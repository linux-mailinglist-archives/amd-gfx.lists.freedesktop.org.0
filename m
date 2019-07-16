Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67D6A0C8
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 05:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8142D6E087;
	Tue, 16 Jul 2019 03:21:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933F66E087
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 03:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfxgczzZ3EthjvPewP8ZIRjEbRF6adoA+/zG8yCp+mlkvzK7P2CN3/3UpM/EAHjhdT9IzBWwyBwzRv9Rj/dgIAsSzEQAsECr92iu98mN8rPA3hxJmrwaUF1SC07FdyB3OE/bfmk1zDl9evHFzDsyz0jTn9GB2+SNeYJphN4QHrqgV+IYz+pYIobVKWIk5/AP6bcacDqIZ27IrFlb+6V6k6qli/kXYIkwNohbGJx5gjt9jONb/occklsSsDoG2xlwrKoCiyJOA1gF4loPprIPqT/H6BlfFI5wNEHoeC9Obju/+/GCvMzeJnxcMuM8nZA0pqL1MSnehDCXc1DIeOYT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vfDPsGDErpoGEGj4zHWLfMZ2SicyjDS2BCEJfW9yAY=;
 b=Uy29QZvtZDvZKD7kHoFTAswvs+R2S45vDgO+/MLWAfMZkllLDJlalu3X0ARmZrkeGjHdwXJKWP3lSLjOZCrbTdWHI/wSta1fSK8CtgPO1fCAszz0hgjav+ssWs8a+0TRAMOO7I33i5v6Zeo5BGvYjOD3bzHeTKGQCu5ef7pD5LbPmZTHOh1SoDLtFjpy34MtxiKBEU7bP9zlEJFZdCZos66c/fh7/Vs9nTz380ShBoj4fkvV4+CuZ1Ahot3egQK+zxuqO6k6hpMndfB4Ue96hl6PIMiHkhmMbCW8z6BY7Mc/wlqZYr+efPeV3j4M46wbL9AHJQezS4FRRZwgqXbJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4015.namprd12.prod.outlook.com (10.255.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 03:21:15 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 03:21:15 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Thread-Topic: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task V2
Thread-Index: AQHVOHXSS3c4xx6rQ0GsCmZZtw+wuabMlKyAgAAFXKo=
Date: Tue, 16 Jul 2019 03:21:15 +0000
Message-ID: <MN2PR12MB329686636B30CD79D946BD55A2CE0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190712055054.22119-1-evan.quan@amd.com>,
 <MN2PR12MB3344074D151A9DF09836BFEDE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344074D151A9DF09836BFEDE4CE0@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 194fbc93-bed0-42ee-bf23-08d7099ca969
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4015; 
x-ms-traffictypediagnostic: MN2PR12MB4015:
x-microsoft-antispam-prvs: <MN2PR12MB4015FC41CFE9C8DD3005C3F0A2CE0@MN2PR12MB4015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(189003)(13464003)(199004)(7736002)(2906002)(14444005)(256004)(8676002)(76116006)(8936002)(186003)(55016002)(316002)(66066001)(110136005)(25786009)(6436002)(486006)(99286004)(74316002)(86362001)(446003)(2501003)(76176011)(6606003)(478600001)(6506007)(19627405001)(53546011)(6246003)(7696005)(33656002)(229853002)(14454004)(9686003)(54896002)(5660300002)(102836004)(52536014)(71190400001)(3846002)(6116002)(66946007)(71200400001)(26005)(81166006)(66556008)(64756008)(81156014)(66446008)(66476007)(11346002)(68736007)(53936002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4015;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M7QyxMOW3gQ3pFG/O2+w0L915I+HxZj9xF1QBb6k6MLbySHetBmv+2g/T93ZdgyOHQeGXuSRxwD3InRONsFoNQbKUSz12UDmLnNhsW4+Cu7pRKTMM0yl4hRsA/fEZOF0Sd+LTn64wNSX0+NhMPAU/xw8WTWVuj8mrspxHGKhjU3hwDn7FXJ+VOqO0gjbofm8EZG0LPs+XLu34XDitI/OKJtabENZYiZ7SDfv/O4oy7+fPBDLr+ICrFtZUf24EwS/Pn5ntm4ENbhiyif6LyIqD1AD1MK2FSdzTuqNnOF8etYYCZCnDNiQA/2GYMMjLMLnC8c4hkFgiDrNEBW+zcJ6mVEzobvVty0rAWI15IyP1UqWdu561Gf1CdggK7AQm4KO3ww7+2xppN1OjMFbAQNnx1D28D+SjewkXImdEiSuaTo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194fbc93-bed0-42ee-bf23-08d7099ca969
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 03:21:15.6083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vfDPsGDErpoGEGj4zHWLfMZ2SicyjDS2BCEJfW9yAY=;
 b=tjpQdHgW9pZsvaerXz8atFqW3IkV5plCqN4AATDXJetI6mYquO/fIHO8kCnE2vGN0PZrOjQFU4PXQhjzYF6ywrs7CPXKdLKOhbR6e2Kqv5n4VVJuhnsI9nNSMwuhL/4h1S6G2+aWyBCwRTumvW56M+05fotSY2QnVP5GK+qFVVI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1880664927=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1880664927==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329686636B30CD79D946BD55A2CE0MN2PR12MB3296namp_"

--_000_MN2PR12MB329686636B30CD79D946BD55A2CE0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>


Best Regards,

Kevin

________________________________
From: Quan, Evan
Sent: Tuesday, July 16, 2019 11:01:43 AM
To: Quan, Evan; amd-gfx@lists.freedesktop.org
Cc: Wang, Kevin(Yang)
Subject: RE: [PATCH] drm/amd/powerplay: fix deadlock around smu_handle_task=
 V2

Ping..

> -----Original Message-----
> From: Evan Quan <evan.quan@amd.com>
> Sent: Friday, July 12, 2019 1:51 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>
> Subject: [PATCH] drm/amd/powerplay: fix deadlock around
> smu_handle_task V2
>
> As the lock was already held on the entrance to smu_handle_task.
>
> - V2: lock in small granularity
>
> Change-Id: I5388aa917ef0e330974e26c59db42d1354b6a865
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index 961f4e54ed18..eb255a6bd3a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -3049,11 +3049,9 @@ void amdgpu_pm_compute_clocks(struct
> amdgpu_device *adev)
>        if (is_support_sw_smu(adev)) {
>                struct smu_context *smu =3D &adev->smu;
>                struct smu_dpm_context *smu_dpm =3D &adev-
> >smu.smu_dpm;
> -             mutex_lock(&(smu->mutex));
>                smu_handle_task(&adev->smu,
>                                smu_dpm->dpm_level,
>                                AMD_PP_TASK_DISPLAY_CONFIG_CHANGE);
> -             mutex_unlock(&(smu->mutex));
>        } else {
>                if (adev->powerplay.pp_funcs->dispatch_tasks) {
>                        if (!amdgpu_device_has_dc_support(adev)) {
> --
> 2.21.0


--_000_MN2PR12MB329686636B30CD79D946BD55A2CE0MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: Kevin Wang &lt;kevin=
1.wang@amd.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Best Regards,</p>
<p style=3D"margin-top:0;margin-bottom:0">Kevin</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan<br>
<b>Sent:</b> Tuesday, July 16, 2019 11:01:43 AM<br>
<b>To:</b> Quan, Evan; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Wang, Kevin(Yang)<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: fix deadlock around smu_hand=
le_task V2</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Ping..<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; Sent: Friday, July 12, 2019 1:51 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Quan, Evan<br>
&gt; &lt;Evan.Quan@amd.com&gt;<br>
&gt; Subject: [PATCH] drm/amd/powerplay: fix deadlock around<br>
&gt; smu_handle_task V2<br>
&gt; <br>
&gt; As the lock was already held on the entrance to smu_handle_task.<br>
&gt; <br>
&gt; - V2: lock in small granularity<br>
&gt; <br>
&gt; Change-Id: I5388aa917ef0e330974e26c59db42d1354b6a865<br>
&gt; Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 2 --<br>
&gt;&nbsp; 1 file changed, 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; index 961f4e54ed18..eb255a6bd3a9 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&gt; @@ -3049,11 &#43;3049,9 @@ void amdgpu_pm_compute_clocks(struct<br>
&gt; amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev))=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct smu_context *smu =3D &amp;adev-&gt;smu;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *smu_dpm =3D &amp;adev-<br>
&gt; &gt;smu.smu_dpm;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mutex_lock(&amp;(smu-&gt;mutex));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; smu_handle_task(&amp;adev-&gt;smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_dpm-&gt;dpm_level,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMD_PP_TASK_DISPLAY_CONFIG_CHANGE)=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; mutex_unlock(&amp;(smu-&gt;mutex));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (adev-&gt;powerplay.pp_funcs-&gt;dispatch_tasks) {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!am=
dgpu_device_has_dc_support(adev)) {<br>
&gt; --<br>
&gt; 2.21.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329686636B30CD79D946BD55A2CE0MN2PR12MB3296namp_--

--===============1880664927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1880664927==--

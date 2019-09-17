Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA4B45CC
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 05:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAFB6EAD0;
	Tue, 17 Sep 2019 03:04:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700054.outbound.protection.outlook.com [40.107.70.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059AD6EAD0
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 03:04:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ycul53Eu1oDQrolIhGlLYasQr2mAbxOaLDcZ9hpvYJVYwuMV/NVN2YHbJmotq499XDldyGyi2ia0MWteMNJztubwxbMrnJsS/68wks5GzLJ2MH9Z01NVwPB3kP+gByrP/v5jhbTX6RVhga/d7/4R7B1/cEi3VJ2J9MtDK4RHgM6m596oABwhwehwcB/rIzkbvCWW3w9zNk6VccR8ftUCK4qG+v25Clfc5NdkipalioBQ9rj1xqPr3fqBuBaJj3qxCKgYH7TTEduvczIxKwXqwTelUPL2sm46xaNnRHFleuROQ5p64wHobaNIg6vyAeTKb+ZAsflidNhKvFO0XwO+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3thOukf2c+ecA61yQ2C6pC0kRvqDB8wD5TRaoITIbE=;
 b=EiiZZTMkHKeRp4BpHsoJWGUTHQd7wv9N+PZPGypuNOigXJmaV9XTdPOUCRXvQzdsHRlqdFFIqc++JRVD2FVNX49+/gLCNpUj8nUDv9oA+RH871wicVZxiljPUNeIU90y42PmN/Fm4o6u8q2kIQ7qr4huVi5gDUnzQAwpr//GZNwvEvEzOvJDwcrlBy6mti5IOQOMN9BPyFlRR9MkBQd/Tdgo71mZajbXihKtTmC49UgolU0dj2k9oA2WceRFSNJR7wYzj84hf2s8qqmfN54hpmhypMscJZq1UCqgWcXJotXnlzjoGogp2CSIQl4+wv+E7TC6+gjt23A0JIMexyIMaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1627.namprd12.prod.outlook.com (10.172.40.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Tue, 17 Sep 2019 03:04:36 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 03:04:36 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [Patch] drm/amdgpu: add navi12 pci id
Thread-Topic: [Patch] drm/amdgpu: add navi12 pci id
Thread-Index: AQHVbQLpRi6MOO44JEKZbCbq0YcMyKcvLssQgAAAbNQ=
Date: Tue, 17 Sep 2019 03:04:36 +0000
Message-ID: <DM5PR12MB25354229F6752F551AB07009958F0@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <DM5PR12MB253567599A33CBC49F0DFEDD958F0@DM5PR12MB2535.namprd12.prod.outlook.com>,
 <21ED1B7F-2E7C-483B-B1DC-690A862F5908@amd.com>
In-Reply-To: <21ED1B7F-2E7C-483B-B1DC-690A862F5908@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca2131a6-f81e-40d2-ec26-08d73b1bc5dd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1627; 
x-ms-traffictypediagnostic: DM5PR12MB1627:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB16277DA64ED2832A775E6A61958F0@DM5PR12MB1627.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(189003)(199004)(229853002)(7736002)(74316002)(52536014)(256004)(11346002)(66946007)(33656002)(71200400001)(71190400001)(54906003)(66446008)(105004)(66066001)(76176011)(64756008)(66476007)(25786009)(476003)(6506007)(7696005)(102836004)(6636002)(14454004)(19627405001)(53546011)(26005)(478600001)(99286004)(316002)(6436002)(91956017)(4326008)(66556008)(2906002)(5660300002)(76116006)(4744005)(3846002)(6246003)(86362001)(8676002)(186003)(9686003)(236005)(6116002)(81156014)(81166006)(54896002)(486006)(6862004)(8936002)(446003)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1627;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oumzDkeYig5Th8RbO+KMiXlBSpq9pbuFfd6+GGBks5LXUPxC8YGivbA7RLxNOdKcB4Lpr4MFIsH4T+a7GJj5v/qs/FmYQU9ad2TouYXcDK1KG0kvNvhSceFYKcNocgJcD6QxfGXyKNZMxXl/QV1Lo/48QLQC66wMrGIMg2sTRV8eajMU3VGqpRRfqDTsXseq54NcCRIaDwj2r5RgUUa+xim1f2KkWZLtTwf4nApdm7j/V/Ne8wPRiKjUbd+ysn24SEyXx+Y+DWwifhLSKbYLgvOZnIQlhxs5aGO1/SFnxoKl426Faf+6S3MYnFlINVaMDaerqRTmWG22w13eQse4lffjUzRoXoTVr9gHA5L9ApLDKgFnCaGxYsA4XZJ6Z1yRtgFfCMq6op9e6KYViTM0rPq1//yBaibzU9fcesj8CXM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2131a6-f81e-40d2-ec26-08d73b1bc5dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 03:04:36.4916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: loqaE5NH59ASRaekdQ/HQZZTYr81tpsh2wcGgwlvsYD8gXunxf2U3M2VbEtXlyPC16fFk0Jxprm2VD1uyCT5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1627
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3thOukf2c+ecA61yQ2C6pC0kRvqDB8wD5TRaoITIbE=;
 b=U/0sQRGllONe7ReVp7ezit7xwiI5EektXHMJgXK72axPsFWi3NtZ2amff4dOfTV3F+hm+IkYvYgvNxsJeGHyBJtQMw8IimIia8VHh2cZKphxBH0sIjKxdO6Xf5WynMyNSJVo9Ai3Y+dKXymRO+nPxlnIRHl4LXXOj4bAj38oZhg=
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Xu,
 Feifei" <Feifei.Xu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============1828555459=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1828555459==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB25354229F6752F551AB07009958F0DM5PR12MB2535namp_"

--_000_DM5PR12MB25354229F6752F551AB07009958F0DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Hawking!
________________________________
From: Zhang, Hawking <Hawking.Zhang@amd.com>
Sent: Tuesday, September 17, 2019 11:02
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Deucher,=
 Alexander <Alexander.Deucher@amd.com>; Xu, Feifei <Feifei.Xu@amd.com>; Yua=
n, Xiaojie <Xiaojie.Yuan@amd.com>; Xiao, Jack <Jack.Xiao@amd.com>; Long, Ga=
ng <Gang.Long@amd.com>
Subject: Re: [Patch] drm/amdgpu: add navi12 pci id

Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com<mailto:Hawking.Zhang@amd.=
com>>

Regards,
Hawking

Sent from my iPhone

On Sep 16, 2019, at 22:57, Yin, Tianci (Rico) <Tianci.Yin@amd.com<mailto:Ti=
anci.Yin@amd.com>> wrote:


<0001-drm-amdgpu-add-navi12-pci-id.patch>

--_000_DM5PR12MB25354229F6752F551AB07009958F0DM5PR12MB2535namp_
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
Thanks Hawking!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhang, Hawking &lt;Ha=
wking.Zhang@amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 17, 2019 11:02<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Xu, Feifei &lt;F=
eifei.Xu@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Xiao, Jac=
k &lt;Jack.Xiao@amd.com&gt;; Long, Gang &lt;Gang.Long@amd.com&gt;<br>
<b>Subject:</b> Re: [Patch] drm/amdgpu: add navi12 pci id</font>
<div>&nbsp;</div>
</div>
<div dir=3D"auto">Reviewed-by: Hawking Zhang &lt;<a href=3D"mailto:Hawking.=
Zhang@amd.com">Hawking.Zhang@amd.com</a>&gt;
<div><br>
</div>
<div>Regards,</div>
<div>Hawking<br>
<br>
<div id=3D"x_AppleMailSignature" dir=3D"ltr">Sent from my iPhone</div>
<div dir=3D"ltr"><br>
On Sep 16, 2019, at 22:57, Yin, Tianci (Rico) &lt;<a href=3D"mailto:Tianci.=
Yin@amd.com">Tianci.Yin@amd.com</a>&gt; wrote:<br>
<br>
</div>
<blockquote type=3D"cite">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
</div>
</blockquote>
<blockquote type=3D"cite">
<div dir=3D"ltr">&lt;0001-drm-amdgpu-add-navi12-pci-id.patch&gt;</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB25354229F6752F551AB07009958F0DM5PR12MB2535namp_--

--===============1828555459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1828555459==--

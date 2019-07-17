Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6AF6BDA5
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 15:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB876E1B2;
	Wed, 17 Jul 2019 13:50:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790057.outbound.protection.outlook.com [40.107.79.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5E76E1B2
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 13:50:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7vG4BPcqjcgY7gaoqnqEKPtWeICeN1JfmfsfnSEartrXq8wRxoPSLghLWE1ZOrDRmcaLW+G7wo9Cz0ITz5TkjXmnX+t8tOf4QYjo31qHxXI//8RMqpFax8dov0gs0am9VvwVbt08imrGkL3TnsawEeCCGonx9a3widyGvgsJvW9RKMqQirMKUmG9Lk/emc0nyPeQL8UtbiEbOtkammemb/S1f9u6T11LSB1mTbCrxSxcoDTPSSk+I2WlPZWOBjqnxRxcKQuSLO1bZI8ZeCk9hcWXvL4MPSHBWR0FP/7eoDH6Dn7D9zL7ytNrCXtkz31S9ZJ8TfSFiTzcP7Kz5UxQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUNqq8dDJ1nVg0PkcO7nzvLCt+pAgMwuMVuPJHp/WWE=;
 b=g0zSthvfm7BYt110i9r3djluhi0w3eE2zaLm8hbnwP0FYv2ZbWjcbqojK1Xk0C2qwHNDBGFiqVtNt5JOTWxQoDbTYGoGFsKXYIeQT4bYVVcBgM1zyyjE0eKyBtf1r3f8tmWB2nNaQ6jB3ovVy8AwMNPVJdBo7dZuyKayvGwf9FPh3N80FX/nrZfL/EHhN5Fpnc4TC98KAFqoYw51+ly6lZzHkFDVXSMQHFYfHCGJvMGcQe/LpSs+5B625Xxy6f6y8eF5/efcatDPJQ3kjcUupcwbqCophgl4K0GvU0Bld+LFXMkFro5L0EPQah019zb6VBN91lSAxrwN82y3GQ+bpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1937.namprd12.prod.outlook.com (10.175.102.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:50:48 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:50:48 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "StDenis, Tom" <Tom.StDenis@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
Thread-Topic: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
Thread-Index: AQHVO8kRvSSqzqpVH0SqsBcjPPwln6bNHEsAgAGmxACAABKamA==
Date: Wed, 17 Jul 2019 13:50:47 +0000
Message-ID: <BN6PR12MB1809B374579E8D82EBFCC151F7C90@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190716112434.29017-1-tom.stdenis@amd.com>
 <e6bc6d43-d4ac-467f-22b3-2be79619b93e@gmail.com>,
 <4d8fb065-f31b-d730-04d0-6c6e83b3a171@amd.com>
In-Reply-To: <4d8fb065-f31b-d730-04d0-6c6e83b3a171@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.21.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a4ed1b2-f17f-47a2-8383-08d70abdc5d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1937; 
x-ms-traffictypediagnostic: BN6PR12MB1937:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1937621E6A2A19DE4B0B215BF7C90@BN6PR12MB1937.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(189003)(199004)(606006)(3846002)(110136005)(74316002)(7736002)(76176011)(53936002)(66574012)(2906002)(76116006)(54896002)(71190400001)(6306002)(71200400001)(476003)(105004)(8676002)(6116002)(55016002)(446003)(14454004)(316002)(9686003)(11346002)(256004)(64756008)(66476007)(14444005)(66066001)(966005)(6506007)(53546011)(5660300002)(8936002)(66946007)(6246003)(66556008)(19627405001)(52536014)(33656002)(66446008)(236005)(25786009)(478600001)(6436002)(7696005)(86362001)(186003)(229853002)(26005)(486006)(68736007)(102836004)(2501003)(81156014)(99286004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1937;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zt8dGxwPR95kvf+Hp0oPmHrlXh3f5L4U7cablf5nrq9m0srdzncBRcG8fo0U0nSiiuV5ZkJeulbUtkT8ZUggDmAoIxNhs4dy7q6x1uv4j0oUyWwq9ixYV7pVkY8JBNyneBsr1MjFBaBfGUyD5ZSOPDg/4gPan/k2/AJg9fLw8RgGmypjt+efWbu+/gtQR2M1tZnHl6ZHnFB2bZHd2f/cCvRRb9/AOFsWLszeeeNiWnguyHsk1QZCiVfmhxgCM8Op2upTwdTxO9girC7xJ9H0btLJ5yZkKVjkCUmAm6GnMeeSz84pwCMDA70NNhXpCx1rPj2wzyMqLpyP3Mp/yo1af2hmznX/0yOkAIA3D/epg/XF8hACfKuNk9Z4YYGlOyxy9FL/z5qWkRvlDa+sHFJNkm+yk9LDZaBy6vR0kbb/sZY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4ed1b2-f17f-47a2-8383-08d70abdc5d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:50:47.8566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUNqq8dDJ1nVg0PkcO7nzvLCt+pAgMwuMVuPJHp/WWE=;
 b=IR2ZELKWFzIXL1mSzzXPbg7cMFrFd4LBGkUasRlTQV+Dh4KWeNbGzBXIVqGOHv31yDTN5U0f8Kj/fUJUbgR2+8xF1hxsVFDLOcufTgZCDErtR+eBXQTbVg8FjcImYtcQk4sv2JbZszmdOi3e7zsMC0tF72pV0ellSKqrGKOI3Hc=
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
Content-Type: multipart/mixed; boundary="===============0516494687=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0516494687==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809B374579E8D82EBFCC151F7C90BN6PR12MB1809namp_"

--_000_BN6PR12MB1809B374579E8D82EBFCC151F7C90BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

RB,

thanks,

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of StDenis,=
 Tom <Tom.StDenis@amd.com>
Sent: Wednesday, July 17, 2019 8:44 AM
To: Koenig, Christian; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debug=
fs interface

Thanks.


Alex can I grab an R-b please?


Cheers,

Tom

On 2019-07-16 7:30 a.m., Christian K=F6nig wrote:
> Am 16.07.19 um 13:24 schrieb StDenis, Tom:
>> The register debugfs interface was using the wrong bitmask for vmid
>> selection for GFX_CNTL.
>>
>> Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> index 87b32873046f..59849ed9797d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>> @@ -132,7 +132,7 @@ static int amdgpu_debugfs_process_reg_op(bool
>> read, struct file *f,
>>           me =3D (*pos & GENMASK_ULL(33, 24)) >> 24;
>>           pipe =3D (*pos & GENMASK_ULL(43, 34)) >> 34;
>>           queue =3D (*pos & GENMASK_ULL(53, 44)) >> 44;
>> -        vmid =3D (*pos & GENMASK_ULL(48, 45)) >> 54;
>> +        vmid =3D (*pos & GENMASK_ULL(58, 54)) >> 54;
>>             use_ring =3D 1;
>>       } else {
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809B374579E8D82EBFCC151F7C90BN6PR12MB1809namp_
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
RB,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
thanks,</div>
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
ounces@lists.freedesktop.org&gt; on behalf of StDenis, Tom &lt;Tom.StDenis@=
amd.com&gt;<br>
<b>Sent:</b> Wednesday, July 17, 2019 8:44 AM<br>
<b>To:</b> Koenig, Christian; amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> Re: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection i=
n debugfs interface</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Thanks.<br>
<br>
<br>
Alex can I grab an R-b please?<br>
<br>
<br>
Cheers,<br>
<br>
Tom<br>
<br>
On 2019-07-16 7:30 a.m., Christian K=F6nig wrote:<br>
&gt; Am 16.07.19 um 13:24 schrieb StDenis, Tom:<br>
&gt;&gt; The register debugfs interface was using the wrong bitmask for vmi=
d<br>
&gt;&gt; selection for GFX_CNTL.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Tom St Denis &lt;tom.stdenis@amd.com&gt;<br>
&gt;<br>
&gt; Acked-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 2 &#43;-<br>
&gt;&gt; &nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
&gt;&gt; index 87b32873046f..59849ed9797d 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c<br>
&gt;&gt; @@ -132,7 &#43;132,7 @@ static int amdgpu_debugfs_process_reg_op(b=
ool <br>
&gt;&gt; read, struct file *f,<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; me =3D (*po=
s &amp; GENMASK_ULL(33, 24)) &gt;&gt; 24;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe =3D (*=
pos &amp; GENMASK_ULL(43, 34)) &gt;&gt; 34;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; queue =3D (=
*pos &amp; GENMASK_ULL(53, 44)) &gt;&gt; 44;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vmid =3D (*pos &amp; G=
ENMASK_ULL(48, 45)) &gt;&gt; 54;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vmid =3D (*pos &am=
p; GENMASK_ULL(58, 54)) &gt;&gt; 54;<br>
&gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; use_=
ring =3D 1;<br>
&gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809B374579E8D82EBFCC151F7C90BN6PR12MB1809namp_--

--===============0516494687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0516494687==--

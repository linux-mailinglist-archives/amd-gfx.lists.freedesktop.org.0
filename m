Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F9866AB
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 18:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD3D6E895;
	Thu,  8 Aug 2019 16:09:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750048.outbound.protection.outlook.com [40.107.75.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE726E899
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 16:09:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/HTkGD2EMWdpCdTkJNSm8GQumLqfPcknb5UoRLlCZTE8/SaG5gCJO9zxZj5DTMYo4FWBcSu3/Yh6i/HEiXlh/lTODusQiAQMeCZ629wAikcPnlFmh0pOuFxrNtlXTcy1cqnqDb1L/O4/mqpvrWTyHVqG4l29xTqh+76bEsTcAbCnUMts/ZjYr6Rx9eN/GdZQStuaAH0D66sb4NCm0qn2/FdEyTB/jJCLsbjeY6E1+bhio83XBJPkwNStDTSLPn2bK9zCt9jPoSUNtbINe/ngZ3/qTj32GYXq8xsO5xFzWRwI0ISb4RVRUmRgT9Jjp6I61UW6vI/d6Zz1BCdE2BL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIlw+eX2RTL+B/lLdjbzCHFNXm8tx1l5bOWXBgQyHqc=;
 b=KwBtUjle9cttR0mTZNVexg07Pys327cGcSpe2XZrwg4TUWDBPkzcKQNmxv0FU0ciqE3v/IbJZcBuX14Od/IH++orWHYK8BOnMFmYRwQKjPPPB+6JdP/OFBMT7M1eNmTIv+EmjRvspB2wSGn/4bYt2uHW14UNzDeDpuZlNrwtrZJpXoXF+lyaq5VTDZs1oGiSUOyAYGSJvrmYsxWLp0UunrG6YsKywfVmWVG8rL/IZdF98Eu0qPrw4Sjr4heKgtq6eXJgEygWyuuYtQ6rj5DJO+zIHqfCuEX8T6vleNVGIP8eX3lwSrX2VlAIE+qy29F+163C8dyNUauv9TMjnqUT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1569.namprd12.prod.outlook.com (10.172.19.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 8 Aug 2019 16:09:41 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 16:09:41 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTMgrPTJV6Fs0ek65dn0x+UgRKabvXkUAgAIJ+RCAAATcmQ==
Date: Thu, 8 Aug 2019 16:09:40 +0000
Message-ID: <BN6PR12MB1809D2F0A97155733CA3FC6EF7D70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
 <3e4f2f68-8840-d85c-052e-fc54dbf45fd4@gmail.com>,
 <BL0PR12MB2580601F44DB50051768070080D70@BL0PR12MB2580.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB2580601F44DB50051768070080D70@BL0PR12MB2580.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.170.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2feab5c2-a87b-4bc9-479e-08d71c1ad1d0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1569; 
x-ms-traffictypediagnostic: BN6PR12MB1569:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB15697A742A8C78B23E6F791FF7D70@BN6PR12MB1569.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(13464003)(199004)(189003)(33656002)(478600001)(86362001)(2906002)(966005)(6246003)(66574012)(71200400001)(4326008)(6116002)(71190400001)(74316002)(3846002)(19627405001)(8676002)(25786009)(14454004)(7736002)(9686003)(236005)(76116006)(54896002)(6436002)(6306002)(53936002)(105004)(5660300002)(55016002)(26005)(7696005)(66476007)(66446008)(54906003)(229853002)(316002)(76176011)(446003)(102836004)(81166006)(66946007)(81156014)(110136005)(99286004)(52536014)(186003)(11346002)(66556008)(64756008)(8936002)(14444005)(66066001)(476003)(256004)(53546011)(6506007)(606006)(2501003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1569;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zeG5cIfXiF/e+VoOlX/lwjhEZS646uzHCpWzv3UDBZ5BykmdXQbwT2NWo/wbWAgmJa4o/pK+keMjxbL8cmoq3cJbzaYbhe8LWMy4OS3QUF4I0s18mAjiTjsRd2Nh0kjVDx/rV+Q/tIEedJIP1j3gqkJUEKwW4ibN57dQcCluQegvfEodCAZyt9td8+1b0py2pVfYKxBiG5AjNXbsCd+OtV50afSK8Ak1m7F+9qqqd9l+jkr12qTT1JzHmejQOml3WOCtjBqNSj8/qHmYg/4BjQpMzfI4iRSuH19xY7Gy7qYJxjt8K9u2adEcdM1JLVdr9apvaAJmmN85OJbwGmQkHdoIvZ8+Tu4epzFD5wKCYOOZW/Tq+fawt5RfUEGJyAVlNlhqfgLIbKs9hgY0XevfYTbcwE77xeY8KK9FpSOUCcQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feab5c2-a87b-4bc9-479e-08d71c1ad1d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 16:09:40.9530 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rZR1ASncYV6YwtjR8dMuW+Hveb6HCqELznZuFXjuC1XLSjrO+6gfMdVOsD8504BbiU38FWtOa1bVqU0JHQPIpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1569
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIlw+eX2RTL+B/lLdjbzCHFNXm8tx1l5bOWXBgQyHqc=;
 b=VAtuzil06WSDKoiZSmwHXVbfCOBLZ2nR+sZutZcDGJ4/eEex8a1vcpQMLqZpstOZ+W8dowbWeA2E8TEUPvEX4ptlxnaD4rQgvfLH9YmlJ+vqhPP3xk/KD1dFEe1raeQTsRrGlCUGrhnJhurUwEJXOp5yOKY1CixastXvSNCVN6c=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: multipart/mixed; boundary="===============0208976851=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0208976851==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809D2F0A97155733CA3FC6EF7D70BN6PR12MB1809namp_"

--_000_BN6PR12MB1809D2F0A97155733CA3FC6EF7D70BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The snoop bit is for snooping the CPU cache by the GPU when doing system me=
mory mappings.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zeng, Oa=
k <Oak.Zeng@amd.com>
Sent: Thursday, August 8, 2019 12:02 PM
To: Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@lists.freedesktop=
.org <amd-gfx@lists.freedesktop.org>
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Keely, Sean <Sean.Keely@amd.c=
om>
Subject: RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions

Hi Christian,

My understanding of the snoop bit (C bit in the PTE definition) is to probe=
 remote gpu's L2 cache after this gpu write remote gpu's vram. Is this corr=
ect? I am still checking this point with HW engineer.

If this is correct, then the snooping (or probing) is a way to maintain cer=
tain cache coherency when one memory is access by two masters (for example =
two gpu). With existing AMDGPU_VM_ definitions in amdgpu_drm.h, how does a =
user implement the request like: I want a trunk of vram physically in a rem=
ote gpu, I want to access it in a uncached way (AMDGPU_VM_MTYPE_UC) but I w=
ant to probe remote gpu's cache when I modify this vram.

From PTE's definition, both C bit and mtype and R/W/X bits are just flags t=
o enable user to program page access behavior. Any detail reason why we sho=
uldn't expose the snoop bit?

Regards,
Oak

-----Original Message-----
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, August 7, 2019 4:42 AM
To: Zeng, Oak <Oak.Zeng@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Koenig, Christian <Christian.=
Koenig@amd.com>; Keely, Sean <Sean.Keely@amd.com>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions

Am 07.08.19 um 04:31 schrieb Zeng, Oak:
> Add definition of all supported mtypes. The RW mtype is recently
> introduced for arcturus. Also add definition for the
> cachable/snoopable bit, which will be used later in this series.
>
> Change-Id: I96fc9bb4b6b1e62bdc10b600d8aaa6a802128d6d
> Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 9 +++++++--
>   include/uapi/drm/amdgpu_drm.h          | 4 ++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 2eda3a8..7a77477 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -80,8 +80,13 @@ struct amdgpu_bo_list_entry;
>   #define AMDGPU_PTE_MTYPE_VG10(a)    ((uint64_t)(a) << 57)
>   #define AMDGPU_PTE_MTYPE_VG10_MASK  AMDGPU_PTE_MTYPE_VG10(3ULL)
>
> -#define AMDGPU_MTYPE_NC 0
> -#define AMDGPU_MTYPE_CC 2
> +enum amdgpu_mtype {
> +     AMDGPU_MTYPE_NC =3D 0,
> +     AMDGPU_MTYPE_WC =3D 1,
> +     AMDGPU_MTYPE_CC =3D 2,
> +     AMDGPU_MTYPE_UC =3D 3,
> +     AMDGPU_MTYPE_RW =3D 4,
> +};
>
>   #define AMDGPU_PTE_DEFAULT_ATC  (AMDGPU_PTE_SYSTEM      \
>                                   | AMDGPU_PTE_SNOOPED    \
> diff --git a/include/uapi/drm/amdgpu_drm.h
> b/include/uapi/drm/amdgpu_drm.h index ca97b68..2889663 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -503,6 +503,10 @@ struct drm_amdgpu_gem_op {
>   #define AMDGPU_VM_MTYPE_CC          (3 << 5)
>   /* Use UC MTYPE instead of default MTYPE */
>   #define AMDGPU_VM_MTYPE_UC          (4 << 5)
> +/* Use RW MTYPE instead of default MTYPE */
> +#define AMDGPU_VM_MTYPE_RW           (5 << 5)

> +/* Cacheable/snoopable */
> +#define AMDGPU_VM_PAGE_SNOOPED               (1 << 9)

That's a rather big NAK. Cache snooping is not something userspace is allow=
ed to be aware of.

Christian.

>
>   struct drm_amdgpu_gem_va {
>        /** GEM object handle */

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809D2F0A97155733CA3FC6EF7D70BN6PR12MB1809namp_
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
The snoop bit is for snooping the CPU cache by the GPU when doing system me=
mory mappings.<br>
</div>
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
ounces@lists.freedesktop.org&gt; on behalf of Zeng, Oak &lt;Oak.Zeng@amd.co=
m&gt;<br>
<b>Sent:</b> Thursday, August 8, 2019 12:02 PM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; amd-gfx@list=
s.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; Keely, Sean &lt;=
Sean.Keely@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Christian,<br>
<br>
My understanding of the snoop bit (C bit in the PTE definition) is to probe=
 remote gpu's L2 cache after this gpu write remote gpu's vram. Is this corr=
ect? I am still checking this point with HW engineer.<br>
<br>
If this is correct, then the snooping (or probing) is a way to maintain cer=
tain cache coherency when one memory is access by two masters (for example =
two gpu). With existing AMDGPU_VM_ definitions in amdgpu_drm.h, how does a =
user implement the request like:
 I want a trunk of vram physically in a remote gpu, I want to access it in =
a uncached way (AMDGPU_VM_MTYPE_UC) but I want to probe remote gpu's cache =
when I modify this vram.<br>
<br>
From PTE's definition, both C bit and mtype and R/W/X bits are just flags t=
o enable user to program page access behavior. Any detail reason why we sho=
uldn't expose the snoop bit?<br>
<br>
Regards,<br>
Oak<br>
<br>
-----Original Message-----<br>
From: Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt; <br>
Sent: Wednesday, August 7, 2019 4:42 AM<br>
To: Zeng, Oak &lt;Oak.Zeng@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
Cc: Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; Koenig, Christian &lt;C=
hristian.Koenig@amd.com&gt;; Keely, Sean &lt;Sean.Keely@amd.com&gt;<br>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions<br>
<br>
Am 07.08.19 um 04:31 schrieb Zeng, Oak:<br>
&gt; Add definition of all supported mtypes. The RW mtype is recently <br>
&gt; introduced for arcturus. Also add definition for the <br>
&gt; cachable/snoopable bit, which will be used later in this series.<br>
&gt;<br>
&gt; Change-Id: I96fc9bb4b6b1e62bdc10b600d8aaa6a802128d6d<br>
&gt; Signed-off-by: Oak Zeng &lt;Oak.Zeng@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 9 &#43;&#43;&#43;=
&#43;&#43;&#43;&#43;--<br>
&gt;&nbsp;&nbsp; include/uapi/drm/amdgpu_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 2 files changed, 11 insertions(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h <br>
&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; index 2eda3a8..7a77477 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; @@ -80,8 &#43;80,13 @@ struct amdgpu_bo_list_entry;<br>
&gt;&nbsp;&nbsp; #define AMDGPU_PTE_MTYPE_VG10(a)&nbsp;&nbsp;&nbsp; ((uint6=
4_t)(a) &lt;&lt; 57)<br>
&gt;&nbsp;&nbsp; #define AMDGPU_PTE_MTYPE_VG10_MASK&nbsp; AMDGPU_PTE_MTYPE_=
VG10(3ULL)<br>
&gt;&nbsp;&nbsp; <br>
&gt; -#define AMDGPU_MTYPE_NC 0<br>
&gt; -#define AMDGPU_MTYPE_CC 2<br>
&gt; &#43;enum amdgpu_mtype {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_NC =3D 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_WC =3D 1,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_CC =3D 2,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_UC =3D 3,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_RW =3D 4,<br>
&gt; &#43;};<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define AMDGPU_PTE_DEFAULT_ATC&nbsp; (AMDGPU_PTE_SYSTEM&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | AMDGPU_PTE_SNO=
OPED&nbsp;&nbsp;&nbsp; \<br>
&gt; diff --git a/include/uapi/drm/amdgpu_drm.h <br>
&gt; b/include/uapi/drm/amdgpu_drm.h index ca97b68..2889663 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; &#43;&#43;&#43; b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -503,6 &#43;503,10 @@ struct drm_amdgpu_gem_op {<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VM_MTYPE_CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (3 &lt;&lt; 5)<br>
&gt;&nbsp;&nbsp; /* Use UC MTYPE instead of default MTYPE */<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VM_MTYPE_UC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (4 &lt;&lt; 5)<br>
&gt; &#43;/* Use RW MTYPE instead of default MTYPE */<br>
&gt; &#43;#define AMDGPU_VM_MTYPE_RW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (5 &lt;&lt; 5)<br>
<br>
&gt; &#43;/* Cacheable/snoopable */<br>
&gt; &#43;#define AMDGPU_VM_PAGE_SNOOPED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1 &lt;&lt; 9)<br>
<br>
That's a rather big NAK. Cache snooping is not something userspace is allow=
ed to be aware of.<br>
<br>
Christian.<br>
<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; struct drm_amdgpu_gem_va {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** GEM object handle */<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809D2F0A97155733CA3FC6EF7D70BN6PR12MB1809namp_--

--===============0208976851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0208976851==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F084763C5
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 12:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932786ED18;
	Fri, 26 Jul 2019 10:45:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780051.outbound.protection.outlook.com [40.107.78.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1056ED18
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 10:45:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfUDN0yZWoZ9ry81do1UqPDZj4NBwgZNgyoRbSdmwrXTAVrhkLqxivppopRyuH+eQOTirtLjIAYgyS2S/liPZqebgynroATG34if5HSLqftOjVKTpdd53302wOSxZ2XIfXSjHllP6VyNkCEroxvDBjvAjPftVtoFOhjPmSPdto15IFd0+LEbNRoUzaYf0spRUt/IxRm7wtBrzY3clbGf3CsPWQl4m8uTLjxtH0EY91CuyXRKH+wEUXXmq6D3HYvxqd0DvQIC1A/PmhSs0UjkbczYkH8rWCF4pOq+x3UkWJ1BIBtA72P8lSxt35WX9t5oWKicxdvcp555ipVJ3BioNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB6UFN3aukp9/b2UCD3dssRymK99oma6vDouBj6rzxM=;
 b=Ye8mT8RAoF5KnshoC50epXUgOkqgnr9qACU+XWmNCbkvAIIvCkAQHMS2u9dKNX7RB7QA+dbls8R82w/MEY6s4UdMMQh1kvAyE4oQqeWkzhxWSqyrP9WADoL565VD9BCRb0wfWfzbJiWIGPhx9FduQlNcogAKEFoPfStsZhitMZ/w20zpP0bySJt3T2yxRYnaU3mGaJvErd9PXqJGPpMs6XyyLnKI4QJhD41/xjAG3riDxxhtsDxSu/88SkzTge//g4cZgo0QCcERcwMfks5rXIKZOh7h5O2WBOWkiPrYfzM7N/K5f6FrWmEVUhzfNjt8ld5T4QCmvcEscR3wZyDosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com (10.174.114.148) by
 BN6PR1201MB0228.namprd12.prod.outlook.com (10.174.115.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 10:45:02 +0000
Received: from BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346]) by BN6PR1201MB0178.namprd12.prod.outlook.com
 ([fe80::e14e:201c:e206:9346%7]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 10:45:02 +0000
From: "Thai, Thong" <Thong.Thai@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Topic: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD
 commands
Thread-Index: AQHVQwDvAKYQ9+/3TUijBLCloFCcdabcflCAgAA5RwE=
Date: Fri, 26 Jul 2019 10:45:01 +0000
Message-ID: <BN6PR1201MB0178F74D883BC13DD35CDC369DC00@BN6PR1201MB0178.namprd12.prod.outlook.com>
References: <20190725155204.5739-1-thong.thai@amd.com>,
 <2a7d972a-5916-7d00-c8ad-5ff33363d993@gmail.com>
In-Reply-To: <2a7d972a-5916-7d00-c8ad-5ff33363d993@gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [108.162.162.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f7559ca-18a4-4d06-0eea-08d711b65014
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR1201MB0228; 
x-ms-traffictypediagnostic: BN6PR1201MB0228:
x-microsoft-antispam-prvs: <BN6PR1201MB0228566E7F6894A72DA3FE009DC00@BN6PR1201MB0228.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(199004)(189003)(66066001)(99286004)(2501003)(5660300002)(86362001)(25786009)(8936002)(81156014)(81166006)(52536014)(68736007)(316002)(7696005)(478600001)(110136005)(76176011)(76116006)(33656002)(2906002)(102836004)(66446008)(14454004)(66946007)(64756008)(66556008)(66476007)(55236004)(26005)(53936002)(7736002)(6246003)(186003)(446003)(6436002)(71200400001)(71190400001)(55016002)(6116002)(53546011)(74316002)(476003)(229853002)(9686003)(256004)(14444005)(11346002)(54896002)(486006)(8676002)(6506007)(3846002)(66574012)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0228;
 H:BN6PR1201MB0178.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rW6NtXQVMSGRWWPGYRlPcp45ig6MAIPipYK4g52y7/SBxmgyqDWFr8UXTsaL95c1aN7Xl5WSbBZrCMUoc1c4Hioffpf4+YLQ11tZ8n3NSyu45L7Xbx60AHv9GrLJ5THtnUxZAb2Uw8++dzSFnN1ubXqEOiP3cERsdHaFx8GarairHtCj+Gv6fex+ylTEkDd1+WlMED12hNT22UKWRX/aLS+oseXHo9kYIu67ACu+E+fTYdspl0UgDCUzsZlNfOZNCIlOZ7IItLD1m4ZaayZk4YRuhJAQYJ63KqzXD63xnBxqwUcG0avXFxL0rcvx2edCKzLhQawdTGEPGsnY7lrEAjSWMmyRm50jgztC2bj5GfV/llCaarIfmTkB3RdzMU1dZsb245/bICPvplU7yZvSGIKza7wqo0gKcTyG55O6q6Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7559ca-18a4-4d06-0eea-08d711b65014
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 10:45:01.9607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thonthai@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0228
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UB6UFN3aukp9/b2UCD3dssRymK99oma6vDouBj6rzxM=;
 b=Axf9g41mgwCIGnjqYY+l5+io7+IYJI+kgRHLODY1jcPAptoHvlnCjECwwr2BVaJnJGDJaJwqLIrfvWKcxeuoDVkfLoTXKQ8fhGuQnUF8nsBwrnjbf/v/EoDbXWB8Eoucv8tSK1PVWy4TOo3fFxEoYK91lrwV7S7x9zb6DyYQsbM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Thong.Thai@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1076389457=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1076389457==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN6PR1201MB0178F74D883BC13DD35CDC369DC00BN6PR1201MB0178_"

--_000_BN6PR1201MB0178F74D883BC13DD35CDC369DC00BN6PR1201MB0178_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Well, not through this particular piece of code, since this explicitly sets=
 it. But I would imagine someone could set the bit in userspace and insert =
KMD commands in the BO as part of some IB instructions - I=92ll have a look=
.

________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Friday, July 26, 2019 3:17:19 AM
To: Thai, Thong <Thong.Thai@amd.com>; amd-gfx@lists.freedesktop.org <amd-gf=
x@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands as KMD c=
ommands

Am 25.07.19 um 17:52 schrieb Thai, Thong:
> Sets the CMD_SOURCE bit for VCN 2.0 Decoder Ring Buffer commands. This
> bit was previously set by the RBC HW on older firmware. Newer firmware
> uses a SW RBC and this bit has to be set by the driver.

Mhm, another question came to my mind: Would it now be possible for user
space to set this flag and and gain access to the kernel driver commands?

Cause that could be a security problem.

Christian.

>
> Signed-off-by: Thong Thai <thong.thai@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  1 +
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   | 12 ++++++------
>   2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vcn.h
> index 5e2453ee6b29..4d3bf4adf1eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> @@ -30,6 +30,7 @@
>   #define AMDGPU_VCN_FIRMWARE_OFFSET  256
>   #define AMDGPU_VCN_MAX_ENC_RINGS    3
>
> +#define VCN_DEC_KMD_CMD                      0x80000000
>   #define VCN_DEC_CMD_FENCE           0x00000000
>   #define VCN_DEC_CMD_TRAP            0x00000001
>   #define VCN_DEC_CMD_WRITE_REG               0x00000004
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/=
amdgpu/vcn_v2_0.c
> index bc9726787c97..7091aef95ff0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -1488,7 +1488,7 @@ static void vcn_v2_0_dec_ring_insert_start(struct a=
mdgpu_ring *ring)
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OF=
FSET, 0));
>        amdgpu_ring_write(ring, 0);
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
> -     amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_START << 1);
> +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_START=
 << 1));
>   }
>
>   /**
> @@ -1501,7 +1501,7 @@ static void vcn_v2_0_dec_ring_insert_start(struct a=
mdgpu_ring *ring)
>   static void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)
>   {
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
> -     amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_END << 1);
> +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_END <=
< 1));
>   }
>
>   /**
> @@ -1546,7 +1546,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct amd=
gpu_ring *ring, u64 addr, u64
>        amdgpu_ring_write(ring, upper_32_bits(addr) & 0xff);
>
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
> -     amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE << 1);
> +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_FENCE << 1))=
;
>
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OF=
FSET, 0));
>        amdgpu_ring_write(ring, 0);
> @@ -1556,7 +1556,7 @@ static void vcn_v2_0_dec_ring_emit_fence(struct amd=
gpu_ring *ring, u64 addr, u64
>
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
>
> -     amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP << 1);
> +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_TRAP << 1));
>   }
>
>   /**
> @@ -1600,7 +1600,7 @@ static void vcn_v2_0_dec_ring_emit_reg_wait(struct =
amdgpu_ring *ring,
>
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
>
> -     amdgpu_ring_write(ring, VCN_DEC_CMD_REG_READ_COND_WAIT << 1);
> +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_REG_READ_CON=
D_WAIT << 1));
>   }
>
>   static void vcn_v2_0_dec_ring_emit_vm_flush(struct amdgpu_ring *ring,
> @@ -1629,7 +1629,7 @@ static void vcn_v2_0_dec_ring_emit_wreg(struct amdg=
pu_ring *ring,
>
>        amdgpu_ring_write(ring, PACKET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFS=
ET, 0));
>
> -     amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_REG << 1);
> +     amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_WRITE_REG <<=
 1));
>   }
>
>   /**


--_000_BN6PR1201MB0178F74D883BC13DD35CDC369DC00BN6PR1201MB0178_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>
<div>
<div style=3D"direction:ltr">Well, not through this particular piece of cod=
e, since this explicitly sets it. But I would imagine someone could set the=
 bit in userspace and insert KMD commands in the BO as part of some IB inst=
ructions - I=92ll have a look.</div>
</div>
<div><br>
</div>
<div class=3D"x_ms-outlook-ios-signature"></div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig &=
lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Friday, July 26, 2019 3:17:19 AM<br>
<b>To:</b> Thai, Thong &lt;Thong.Thai@amd.com&gt;; amd-gfx@lists.freedeskto=
p.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/amd/amdgpu/vcn_v2_0: Mark RB commands a=
s KMD commands</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Am 25.07.19 um 17:52 schrieb Thai, Thong:<br>
&gt; Sets the CMD_SOURCE bit for VCN 2.0 Decoder Ring Buffer commands. This=
<br>
&gt; bit was previously set by the RBC HW on older firmware. Newer firmware=
<br>
&gt; uses a SW RBC and this bit has to be set by the driver.<br>
<br>
Mhm, another question came to my mind: Would it now be possible for user <b=
r>
space to set this flag and and gain access to the kernel driver commands?<b=
r>
<br>
Cause that could be a security problem.<br>
<br>
Christian.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Thong Thai &lt;thong.thai@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |&nbsp; 1 &#43;<br=
>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c&nbsp;&nbsp; | 12 &#4=
3;&#43;&#43;&#43;&#43;&#43;------<br>
&gt;&nbsp;&nbsp; 2 files changed, 7 insertions(&#43;), 6 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vcn.h<br>
&gt; index 5e2453ee6b29..4d3bf4adf1eb 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h<br>
&gt; @@ -30,6 &#43;30,7 @@<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VCN_FIRMWARE_OFFSET&nbsp; 256<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VCN_MAX_ENC_RINGS&nbsp;&nbsp;&nbsp; 3<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;#define VCN_DEC_KMD_CMD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 0x80000000<br>
&gt;&nbsp;&nbsp; #define VCN_DEC_CMD_FENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000000<br>
&gt;&nbsp;&nbsp; #define VCN_DEC_CMD_TRAP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000001<br>
&gt;&nbsp;&nbsp; #define VCN_DEC_CMD_WRITE_REG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00000004<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/a=
md/amdgpu/vcn_v2_0.c<br>
&gt; index bc9726787c97..7091aef95ff0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c<br>
&gt; @@ -1488,7 &#43;1488,7 @@ static void vcn_v2_0_dec_ring_insert_start(s=
truct amdgpu_ring *ring)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_S=
TART &lt;&lt; 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_KMD_CMD =
| (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt; @@ -1501,7 &#43;1501,7 @@ static void vcn_v2_0_dec_ring_insert_start(s=
truct amdgpu_ring *ring)<br>
&gt;&nbsp;&nbsp; static void vcn_v2_0_dec_ring_insert_end(struct amdgpu_rin=
g *ring)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_PACKET_E=
ND &lt;&lt; 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_KMD_CMD =
| (VCN_DEC_CMD_PACKET_END &lt;&lt; 1));<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt; @@ -1546,7 &#43;1546,7 @@ static void vcn_v2_0_dec_ring_emit_fence(str=
uct amdgpu_ring *ring, u64 addr, u64<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, uppe=
r_32_bits(addr) &amp; 0xff);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_FENCE &l=
t;&lt; 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_KMD_CMD =
| (VCN_DEC_CMD_FENCE &lt;&lt; 1));<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET, 0));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0);<=
br>
&gt; @@ -1556,7 &#43;1556,7 @@ static void vcn_v2_0_dec_ring_emit_fence(str=
uct amdgpu_ring *ring, u64 addr, u64<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_TRAP &lt=
;&lt; 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_KMD_CMD =
| (VCN_DEC_CMD_TRAP &lt;&lt; 1));<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt; @@ -1600,7 &#43;1600,7 @@ static void vcn_v2_0_dec_ring_emit_reg_wait(=
struct amdgpu_ring *ring,<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_REG_READ=
_COND_WAIT &lt;&lt; 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_KMD_CMD =
| (VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1));<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static void vcn_v2_0_dec_ring_emit_vm_flush(struct amdgpu_=
ring *ring,<br>
&gt; @@ -1629,7 &#43;1629,7 @@ static void vcn_v2_0_dec_ring_emit_wreg(stru=
ct amdgpu_ring *ring,<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACK=
ET0(mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET, 0));<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_CMD_WRITE_RE=
G &lt;&lt; 1);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, VCN_DEC_KMD_CMD =
| (VCN_DEC_CMD_WRITE_REG &lt;&lt; 1));<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_BN6PR1201MB0178F74D883BC13DD35CDC369DC00BN6PR1201MB0178_--

--===============1076389457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1076389457==--

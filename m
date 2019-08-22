Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990799426
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2716E9EC;
	Thu, 22 Aug 2019 12:47:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700073.outbound.protection.outlook.com [40.107.70.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490BC6E9EC
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiKv2Lp+MKLZttxJQMzbDe/NVUv6LFymBnPCjtQzNRf4PReyUXCalPKtHBM4JibuDdeE2tI+JS/KU7RgrLjm8hdILUi7hY+MvjxCD4rBmUl0W38VjASY8Z3ToTkYtLw/7My+mx0GUqJvs2e6W7ytPOQx+VtBK99rXiOgry+JFBcTtmus5scG2L29C4caMk8jbn678y5n+D1S2vRUQ113Jb5ce/Ay8XwuVvHT5XLqorM8esKMXi8KhKpG8Yf0kZuYv/T0rfgKMDiM84TWnPrWepXp82wjG5C9bDCWGZxoGyIm220XI8s5IWR0q8iP9zMLhLAcfktxJPIhJbA0dG7WRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70AdVcvGev5i35pXd7v34wWa0bLjYdOJCNtPSUz/pc8=;
 b=A2A+GdNSGOEnupxdf4duoSJdwtap5WoRVJiK7DJjmdhOf7x0EuVa0AwlphQ0kIZZam7dfnuVwSkKLa5C0TK+UXY4mr6gaLllkZOdn8KpAA3HZpDEiardfWb7+gFHo2ETlw6YgD6fkxOq3A1S/uuJ8hM3IdWhUf6qpIkdAC8o/j8elaSyk8jRF6MhjBx0oCQKsZXZd+Fjb2DmTx87h8ab1Bk7YiQlPZFtwxy8PmwI7EhDoyJtZu4P8ktZrVcip07GZxY9PIpj8WyZ84TQpgC/B4d+jfoFTu0CW8u25KJqwOlFIwAhWydhV3wxo/KzhYgmawsvnMtsuGtBQ06OtHoXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1681.namprd12.prod.outlook.com (10.172.19.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 12:47:51 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 12:47:51 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP HDP
 flush
Thread-Topic: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP HDP
 flush
Thread-Index: AQHVWG6wuBts0QAPf0eTQzrz17f/yacG6BWAgAA2eUg=
Date: Thu, 22 Aug 2019 12:47:51 +0000
Message-ID: <BN6PR12MB1809C8AD78F826E8D3CD30F4F7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190821222034.13387-1-alexander.deucher@amd.com>
 <20190821222034.13387-5-alexander.deucher@amd.com>,
 <217a929a-543f-7aa4-4494-3569f9998a97@gmail.com>
In-Reply-To: <217a929a-543f-7aa4-4494-3569f9998a97@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70a084c5-2fc0-482b-b9b3-08d726fef1c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1681; 
x-ms-traffictypediagnostic: BN6PR12MB1681:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1681667864E83500C1210F7BF7A50@BN6PR12MB1681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(189003)(199004)(71190400001)(71200400001)(9686003)(105004)(55016002)(66946007)(25786009)(478600001)(19627405001)(66556008)(76116006)(66476007)(64756008)(54896002)(316002)(66066001)(33656002)(52536014)(2906002)(446003)(8676002)(110136005)(11346002)(476003)(486006)(5660300002)(86362001)(81156014)(81166006)(229853002)(102836004)(6636002)(8936002)(7736002)(66446008)(2501003)(14454004)(3846002)(186003)(26005)(7696005)(6116002)(6246003)(6506007)(53546011)(76176011)(74316002)(6436002)(256004)(99286004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1681;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dKcf0vBpQZWjKrBYEnjua5Rsey3oPAs1SByx+F7kt8iRmTfFVplyqhl3Zp6UHdZVWjycLubMm/epDCbCeaEI2cj96Zo09E4R4fgSveA/7dUWSojqbffiWzLqKYDHIMlDvtalui+BmgJypTDwFq40pbi1v5c6Y3KFV+Mslcywv9zrFqEB2jfhFNHyRutRlHsT9UxESKbbl2CZE0u3hIeBVxt5Ap50bVB6T9LuK2opAw8q8oiaBIb0lAdGCifkAoiSDXRavgm4y/NZcUIjB5qxfg9mp7iId74+R2MP/SRIdKJzpkuOlG2FrXU/2N4XHUBB9IxesmOA8J+/pHIgPLSrrMAO+BQVtd17UCX4tLB0mpdujYiox/6vc/UlbpAU3DUW3/HPEM+IMeyayQA9Apyfx6Hqx7LQc0zS0X/nRbXx/TM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a084c5-2fc0-482b-b9b3-08d726fef1c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:47:51.4476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeHYvfCO9o0ZIejoChIRhS3OavtlddHDYPxDVgg1vkG8xWOvm8ZHiMa9DXP6gsOfTTXZBp/d9wUiAyO9QF86ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70AdVcvGev5i35pXd7v34wWa0bLjYdOJCNtPSUz/pc8=;
 b=iuAKeXfOJ6f74529i+4A8AjiShm1cJuUNKGNmk3eCxqMTuaSeB6v5AyOTNKTPjckXXG++j6N0RJ/2panq6+kdZv+YXpfx+atXgN0bBZ1AD8Fae+KO4OnJrO2yvWvXyawMNR5qjKLKbaXQsbWDpZithAEouEirShVOuU45TSq2W8=
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
Content-Type: multipart/mixed; boundary="===============1592280231=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1592280231==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809C8AD78F826E8D3CD30F4F7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809C8AD78F826E8D3CD30F4F7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This was an old patch I accidentally sent out.  Please ignore.

Alex
________________________________
From: Christian K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, August 22, 2019 5:32 AM
To: Alex Deucher <alexdeucher@gmail.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP HDP=
 flush

Every time we actually tried this it just ended in users reporting CP hangs=
.

Christian.

Am 22.08.19 um 00:20 schrieb Alex Deucher:
> Flush via the ring works differently on CIK and requires a
> special sequence.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/radeon/cik.c | 73 +++++++++++++++++++++++++++----------=
-------
>   1 file changed, 45 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 0847367..03dd075 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -3485,6 +3485,48 @@ int cik_ring_test(struct radeon_device *rdev, stru=
ct radeon_ring *ring)
>        return r;
>   }
>
> +static void cik_gfx_hdp_flush(struct radeon_device *rdev,
> +                           int ridx)
> +{
> +     struct radeon_ring *ring =3D &rdev->ring[ridx];
> +     u32 ref_and_mask;
> +
> +     switch (ring->idx) {
> +     case CAYMAN_RING_TYPE_CP1_INDEX:
> +     case CAYMAN_RING_TYPE_CP2_INDEX:
> +             switch (ring->me) {
> +             case 0:
> +                     ref_and_mask =3D CP2 << ring->pipe;
> +                     break;
> +             case 1:
> +                     ref_and_mask =3D CP6 << ring->pipe;
> +                     break;
> +             default:
> +                     return;
> +             }
> +             break;
> +     case RADEON_RING_TYPE_GFX_INDEX:
> +             ref_and_mask =3D CP0;
> +             break;
> +     default:
> +             return;
> +     }
> +
> +     radeon_ring_write(ring, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
> +     radeon_ring_write(ring, ((CP_WAIT_REG_MEM_TIMEOUT -
> +                               PACKET3_SET_UCONFIG_REG_START) >> 2));
> +     radeon_ring_write(ring, 0xfff);
> +
> +     radeon_ring_write(ring, PACKET3(PACKET3_WAIT_REG_MEM, 5));
> +     radeon_ring_write(ring, (WAIT_REG_MEM_OPERATION(1) | /* special op =
*/
> +                              WAIT_REG_MEM_FUNCTION(3))); /* =3D=3D */
> +     radeon_ring_write(ring, GPU_HDP_FLUSH_REQ >> 2);
> +     radeon_ring_write(ring, GPU_HDP_FLUSH_DONE >> 2);
> +     radeon_ring_write(ring, ref_and_mask);
> +     radeon_ring_write(ring, ref_and_mask);
> +     radeon_ring_write(ring, 0xa); /* poll interval */
> +}
> +
>   /**
>    * cik_fence_gfx_ring_emit - emit a fence on the gfx ring
>    *
> @@ -3511,15 +3553,7 @@ void cik_fence_gfx_ring_emit(struct radeon_device =
*rdev,
>        radeon_ring_write(ring, fence->seq);
>        radeon_ring_write(ring, 0);
>        /* HDP flush */
> -     /* We should be using the new WAIT_REG_MEM special op packet here
> -      * but it causes the CP to hang
> -      */
> -     radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
> -     radeon_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
> -                              WRITE_DATA_DST_SEL(0)));
> -     radeon_ring_write(ring, HDP_MEM_COHERENCY_FLUSH_CNTL >> 2);
> -     radeon_ring_write(ring, 0);
> -     radeon_ring_write(ring, 0);
> +     cik_gfx_hdp_flush(rdev, fence->ring);
>   }
>
>   /**
> @@ -3549,15 +3583,7 @@ void cik_fence_compute_ring_emit(struct radeon_dev=
ice *rdev,
>        radeon_ring_write(ring, fence->seq);
>        radeon_ring_write(ring, 0);
>        /* HDP flush */
> -     /* We should be using the new WAIT_REG_MEM special op packet here
> -      * but it causes the CP to hang
> -      */
> -     radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
> -     radeon_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
> -                              WRITE_DATA_DST_SEL(0)));
> -     radeon_ring_write(ring, HDP_MEM_COHERENCY_FLUSH_CNTL >> 2);
> -     radeon_ring_write(ring, 0);
> -     radeon_ring_write(ring, 0);
> +     cik_gfx_hdp_flush(rdev, fence->ring);
>   }
>
>   bool cik_semaphore_ring_emit(struct radeon_device *rdev,
> @@ -5369,16 +5395,7 @@ void cik_vm_flush(struct radeon_device *rdev, int =
ridx, struct radeon_vm *vm)
>        radeon_ring_write(ring, VMID(0));
>
>        /* HDP flush */
> -     /* We should be using the WAIT_REG_MEM packet here like in
> -      * cik_fence_ring_emit(), but it causes the CP to hang in this
> -      * context...
> -      */
> -     radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
> -     radeon_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
> -                              WRITE_DATA_DST_SEL(0)));
> -     radeon_ring_write(ring, HDP_MEM_COHERENCY_FLUSH_CNTL >> 2);
> -     radeon_ring_write(ring, 0);
> -     radeon_ring_write(ring, 0);
> +     cik_gfx_hdp_flush(rdev, ridx);
>
>        /* bits 0-15 are the VM contexts0-15 */
>        radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));


--_000_BN6PR12MB1809C8AD78F826E8D3CD30F4F7A50BN6PR12MB1809namp_
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
This was an old patch I accidentally sent out.&nbsp; Please ignore.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K&ouml;nig =
&lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 5:32 AM<br>
<b>To:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for=
 CP HDP flush</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Every time we actually tried this it just ended in=
 users reporting CP hangs.<br>
<br>
Christian.<br>
<br>
Am 22.08.19 um 00:20 schrieb Alex Deucher:<br>
&gt; Flush via the ring works differently on CIK and requires a<br>
&gt; special sequence.<br>
&gt;<br>
&gt; Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/radeon/cik.c | 73 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----------------<br>
&gt;&nbsp;&nbsp; 1 file changed, 45 insertions(&#43;), 28 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik=
.c<br>
&gt; index 0847367..03dd075 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/cik.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/radeon/cik.c<br>
&gt; @@ -3485,6 &#43;3485,48 @@ int cik_ring_test(struct radeon_device *rde=
v, struct radeon_ring *ring)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;static void cik_gfx_hdp_flush(struct radeon_device *rdev,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; int ridx)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_ring *ring =3D &amp;rdev-&=
gt;ring[ridx];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u32 ref_and_mask;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; switch (ring-&gt;idx) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case CAYMAN_RING_TYPE_CP1_INDEX:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case CAYMAN_RING_TYPE_CP2_INDEX:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; switch (ring-&gt;me) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; case 0:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_and_mask =3D CP=
2 &lt;&lt; ring-&gt;pipe;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; case 1:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_and_mask =3D CP=
6 &lt;&lt; ring-&gt;pipe;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case RADEON_RING_TYPE_GFX_INDEX:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ref_and_mask =3D CP0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKET3_=
SET_UCONFIG_REG, 1));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, ((CP_WAIT_REG_ME=
M_TIMEOUT -<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PACKET3_SET_UCONFIG_REG_START) &gt=
;&gt; 2));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0xfff);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKET3_=
WAIT_REG_MEM, 5));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WAIT_REG_MEM_OP=
ERATION(1) | /* special op */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WAIT_REG_MEM_FUNCTION(3))); /* =3D=3D */=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, GPU_HDP_FLUSH_RE=
Q &gt;&gt; 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, GPU_HDP_FLUSH_DO=
NE &gt;&gt; 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, ref_and_mask);<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, ref_and_mask);<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0xa); /* poll in=
terval */<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp; * cik_fence_gfx_ring_emit - emit a fence on the gfx =
ring<br>
&gt;&nbsp;&nbsp;&nbsp; *<br>
&gt; @@ -3511,15 &#43;3553,7 @@ void cik_fence_gfx_ring_emit(struct radeon_=
device *rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, fenc=
e-&gt;seq);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HDP flush */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* We should be using the new WAIT_REG_MEM s=
pecial op packet here<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but it causes the CP to hang<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKET3_WRIT=
E_DATA, 3));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WRITE_DATA_ENGINE_S=
EL(0) |<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0)));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, HDP_MEM_COHERENCY_FL=
USH_CNTL &gt;&gt; 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cik_gfx_hdp_flush(rdev, fence-&gt;ring);=
<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt; @@ -3549,15 &#43;3583,7 @@ void cik_fence_compute_ring_emit(struct rad=
eon_device *rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, fenc=
e-&gt;seq);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HDP flush */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* We should be using the new WAIT_REG_MEM s=
pecial op packet here<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but it causes the CP to hang<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKET3_WRIT=
E_DATA, 3));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WRITE_DATA_ENGINE_S=
EL(0) |<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0)));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, HDP_MEM_COHERENCY_FL=
USH_CNTL &gt;&gt; 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cik_gfx_hdp_flush(rdev, fence-&gt;ring);=
<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; bool cik_semaphore_ring_emit(struct radeon_device *rdev,<b=
r>
&gt; @@ -5369,16 &#43;5395,7 @@ void cik_vm_flush(struct radeon_device *rde=
v, int ridx, struct radeon_vm *vm)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, VMID=
(0));<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HDP flush */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* We should be using the WAIT_REG_MEM packe=
t here like in<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * cik_fence_ring_emit(), but it causes=
 the CP to hang in this<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * context...<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKET3_WRIT=
E_DATA, 3));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WRITE_DATA_ENGINE_S=
EL(0) |<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0)));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, HDP_MEM_COHERENCY_FL=
USH_CNTL &gt;&gt; 2);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; cik_gfx_hdp_flush(rdev, ridx);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bits 0-15 are the VM cont=
exts0-15 */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACK=
ET3(PACKET3_WRITE_DATA, 3));<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809C8AD78F826E8D3CD30F4F7A50BN6PR12MB1809namp_--

--===============1592280231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1592280231==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945260C4D
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 22:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5866E53C;
	Fri,  5 Jul 2019 20:22:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE756E53C
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 20:22:32 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1345.namprd12.prod.outlook.com (10.168.225.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Fri, 5 Jul 2019 20:22:30 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::45c9:2de0:833f:98f4]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::45c9:2de0:833f:98f4%9]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 20:22:30 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/ttm: make some functions static
Thread-Topic: [PATCH] drm/amdgpu/ttm: make some functions static
Thread-Index: AQHVM1TZZtDzHxaAUEi8JsvfCyo+IKa8YOSAgAAW6eY=
Date: Fri, 5 Jul 2019 20:22:30 +0000
Message-ID: <BN6PR12MB161810373183A43F8FE1AB7085F50@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190705171227.21009-1-alexander.deucher@amd.com>,
 <f4c1f72f-9dfa-da35-eb1f-5f58dbabdc3f@amd.com>
In-Reply-To: <f4c1f72f-9dfa-da35-eb1f-5f58dbabdc3f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:cd79:f422:7b2e:f082]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9df152ad-f66c-4783-409c-08d701868185
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1345; 
x-ms-traffictypediagnostic: BN6PR12MB1345:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB134595E567E8E108A39B694985F50@BN6PR12MB1345.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(68736007)(11346002)(476003)(86362001)(446003)(7736002)(72206003)(14454004)(966005)(33656002)(256004)(5660300002)(606006)(2501003)(478600001)(74316002)(110136005)(2906002)(25786009)(316002)(4326008)(486006)(102836004)(6116002)(76176011)(7696005)(6436002)(52536014)(55016002)(53546011)(229853002)(186003)(99286004)(6506007)(46003)(6246003)(73956011)(66946007)(66476007)(64756008)(66556008)(66446008)(71190400001)(236005)(9686003)(54896002)(6306002)(81166006)(81156014)(8676002)(53936002)(8936002)(71200400001)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1345;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BtZrwRdbqzkJpBKPT8OdFVLnEqQu004tZz31unAUDyDNBhe8TGOo5fFUuqy9pfglbmoA1UgBDddtN81XQCWgFci6YIEXXe2ocbN9FlXxJ/dE1T3lMx0Kl9je+NfRRfu/kjzFiqG9kCQy9/itiTRpi3wfXPmbKBrmq+agwprVwyPChizhAhEzWLJ1yfHC1qX8lgLZZwzkBLTToSTEjFKDdeFLeCZGZkNkMY/rKROzEDAVbtxJoXrF6SnFny7InXil3UMAA2E7Pt1Xqp64Mi6X1zRmnkgB4ShWjNOZp9NBVJCdhu0eVzjYH0j6Jw+gh7XWpq28tXNmYIkQtLTzUyTdL/BH+qgbnFupvtfUz0Pwyk5gBIZzPQW8nesgbZqtUDgSGq2TkA8BxfkZn2EYwInbDp+mT5sFm43Y2YfBClokDNU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df152ad-f66c-4783-409c-08d701868185
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 20:22:30.5364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st2ZmFOlC6p8sIe0OQYLfL38CdHzGJX3huEEZBHpcms=;
 b=crmIvnD37Ls7PMk+ZuKvkoQJJhGsmyEYl0beDllgXIFx/1scf3D5jCcGQCkixzFdiBRMYt7haFtx6YKOpKzUN6eUUdrUxqKNM91wg+gOzGMCzwQmhZ8o95L9h2N7tuDVlx/OXPbEbCFBMz3xMqXHqF8M/hZwhVptCa58vsVj8wg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1676091810=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1676091810==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB161810373183A43F8FE1AB7085F50BN6PR12MB1618namp_"

--_000_BN6PR12MB161810373183A43F8FE1AB7085F50BN6PR12MB1618namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How would we handle that? Having a revert on amd-kfd-staging? We can ensure=
 that amd-staging-dkms doesn't cherrypick it in, but since KFD merges, it w=
ould be more complicated.

Kent

KENT RUSSELL
Sr. Software Engineer | Linux Compute Kernel
1 Commerce Valley Drive East
Markham, ON L3T 7X6
O +(1) 289-695-2122 | Ext 72122
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kuehling=
, Felix <Felix.Kuehling@amd.com>
Sent: Friday, July 5, 2019 2:59:31 PM
To: Alex Deucher; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander
Subject: Re: [PATCH] drm/amdgpu/ttm: make some functions static

On 2019-07-05 1:12 p.m., Alex Deucher wrote:
> Noticed while reviewing the code.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

We'll need to be careful not to merge this change on amd-kfd-staging and
amd-staging-dkms. On those branches, this function is called from
amdgpu_amdkfd_gpuvm.c.

Regards,
   Felix


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 +++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
>   2 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index c9faa69cd677..d090106ef23b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -299,12 +299,12 @@ static struct drm_mm_node *amdgpu_find_mm_node(stru=
ct ttm_mem_reg *mem,
>    *
>    * @f: Returns the last fence if multiple jobs are submitted.
>    */
> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> -                            struct amdgpu_copy_mem *src,
> -                            struct amdgpu_copy_mem *dst,
> -                            uint64_t size,
> -                            struct reservation_object *resv,
> -                            struct dma_fence **f)
> +static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> +                                   struct amdgpu_copy_mem *src,
> +                                   struct amdgpu_copy_mem *dst,
> +                                   uint64_t size,
> +                                   struct reservation_object *resv,
> +                                   struct dma_fence **f)
>   {
>        struct amdgpu_ring *ring =3D adev->mman.buffer_funcs_ring;
>        struct drm_mm_node *src_mm, *dst_mm;
> @@ -949,7 +949,7 @@ static void amdgpu_ttm_tt_unpin_userptr(struct ttm_tt=
 *ttm)
>   #endif
>   }
>
> -int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,
> +static int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,
>                                struct ttm_buffer_object *tbo,
>                                uint64_t flags)
>   {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.h
> index c2b7669004ba..de89c218db26 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -86,12 +86,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint6=
4_t src_offset,
>                       struct reservation_object *resv,
>                       struct dma_fence **fence, bool direct_submit,
>                       bool vm_needs_flush);
> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> -                            struct amdgpu_copy_mem *src,
> -                            struct amdgpu_copy_mem *dst,
> -                            uint64_t size,
> -                            struct reservation_object *resv,
> -                            struct dma_fence **f);
>   int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>                        uint32_t src_data,
>                        struct reservation_object *resv,
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB161810373183A43F8FE1AB7085F50BN6PR12MB1618namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
How would we handle that? Having a revert on amd-kfd-staging? We can ensure=
 that amd-staging-dkms doesn't cherrypick it in, but since KFD merges, it w=
ould be more complicated.<br>
<br>
Kent<br>
<br>
KENT RUSSELL<br>
Sr. Software Engineer | Linux Compute Kernel<br>
1 Commerce Valley Drive East<br>
Markham, ON L3T 7X6<br>
O &#43;(1) 289-695-2122 | Ext 72122<br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kuehling, Felix &lt;Felix.Kue=
hling@amd.com&gt;<br>
<b>Sent:</b> Friday, July 5, 2019 2:59:31 PM<br>
<b>To:</b> Alex Deucher; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/ttm: make some functions static</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2019-07-05 1:12 p.m., Alex Deucher wrote:<br>
&gt; Noticed while reviewing the code.<br>
&gt;<br>
&gt; Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
Reviewed-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
<br>
We'll need to be careful not to merge this change on amd-kfd-staging and <b=
r>
amd-staging-dkms. On those branches, this function is called from <br>
amdgpu_amdkfd_gpuvm.c.<br>
<br>
Regards,<br>
&nbsp;&nbsp; Felix<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;-------<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |&nbsp; 6 ------<b=
r>
&gt;&nbsp;&nbsp; 2 files changed, 7 insertions(&#43;), 13 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c<br>
&gt; index c9faa69cd677..d090106ef23b 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; @@ -299,12 &#43;299,12 @@ static struct drm_mm_node *amdgpu_find_mm_no=
de(struct ttm_mem_reg *mem,<br>
&gt;&nbsp;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp; * @f: Returns the last fence if multiple jobs are su=
bmitted.<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt; -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct amdgpu_copy_mem *src,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct amdgpu_copy_mem *dst,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; uint64_t size,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct reservation_object *resv,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct dma_fence **f)<br>
&gt; &#43;static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amd=
gpu_copy_mem *src,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amd=
gpu_copy_mem *dst,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t s=
ize,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct res=
ervation_object *resv,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma=
_fence **f)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring =3D=
 adev-&gt;mman.buffer_funcs_ring;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_mm_node *src_mm, =
*dst_mm;<br>
&gt; @@ -949,7 &#43;949,7 @@ static void amdgpu_ttm_tt_unpin_userptr(struct=
 ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp; #endif<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; -int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,<br>
&gt; &#43;static int amdgpu_ttm_gart_bind(struct amdgpu_device *adev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_buffer_object *tbo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t flags)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.h<br>
&gt; index c2b7669004ba..de89c218db26 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h<br>
&gt; @@ -86,12 &#43;86,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring=
, uint64_t src_offset,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct reserv=
ation_object *resv,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dma_fe=
nce **fence, bool direct_submit,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool vm_needs=
_flush);<br>
&gt; -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct amdgpu_copy_mem *src,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct amdgpu_copy_mem *dst,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; uint64_t size,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct reservation_object *resv,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; struct dma_fence **f);<br>
&gt;&nbsp;&nbsp; int amdgpu_fill_buffer(struct amdgpu_bo *bo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_=
t src_data,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct =
reservation_object *resv,<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB161810373183A43F8FE1AB7085F50BN6PR12MB1618namp_--

--===============1676091810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1676091810==--

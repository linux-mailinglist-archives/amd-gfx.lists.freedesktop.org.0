Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F2B23B6
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Sep 2019 17:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A69C6F408;
	Fri, 13 Sep 2019 15:57:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D296F408
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Sep 2019 15:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpCpo6l6jmDfpw+9jtAaxqIij7bKH9/t/IEiuvFy1xDURA7MT4MCGNiny+9G+e6iPV7cAsCNem0cb9ax5qdepLL3/UHUYcRE9pDlOZh/VbJP7sca/079yZq+tQFI6F9+S0aCkyhKxfofMjPDX5nk3rlpy/xVYjenaGDXKT6vuvZqEiCpnm081YZp76ARZHJF6uzLBU7K+Z4sWliHKyMRGa/K403p/Zj4JGsnOXZVpiVQiZlmjPo7npb5DHGfarCzWXMvf1zmdkZOSyhYOmOs4kG56vJCqZFfJ+VRDYEk+c/YmMZi2P4d9K3stEbPjhTafnS+MzPkwqkVmPgJ1iCotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNz+73HdcbJYUe/lVggpBUcRHGUzYzO0NOOXGyKu/fk=;
 b=Kp8SgMg2UY4N6ikqpF5/46USboEvsGHbQO4Jtcalg/GWAhYBL3qE6qJvu2Rfmp5l8abdB1eQCQx12AjRKAyTTgETiXpQ8+tdzItuOf+NXbanzyMMjaAakUW6Cc6kzugZ5JOBgUIzs+sLuBZOUPEQxqTyktzFJtimVjHQvd0P80xXez2d5dk/3887VZD7N2GNnwSuwJ/6CJ3eIH8Bql0SRm5Z+2cn1jhSgyAZutHdgLj1jpVEmQQ1EDornK2i8H8NX2YCjkdVxBm4SUAkaPFYLpX+1elIh8/6PDbGiyAv8hJVEz7GLNOYKEIn3EmOVvF8I8xOiNqgMk0iBVu+wmlI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1394.namprd12.prod.outlook.com (10.168.228.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Fri, 13 Sep 2019 15:57:45 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f%8]) with mapi id 15.20.2241.022; Fri, 13 Sep 2019
 15:57:45 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdgpu: trace if a PD/PT update is done directly
Thread-Topic: [PATCH 3/3] drm/amdgpu: trace if a PD/PT update is done directly
Thread-Index: AQHVai1PLjt6TCkQ80mgAcWFaZ1Z4Kcpw4q5
Date: Fri, 13 Sep 2019 15:57:44 +0000
Message-ID: <BN6PR12MB18096F1BC80E66293A954307F7B30@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190913121801.96728-1-christian.koenig@amd.com>,
 <20190913121801.96728-3-christian.koenig@amd.com>
In-Reply-To: <20190913121801.96728-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f96b4a8-6cba-41bc-04cf-08d738631de4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1394; 
x-ms-traffictypediagnostic: BN6PR12MB1394:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1394BB4CD01D0BC1BA3252C2F7B30@BN6PR12MB1394.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:121;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(606006)(7736002)(86362001)(66946007)(66476007)(76116006)(25786009)(64756008)(53936002)(9686003)(54896002)(6306002)(966005)(74316002)(52536014)(6246003)(66556008)(66446008)(71200400001)(14454004)(66574012)(15650500001)(71190400001)(236005)(6436002)(229853002)(8936002)(55016002)(33656002)(2906002)(3846002)(81166006)(81156014)(8676002)(6116002)(99286004)(5660300002)(19627405001)(7696005)(102836004)(53546011)(76176011)(110136005)(316002)(6506007)(105004)(26005)(478600001)(66066001)(256004)(2501003)(486006)(476003)(14444005)(186003)(446003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1394;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0LaTX0GLRQNCB5u/f6VgTTFdYogXixYM0BAa3BaXUdmnHkqiIOAqnISh9XGz22fUloLuRWQ1yDtsdELYH9EtbO0u/fK2iLHfn2f/eKEYtNRxartEh5T0y7sGDw7iyXqYzAz87ZxFON7r3Pe+s0BkjXiBIAQcAP9+zq5waKMkFgq4Bo37P5N5+rU8GRULB2j+kGWSnBKmQBkCsjIFkegbdTjgRoscznImKvXzDw3tGBNBeF6rYrqpBR+UyGGjYnBpU4s8AAvgv7F5ht0aa5LJdzCSFezLPIbc2sf50OWONKI0EoK9XKynRDr+SiQN9649jUHGg+3wCcjoNE+bK7cxqDhFriuWjJr4SS0o1HY/b3AfT7lqCsUBYj9TB05DUCBziFf8t1rbUWNnpBCywfDOwYfIUmF90fhMw3Ok37p9sUQ=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f96b4a8-6cba-41bc-04cf-08d738631de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 15:57:44.9615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1HPx+TGjtSj8ZtojKU1wywSzvdmA8A9PfGGVwV5x4zPrAXYPNvics9mpraJYo8W7BeEu41rF6+Rd5VzVuqCW4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1394
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNz+73HdcbJYUe/lVggpBUcRHGUzYzO0NOOXGyKu/fk=;
 b=J++53/PO/FQCYHoxBTLdzwSf0pjJOWpp6Jbp3ldOg/b9jG0UTa3EJSxDeMkHJq2tRZnSGqg6vutN1HKWTugCQOX/eima1IocjI7Vi+Qty2tMxCmZd1/jxX7vARN2I9us9YbLzhjvNW2XBc8F3kQzOYEN3hprbpzB7iIa3Kd3afw=
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
Content-Type: multipart/mixed; boundary="===============0246877218=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0246877218==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18096F1BC80E66293A954307F7B30BN6PR12MB1809namp_"

--_000_BN6PR12MB18096F1BC80E66293A954307F7B30BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Christia=
n K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Friday, September 13, 2019 8:18 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdgpu: trace if a PD/PT update is done directly

This is usfull for debugging.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   | 23 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  4 ++--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h
index d3ca2424b5fe..e9feb5a8fb9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -325,14 +325,15 @@ DEFINE_EVENT(amdgpu_vm_mapping, amdgpu_vm_bo_cs,

 TRACE_EVENT(amdgpu_vm_set_ptes,
             TP_PROTO(uint64_t pe, uint64_t addr, unsigned count,
-                    uint32_t incr, uint64_t flags),
-           TP_ARGS(pe, addr, count, incr, flags),
+                    uint32_t incr, uint64_t flags, bool direct),
+           TP_ARGS(pe, addr, count, incr, flags, direct),
             TP_STRUCT__entry(
                              __field(u64, pe)
                              __field(u64, addr)
                              __field(u32, count)
                              __field(u32, incr)
                              __field(u64, flags)
+                            __field(bool, direct)
                              ),

             TP_fast_assign(
@@ -341,28 +342,32 @@ TRACE_EVENT(amdgpu_vm_set_ptes,
                            __entry->count =3D count;
                            __entry->incr =3D incr;
                            __entry->flags =3D flags;
+                          __entry->direct =3D direct;
                            ),
-           TP_printk("pe=3D%010Lx, addr=3D%010Lx, incr=3D%u, flags=3D%llx,=
 count=3D%u",
-                     __entry->pe, __entry->addr, __entry->incr,
-                     __entry->flags, __entry->count)
+           TP_printk("pe=3D%010Lx, addr=3D%010Lx, incr=3D%u, flags=3D%llx,=
 count=3D%u, "
+                     "direct=3D%d", __entry->pe, __entry->addr, __entry->i=
ncr,
+                     __entry->flags, __entry->count, __entry->direct)
 );

 TRACE_EVENT(amdgpu_vm_copy_ptes,
-           TP_PROTO(uint64_t pe, uint64_t src, unsigned count),
-           TP_ARGS(pe, src, count),
+           TP_PROTO(uint64_t pe, uint64_t src, unsigned count, bool direct=
),
+           TP_ARGS(pe, src, count, direct),
             TP_STRUCT__entry(
                              __field(u64, pe)
                              __field(u64, src)
                              __field(u32, count)
+                            __field(bool, direct)
                              ),

             TP_fast_assign(
                            __entry->pe =3D pe;
                            __entry->src =3D src;
                            __entry->count =3D count;
+                          __entry->direct =3D direct;
                            ),
-           TP_printk("pe=3D%010Lx, src=3D%010Lx, count=3D%u",
-                     __entry->pe, __entry->src, __entry->count)
+           TP_printk("pe=3D%010Lx, src=3D%010Lx, count=3D%u, direct=3D%d",
+                     __entry->pe, __entry->src, __entry->count,
+                     __entry->direct)
 );

 TRACE_EVENT(amdgpu_vm_flush,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm_cpu.c
index a2daeadd770f..73fec7a0ced5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -89,7 +89,7 @@ static int amdgpu_vm_cpu_update(struct amdgpu_vm_update_p=
arams *p,

         pe +=3D (unsigned long)amdgpu_bo_kptr(bo);

-       trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags);
+       trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags, p->direct);

         for (i =3D 0; i < count; i++) {
                 value =3D p->pages_addr ?
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm_sdma.c
index 38c966cedc26..e8db1467a71d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -143,7 +143,7 @@ static void amdgpu_vm_sdma_copy_ptes(struct amdgpu_vm_u=
pdate_params *p,
         src +=3D p->num_dw_left * 4;

         pe +=3D amdgpu_bo_gpu_offset(bo);
-       trace_amdgpu_vm_copy_ptes(pe, src, count);
+       trace_amdgpu_vm_copy_ptes(pe, src, count, p->direct);

         amdgpu_vm_copy_pte(p->adev, ib, pe, src, count);
 }
@@ -170,7 +170,7 @@ static void amdgpu_vm_sdma_set_ptes(struct amdgpu_vm_up=
date_params *p,
         struct amdgpu_ib *ib =3D p->job->ibs;

         pe +=3D amdgpu_bo_gpu_offset(bo);
-       trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags);
+       trace_amdgpu_vm_set_ptes(pe, addr, count, incr, flags, p->direct);
         if (count < 3) {
                 amdgpu_vm_write_pte(p->adev, ib, pe, addr | flags,
                                     count, incr);
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18096F1BC80E66293A954307F7B30BN6PR12MB1809namp_
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
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Christian K=F6nig &lt;ckoenig=
.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Friday, September 13, 2019 8:18 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> [PATCH 3/3] drm/amdgpu: trace if a PD/PT update is done dir=
ectly</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This is usfull for debugging.<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h&nbsp;&nbsp; | 23 &#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c&nbsp; |&nbsp; 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |&nbsp; 4 &#43;&#43;--<br=
>
&nbsp;3 files changed, 17 insertions(&#43;), 12 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_trace.h<br>
index d3ca2424b5fe..e9feb5a8fb9d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>
@@ -325,14 &#43;325,15 @@ DEFINE_EVENT(amdgpu_vm_mapping, amdgpu_vm_bo_cs,<=
br>
&nbsp;<br>
&nbsp;TRACE_EVENT(amdgpu_vm_set_ptes,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_PROTO(uint64_t pe, uint64_t addr, unsigned count,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t incr, uint64_t flags),<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_ARGS(pe, a=
ddr, count, incr, flags),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t incr, uint64_t flags,=
 bool direct),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_ARGS(p=
e, addr, count, incr, flags, direct),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_STRUCT__entry(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u64, pe)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u64, addr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u32, count)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u32, incr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u64, flags)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; __field(bool, direct)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ),<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_fast_assign(<br>
@@ -341,28 &#43;342,32 @@ TRACE_EVENT(amdgpu_vm_set_ptes,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; __entry-&gt;count =3D count;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; __entry-&gt;incr =3D incr;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; __entry-&gt;flags =3D flags;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; __entry-&gt;direct =3D direct;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_printk(&qu=
ot;pe=3D%010Lx, addr=3D%010Lx, incr=3D%u, flags=3D%llx, count=3D%u&quot;,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __entry-&gt;pe, __entry-&gt;=
addr, __entry-&gt;incr,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __entry-&gt;flags, __entry-&=
gt;count)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_printk=
(&quot;pe=3D%010Lx, addr=3D%010Lx, incr=3D%u, flags=3D%llx, count=3D%u, &qu=
ot;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;direct=3D%d&quot;,=
 __entry-&gt;pe, __entry-&gt;addr, __entry-&gt;incr,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __entry-&gt;flags, __ent=
ry-&gt;count, __entry-&gt;direct)<br>
&nbsp;);<br>
&nbsp;<br>
&nbsp;TRACE_EVENT(amdgpu_vm_copy_ptes,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_PROTO(uint=
64_t pe, uint64_t src, unsigned count),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_ARGS(pe, s=
rc, count),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_PROTO(=
uint64_t pe, uint64_t src, unsigned count, bool direct),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_ARGS(p=
e, src, count, direct),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_STRUCT__entry(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u64, pe)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u64, src)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; __field(u32, count)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; __field(bool, direct)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ),<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP=
_fast_assign(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; __entry-&gt;pe =3D pe;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; __entry-&gt;src =3D src;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; __entry-&gt;count =3D count;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; __entry-&gt;direct =3D direct;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; ),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_printk(&qu=
ot;pe=3D%010Lx, src=3D%010Lx, count=3D%u&quot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __entry-&gt;pe, __entry-&gt;=
src, __entry-&gt;count)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TP_printk=
(&quot;pe=3D%010Lx, src=3D%010Lx, count=3D%u, direct=3D%d&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __entry-&gt;pe, __entry-=
&gt;src, __entry-&gt;count,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __entry-&gt;direct)<br>
&nbsp;);<br>
&nbsp;<br>
&nbsp;TRACE_EVENT(amdgpu_vm_flush,<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_vm_cpu.c<br>
index a2daeadd770f..73fec7a0ced5 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c<br>
@@ -89,7 &#43;89,7 @@ static int amdgpu_vm_cpu_update(struct amdgpu_vm_upda=
te_params *p,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pe &#43;=3D (unsigned long=
)amdgpu_bo_kptr(bo);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_vm_set_ptes(pe, addr, co=
unt, incr, flags);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_vm_set_ptes(pe, addr=
, count, incr, flags, p-&gt;direct);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; count=
; i&#43;&#43;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; value =3D p-&gt;pages_addr ?<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm_sdma.c<br>
index 38c966cedc26..e8db1467a71d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c<br>
@@ -143,7 &#43;143,7 @@ static void amdgpu_vm_sdma_copy_ptes(struct amdgpu_=
vm_update_params *p,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src &#43;=3D p-&gt;num_dw_=
left * 4;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pe &#43;=3D amdgpu_bo_gpu_=
offset(bo);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_vm_copy_ptes(pe, src, co=
unt);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_vm_copy_ptes(pe, src=
, count, p-&gt;direct);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_copy_pte(p-&gt;a=
dev, ib, pe, src, count);<br>
&nbsp;}<br>
@@ -170,7 &#43;170,7 @@ static void amdgpu_vm_sdma_set_ptes(struct amdgpu_v=
m_update_params *p,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ib *ib =3D p=
-&gt;job-&gt;ibs;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pe &#43;=3D amdgpu_bo_gpu_=
offset(bo);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_vm_set_ptes(pe, addr, co=
unt, incr, flags);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; trace_amdgpu_vm_set_ptes(pe, addr=
, count, incr, flags, p-&gt;direct);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (count &lt; 3) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_vm_write_pte(p-&gt;adev, ib, pe, addr | flags,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count, i=
ncr);<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18096F1BC80E66293A954307F7B30BN6PR12MB1809namp_--

--===============0246877218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0246877218==--

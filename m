Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0298714
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 00:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C874F6E9A4;
	Wed, 21 Aug 2019 22:23:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E796E9A4
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 22:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBvBEs7wD75G9Lxd5DZG9ZGEL9ihYTJ/oGgeOqDtvhww0NmIwRhvm/s/pu4sAvop0ufGmqrNXOa8jVi/eaRgzVbPE0NKOfqS+YMsav3uRMSN7BndrXWb1qd63lxIb2UFyXi9Iay8ZvVAQaIvO6SxPtH9fM8a8T+LOQ1ysJinWR2ZcLELUc4Gu/55uK7E9oVDTlHprGpBSclfPpdfsbN2NKfayPnBkbLi15E0xkQJHBM8MP2rdOWZA9AuEbOIv+ZmKMx9/X6yd8YNPsyHcsy77K94ukSyBEZy0F1gAUg+gf32z9M48DbKIrXRBwJWKL4gF4cVZdIYFJ0clWmQ6MDeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awz/alySlXXG9Go1RCO3oemyjtwXZs45qWog2tqiPQg=;
 b=cgcWpfaEhkQsYPUobLmk9YBFE0BEEE40LYfek1HfstVcWoScfjz5QQExBL4aRpaaAu/zgjOdAVMYrP9N6RWwwD4uAkj4aSnzXVqtJ0eQUEoCnDbj/tLGSGu6nEEvmWwsBnI/z5EV+HDWRgTlc1xDC5+IlQTgvmoEtiCyMKFbd8A9MIArGIpX3ns36HGVV4pHhOa+bxKIk2LnnJF3uOPkhEQl2mfZNvWWvMbteEN4ZXl0DCa4KcVFRGkTX7qlfLL9KIu3A2TmEmJprhx3YzD06ScaVv/W1/J5Iq6+MOWk4NXe0v0+KK7XBZHA+0ii14te4NRq1MtFSZZOcxdW2pLECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1299.namprd12.prod.outlook.com (10.168.227.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 22:23:34 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.018; Wed, 21 Aug 2019
 22:23:33 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP HDP
 flush
Thread-Topic: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP HDP
 flush
Thread-Index: AQHVWG6wuBts0QAPf0eTQzrz17f/yacGLTd+
Date: Wed, 21 Aug 2019 22:23:33 +0000
Message-ID: <BN6PR12MB1809DC90F9DBB4F86DCA278CF7AA0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190821222034.13387-1-alexander.deucher@amd.com>,
 <20190821222034.13387-5-alexander.deucher@amd.com>
In-Reply-To: <20190821222034.13387-5-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63db25f2-d682-4136-bc22-08d726863435
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1299; 
x-ms-traffictypediagnostic: BN6PR12MB1299:
x-microsoft-antispam-prvs: <BN6PR12MB129964CA13806D75F62099C3F7AA0@BN6PR12MB1299.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(25786009)(8676002)(478600001)(476003)(3846002)(2501003)(486006)(66446008)(64756008)(66556008)(66476007)(66946007)(105004)(19627405001)(86362001)(76116006)(66066001)(229853002)(11346002)(33656002)(446003)(6116002)(53936002)(71190400001)(71200400001)(2906002)(102836004)(256004)(14454004)(7736002)(6506007)(5660300002)(53546011)(316002)(76176011)(110136005)(55016002)(8936002)(26005)(186003)(54896002)(7696005)(81166006)(81156014)(6436002)(52536014)(99286004)(9686003)(74316002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1299;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PM1sFlSsylCKXhr3MY2F9fiubxNVcKeE5ZxVVJfnPC+8LB5zeW1T0wC4KG+xJrkuVVjK4qeg26pTqOCbFjbRoRnVQ53+wYYXhmBIKdOtlsOY7XWtRyQ7NWkpPoppRQ2h5Ci9cQqKgtPOuavI3GwRgzPqmTyK6/mAgtR1GVLoYjxGrkSBjE5NB9GfyVQQo8kWpBIuClo+SUqcqEUMcXJtHm2fpwv+dmNFCwGjQblnXfHAe44lwhOxFWjadhV/dfBhNuAnVDJ+2JedJORm7C8LuuvqZzaw3govp8S6c6jahBn95DBaTFywpqlJH8HnkKr9+1uLEpRsNzp2vibwcVlhsAMUOwDMdBp+BrK+TRXzV0W7+IrDQwj5p1jzcyfn32gSqfg5nQrEhgduSmJHzCAUI0yMjzhzZRx9kX6lkk6nJUU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63db25f2-d682-4136-bc22-08d726863435
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 22:23:33.7485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkkBAzEZ+r/lAwc3pQgtXInq91Hm71Cme8Ks2T1xuS3XQ0G20e+rAfaAEU7QOkudDupAX6hLrasp1VZWPS5SSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1299
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awz/alySlXXG9Go1RCO3oemyjtwXZs45qWog2tqiPQg=;
 b=PhgebXdSRQOU2vI0WtWTq1HJUHvWeE+7P9xBn2AWuICSMHUbHxT7DdheSWn1ciOinuR/H3Lad95bfzyFELWDhniRYmwX0JCSyPjcZDSKVwakrmI++2XrfgwvqkqpfieUBelFCK+gUJlfgqfru98tWxdiFUeJl63j2Ooix38jnL4=
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
Content-Type: multipart/mixed; boundary="===============1524886053=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1524886053==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809DC90F9DBB4F86DCA278CF7AA0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809DC90F9DBB4F86DCA278CF7AA0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore those.  wrong directory.

Alex
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Wednesday, August 21, 2019 6:20 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP HDP flu=
sh

Flush via the ring works differently on CIK and requires a
special sequence.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/radeon/cik.c | 73 +++++++++++++++++++++++++++-------------=
----
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 0847367..03dd075 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -3485,6 +3485,48 @@ int cik_ring_test(struct radeon_device *rdev, struct=
 radeon_ring *ring)
         return r;
 }

+static void cik_gfx_hdp_flush(struct radeon_device *rdev,
+                             int ridx)
+{
+       struct radeon_ring *ring =3D &rdev->ring[ridx];
+       u32 ref_and_mask;
+
+       switch (ring->idx) {
+       case CAYMAN_RING_TYPE_CP1_INDEX:
+       case CAYMAN_RING_TYPE_CP2_INDEX:
+               switch (ring->me) {
+               case 0:
+                       ref_and_mask =3D CP2 << ring->pipe;
+                       break;
+               case 1:
+                       ref_and_mask =3D CP6 << ring->pipe;
+                       break;
+               default:
+                       return;
+               }
+               break;
+       case RADEON_RING_TYPE_GFX_INDEX:
+               ref_and_mask =3D CP0;
+               break;
+       default:
+               return;
+       }
+
+       radeon_ring_write(ring, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
+       radeon_ring_write(ring, ((CP_WAIT_REG_MEM_TIMEOUT -
+                                 PACKET3_SET_UCONFIG_REG_START) >> 2));
+       radeon_ring_write(ring, 0xfff);
+
+       radeon_ring_write(ring, PACKET3(PACKET3_WAIT_REG_MEM, 5));
+       radeon_ring_write(ring, (WAIT_REG_MEM_OPERATION(1) | /* special op =
*/
+                                WAIT_REG_MEM_FUNCTION(3))); /* =3D=3D */
+       radeon_ring_write(ring, GPU_HDP_FLUSH_REQ >> 2);
+       radeon_ring_write(ring, GPU_HDP_FLUSH_DONE >> 2);
+       radeon_ring_write(ring, ref_and_mask);
+       radeon_ring_write(ring, ref_and_mask);
+       radeon_ring_write(ring, 0xa); /* poll interval */
+}
+
 /**
  * cik_fence_gfx_ring_emit - emit a fence on the gfx ring
  *
@@ -3511,15 +3553,7 @@ void cik_fence_gfx_ring_emit(struct radeon_device *r=
dev,
         radeon_ring_write(ring, fence->seq);
         radeon_ring_write(ring, 0);
         /* HDP flush */
-       /* We should be using the new WAIT_REG_MEM special op packet here
-        * but it causes the CP to hang
-        */
-       radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
-       radeon_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
-                                WRITE_DATA_DST_SEL(0)));
-       radeon_ring_write(ring, HDP_MEM_COHERENCY_FLUSH_CNTL >> 2);
-       radeon_ring_write(ring, 0);
-       radeon_ring_write(ring, 0);
+       cik_gfx_hdp_flush(rdev, fence->ring);
 }

 /**
@@ -3549,15 +3583,7 @@ void cik_fence_compute_ring_emit(struct radeon_devic=
e *rdev,
         radeon_ring_write(ring, fence->seq);
         radeon_ring_write(ring, 0);
         /* HDP flush */
-       /* We should be using the new WAIT_REG_MEM special op packet here
-        * but it causes the CP to hang
-        */
-       radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
-       radeon_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
-                                WRITE_DATA_DST_SEL(0)));
-       radeon_ring_write(ring, HDP_MEM_COHERENCY_FLUSH_CNTL >> 2);
-       radeon_ring_write(ring, 0);
-       radeon_ring_write(ring, 0);
+       cik_gfx_hdp_flush(rdev, fence->ring);
 }

 bool cik_semaphore_ring_emit(struct radeon_device *rdev,
@@ -5369,16 +5395,7 @@ void cik_vm_flush(struct radeon_device *rdev, int ri=
dx, struct radeon_vm *vm)
         radeon_ring_write(ring, VMID(0));

         /* HDP flush */
-       /* We should be using the WAIT_REG_MEM packet here like in
-        * cik_fence_ring_emit(), but it causes the CP to hang in this
-        * context...
-        */
-       radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
-       radeon_ring_write(ring, (WRITE_DATA_ENGINE_SEL(0) |
-                                WRITE_DATA_DST_SEL(0)));
-       radeon_ring_write(ring, HDP_MEM_COHERENCY_FLUSH_CNTL >> 2);
-       radeon_ring_write(ring, 0);
-       radeon_ring_write(ring, 0);
+       cik_gfx_hdp_flush(rdev, ridx);

         /* bits 0-15 are the VM contexts0-15 */
         radeon_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
--
1.8.3.1


--_000_BN6PR12MB1809DC90F9DBB4F86DCA278CF7AA0BN6PR12MB1809namp_
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
Ignore those.&nbsp; wrong directory.</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, August 21, 2019 6:20 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/radeon: use WAIT_REG_MEM special op for CP =
HDP flush</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Flush via the ring works differently on CIK and re=
quires a<br>
special sequence.<br>
<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/radeon/cik.c | 73 &#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;-----------------<br>
&nbsp;1 file changed, 45 insertions(&#43;), 28 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c<br=
>
index 0847367..03dd075 100644<br>
--- a/drivers/gpu/drm/radeon/cik.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/radeon/cik.c<br>
@@ -3485,6 &#43;3485,48 @@ int cik_ring_test(struct radeon_device *rdev, st=
ruct radeon_ring *ring)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static void cik_gfx_hdp_flush(struct radeon_device *rdev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; int ridx)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_ring *ring =3D &amp=
;rdev-&gt;ring[ridx];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 ref_and_mask;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (ring-&gt;idx) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CAYMAN_RING_TYPE_CP1_INDEX:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CAYMAN_RING_TYPE_CP2_INDEX:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; switch (ring-&gt;me) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case 0:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_and_mask=
 =3D CP2 &lt;&lt; ring-&gt;pipe;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; case 1:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_and_mask=
 =3D CP6 &lt;&lt; ring-&gt;pipe;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case RADEON_RING_TYPE_GFX_INDEX:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ref_and_mask =3D CP0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(P=
ACKET3_SET_UCONFIG_REG, 1));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, ((CP_WAIT=
_REG_MEM_TIMEOUT -<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PACKET3_SET_UCONFIG_REG_STA=
RT) &gt;&gt; 2));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0xfff);<b=
r>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(P=
ACKET3_WAIT_REG_MEM, 5));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WAIT_REG=
_MEM_OPERATION(1) | /* special op */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WAIT_REG_MEM_FUNCTION(3))); /* =
=3D=3D */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, GPU_HDP_F=
LUSH_REQ &gt;&gt; 2);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, GPU_HDP_F=
LUSH_DONE &gt;&gt; 2);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, ref_and_m=
ask);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, ref_and_m=
ask);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0xa); /* =
poll interval */<br>
&#43;}<br>
&#43;<br>
&nbsp;/**<br>
&nbsp; * cik_fence_gfx_ring_emit - emit a fence on the gfx ring<br>
&nbsp; *<br>
@@ -3511,15 &#43;3553,7 @@ void cik_fence_gfx_ring_emit(struct radeon_devic=
e *rdev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, fe=
nce-&gt;seq);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HDP flush */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We should be using the new WAIT_RE=
G_MEM special op packet here<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but it causes the CP to hang<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKE=
T3_WRITE_DATA, 3));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WRITE_DATA_E=
NGINE_SEL(0) |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0)));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, HDP_MEM_COHER=
ENCY_FLUSH_CNTL &gt;&gt; 2);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cik_gfx_hdp_flush(rdev, fence-&gt=
;ring);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
@@ -3549,15 &#43;3583,7 @@ void cik_fence_compute_ring_emit(struct radeon_d=
evice *rdev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, fe=
nce-&gt;seq);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0)=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HDP flush */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We should be using the new WAIT_RE=
G_MEM special op packet here<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but it causes the CP to hang<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKE=
T3_WRITE_DATA, 3));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WRITE_DATA_E=
NGINE_SEL(0) |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0)));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, HDP_MEM_COHER=
ENCY_FLUSH_CNTL &gt;&gt; 2);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cik_gfx_hdp_flush(rdev, fence-&gt=
;ring);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;bool cik_semaphore_ring_emit(struct radeon_device *rdev,<br>
@@ -5369,16 &#43;5395,7 @@ void cik_vm_flush(struct radeon_device *rdev, in=
t ridx, struct radeon_vm *vm)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, VM=
ID(0));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* HDP flush */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We should be using the WAIT_REG_ME=
M packet here like in<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * cik_fence_ring_emit(), but it=
 causes the CP to hang in this<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * context...<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PACKET3(PACKE=
T3_WRITE_DATA, 3));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, (WRITE_DATA_E=
NGINE_SEL(0) |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0)));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, HDP_MEM_COHER=
ENCY_FLUSH_CNTL &gt;&gt; 2);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cik_gfx_hdp_flush(rdev, ridx);<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* bits 0-15 are the VM co=
ntexts0-15 */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_ring_write(ring, PA=
CKET3(PACKET3_WRITE_DATA, 3));<br>
-- <br>
1.8.3.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809DC90F9DBB4F86DCA278CF7AA0BN6PR12MB1809namp_--

--===============1524886053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1524886053==--

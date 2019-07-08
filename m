Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C2627AC
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 19:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9D789DB0;
	Mon,  8 Jul 2019 17:51:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B99C89DB0
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 17:51:55 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1188.namprd12.prod.outlook.com (10.168.225.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 17:51:53 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 17:51:53 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?Windows-1252?Q?Marek_Ol=9A=E1k?= <maraeo@gmail.com>, amd-gfx mailing
 list <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: don't invalidate caches in RELEASE_MEM, only
 do the writeback
Thread-Topic: [PATCH] drm/amdgpu: don't invalidate caches in RELEASE_MEM, only
 do the writeback
Thread-Index: AQHVMQQMdbk1yA446ECvBMoBR727rqbBBA4AgAAFe9k=
Date: Mon, 8 Jul 2019 17:51:53 +0000
Message-ID: <BN6PR12MB180974B4A10C0862544AEF25F7F60@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190702182901.22491-1-maraeo@gmail.com>,
 <CAAxE2A5FUU-TukfWC0-Od9u_deQKV3JZjPXCbwin=ccx-dOx-g@mail.gmail.com>
In-Reply-To: <CAAxE2A5FUU-TukfWC0-Od9u_deQKV3JZjPXCbwin=ccx-dOx-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.77.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 248b2d29-99c0-4540-8bb2-08d703ccf63c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1188; 
x-ms-traffictypediagnostic: BN6PR12MB1188:
x-microsoft-antispam-prvs: <BN6PR12MB1188F99E8011E93B83B71DB5F7F60@BN6PR12MB1188.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(189003)(53936002)(236005)(54896002)(6436002)(9686003)(25786009)(229853002)(66066001)(6506007)(99286004)(55016002)(72206003)(478600001)(7696005)(3846002)(6116002)(76176011)(53546011)(26005)(68736007)(6246003)(52536014)(110136005)(105004)(33656002)(102836004)(186003)(19627405001)(316002)(71190400001)(5660300002)(74316002)(7736002)(2906002)(71200400001)(86362001)(446003)(476003)(486006)(8676002)(66476007)(64756008)(66556008)(256004)(66446008)(81166006)(8936002)(11346002)(14454004)(76116006)(66946007)(81156014)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1188;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3ZVKP4AbrhjJLD8+lfVnb+fsSJJGJMltncpEgRgBJH4P+6BNuXBptY9JvCDj6tA3ZA5VjPbGzajIL/qpoEXHabPQyaB57P8UyJ+52lhuJ6b1ARSIMURXtqKlmHe21euQuiXET2cv4Vr2qz4GrL16yxU4flo9bcZnAa2gLchTgu4vBUNopA/eX8nLdxFYjxKiP0SlV7DOi2VhF6MP2UwJQ0TVpIhKIbaVb1gfA1AO+9PaaFabNOBlAn0Mf641qzXQgEqFh/1PuIT5enaOAK2VULR/Tj4SDnwS8leijDquda1Knek9/LJLFCUNpwUSxAqgaPJcvVLQZc6n6U/jF3I7F30tUOqrkzhiPfn1FtrGuHacYqchaJFAJmuI85B1EI3iq0/umg6UTjvIBuwNgPBTHoS+wvDm3w1S7TxFi0mNYHM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248b2d29-99c0-4540-8bb2-08d703ccf63c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 17:51:53.3520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1188
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HYo+LUeOUF+TB0U6nuJUUUXB9xZhQoqM9NdOhYlNi4=;
 b=CUrrsXoqA1YyQrJlVQ1+ARh+hztvbrNcRAw2hTuRwZUnuI1PeJO0earH01topuyqSk4f3h3xEbD/LaxI0CGEpB99v5vc82VG7pYeyAtCps2JSeqnmJu/pX4ZEaiICsj5mcAN08geEtWNovjGiZ8BKSFMlgf/QTK09w54nAsZGKo=
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
Content-Type: multipart/mixed; boundary="===============1077736329=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1077736329==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180974B4A10C0862544AEF25F7F60BN6PR12MB1809namp_"

--_000_BN6PR12MB180974B4A10C0862544AEF25F7F60BN6PR12MB1809namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Marek Ol=
=9A=E1k <maraeo@gmail.com>
Sent: Monday, July 8, 2019 1:31 PM
To: amd-gfx mailing list
Subject: Re: [PATCH] drm/amdgpu: don't invalidate caches in RELEASE_MEM, on=
ly do the writeback

ping

On Tue, Jul 2, 2019 at 2:29 PM Marek Ol=9A=E1k <maraeo@gmail.com<mailto:mar=
aeo@gmail.com>> wrote:
From: Marek Ol=9A=E1k <marek.olsak@amd.com<mailto:marek.olsak@amd.com>>

This RELEASE_MEM use has the Release semantic, which means we should write
back but not invalidate. Invalidations only make sense with the Acquire
semantic (ACQUIRE_MEM), or when RELEASE_MEM is used to do the combined
Acquire-Release semantic, which is a barrier, not a fence.

The undesirable side effect of doing invalidations for the Release semantic
is that it invalidates caches while shaders are running, because the Releas=
e
can execute in the middle of the next IB.

UMDs should use ACQUIRE_MEM at the beginning of IBs. Doing cache
invalidations for a fence (like in this case) doesn't do anything
for correctness.

Signed-off-by: Marek Ol=9A=E1k <marek.olsak@amd.com<mailto:marek.olsak@amd.=
com>>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index 210d24511dc6..a30f5d4913b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4296,25 +4296,21 @@ static void gfx_v10_0_ring_emit_fence(struct amdgpu=
_ring *ring, u64 addr,
        bool int_sel =3D flags & AMDGPU_FENCE_FLAG_INT;

        /* Interrupt not work fine on GFX10.1 model yet. Use fallback inste=
ad */
        if (adev->pdev->device =3D=3D 0x50)
                int_sel =3D false;

        /* RELEASE_MEM - flush caches, send int */
        amdgpu_ring_write(ring, PACKET3(PACKET3_RELEASE_MEM, 6));
        amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_GCR_SEQ |
                                 PACKET3_RELEASE_MEM_GCR_GL2_WB |
-                                PACKET3_RELEASE_MEM_GCR_GL2_INV |
-                                PACKET3_RELEASE_MEM_GCR_GL2_US |
-                                PACKET3_RELEASE_MEM_GCR_GL1_INV |
-                                PACKET3_RELEASE_MEM_GCR_GLV_INV |
-                                PACKET3_RELEASE_MEM_GCR_GLM_INV |
+                                PACKET3_RELEASE_MEM_GCR_GLM_INV | /* must =
be set with GLM_WB */
                                 PACKET3_RELEASE_MEM_GCR_GLM_WB |
                                 PACKET3_RELEASE_MEM_CACHE_POLICY(3) |
                                 PACKET3_RELEASE_MEM_EVENT_TYPE(CACHE_FLUSH=
_AND_INV_TS_EVENT) |
                                 PACKET3_RELEASE_MEM_EVENT_INDEX(5)));
        amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_DATA_SEL(write64bit ? =
2 : 1) |
                                 PACKET3_RELEASE_MEM_INT_SEL(int_sel ? 2 : =
0)));

        /*
         * the address should be Qword aligned if 64bit write, Dword
         * aligned if only send 32bit data low (discard data high)
--
2.17.1


--_000_BN6PR12MB180974B4A10C0862544AEF25F7F60BN6PR12MB1809namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Marek Ol=9A=E1k &lt;maraeo@gm=
ail.com&gt;<br>
<b>Sent:</b> Monday, July 8, 2019 1:31 PM<br>
<b>To:</b> amd-gfx mailing list<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: don't invalidate caches in RELEASE_=
MEM, only do the writeback</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">ping<br>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue, Jul 2, 2019 at 2:29 PM Mare=
k Ol=9A=E1k &lt;<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>&gt=
; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
From: Marek Ol=9A=E1k &lt;<a href=3D"mailto:marek.olsak@amd.com" target=3D"=
_blank">marek.olsak@amd.com</a>&gt;<br>
<br>
This RELEASE_MEM use has the Release semantic, which means we should write<=
br>
back but not invalidate. Invalidations only make sense with the Acquire<br>
semantic (ACQUIRE_MEM), or when RELEASE_MEM is used to do the combined<br>
Acquire-Release semantic, which is a barrier, not a fence.<br>
<br>
The undesirable side effect of doing invalidations for the Release semantic=
<br>
is that it invalidates caches while shaders are running, because the Releas=
e<br>
can execute in the middle of the next IB.<br>
<br>
UMDs should use ACQUIRE_MEM at the beginning of IBs. Doing cache<br>
invalidations for a fence (like in this case) doesn't do anything<br>
for correctness.<br>
<br>
Signed-off-by: Marek Ol=9A=E1k &lt;<a href=3D"mailto:marek.olsak@amd.com" t=
arget=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 &#43;-----<br>
&nbsp;1 file changed, 1 insertion(&#43;), 5 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index 210d24511dc6..a30f5d4913b9 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -4296,25 &#43;4296,21 @@ static void gfx_v10_0_ring_emit_fence(struct am=
dgpu_ring *ring, u64 addr,<br>
&nbsp; &nbsp; &nbsp; &nbsp; bool int_sel =3D flags &amp; AMDGPU_FENCE_FLAG_=
INT;<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; /* Interrupt not work fine on GFX10.1 model yet=
. Use fallback instead */<br>
&nbsp; &nbsp; &nbsp; &nbsp; if (adev-&gt;pdev-&gt;device =3D=3D 0x50)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int_sel =3D false;<=
br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; /* RELEASE_MEM - flush caches, send int */<br>
&nbsp; &nbsp; &nbsp; &nbsp; amdgpu_ring_write(ring, PACKET3(PACKET3_RELEASE=
_MEM, 6));<br>
&nbsp; &nbsp; &nbsp; &nbsp; amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_GC=
R_SEQ |<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PACKET3_RELEASE_MEM_GCR_GL2_WB |=
<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PACKET3_RELEASE_MEM_GCR_GL2_INV |<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PACKET3_RELEASE_MEM_GCR_GL2_US |<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PACKET3_RELEASE_MEM_GCR_GL1_INV |<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PACKET3_RELEASE_MEM_GCR_GLV_INV |<br>
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PACKET3_RELEASE_MEM_GCR_GLM_INV |<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; PACKET3_RELEASE_MEM_GCR_GLM_INV |=
 /* must be set with GLM_WB */<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PACKET3_RELEASE_MEM_GCR_GLM_WB |=
<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PACKET3_RELEASE_MEM_CACHE_POLICY=
(3) |<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PACKET3_RELEASE_MEM_EVENT_TYPE(C=
ACHE_FLUSH_AND_INV_TS_EVENT) |<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PACKET3_RELEASE_MEM_EVENT_INDEX(=
5)));<br>
&nbsp; &nbsp; &nbsp; &nbsp; amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_DA=
TA_SEL(write64bit ? 2 : 1) |<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;PACKET3_RELEASE_MEM_INT_SEL(int_=
sel ? 2 : 0)));<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; /*<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* the address should be Qword aligned if =
64bit write, Dword<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* aligned if only send 32bit data low (di=
scard data high)<br>
-- <br>
2.17.1<br>
<br>
</blockquote>
</div>
</div>
</body>
</html>

--_000_BN6PR12MB180974B4A10C0862544AEF25F7F60BN6PR12MB1809namp_--

--===============1077736329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1077736329==--

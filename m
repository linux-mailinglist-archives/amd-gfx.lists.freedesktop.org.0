Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0743B7CF
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 16:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBCA890F7;
	Mon, 10 Jun 2019 14:53:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760052.outbound.protection.outlook.com [40.107.76.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C76890F7
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 14:53:53 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1460.namprd12.prod.outlook.com (10.172.24.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 14:53:50 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1965.011; Mon, 10 Jun 2019
 14:53:50 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: drop the incorrect soft_reset for SRIOV
Thread-Topic: [PATCH] drm/amdgpu: drop the incorrect soft_reset for SRIOV
Thread-Index: AQHVH1cVQeI8SOBjsE+oYDnVon4q26aU+eLU
Date: Mon, 10 Jun 2019 14:53:50 +0000
Message-ID: <BN6PR12MB1809F4E306574660D711EB8BF7130@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1560148666-6338-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1560148666-6338-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.161.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab5957cc-a9a8-494d-8d31-08d6edb3731b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1460; 
x-ms-traffictypediagnostic: BN6PR12MB1460:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1460569DDF2B1171637BD038F7130@BN6PR12MB1460.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(478600001)(966005)(72206003)(6116002)(71200400001)(71190400001)(2906002)(55016002)(6306002)(54896002)(9686003)(3846002)(102836004)(76176011)(476003)(26005)(186003)(33656002)(68736007)(53546011)(7696005)(53936002)(25786009)(6506007)(105004)(76116006)(256004)(229853002)(14444005)(11346002)(73956011)(236005)(66556008)(64756008)(6436002)(99286004)(19627405001)(66946007)(446003)(66446008)(66476007)(6246003)(486006)(2501003)(5660300002)(606006)(66066001)(74316002)(81166006)(8676002)(8936002)(7736002)(86362001)(52536014)(316002)(14454004)(81156014)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1460;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uaWNr17JRv1cxN+upVowVSbSDLHFUMbVbNZe8bZbb1JoYLl4nCuYvebgPvbZwOJ45866eoyV1Vd11gkBOyaTbcnS+gYtyI6Pv1vkHxd+V31WIN74W+pFSujtMTfwmZwYeq78ROtudVlnuc5sGaVpMUfe3/QOpRBmsZ+v9RcPH9i07c4TPDfEAhUbyD3RuHci7UpzLljppPJVTcI+jaZgD1ORLvxvqugNgFwwgj0jdfo4JQqNynxzM+mSNXWeoJemyvyRC2msOXxdMF5K6wywBxduHSXBjKwgnedJVccrOSTaLvqvxyNMSfdh7E0qYjm7cZicTcWmSV1mcfUmwbn9VEvsOznZQAsF4EbjQ7LaYUrdLM6WA66th0qqavXCkR5Lx/c3Y4WxT01Q/ZnNL9L0m19X8+aw7Ur+PIe02sHrncA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5957cc-a9a8-494d-8d31-08d6edb3731b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 14:53:50.5157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1460
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVW+u5oUITbmsRKXL4Vk1eWhjoLiosGLhE5BbYnKyMA=;
 b=tFE3nEl8jgsPNxjijmSC6FpK7jVFZURzaikQ+wCW6NQvI6/msQW5M0xH7zECwQfPBxq/w0hn2xpnAWzQxbKgOwqhQCXmX4e+qtGJQFAzmezS8dMY8s75q3FTRfpzPr/sEysBcFoUolo2RlzswcC9Jk6h4fcmOc1Klo7AJvOfhN0=
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
Content-Type: multipart/mixed; boundary="===============1184636433=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1184636433==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F4E306574660D711EB8BF7130BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F4E306574660D711EB8BF7130BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Monk Liu=
 <Monk.Liu@amd.com>
Sent: Monday, June 10, 2019 2:37 AM
To: amd-gfx@lists.freedesktop.org
Cc: Liu, Monk
Subject: [PATCH] drm/amdgpu: drop the incorrect soft_reset for SRIOV

It's incorrect to do soft reset for SRIOV, when GFX
hang the WREG would stuck there becuase it goes KIQ way.

the GPU reset counter is incorrect: always increase twice
for each timedout

Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ring.c
index 8f5026c..ff6976e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -399,7 +399,7 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring=
, unsigned int vmid,
 {
         ktime_t deadline =3D ktime_add_us(ktime_get(), 10000);

-       if (!ring->funcs->soft_recovery || !fence)
+       if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !=
fence)
                 return false;

         atomic_inc(&ring->adev->gpu_reset_counter);
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809F4E306574660D711EB8BF7130BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Monk Liu &lt;Monk.Liu@amd.com=
&gt;<br>
<b>Sent:</b> Monday, June 10, 2019 2:37 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Liu, Monk<br>
<b>Subject:</b> [PATCH] drm/amdgpu: drop the incorrect soft_reset for SRIOV=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">It's incorrect to do soft reset for SRIOV, when GF=
X<br>
hang the WREG would stuck there becuase it goes KIQ way.<br>
<br>
the GPU reset counter is incorrect: always increase twice<br>
for each timedout<br>
<br>
Signed-off-by: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ring.c<br>
index 8f5026c..ff6976e 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c<br>
@@ -399,7 &#43;399,7 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *=
ring, unsigned int vmid,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ktime_t deadline =3D ktime=
_add_us(ktime_get(), 10000);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ring-&gt;funcs-&gt;soft_recovery=
 || !fence)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(ring-&gt;adev=
) || !ring-&gt;funcs-&gt;soft_recovery || !fence)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return false;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_inc(&amp;ring-&gt;a=
dev-&gt;gpu_reset_counter);<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809F4E306574660D711EB8BF7130BN6PR12MB1809namp_--

--===============1184636433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1184636433==--

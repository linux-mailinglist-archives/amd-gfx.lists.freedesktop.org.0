Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD71B79B1
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 14:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABED66EBBC;
	Thu, 19 Sep 2019 12:45:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730056.outbound.protection.outlook.com [40.107.73.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13756EBBC
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 12:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRbu+QY97pc9gbk+kbXzMXUNNU/dWwZbqxZPWdthOjzOUwlrkq8HtSu7+/Xcu/GX2s25fG0YVQFbEDjCmjMaSpOZf+mkITvttb8KI0OcajluBIu46QYG3LXk+X04DUU81LiAc2aOmdP+nV4H9A8NH4m7HcZB6/HGnzh2laVJaCp+2StYBVtBgCTGFNps9Qfe2Vuj9vw13ncEyq5cU5IMfd1dKqIbh0Q6uwAuIjpgt/IQQ0y38OTt4D4LYg4b5UcRdPYvxg/VBQz/fbeuGzfm+katfHnsCAI27tRBi3hheeRRURROuj1MzwCd7Cco5/Ww91kC6bTOko5A1kcgG76dSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8+63np5lr4aBbVEGA/xPJNcbXUNlLONvKxGxJ1c/M0=;
 b=kfTO4M/MFF0lhsREN8L26iaJ4GnIC33ARFBzBXjWh2hMxEcjPgbGJuNsxVIFRp3LFb78YJBKyzCG7+cBgLCMQKw8ktGfPapLI9O9PrLYBZrEami1JNq0swbJ9WEafBvZRCK3j/tew/eetBfkDOotcJqCQ+yiP/PMCUjTlvklA3gRNDYZYwLcZQGvcbcKHu7Ju47UIzB3hKh8aAu6lFaBl6otXS/wY+bpKU6M0OQOxdMl6AtcCu8cbU0OJpBirz+Qv3YYLwgVl482SidiSlgmuP6uC7vMPGEjrvWJ8S8Qhzt1nIsUzuTXwDcuianehfO/XJurw7Gvkj2KUXdXdVDBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1794.namprd12.prod.outlook.com (10.175.98.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 12:45:42 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.028; Thu, 19 Sep
 2019 12:45:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix potential VM faults
Thread-Topic: [PATCH] drm/amdgpu: fix potential VM faults
Thread-Index: AQHVbsYQWSqjc8n+x0+lshN2tCdWIqcy8qP0
Date: Thu, 19 Sep 2019 12:45:41 +0000
Message-ID: <BN6PR12MB1809A685F98E715D2EBF755EF7890@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190919084136.82658-1-christian.koenig@amd.com>
In-Reply-To: <20190919084136.82658-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69705c8d-712c-4d51-041c-08d73cff4828
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1794; 
x-ms-traffictypediagnostic: BN6PR12MB1794:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1794DA1CEF5C1EB97193B8FBF7890@BN6PR12MB1794.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:326;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(199004)(189003)(486006)(446003)(11346002)(606006)(25786009)(86362001)(8936002)(81166006)(81156014)(8676002)(476003)(6506007)(7696005)(99286004)(76176011)(105004)(186003)(102836004)(53546011)(52536014)(14444005)(5660300002)(66574012)(256004)(71200400001)(71190400001)(26005)(966005)(14454004)(19627405001)(9686003)(54896002)(6306002)(236005)(316002)(64756008)(33656002)(66556008)(66476007)(66946007)(6246003)(76116006)(110136005)(66066001)(6436002)(66446008)(74316002)(7736002)(2906002)(6116002)(3846002)(2501003)(55016002)(478600001)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1794;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +7tMAJrXuzICGsj28qWvXC3KA3O+DwaNi2rtop6qw8J+kdRabd3fEnoteaxSFaZL2Ab4yvaZavbgUVEvZgH3uSS2Gq/J1wbqHhDGfFb+gc430L6qdbShDwb8y3/+gofzpoJMTUcJp5H1zm9YBfonwGFCQfpGedawFDwfvelyfSjVZ1KGgmkIQvosAbygeySGUx0bOTxTrjSuSLG/YeDC41cReNlrLNZ9DbC7FZSP3Cz6wbRJne0B64A4OoNIFWx9qajIejVYqm10NzmYTuQoPdbX1Ue3V+ugjzSFDGzM+KPn+tV6JQui4wpnQ8m1d+HSOLZb0xzPtMnUM5w9XbS/0btr2ZvJIlPszFkXueKoGm1ygnZJqjnsJWmfBUujpjCoXlvtc8c9p/HnhisoxehSdttJMEWO+R8I7oN3N6goCaA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69705c8d-712c-4d51-041c-08d73cff4828
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 12:45:41.8634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+WlQELhE72Soj/nh6zbz/kFMY0WxrCzVL4jN81McVBVpqd706SRIwUiBbpjM3xayzY8rNjXRKyfnDuaN9ePbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8+63np5lr4aBbVEGA/xPJNcbXUNlLONvKxGxJ1c/M0=;
 b=dtlUDZulc1ae56MHC+nHEJb711cCtQwNRw+fIZWdYPQx9WZ+GhtJmlL9DCdRbndxgtxZFG0mPZzOBFbnY8iXqzu58/H+wrlUzAx57IIjQDKULpshx4vBcGuoGPsqcFhV0qGEaLhSZTtaVelsyN6M2cRvftP8HhYYQTVKUv7N4uU=
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
Content-Type: multipart/mixed; boundary="===============1828892286=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1828892286==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809A685F98E715D2EBF755EF7890BN6PR12MB1809namp_"

--_000_BN6PR12MB1809A685F98E715D2EBF755EF7890BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Christia=
n K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, September 19, 2019 4:41 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix potential VM faults

When we allocate new page tables under memory
pressure we should not evict old ones.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.c
index 70d45d48907a..8e44ecaada35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -514,7 +514,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device *ad=
ev,
                 .interruptible =3D (bp->type !=3D ttm_bo_type_kernel),
                 .no_wait_gpu =3D bp->no_wait_gpu,
                 .resv =3D bp->resv,
-               .flags =3D TTM_OPT_FLAG_ALLOW_RES_EVICT
+               .flags =3D bp->type !=3D ttm_bo_type_kernel ?
+                       TTM_OPT_FLAG_ALLOW_RES_EVICT : 0
         };
         struct amdgpu_bo *bo;
         unsigned long page_align, size =3D bp->size;
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809A685F98E715D2EBF755EF7890BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Christian K=F6nig &lt;ckoenig=
.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Thursday, September 19, 2019 4:41 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: fix potential VM faults</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">When we allocate new page tables under memory<br>
pressure we should not evict old ones.<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_object.c<br>
index 70d45d48907a..8e44ecaada35 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
@@ -514,7 &#43;514,8 @@ static int amdgpu_bo_do_create(struct amdgpu_device=
 *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; .interruptible =3D (bp-&gt;type !=3D ttm_bo_type_kern=
el),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; .no_wait_gpu =3D bp-&gt;no_wait_gpu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; .resv =3D bp-&gt;resv,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .flags =3D TTM_OPT_FLAG_ALLOW_RES_EVICT<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; .flags =3D bp-&gt;type !=3D ttm_bo_type_kernel ?<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTM_OPT_FLAG=
_ALLOW_RES_EVICT : 0<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *bo;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long page_align, =
size =3D bp-&gt;size;<br>
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

--_000_BN6PR12MB1809A685F98E715D2EBF755EF7890BN6PR12MB1809namp_--

--===============1828892286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1828892286==--

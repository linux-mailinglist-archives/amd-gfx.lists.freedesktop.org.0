Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F018B7A94
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 15:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DDA6F504;
	Thu, 19 Sep 2019 13:33:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790083.outbound.protection.outlook.com [40.107.79.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DAE6F504
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 13:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oREyYKyWEv0LP/IRfN7wgMIeX7tbx4KBpHAr+b4rs8Zf7Oq/2jmLkdP+FcKdQ2nbYUXKpFK1xazbpmZ0qxHbhqC1p4sVudiy2Qc9dc+CamrYp4CkwYiOIpseI851yxQGtGFdirBu7MaJyK6dz1nGjS+sBLBpxupCP5H70efG+39U721Oc5QU5bUukuqsrSBXTbnrMoC8p9DfHWpMOfS6Z7hDwWMHjm6VbNJ8IGLnKDhAIb1LFcA3jw4navdlWvOiJC7jQeC+1EAfy8PUF3LbiBheWQ0XGAS7+MN1IURJI3ZFBCCwREArNYUGqfVsKN9mevtlFkL8FtYLuiFIVmfjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf8FRgbLIUF6GFOfUaJ8TLohae0ugHAufUVI7i/4EOs=;
 b=cJzbA7U2+2qe0gQOSCCVcxx6Jc8VyF8MznxUnRpx3WqB/38AggrDsByRAkArHLFREQI1jQMdAIwVEgKkN8PiwstxetMBS65Fo2iXKZD4cy/nqFR3Zz+4snDRbFQIDWsCenGLTkTrlWsbQ2GOvgapJBi1AxqLK9tYOE7mHg9/psZdA/7SStBYubhwMAMye8BgUDH6I+4/bgvNNvvKL0RgCYSk3aogelRNyDed+Axnlw6JYLU/MXO4mzp8L1rgYwrdHy8/5Nxgp6eQhjelfQ/Q4XStBZja4xEtMKwOUJK3coHf9Mr5x+5EMZGxNq+NvEvvswBJ9fKL0Z2S/uhcJrGiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Thu, 19 Sep 2019 13:33:13 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.028; Thu, 19 Sep
 2019 13:33:12 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: restrict hotplug error message
Thread-Topic: [PATCH] drm/amdgpu: restrict hotplug error message
Thread-Index: AQHVbuyD6rpBD2iAZUOaglrDghdIyacy/6sq
Date: Thu, 19 Sep 2019 13:33:12 +0000
Message-ID: <BN6PR12MB18099E77076B1372548E71F0F7890@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190919131649.8406-1-christian.koenig@amd.com>
In-Reply-To: <20190919131649.8406-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25173251-e049-4961-8956-08d73d05eb4e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1204; 
x-ms-traffictypediagnostic: BN6PR12MB1204:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1204DA6682E88F5D742817D8F7890@BN6PR12MB1204.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(189003)(199004)(74316002)(6436002)(4326008)(6116002)(102836004)(186003)(486006)(3846002)(2906002)(236005)(9686003)(19627405001)(53546011)(76176011)(6506007)(7696005)(606006)(99286004)(26005)(54896002)(25786009)(33656002)(55016002)(6306002)(7736002)(229853002)(256004)(52536014)(14444005)(11346002)(66556008)(8936002)(478600001)(316002)(105004)(66574012)(66066001)(14454004)(446003)(66946007)(66476007)(66446008)(2501003)(71190400001)(5660300002)(64756008)(110136005)(15650500001)(54906003)(476003)(71200400001)(966005)(81156014)(81166006)(8676002)(6246003)(76116006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1204;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Icbe+//X3lLqcXJi4s572abxO4LFS5Pfek3ZIrq0ILwhkIol3lXRyeFr9SN2bXnpiQhvn6R0Urac/RneAA5EgfxaAfRoybLcBNbuJeAVp0d4fe1vwo/J81R4Y6aPj2dSSLByMhusD5PTKJizYcxLx6V2ghNqO5HKGN9TOosGEWrYWFwbvUgStBgZykzKX63tzCzN02oXT0nEsbcyNsEGnXbOJl8ZCmmpu0JyXrB5MXhZILs0WQcLu/kz9tfqZtDj2Fbzv/1r1cd6Pd1bAIrsDPXe5VRF6yosd3llLXJtgds59gfz+AXGp5Q0m+Jv1pxtYmaYoQ7vOxRsrDfWhsHtoupmJ/5hKZ9EWWOJVOG/MmSompOIiT2NaXRbA/UPGX0wXzXZ1Yz+7rto9pAEfYvVxHxTIs6UZRnRYwesqQ/cYxk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25173251-e049-4961-8956-08d73d05eb4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 13:33:12.7228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: boOIcN2xqhkXW4gSN9femJ1shjYcw6/HjioHIKpI3P19qpyTOaIZiljSIzIbHPdY5Cjg/VQ2s9iyoams8I42Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf8FRgbLIUF6GFOfUaJ8TLohae0ugHAufUVI7i/4EOs=;
 b=Z5tJkMnbIV5EThVR/XFZvmR3UZifxNO8OAoIaaLaJvstlcqx0mgugbYFB0PPlF0mdhMRJILHh4IANCzVf9qIajLMCHW/izt26WFf5ZHsZnSVtrkraTgHCLDrMLJSp0sq0qD1/NWRQq4e7bXAH/H9PErV/Rtw+Txnr7Shgngv0aY=
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Zhang,
 Jack \(Jian\)" <Jack.Zhang1@amd.com>
Content-Type: multipart/mixed; boundary="===============1053933333=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1053933333==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18099E77076B1372548E71F0F7890BN6PR12MB1809namp_"

--_000_BN6PR12MB18099E77076B1372548E71F0F7890BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Christia=
n K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, September 19, 2019 9:16 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deng, Emily <Emily.Deng@amd.com>; Zhang, Jack (Jian) <Jack.Zhang1@amd.c=
om>
Subject: [PATCH] drm/amdgpu: restrict hotplug error message

We should print the error only when we are hotplugged and crash
basically all userspace applications.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 6978d17a406b..5cb808cb8108 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1098,7 +1098,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 {
         struct drm_device *dev =3D pci_get_drvdata(pdev);

-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+#ifdef MODULE
+       if (THIS_MODULE->state !=3D MODULE_STATE_GOING)
+#endif
+               DRM_ERROR("Hotplug removal is not supported\n");
         drm_dev_unplug(dev);
         drm_dev_put(dev);
         pci_disable_device(pdev);
--
2.14.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18099E77076B1372548E71F0F7890BN6PR12MB1809namp_
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
<b>Sent:</b> Thursday, September 19, 2019 9:16 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;; Zhang, Jack (Jian) &lt;J=
ack.Zhang1@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: restrict hotplug error message</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">We should print the error only when we are hotplug=
ged and crash<br>
basically all userspace applications.<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 &#43;&#43;&#43;&#43;-<br>
&nbsp;1 file changed, 4 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 6978d17a406b..5cb808cb8108 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1098,7 &#43;1098,10 @@ amdgpu_pci_remove(struct pci_dev *pdev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D=
 pci_get_drvdata(pdev);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;#ifdef MODULE<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (THIS_MODULE-&gt;state !=3D MO=
DULE_STATE_GOING)<br>
&#43;#endif<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;Hotplug removal is not supported\n&quot;);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<=
br>
-- <br>
2.14.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18099E77076B1372548E71F0F7890BN6PR12MB1809namp_--

--===============1053933333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1053933333==--

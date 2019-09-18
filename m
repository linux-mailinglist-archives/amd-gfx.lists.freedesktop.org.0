Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A7B638A
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 14:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7518E6EF2A;
	Wed, 18 Sep 2019 12:50:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208E6EF2A
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 12:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6DUNEJGc20Jeg21vGmjPe5ocfjDbw9Cw2VVwMsmGclG4gFzHtC3r1eVJSwK5f2x9Lpc37Rwrsv3vm+PwP0GeWchsHItQy8Pt2b4oc94Ro8S7TftbT2lK+CZV4fLLVxO2xPgCLrM6JT72yQ6/OPLunASFx+vLqx9lCvTDOhyOPOUZba5d5WrpZSANMykVrLprCg3fnRYeg3G51v2nKYGzR3oNjWZQZA7gPV3evK+Gjlx5VnrSORsMYum4LLqWjUI6cz0T+Ph5KlPmhL8F46DgrkTZv3RLMNDUZ5w1Mv/IBq/L7Gy2JdsXgiApAY7SnoJ4fliZOOTk31Vj98Q2SVM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tESEKv1Deqp6f0zAPYr2yWdqm78OEiMCPfL7UNsSGX0=;
 b=C6xrCV+PdbmbeqvRIP/jVZ13WTJh4+FB6G83AozF47b0S7h3thJSErSxe8w901sbsyTrJfepmT7isBqYqnOtzURvWFESyJXxFVrJt4k4sBGiei3i8PgSwJeeW/TOaq8mNPOKzPSk0hKskPLP77D6RazP5+5J1ZC15R18e7zruZvwglsxpX84mdvtd6YwlZnT458siPDiPST1rrCZPtXzX5mTWMAU/gcB5L2Vj/gj1qg1X5o9YWKAIMjdR/dUp2cZCnygalwcaPrFS8O2F9BeLBfaStvyeGHmmxhKGrCyNN0PSmEV+HT61PvVr+okWzkZQceNsE2kP5R2qf2nwY2f0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1651.namprd12.prod.outlook.com (10.172.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 12:50:18 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.023; Wed, 18 Sep
 2019 12:50:18 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang, Jack (Jian)"
 <Jack.Zhang1@amd.com>
Subject: Re: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbfIt7l7eqh+WDEKjJwMyXqaddacxCnYAgAAF+4CAAFK08A==
Date: Wed, 18 Sep 2019 12:50:18 +0000
Message-ID: <BN6PR12MB1809EE8D0A4C188737F89FC2F78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190918072445.3559-1-Jack.Zhang1@amd.com>,
 <DM6PR12MB367564A4AAC093F841D88018BB8E0@DM6PR12MB3675.namprd12.prod.outlook.com>,
 <2a7e5c50-7af0-4af1-a46d-834943ab810c@email.android.com>
In-Reply-To: <2a7e5c50-7af0-4af1-a46d-834943ab810c@email.android.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.56.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24a0d101-3a79-4fec-b2aa-08d73c36c29d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1651; 
x-ms-traffictypediagnostic: BN6PR12MB1651:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1651AD3239BBCB4DB0A3336EF78E0@BN6PR12MB1651.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(199004)(189003)(13464003)(486006)(7696005)(9686003)(14454004)(6246003)(33656002)(478600001)(19627405001)(6506007)(53546011)(66066001)(54896002)(2906002)(76176011)(66946007)(71190400001)(25786009)(476003)(55016002)(71200400001)(64756008)(6636002)(7736002)(99286004)(102836004)(76116006)(66556008)(86362001)(66476007)(66446008)(8676002)(4326008)(81156014)(81166006)(26005)(316002)(6436002)(5660300002)(110136005)(8936002)(54906003)(105004)(229853002)(74316002)(256004)(186003)(6116002)(52536014)(446003)(11346002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1651;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jF/Hm5o8XNdgQG5mow0Vt7Enlw2hNysYkAUbZWYKkfF7BV4Rg/HLmTjuMOJkPVLtV0PnUL8BBPJS4EgfXL07wDUgNEjzSWXMFlSeUlHYCm1jDg33hA5irQXigs/ggOiVeiXpUCflf/6hpWTAZE3MRYXyugC7NKk4G5nvKc+C88taMc/sp1NXSJHVtTXRfGYKkCWn2tGBzN41yakZsXESTk8TeyCvkw+TFlKDu9rNIn4uPOXKtOVJfhR81ENG4NmHZdWMXqwMtmJ6V/V0Z70deHWpZF7XY/F+rd2kcktIJVSXDzX/i4q9V7vhDPTfBGmZLjjto4dylYKdvEftEABI4BIKPNqkMUL43xlF6ZKFynQdvBrYOJ9SgT8unhmbNBPLGX/jM2n0lNphIxePgXP3u0KmEn375FChU4KxogtYqMA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a0d101-3a79-4fec-b2aa-08d73c36c29d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 12:50:18.5220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXHMA5CAWcziCWwBtdyXKtc/HfVOvSGs6xOA9vQEP7Jw++dP26hnkFowW9C7uV7esOsIRla5UOA03059VoA6Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tESEKv1Deqp6f0zAPYr2yWdqm78OEiMCPfL7UNsSGX0=;
 b=Dy+ELXvv3KDxVTQz3vXxo36GFZeRkocuau4yj2PuklexwfI3wRSKJPzvJeRNGVF8wcWYLJmn2ROfGaRQAXmLxHLG7behbmyjQLIx9t2QrGcxlLcjvgP6/TUFQ5youNFESEuxCcDR/LRD7cCEaSt8RyXVF4Eb6PSgmdl/dXjCmZw=
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>, "Teng,
 Rui" <Rui.Teng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1476695665=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1476695665==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809EE8D0A4C188737F89FC2F78E0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809EE8D0A4C188737F89FC2F78E0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Driver unload works fine (barring any bugs) as long as you are not using th=
e device.  E.g., unbound the fbcon and no apps are using the GPU.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Koenig, =
Christian <Christian.Koenig@amd.com>
Sent: Wednesday, September 18, 2019 3:53 AM
To: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Cc: Deng, Emily <Emily.Deng@amd.com>; Cui, Flora <Flora.Cui@amd.com>; Teng,=
 Rui <Rui.Teng@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freed=
esktop.org>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Hi Jack,

Well that believe is unfortunately completely wrong.

The point is that ANY use of amdgpu by userspace will prevent correct drive=
r unload, that qxl is used for the fbcon doesn't change anything here.

So the patch is a clear NAK. Driver unload is not supposed to work even und=
er SRIOV.

Regards,
Christian.



Am 18.09.2019 09:32 schrieb "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>:
Hi, Christian and folks,

In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like "qxl" as the default gfx device.
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.

Would you please help to review this patch?

Best wishes,
Jack

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com>
Sent: Wednesday, September 18, 2019 3:25 PM
To: amd-gfx@lists.freedesktop.org
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh

In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.

So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 420888e..ada2b25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1103,8 +1103,9 @@ static void
 amdgpu_pci_remove(struct pci_dev *pdev)  {
         struct drm_device *dev =3D pci_get_drvdata(pdev);
-
-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+       struct amdgpu_device *adev =3D dev->dev_private;
+       if (!amdgpu_sriov_vf(adev) && !amdgpu_passthrough(adev))
+               DRM_ERROR("Device removal is currently not supported outsid=
e of
+fbcon\n");
         drm_dev_unplug(dev);
         drm_dev_put(dev);
         pci_disable_device(pdev);
--
2.7.4


--_000_BN6PR12MB1809EE8D0A4C188737F89FC2F78E0BN6PR12MB1809namp_
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
Driver unload works fine (barring any bugs) as long as you are not using th=
e device.&nbsp; E.g., unbound the fbcon and no apps are using the GPU.</div=
>
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
ounces@lists.freedesktop.org&gt; on behalf of Koenig, Christian &lt;Christi=
an.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, September 18, 2019 3:53 AM<br>
<b>To:</b> Zhang, Jack (Jian) &lt;Jack.Zhang1@amd.com&gt;<br>
<b>Cc:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;; Cui, Flora &lt;Flora.Cui=
@amd.com&gt;; Teng, Rui &lt;Rui.Teng@amd.com&gt;; amd-gfx@lists.freedesktop=
.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough</font>
<div>&nbsp;</div>
</div>
<style>
<!--
.x_EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
<div>
<div>
<div dir=3D"auto">Hi Jack,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Well that believe is unfortunately completely wrong.</div=
>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The point is that ANY use of amdgpu by userspace will pre=
vent correct driver unload, that qxl is used for the fbcon doesn't change a=
nything here.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">So the patch is a clear NAK. Driver unload is not suppose=
d to work even under SRIOV.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards,</div>
<div dir=3D"auto">Christian.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_x_gmail_extra"><br>
<div class=3D"x_x_gmail_quote">Am 18.09.2019 09:32 schrieb &quot;Zhang, Jac=
k (Jian)&quot; &lt;Jack.Zhang1@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"x_PlainText">Hi, Christian and folks,<br>
<br>
In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like &quot;qxl&quot; as the default gfx device.<br>
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.<br>
<br>
Would you please help to review this patch?<br>
<br>
Best wishes,<br>
Jack<br>
<br>
-----Original Message-----<br>
From: Jack Zhang &lt;Jack.Zhang1@amd.com&gt; <br>
Sent: Wednesday, September 18, 2019 3:25 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Zhang, Jack (Jian) &lt;Jack.Zhang1@amd.com&gt;<br>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh<br>
<br>
In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.<br>
<br>
So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.<br>
<br>
Signed-off-by: Jack Zhang &lt;Jack.Zhang1@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 &#43;&#43;&#43;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 420888e..ada2b25 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1103,8 &#43;1103,9 @@ static void<br>
&nbsp;amdgpu_pci_remove(struct pci_dev *pdev)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D=
 pci_get_drvdata(pdev);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D de=
v-&gt;dev_private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev) &amp;&=
amp; !amdgpu_passthrough(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is currently not supported ou=
tside of <br>
&#43;fbcon\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<=
br>
--<br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809EE8D0A4C188737F89FC2F78E0BN6PR12MB1809namp_--

--===============1476695665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1476695665==--

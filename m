Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A5B5E59
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 09:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49F86EE21;
	Wed, 18 Sep 2019 07:53:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740049.outbound.protection.outlook.com [40.107.74.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E7A6EE21
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 07:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfaVWIQu4OW2YtqouXPpU6OoVZFm1RySI/swfWY4J6A3mvPD6L1UH8bEEa3c85x6jrJwhQ0YeXkMhye2AC8Edn8G+znPnZ1IbUsptgJ/JT4uCH5nqzWW2dsN8XDL0CICwhHN+oX2W6IAH/P4zpAuGWWXJYJiNzI0ZvgMPjHoQ8Qu0vSmAOsWH6R54iF59+yYKSS4iPHs/o7PR0FqCFsh6zNdSejU+ZbMuIq10MoKg36SV6/+qSrZLo5AJPrLG+DWau8NEstaExMb2rt/2MwYktncZzUOQodLnsJls1FfZDPKgG4ksAMMlg6iY4RdxX/B+g42OTi6i+2yQn1xJCERgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYNc6bzspiCAbBbOKlo2ind9NeJO2BOfXYUg2hvV+eo=;
 b=BUMRI2CwInf1ZGazzhA1RmEyM1lWEdsS2LLKjlRfvGaSXQTFjHmRhkRRDhZZtzyuH8BIBqTtdjiHG874LS6pLqn0L1Av+Uk4h/pyHPEGo0fULP9jtu3Lg6Q6nLz5dTru92IFZ5XWAuUu1dTrNwr/uFcZtJs5NjE7GpGa4uX3jvpG4CcKSK0iP8P/Yb2laKPIeFl1v+hNx34WGohVQ9f+MAu1egk/vwN2hbMO1QJWMhLGC4kIn4jmYvv3f1jjYdQUmogDOredpsfTmQjGoYNleTgwNOCNAR8lMWVPCMHBVKLsMYJIuXpYbOlCFqDULVsJUtoZzA+ty/QNoFT1L9HiEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1465.namprd12.prod.outlook.com (10.172.35.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 07:53:34 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 07:53:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbfIsKnOwH2bp1EW50Z76zZ7KZacxCM9wgAAHoyc=
Date: Wed, 18 Sep 2019 07:53:33 +0000
Message-ID: <2a7e5c50-7af0-4af1-a46d-834943ab810c@email.android.com>
References: <20190918072445.3559-1-Jack.Zhang1@amd.com>,
 <DM6PR12MB367564A4AAC093F841D88018BB8E0@DM6PR12MB3675.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB367564A4AAC093F841D88018BB8E0@DM6PR12MB3675.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [37.201.193.98]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6942d24d-16ed-4839-1cd7-08d73c0d4e3a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1465; 
x-ms-traffictypediagnostic: DM5PR12MB1465:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1465D1BC5F3A3805A81EB607838E0@DM5PR12MB1465.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(13464003)(189003)(199004)(4326008)(81166006)(478600001)(81156014)(31686004)(25786009)(316002)(76176011)(66476007)(66446008)(66946007)(64756008)(256004)(6862004)(99286004)(8676002)(66556008)(54896002)(6436002)(66066001)(6512007)(229853002)(6246003)(486006)(14454004)(53546011)(102836004)(91956017)(76116006)(9686003)(71190400001)(31696002)(6636002)(3846002)(6506007)(5660300002)(71200400001)(11346002)(54906003)(446003)(7736002)(86362001)(186003)(6116002)(6486002)(8936002)(476003)(2906002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1465;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: o0HpOVEdwSw1pRimMOzE9S2NT+e1+LcNn+HYdq41hJtXzCyW7H1Wm4pJVo3rVCv6KWY6Qu/doOIXhB4Tv9YHy6N0R6eq0nNNbCD5qe5Lcbd/WeuyuChLzseOdqJsgjWHseQcEYDoElcng7X24j1a4a7KNdNTRkDwnRCYT9foRbRtTSr+2nxxjeM35B8VXE7xyLu/p9vCWaUjMkF25igPCCmOSrzNvVUT/tGHNE5bFU0a9pSvSLNwN27bdUBM93OeBfuqANmhTmhmn/4TO95Q6fj20m3hnREENCFu45IHfs0b0ymRH3csXzqygqppqvJY5wXVXW/aGzMWx2VCeMN4MTUU43AuJrbSx8CKvVk+TyqDdrc/Fv30S9Eck645tgML2uEGMBhd6QD6LIaFZ/W6d/miHi60k92Wt09jGAWATHU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6942d24d-16ed-4839-1cd7-08d73c0d4e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 07:53:33.9787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVe4tN3F3bLlS8agi7t6jF/H5RzHCrNHiejC/qSqUPuTr63JhtEGDG0h4I/K6wlj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1465
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYNc6bzspiCAbBbOKlo2ind9NeJO2BOfXYUg2hvV+eo=;
 b=L6GJ1+cDACdSY+zFJNuubsCDKCgtp/JtvDszbYrblX31BkV9C4KrdlJtlVTEa5up/F3ZJAE8rTyJt9+2AQBsic8G/bSyQA7ia0AD1Mmz7rtO0qjMkTA59qR5PFlY2DZr6jvirZJLLk3Jq0p2Hg+cPAzHOVK66/D9P95n/PrKl54=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0393159827=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0393159827==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_2a7e5c507af04af1a46d834943ab810cemailandroidcom_"

--_000_2a7e5c507af04af1a46d834943ab810cemailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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


--_000_2a7e5c507af04af1a46d834943ab810cemailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
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
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 18.09.2019 09:32 schrieb &quot;Zhang, Jack =
(Jian)&quot; &lt;Jack.Zhang1@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Hi, Christian and folks,<br>
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
</span></font>
</body>
</html>

--_000_2a7e5c507af04af1a46d834943ab810cemailandroidcom_--

--===============0393159827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0393159827==--

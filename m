Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3078FBE7
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 09:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888486EAF2;
	Fri, 16 Aug 2019 07:15:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740078.outbound.protection.outlook.com [40.107.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DAE6EAF2
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jF8DusVRhM6eoWzH/imduUw/GZmhYgFLj2zSTyIhoZmu5j+AHGZ0OnLoGgnfR3hFf767jqBUbfAguliVMBl/QSrFWKfJw0S/BM6Z4YFm+E6Znsuws7kFeDXIM50p/I3LDVuwE2WvmvF8bYKMGCJaOZyWP+4tR2xhEA/UBAleXgnfR1eSjxyJbga7jLi6g7fmnOtxtCrs7bfMeyTP9L/bgYJWu7rAh4AQhiPvMCc78bqvT6D9eI30fbWHlN4qTqs/BjOAlHIXZkcaGqxh5OwW3jQ0+VV/VNWtYe0Sgis7e6X6qPbe7wvca8OMHwRKdaUBENdG4CVkM37jq3xwSQ7jRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYIB/JdauiiIwLCCipVc2a8X83Guau3EGQ7wJftEQfY=;
 b=KJAjDdIhv4Eg6c238E5vImHw1pKaPZuQjeFJ0xovq4AEfsCWiJRWIXtJZH5LHB0fA5kruLWcvTQ2vtbTLXLkBT8QoXH7OKXii7Q11wskyY/1LhXYC+Za7O6M+uKFoUpPJNwEyoUIyl4hzuRATN5D2dQQV95w0oO30h/utrTlsR7Zj2qft1BV35HLLz+f89UB+i0bVAWpWH23IXsxi8p2PL5xmbkOd0G5gS9Rm5WlpJB+Oc08k4Y2U4pdDAIO7iAPa8UxPTEmUvoeOPr+zwPTQ9fEQ7VxLZY2W+fe4BeiUfJcNgJQGa3n3HoxwGMEX8pjcCD5p4v3/ZU3hBtSk4Izuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2976.namprd12.prod.outlook.com (20.178.240.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Fri, 16 Aug 2019 07:15:42 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 07:15:42 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/amd/powerplay: expose supported clock domains
 only through sysfs
Thread-Topic: [PATCH 2/4] drm/amd/powerplay: expose supported clock domains
 only through sysfs
Thread-Index: AQHVU/kG0ZSe+gOnY02kPCV5gat+5Kb9XAgl
Date: Fri, 16 Aug 2019 07:15:42 +0000
Message-ID: <MN2PR12MB329617CB0EF329673FB44F77A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190816060807.11922-1-evan.quan@amd.com>,
 <20190816060807.11922-2-evan.quan@amd.com>
In-Reply-To: <20190816060807.11922-2-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aea2d53-114a-4539-744c-08d722198c77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2976; 
x-ms-traffictypediagnostic: MN2PR12MB2976:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB297677BBFAB6680660932926A2AF0@MN2PR12MB2976.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(74316002)(476003)(71200400001)(71190400001)(6246003)(99286004)(6436002)(3846002)(6116002)(66066001)(229853002)(256004)(486006)(91956017)(11346002)(76116006)(2501003)(478600001)(446003)(105004)(66946007)(33656002)(66446008)(64756008)(66556008)(66476007)(81166006)(110136005)(316002)(5660300002)(25786009)(81156014)(76176011)(19627405001)(8936002)(26005)(52536014)(606006)(53936002)(54896002)(6306002)(55016002)(86362001)(8676002)(7736002)(2906002)(186003)(966005)(102836004)(236005)(6506007)(53546011)(9686003)(14454004)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2976;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bS2cyd7iN/3bcogE/vusYcwajNfoj66ampR48VwJnmojaKq0c0ArLKPtUigBvhKYh0CE4WwYxJ3F3fbGfuOtcqo1Fh41GGPmz0B/SbSZCQ8uoa6v1xmlw2G4uwcrinhe8/llDoN6OSo5UB5RRkc4l7Bmsaj4KFStZMazO72aiW85gDYOFAcI38v2370VdpBCEyNpHC/OhEjHbx96FjJGDXfaKO/91dajGnu4gYhun1HnXYiV4P9K36hqCWe8JZqUUsZjos759XM0hmwaoV5VMY4E6Q+/EDOKYjHnGtOHY6O6qFfPZVFS1mb9ParnkPpt+CsIM3ycJaZ1jkH1HuRoyxfRx8qedQxK96463lAzsQITfoDygN6Q/TPKVEQQuF4OwWNkGgxv3pZwP1TlkC5GB4ditui/MSgk+8DafH7Ar7I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aea2d53-114a-4539-744c-08d722198c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:15:42.1460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jdduPauOTI+MoXBm62Aed79Nm4aOFohGU7fGUrBzty0rMDY110SScFiAW044uIrY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2976
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYIB/JdauiiIwLCCipVc2a8X83Guau3EGQ7wJftEQfY=;
 b=BjSeLE7ykIEwbRQgS6ViSBnqTT0Ivf/wLzpoveCHOb1y07Zk4mUVCx5d/+4HI72+BQ6i+AFCqNbnq4b/ZfpcXLxg8WlLDoHsr6ZonDZHbgZ97yjqmMKFR64nLI+qvg9kO5vvbK1AjeR5SCzSOHElelhkG/Ao0s/1S8V9qUoGAeQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0648202390=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0648202390==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329617CB0EF329673FB44F77A2AF0MN2PR12MB3296namp_"

--_000_MN2PR12MB329617CB0EF329673FB44F77A2AF0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I don't recommend it. What's the problem if we keep it the way it is?
maybe other asic also has same problems, if do it, the other asic should  a=
dd a condition in there too.
eg: navi10 don't support sensor of  "pp_dpm_pcie".

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Friday, August 16, 2019 2:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH 2/4] drm/amd/powerplay: expose supported clock domains only=
 through sysfs

Do not expose those unsupported clock domains through sysfs on
Arcturus.

Change-Id: I526e7bd457fdcd8c79d4581bb9b77e5cb57f5844
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index c5642be9b44b..7accf2c7f8cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -2879,10 +2879,12 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev=
)
                         DRM_ERROR("failed to create device file pp_dpm_soc=
clk\n");
                         return ret;
                 }
-               ret =3D device_create_file(adev->dev, &dev_attr_pp_dpm_dcef=
clk);
-               if (ret) {
-                       DRM_ERROR("failed to create device file pp_dpm_dcef=
clk\n");
-                       return ret;
+               if (adev->asic_type !=3D CHIP_ARCTURUS) {
+                       ret =3D device_create_file(adev->dev, &dev_attr_pp_=
dpm_dcefclk);
+                       if (ret) {
+                               DRM_ERROR("failed to create device file pp_=
dpm_dcefclk\n");
+                               return ret;
+                       }
                 }
         }
         if (adev->asic_type >=3D CHIP_VEGA20) {
@@ -2892,10 +2894,12 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *adev=
)
                         return ret;
                 }
         }
-       ret =3D device_create_file(adev->dev, &dev_attr_pp_dpm_pcie);
-       if (ret) {
-               DRM_ERROR("failed to create device file pp_dpm_pcie\n");
-               return ret;
+       if (adev->asic_type !=3D CHIP_ARCTURUS) {
+               ret =3D device_create_file(adev->dev, &dev_attr_pp_dpm_pcie=
);
+               if (ret) {
+                       DRM_ERROR("failed to create device file pp_dpm_pcie=
\n");
+                       return ret;
+               }
         }
         ret =3D device_create_file(adev->dev, &dev_attr_pp_sclk_od);
         if (ret) {
@@ -2999,9 +3003,11 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device *adev=
)
         device_remove_file(adev->dev, &dev_attr_pp_dpm_mclk);
         if (adev->asic_type >=3D CHIP_VEGA10) {
                 device_remove_file(adev->dev, &dev_attr_pp_dpm_socclk);
-               device_remove_file(adev->dev, &dev_attr_pp_dpm_dcefclk);
+               if (adev->asic_type !=3D CHIP_ARCTURUS)
+                       device_remove_file(adev->dev, &dev_attr_pp_dpm_dcef=
clk);
         }
-       device_remove_file(adev->dev, &dev_attr_pp_dpm_pcie);
+       if (adev->asic_type !=3D CHIP_ARCTURUS)
+               device_remove_file(adev->dev, &dev_attr_pp_dpm_pcie);
         if (adev->asic_type >=3D CHIP_VEGA20)
                 device_remove_file(adev->dev, &dev_attr_pp_dpm_fclk);
         device_remove_file(adev->dev, &dev_attr_pp_sclk_od);
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329617CB0EF329673FB44F77A2AF0MN2PR12MB3296namp_
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
<span>I don't recommend it. What's the problem if we keep it the way it is?=
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>maybe other asic also has same problems, if do it, the other asic sho=
uld&nbsp; add a condition in there too.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>eg: navi10 don't support sensor of&nbsp; &quot;pp_dpm_pcie&quot;.</sp=
an></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Friday, August 16, 2019 2:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/4] drm/amd/powerplay: expose supported clock domai=
ns only through sysfs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Do not expose those unsupported clock domains thro=
ugh sysfs on<br>
Arcturus.<br>
<br>
Change-Id: I526e7bd457fdcd8c79d4581bb9b77e5cb57f5844<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 26 &#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------<br>
&nbsp;1 file changed, 16 insertions(&#43;), 10 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index c5642be9b44b..7accf2c7f8cd 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -2879,10 &#43;2879,12 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *=
adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_E=
RROR(&quot;failed to create device file pp_dpm_socclk\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D device_create_file(adev-&gt;dev, &amp;dev_attr_pp_dpm_dc=
efclk);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (ret) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;=
failed to create device file pp_dpm_dcefclk\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_ARCTURUS) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D devi=
ce_create_file(adev-&gt;dev, &amp;dev_attr_pp_dpm_dcefclk);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;failed to create device=
 file pp_dpm_dcefclk\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type &gt=
;=3D CHIP_VEGA20) {<br>
@@ -2892,10 &#43;2894,12 @@ int amdgpu_pm_sysfs_init(struct amdgpu_device *=
adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D device_create_file(adev-&gt;d=
ev, &amp;dev_attr_pp_dpm_pcie);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;failed to create device file pp_dpm_pcie\n&quot;=
);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_=
ARCTURUS) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D device_create_file(adev-&gt;dev, &amp;dev_attr_pp_dp=
m_pcie);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&q=
uot;failed to create device file pp_dpm_pcie\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D device_create_file=
(adev-&gt;dev, &amp;dev_attr_pp_sclk_od);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
@@ -2999,9 &#43;3003,11 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device *=
adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&g=
t;dev, &amp;dev_attr_pp_dpm_mclk);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type &gt=
;=3D CHIP_VEGA10) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_pp_dpm=
_socclk);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_pp_dpm_dcefclk);<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_ARCTURUS)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_remov=
e_file(adev-&gt;dev, &amp;dev_attr_pp_dpm_dcefclk);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp=
;dev_attr_pp_dpm_pcie);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_=
ARCTURUS)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_pp_dpm_pcie);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type &gt=
;=3D CHIP_VEGA20)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&gt;dev, &amp;dev_attr_pp_dpm=
_fclk);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_remove_file(adev-&g=
t;dev, &amp;dev_attr_pp_sclk_od);<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329617CB0EF329673FB44F77A2AF0MN2PR12MB3296namp_--

--===============0648202390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0648202390==--

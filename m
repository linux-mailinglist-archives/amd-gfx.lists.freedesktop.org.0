Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5959B61
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 14:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EDD6E91A;
	Fri, 28 Jun 2019 12:33:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770040.outbound.protection.outlook.com [40.107.77.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64396E91A
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 12:33:00 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1940.namprd12.prod.outlook.com (10.175.96.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 12:32:55 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 12:32:55 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: fix MGPU fan boost enablement for XGMI reset
Thread-Topic: [PATCH] drm/amdgpu: fix MGPU fan boost enablement for XGMI reset
Thread-Index: AQHVLWH6nFEg9bfIY0maOenRLG0DmaaxAGDX
Date: Fri, 28 Jun 2019 12:32:55 +0000
Message-ID: <BN6PR12MB1809A8CC1A1B354981124EF7F7FC0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190628033112.12099-1-evan.quan@amd.com>
In-Reply-To: <20190628033112.12099-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694bcd5a-56bc-4df1-cfa0-08d6fbc4beeb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1940; 
x-ms-traffictypediagnostic: BN6PR12MB1940:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB19400B6D6CA18290EE6DFC82F7FC0@BN6PR12MB1940.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(189003)(199004)(966005)(66556008)(81166006)(81156014)(71190400001)(71200400001)(66476007)(26005)(229853002)(316002)(25786009)(8676002)(52536014)(11346002)(446003)(486006)(86362001)(66446008)(64756008)(5660300002)(76116006)(110136005)(476003)(7736002)(73956011)(66946007)(8936002)(74316002)(2501003)(66066001)(606006)(53936002)(68736007)(19627405001)(236005)(99286004)(9686003)(6246003)(14454004)(186003)(256004)(76176011)(6436002)(105004)(478600001)(7696005)(6116002)(102836004)(53546011)(72206003)(6506007)(3846002)(55016002)(33656002)(54896002)(2906002)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1940;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IpC3u5HLCgd0m4Hot6W/lD5+Pzq+Us9tkHv8ARCD9CNPOYrrNhJQr5d8j/Ib+/9KA/NDvs+4jPXce5of9Ua+kupxSWmfX63le9j6M3LP4pq0SXgN2itKT9KaNt7HnyT79tnaVaFbI3ZF/u7FeZFCWTt48IDwc8hYKXT1BQ+pkEs8eLU99v28WihRvepZ8l/tB2u4n9IKVmKuegGJv7EuKr68Evz3SJg0yT6pa/KGbUne0vOrLj35L2K1For1z85HGXhK17MdiNevMiq5MoZt595El1sN8OrBWXlJ5xZntvGbVnzrccTdEQUDCG7XgsuvKF+0SVZMlB9SypTIn4mvrVH8KhzyUv2F5E/QhzEWIZ7iPYsd+bRYdCccgdAfMKVvFToUxkECcXOK69oXLZlkZIp8GEbkUuvXD7VnFYBd6BY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694bcd5a-56bc-4df1-cfa0-08d6fbc4beeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 12:32:55.2829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1940
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2W9zVMRQybCYoTnA1A5dEfavtRucHJM5BVJfNmn5RJY=;
 b=ddTCKLxdoPBSVNWMOwv8Voa8BohmVKmwVVlE1Gw9kRIAfANeX+YCkzF2jiHwapSP5ka5GK5SlgdJn6BldkgaElH2dmBmBfdBoiy4VNxsFZsESHHR4fzmqfE95BSu86xNTu9YzB5mYpbF2aN3iWDW0VD1LhkHaVfnoWz/PJkWBLc=
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
Content-Type: multipart/mixed; boundary="===============0955469719=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0955469719==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809A8CC1A1B354981124EF7F7FC0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809A8CC1A1B354981124EF7F7FC0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Thursday, June 27, 2019 11:31 PM
To: amd-gfx@lists.freedesktop.org
Cc: Quan, Evan
Subject: [PATCH] drm/amdgpu: fix MGPU fan boost enablement for XGMI reset

MGPU fan boost feature should not be enabled until all the
devices from the same hive are all back from reset.

Change-Id: I03a69434ff28f4eac209bd91320dde8a238a33cf
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |  4 ++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index 7541e1b076b0..9efa0423c242 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1219,6 +1219,10 @@ int amdgpu_dm_display_resume(struct amdgpu_device *a=
dev );
 static inline int amdgpu_dm_display_resume(struct amdgpu_device *adev) { r=
eturn 0; }
 #endif

+
+void amdgpu_register_gpu_instance(struct amdgpu_device *adev);
+void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev);
+
 #include "amdgpu_object.h"

 /* used by df_v3_6.c and amdgpu_pmu.c */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c
index a2d234c07fc4..f39eb7b37c8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3558,6 +3558,12 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_i=
nfo *hive,
                                 if (vram_lost)
                                         amdgpu_device_fill_reset_magic(tmp=
_adev);

+                               /*
+                                * Add this ASIC as tracked as reset was al=
ready
+                                * complete successfully.
+                                */
+                               amdgpu_register_gpu_instance(tmp_adev);
+
                                 r =3D amdgpu_device_ip_late_init(tmp_adev)=
;
                                 if (r)
                                         goto out;
@@ -3692,6 +3698,13 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *=
adev,
                 device_list_handle =3D &device_list;
         }

+       /*
+        * Mark these ASICs to be reseted as untracked first
+        * And add them back after reset completed
+        */
+       list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head)
+               amdgpu_unregister_gpu_instance(tmp_adev);
+
         /* block all schedulers and reset given job's ring */
         list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
                 for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_kms.c
index ed051fdb509f..e2c9d8d31ed8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -41,7 +41,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_ras.h"

-static void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)
+void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)
 {
         struct amdgpu_gpu_instance *gpu_instance;
         int i;
@@ -102,7 +102,7 @@ void amdgpu_driver_unload_kms(struct drm_device *dev)
         dev->dev_private =3D NULL;
 }

-static void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
+void amdgpu_register_gpu_instance(struct amdgpu_device *adev)
 {
         struct amdgpu_gpu_instance *gpu_instance;

--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809A8CC1A1B354981124EF7F7FC0BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd=
.com&gt;<br>
<b>Sent:</b> Thursday, June 27, 2019 11:31 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amdgpu: fix MGPU fan boost enablement for XGMI =
reset</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">MGPU fan boost feature should not be enabled until=
 all the<br>
devices from the same hive are all back from reset.<br>
<br>
Change-Id: I03a69434ff28f4eac209bd91320dde8a238a33cf<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 4 &#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c&nbsp;&nbsp;&nbsp; |&nbsp; 4 &=
#43;&#43;--<br>
&nbsp;3 files changed, 19 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 7541e1b076b0..9efa0423c242 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -1219,6 &#43;1219,10 @@ int amdgpu_dm_display_resume(struct amdgpu_devic=
e *adev );<br>
&nbsp;static inline int amdgpu_dm_display_resume(struct amdgpu_device *adev=
) { return 0; }<br>
&nbsp;#endif<br>
&nbsp;<br>
&#43;<br>
&#43;void amdgpu_register_gpu_instance(struct amdgpu_device *adev);<br>
&#43;void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev);<br>
&#43;<br>
&nbsp;#include &quot;amdgpu_object.h&quot;<br>
&nbsp;<br>
&nbsp;/* used by df_v3_6.c and amdgpu_pmu.c */<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index a2d234c07fc4..f39eb7b37c8b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -3558,6 &#43;3558,12 @@ static int amdgpu_do_asic_reset(struct amdgpu_hi=
ve_info *hive,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vram_lost)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; amdgpu_device_fill_reset_magic(tmp_adev);<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Add this ASIC as tracked as res=
et was already<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * complete successfully.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_register_gpu_instance(tmp_adev);=
<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_device_ip_late_init=
(tmp_adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto out;<br>
@@ -3692,6 &#43;3698,13 @@ int amdgpu_device_gpu_recover(struct amdgpu_devi=
ce *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_list_handle =3D &amp;device_list;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Mark these ASICs to be re=
seted as untracked first<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * And add them back after r=
eset completed<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(tmp_adev, dev=
ice_list_handle, gmc.xgmi.head)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_unregister_gpu_instance(tmp_adev);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* block all schedulers an=
d reset given job's ring */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_for_each_entry(tmp_ad=
ev, device_list_handle, gmc.xgmi.head) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; AMDGPU_MAX_RINGS; &#43;&#43;i) {=
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_kms.c<br>
index ed051fdb509f..e2c9d8d31ed8 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
@@ -41,7 &#43;41,7 @@<br>
&nbsp;#include &quot;amdgpu_display.h&quot;<br>
&nbsp;#include &quot;amdgpu_ras.h&quot;<br>
&nbsp;<br>
-static void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)<br>
&#43;void amdgpu_unregister_gpu_instance(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_gpu_instance=
 *gpu_instance;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
@@ -102,7 &#43;102,7 @@ void amdgpu_driver_unload_kms(struct drm_device *de=
v)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev-&gt;dev_private =3D NU=
LL;<br>
&nbsp;}<br>
&nbsp;<br>
-static void amdgpu_register_gpu_instance(struct amdgpu_device *adev)<br>
&#43;void amdgpu_register_gpu_instance(struct amdgpu_device *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_gpu_instance=
 *gpu_instance;<br>
&nbsp;<br>
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809A8CC1A1B354981124EF7F7FC0BN6PR12MB1809namp_--

--===============0955469719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0955469719==--

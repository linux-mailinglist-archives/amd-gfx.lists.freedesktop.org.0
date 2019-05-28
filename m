Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CF2CFCF
	for <lists+amd-gfx@lfdr.de>; Tue, 28 May 2019 21:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79D06E04A;
	Tue, 28 May 2019 19:54:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710047.outbound.protection.outlook.com [40.107.71.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E3C6E04A
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 19:54:25 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1474.namprd12.prod.outlook.com (10.172.23.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 19:54:23 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 19:54:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Return proper error code for gws alloc API
Thread-Topic: [PATCH] drm/amdkfd: Return proper error code for gws alloc API
Thread-Index: AQHVFY76txIN52yqrUetiHSfDTOIP6aA8xsY
Date: Tue, 28 May 2019 19:54:22 +0000
Message-ID: <BN6PR12MB1809212FC7FA7DAD436BE508F71E0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1559073185-26048-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559073185-26048-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.72.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5497d8be-0590-42e3-fc1c-08d6e3a647e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1474; 
x-ms-traffictypediagnostic: BN6PR12MB1474:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB14741181251C56101469F11BF71E0@BN6PR12MB1474.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(25786009)(99286004)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(236005)(8676002)(110136005)(33656002)(229853002)(6306002)(54896002)(9686003)(81166006)(256004)(7696005)(52536014)(186003)(81156014)(91956017)(74316002)(6436002)(11346002)(14444005)(446003)(105004)(8936002)(2906002)(486006)(55016002)(19627405001)(76116006)(606006)(476003)(26005)(6116002)(68736007)(3846002)(53546011)(66066001)(71200400001)(71190400001)(102836004)(6506007)(7736002)(2501003)(53936002)(4326008)(86362001)(966005)(478600001)(5660300002)(72206003)(316002)(76176011)(6246003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1474;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 96gA4YlS05dBrv4pcR2svRc3Z+lWvt+vDt4d8tg1fbytl8WGEaAj65kAvj/yPHlMeNoU4ge6xmzVHIJfPe3wUnNb2YkG4GwuFq5ReiGjpRBMd6wxJphGJTp+ueoLMPXpL6s9TU9m2GXPy0H5Do683RCFAzCVBRzWh78MH1watVOISofF+9V5Ff5QYIzpguZMHLhhKIDG43mHT8+EjJ9qKeF2LXbCeX85xZntloZjOsTQ26nThDH3bPgop2Lae836/39lmgw60nqL6p4NN1nszvtzgILtnVR/FAYFxZpdExf6cIodaa+DKVvS0OyE4+zZYtAzlKbnZPOrXTKlRNp+dcVv7WGHnqXEEkFFScGSbMuTJoXQLD+JqhrBCWPeDE148fxyPzTnNnvkh9yiFcjU7dPxWYYSl0RInDOepQtszMA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5497d8be-0590-42e3-fc1c-08d6e3a647e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 19:54:22.8008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1474
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t02UaVnKyat55KdbYBxap1Nd26me1bgXuUx03bohAF4=;
 b=LMCc/8TGbA7LtfSVSih7OuU7P9fFwb+BMYB0rnExP1Zek14WZIQksL2doxoVt7nAxBUFjUR2x67fjuqFUg/YfqC7JSIJjcyYS8cCvPkhLjYFJcrRuu2lvmu6jxY2LDugjFsVFo7OWYtjmXBcdfeg/CAcQO006uawUcTOuwcOO9Q=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: multipart/mixed; boundary="===============1939128690=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1939128690==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809212FC7FA7DAD436BE508F71E0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809212FC7FA7DAD436BE508F71E0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zeng, Oa=
k <Oak.Zeng@amd.com>
Sent: Tuesday, May 28, 2019 3:53 PM
To: amd-gfx@lists.freedesktop.org
Cc: Kuehling, Felix; Zeng, Oak
Subject: [PATCH] drm/amdkfd: Return proper error code for gws alloc API

Change-Id: Iaa81c6aa5f97e888291771e1aa70b02fccdcb9e0
Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c       | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c               | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 87177ed..e304271 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2124,7 +2124,7 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, void=
 *gws, struct kgd_mem **mem

         *mem =3D kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
         if (!*mem)
-               return -EINVAL;
+               return -ENOMEM;

         mutex_init(&(*mem)->lock);
         (*mem)->bo =3D amdgpu_bo_ref(gws_bo);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_chardev.c
index aab2aa6..491f0dd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1576,7 +1576,7 @@ static int kfd_ioctl_alloc_queue_gws(struct file *fil=
ep,

         if (!hws_gws_support ||
                 dev->dqm->sched_policy =3D=3D KFD_SCHED_POLICY_NO_HWS)
-               return -EINVAL;
+               return -ENODEV;

         dev =3D kfd_device_by_id(args->gpu_id);
         if (!dev) {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drive=
rs/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index c2c570e..da09586 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -103,7 +103,7 @@ int pqm_set_gws(struct process_queue_manager *pqm, unsi=
gned int qid,

         /* Only allow one queue per process can have GWS assigned */
         if (gws && pdd->qpd.num_gws)
-               return -EINVAL;
+               return -EBUSY;

         if (!gws && pdd->qpd.num_gws =3D=3D 0)
                 return -EINVAL;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809212FC7FA7DAD436BE508F71E0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Zeng, Oak &lt;Oak.Zeng@amd.co=
m&gt;<br>
<b>Sent:</b> Tuesday, May 28, 2019 3:53 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Kuehling, Felix; Zeng, Oak<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Return proper error code for gws alloc =
API</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Change-Id: Iaa81c6aa5f97e888291771e1aa70b02fccdcb9=
e0<br>
Signed-off-by: Oak Zeng &lt;Oak.Zeng@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_chardev.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 &#43;-<br>
&nbsp;3 files changed, 3 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
index 87177ed..e304271 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
@@ -2124,7 &#43;2124,7 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, =
void *gws, struct kgd_mem **mem<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mem =3D kzalloc(sizeof(st=
ruct kgd_mem), GFP_KERNEL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!*mem)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -ENOMEM;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_init(&amp;(*mem)-&gt=
;lock);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*mem)-&gt;bo =3D amdgpu_b=
o_ref(gws_bo);<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd=
/amdkfd/kfd_chardev.c<br>
index aab2aa6..491f0dd 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
@@ -1576,7 &#43;1576,7 @@ static int kfd_ioctl_alloc_queue_gws(struct file =
*filep,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!hws_gws_support ||<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dev-&gt;dqm-&gt;sched_policy =3D=3D KFD_SCHED_POLICY_=
NO_HWS)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -ENODEV;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev =3D kfd_device_by_id(a=
rgs-&gt;gpu_id);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dev) {<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drive=
rs/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c<br>
index c2c570e..da09586 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c<br=
>
@@ -103,7 &#43;103,7 @@ int pqm_set_gws(struct process_queue_manager *pqm, =
unsigned int qid,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Only allow one queue pe=
r process can have GWS assigned */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gws &amp;&amp; pdd-&gt=
;qpd.num_gws)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EBUSY;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!gws &amp;&amp; pdd-&g=
t;qpd.num_gws =3D=3D 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
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

--_000_BN6PR12MB1809212FC7FA7DAD436BE508F71E0BN6PR12MB1809namp_--

--===============1939128690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1939128690==--

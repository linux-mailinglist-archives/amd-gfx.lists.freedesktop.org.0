Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE84BF264
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 14:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30D26ECDC;
	Thu, 26 Sep 2019 12:03:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780084.outbound.protection.outlook.com [40.107.78.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D6F6ECDC
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 12:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZdGkkSP3KSVRIIlzjGy87KRbY+xnLo4vK901fwhuZ4dwXQjrIQivwEeKh7zxggupS5umtWxzO/V7u3TPRUuiw89/FMnH8IyPxWGojirN1mva52A8rh7DtwM4+qCJjUgwzDw8bSuWa5dp5mXPRvb76DmPPtwLig6R3t2bZ5uuG6WrqF9vukCB1oUCssYY3m4F6xqe/1ilVb6EspwskLxv/NlpQgLCcOaSWkWo2Cx3DVO2Em0BeTuNVEroSwh0XkalnDKFgHlozrvU4XXJ4HGfEOxEritppH6nyLh98HOKH3iw8a1gemcN5JV4U4vWtpqE42lC0etbnkZ+UNxOd8rTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yjc8NeOUptkyRqSKGCrsgNL7ZoInaelXiN89myHMWJs=;
 b=hhduFtDmSzCSPbH3TehOnPHahmazXXfGV4u/uDkqKiIi8dKJfS2gKuJly1bwxITDBPJDUXh2VGEDMeQSThonmmPy7GHvXGdF5u0YDopWCa4ypT/wKnWEfTC00d6f7LsF1znVdNq9WarnBluOVdWmcSaCXb5CFnY6w1E/NvCqZy81TQ6fObNOWj+97V2dOaAViWnYsvIIGjlFbh1lyd4ZZ2OVu+BZWeJb0HQkE8StxxLSjkxKoOB6oRib3s/EBEh/mP/xVL9AkcTXItYuZycrj/w0xUOqEjkAL2fTMXNBDSlyRJ8TYzdXD7pQpAxsaGNIdFHcM18f53ctXVPrUIsP9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB2970.namprd12.prod.outlook.com (20.178.29.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 12:03:15 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 12:03:15 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: use navi12 specific family id for navi12 code
 path
Thread-Topic: [PATCH] drm/amdkfd: use navi12 specific family id for navi12
 code path
Thread-Index: AQHVc+YrdxynlikctUSs9/sajd/ddqc93NNx
Date: Thu, 26 Sep 2019 12:03:14 +0000
Message-ID: <DM6PR12MB32419C43945D41CE2F6C0DA2F4860@DM6PR12MB3241.namprd12.prod.outlook.com>
References: <1569446041-12694-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1569446041-12694-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [76.69.101.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 269349fd-9c3e-4593-df05-08d7427982e2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2970; 
x-ms-traffictypediagnostic: DM6PR12MB2970:
x-microsoft-antispam-prvs: <DM6PR12MB297011032C1CD972E2DCABC2F4860@DM6PR12MB2970.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:221;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(199004)(189003)(66066001)(5640700003)(71200400001)(2351001)(25786009)(486006)(53546011)(102836004)(71190400001)(229853002)(6506007)(54896002)(52536014)(14454004)(9686003)(7696005)(8676002)(86362001)(76176011)(256004)(14444005)(316002)(5660300002)(6916009)(33656002)(3846002)(6116002)(446003)(478600001)(11346002)(55016002)(99286004)(8936002)(81166006)(81156014)(2906002)(7736002)(6246003)(2501003)(74316002)(66446008)(64756008)(66556008)(66476007)(76116006)(26005)(6436002)(476003)(66946007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2970;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WTSvMGCCvCsemip7GTL40E+KoF+lj+tESPmRnW8pqap9Jcvka9XtCZETn3Cg1qNynnFtDRdjkBz5ENv1g9ZNmEVop7T/rxxOJsPWAVq/VPjzhv/o2aYTIfMkzvqw916Juu9E+70HKjxz6kmDgoMIkdtsps44dbzJ0tQyH5OVMU03jxZsJ2u14rypYSk9M/YpdQ1Q7ba4EYPOirZBgbrQDtmFxdFXOTKbdL0mmyI9XjKAGdqLalGzG/IUoL0jKXHDGmmpw3toIExgjbdXf6f0oE3+Vf4d9VLU+WrqxZd1wUVkS548NFxVlOH4fgkWR7nY67oZfqgnD0MC57JrPh1e33ntVtmhAAK6koag+4UQaJaKx7pn2QOO8EDxzxi03qTFlDozqHsOSDuDVFrQYMYOGpXz9ydYQqVYiGiHn3DCHxk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269349fd-9c3e-4593-df05-08d7427982e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:03:14.8707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBLTXyKePWatsMiRLEsoI7fwEq6qqb6HLnsuvfUA17/eB0V1BPuoGKCCTzmn/FIYO/22Tg0zsfAuNxf3ebdhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2970
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yjc8NeOUptkyRqSKGCrsgNL7ZoInaelXiN89myHMWJs=;
 b=DroRI0hPLjKYLICBVkZDcGGSvllIJrASxtuaisGnnu8L1XmD64HBGoK3OTj5vx74RwJGq/oJru8OE33Z4u89gcWmuh4fAfryf4JC30aLU/LnLgFDR3CYEculCFST6FQZJHhGsAS72/BRrOJ2TqIBynLB42OA2Nfaksm1RD33FyI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============2079188914=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2079188914==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB32419C43945D41CE2F6C0DA2F4860DM6PR12MB3241namp_"

--_000_DM6PR12MB32419C43945D41CE2F6C0DA2F4860DM6PR12MB3241namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.
________________________________
From: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Sent: September 25, 2019 5:14:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Subject: [PATCH] drm/amdkfd: use navi12 specific family id for navi12 code =
path

Keep the same use of CHIP_IDs for navi12 in kfd

Change-Id: I5e52bbc058be51e79553147732a571a604537b7c
Signed-off-by: shaoyunl <shaoyun.liu@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c                 | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c               | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c          | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c         | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c       | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c             | 1 +
 7 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/am=
dkfd/kfd_crat.c
index 1ef3c32..0c327e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -676,6 +676,7 @@ static int kfd_fill_gpu_cache_info(struct kfd_dev *kdev=
,
                 num_of_cache_types =3D ARRAY_SIZE(renoir_cache_info);
                 break;
         case CHIP_NAVI10:
+       case CHIP_NAVI12:
         case CHIP_NAVI14:
                 pcache_info =3D navi10_cache_info;
                 num_of_cache_types =3D ARRAY_SIZE(navi10_cache_info);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c
index 270389b..edfbae5c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -388,7 +388,7 @@ static const struct kfd_device_info navi10_device_info =
=3D {
 };

 static const struct kfd_device_info navi12_device_info =3D {
-       .asic_family =3D CHIP_NAVI10,
+       .asic_family =3D CHIP_NAVI12,
         .asic_name =3D "navi12",
         .max_pasid_bits =3D 16,
         .max_no_of_hqd  =3D 24,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 399a612..54f0c5cc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1798,6 +1798,7 @@ struct device_queue_manager *device_queue_manager_ini=
t(struct kfd_dev *dev)
                 device_queue_manager_init_v9(&dqm->asic_ops);
                 break;
         case CHIP_NAVI10:
+       case CHIP_NAVI12:
         case CHIP_NAVI14:
                 device_queue_manager_init_v10_navi10(&dqm->asic_ops);
                 break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_flat_memory.c
index 4816614..450c991 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -408,6 +408,7 @@ int kfd_init_apertures(struct kfd_process *process)
                         case CHIP_RENOIR:
                         case CHIP_ARCTURUS:
                         case CHIP_NAVI10:
+                       case CHIP_NAVI12:
                         case CHIP_NAVI14:
                                 kfd_init_apertures_v9(pdd, id);
                                 break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_kernel_queue.c
index 990ab54..11d2448 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
@@ -335,6 +335,7 @@ struct kernel_queue *kernel_queue_init(struct kfd_dev *=
dev,
                 kernel_queue_init_v9(&kq->ops_asic_specific);
                 break;
         case CHIP_NAVI10:
+       case CHIP_NAVI12:
         case CHIP_NAVI14:
                 kernel_queue_init_v10(&kq->ops_asic_specific);
                 break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c b/drivers/gpu/=
drm/amd/amdkfd/kfd_packet_manager.c
index af62be0..83ef4b3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
@@ -244,6 +244,7 @@ int pm_init(struct packet_manager *pm, struct device_qu=
eue_manager *dqm)
                 pm->pmf =3D &kfd_v9_pm_funcs;
                 break;
         case CHIP_NAVI10:
+       case CHIP_NAVI12:
         case CHIP_NAVI14:
                 pm->pmf =3D &kfd_v10_pm_funcs;
                 break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_topology.c
index f2170f0..453832e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1320,6 +1320,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
         case CHIP_RENOIR:
         case CHIP_ARCTURUS:
         case CHIP_NAVI10:
+       case CHIP_NAVI12:
         case CHIP_NAVI14:
                 dev->node_props.capability |=3D ((HSA_CAP_DOORBELL_TYPE_2_=
0 <<
                         HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
--
2.7.4


--_000_DM6PR12MB32419C43945D41CE2F6C0DA2F4860DM6PR12MB3241namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
Ping.
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Liu, Shaoyun &lt;Shao=
yun.Liu@amd.com&gt;<br>
<b>Sent:</b> September 25, 2019 5:14:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liu, Shaoyun &lt;Shaoyun.Liu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: use navi12 specific family id for navi1=
2 code path</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Keep the same use of CHIP_IDs for navi12 in kfd<br=
>
<br>
Change-Id: I5e52bbc058be51e79553147732a571a604537b7c<br>
Signed-off-by: shaoyunl &lt;shaoyun.liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_crat.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<=
br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_topology.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;7 files changed, 7 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/am=
dkfd/kfd_crat.c<br>
index 1ef3c32..0c327e0 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c<br>
@@ -676,6 &#43;676,7 @@ static int kfd_fill_gpu_cache_info(struct kfd_dev *=
kdev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; num_of_cache_types =3D ARRAY_SIZE(renoir_cache_info);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pcache_info =3D navi10_cache_info;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; num_of_cache_types =3D ARRAY_SIZE(navi10_cache_info);=
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c<br>
index 270389b..edfbae5c 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
@@ -388,7 &#43;388,7 @@ static const struct kfd_device_info navi10_device_i=
nfo =3D {<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static const struct kfd_device_info navi12_device_info =3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_NAVI10,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_NAVI12,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;navi1=
2&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 2=
4,<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/driver=
s/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
index 399a612..54f0c5cc 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
@@ -1798,6 &#43;1798,7 @@ struct device_queue_manager *device_queue_manager=
_init(struct kfd_dev *dev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_queue_manager_init_v9(&amp;dqm-&gt;asic_ops);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; device_queue_manager_init_v10_navi10(&amp;dqm-&gt;asi=
c_ops);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_flat_memory.c<br>
index 4816614..450c991 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c<br>
@@ -408,6 &#43;408,7 @@ int kfd_init_apertures(struct kfd_process *process)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
CHIP_RENOIR:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
CHIP_ARCTURUS:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
CHIP_NAVI10:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NA=
VI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case =
CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfd_init_apertures_v9(pdd, id);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_kernel_queue.c<br>
index 990ab54..11d2448 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c<br>
@@ -335,6 &#43;335,7 @@ struct kernel_queue *kernel_queue_init(struct kfd_d=
ev *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kernel_queue_init_v9(&amp;kq-&gt;ops_asic_specific);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kernel_queue_init_v10(&amp;kq-&gt;ops_asic_specific);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c b/drivers/gpu/=
drm/amd/amdkfd/kfd_packet_manager.c<br>
index af62be0..83ef4b3 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c<br>
@@ -244,6 &#43;244,7 @@ int pm_init(struct packet_manager *pm, struct devic=
e_queue_manager *dqm)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pm-&gt;pmf =3D &amp;kfd_v9_pm_funcs;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pm-&gt;pmf =3D &amp;kfd_v10_pm_funcs;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/am=
d/amdkfd/kfd_topology.c<br>
index f2170f0..453832e 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c<br>
@@ -1320,6 &#43;1320,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_RENOIR:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_ARCTURUS:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dev-&gt;node_props.capability |=3D ((HSA_CAP_DOORBELL=
_TYPE_2_0 &lt;&lt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HSA_C=
AP_DOORBELL_TYPE_TOTALBITS_SHIFT) &amp;<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB32419C43945D41CE2F6C0DA2F4860DM6PR12MB3241namp_--

--===============2079188914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2079188914==--

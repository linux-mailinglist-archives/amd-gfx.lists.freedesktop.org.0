Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7385BD4F1
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 00:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23ED06EB03;
	Tue, 24 Sep 2019 22:33:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730075.outbound.protection.outlook.com [40.107.73.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D49D6EB03
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 22:33:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PN653hKMp53vZIF36cNbX9rc/X/FUO30PhAhAmONTht0S0eV/BJ0Z24grqT3M2NN+d+mB1n/sknvOFVKMenJhWmqoaK3l+Y1nCSXP321LFmXhi4zQ2V/+Dic50GZPC5CTAWkyItbK3bJf8kJeHZCR0Mn1qEMY22WQ89W92i1qoZQcKHf1O+qkBls3+Tuf3Wa3Cbx0GKEdI8CXi4ffrOBY7xVC02eukwu0yrUkzaLi+pYg7R6o9f0DK45v8kK/mjiK9YcmmCIjSF0G3Ptb9q/6+lSj86s1IDmGFLfK+aHYyY46x1zunBhzPidaVXtXy+BF9D1g3/nIiBM35Q00Mbj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YRUca178Ay3ParkNdGBMbSqxLKxdSS2pJWGNo/hJDI=;
 b=Q9/xRxy2qXa3H2SUniiUs+AzU6HIwVfSr1NnfyDwW4EBU+eV6BpM3tn/WqalqlS2/FnUFYZamnnSqIRgMh5/C2+H49Q2qPvcE7F/ZhIusZqTQd5ZONRO8evSL0fgwImrrsfmVVgzUN+RKkHaWb8a8zpLDELhr2ugV33uilyiLLfgWdueXbn7BdDXdwwN0yw8SXPCchN36lIf5vOi63Lro5vuAbKTiVucdbiTLyW6uwO+6jKJL61P59K/YJjuJNWUCuDbXltmVYiCU25LX4oy9U2ljiftwBay0otR3Oxo2G2CLzayepNFcZ2SOAg34PdyZ7iRVzlRB5Sw9s8VHyDI/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3083.namprd12.prod.outlook.com (20.178.30.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 22:33:01 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 22:33:01 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side
Thread-Index: AQHVcyWw/zVyQ3bhHEGig/0OmRjs5qc7ZV78gAADIICAAAC46A==
Date: Tue, 24 Sep 2019 22:33:01 +0000
Message-ID: <DM6PR12MB2778C3828D2FA626FEA1FB22F0840@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <1569363372-18620-1-git-send-email-shaoyun.liu@amd.com>
 <DM6PR12MB27788F751A7E9247F1BC1EF1F0840@DM6PR12MB2778.namprd12.prod.outlook.com>,
 <f2cb588a-f799-894b-6348-3bbdb9bf5cf0@amd.com>
In-Reply-To: <f2cb588a-f799-894b-6348-3bbdb9bf5cf0@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 170c8cbe-a191-4d45-f80e-08d7413f28bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3083; 
x-ms-traffictypediagnostic: DM6PR12MB3083:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB30839FE2A9663B1DF9EA0E96F0840@DM6PR12MB3083.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(199004)(189003)(7696005)(76176011)(66476007)(19627405001)(966005)(99286004)(52536014)(71200400001)(3846002)(6436002)(71190400001)(606006)(486006)(478600001)(11346002)(229853002)(8936002)(6116002)(316002)(236005)(55016002)(81166006)(110136005)(446003)(8676002)(86362001)(14454004)(476003)(25786009)(105004)(6246003)(256004)(2501003)(76116006)(91956017)(54896002)(74316002)(6306002)(2906002)(66066001)(9686003)(81156014)(66556008)(6506007)(186003)(53546011)(26005)(64756008)(102836004)(7736002)(66946007)(66446008)(33656002)(5660300002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3083;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l2m2MsoX6GSxiFZwZLR9facoOYfl++vERX1aKxonF33pKJRpGhbr5x1EvkRD57s79ut/Aq6EMpSye/Pm4E4YBxufd52bVJkqp/bSM+wKbKUO0hHs0IK1lTmTreB9o/eKGsHiaCPwjimwNVcZ8PRIZXY1MJsTORsXI0VQB2+e1JqfV55EZjqQWZ/hFJxD0QNqulq4CgRruLLQiN5K2HYaOIddtsDtpgABLGQvw8rOCNhi+SoaSZJVfJZMrncD8l7ncieajh3XQ5Kf2jL0sss4L6u0Q4OyX8FYVnFBaJ2U4IoDiYO/tTEpM8walGuCFmJtIkVGZ5AdCfaF78J8Wf5xow4sQ1uE0ym9ixNgw85OIFMeroiCQE6lbUnDKbQ+ObTxRJv2Gqad5pbnWLwom+ILhaj+CxppORl/V5YQGu/SR/nt4FujBQCqaky6C5pWPytmqFHXSayl8Bzyomgi7Q6zkw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 170c8cbe-a191-4d45-f80e-08d7413f28bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 22:33:01.7119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l5nsycv/aM+m33PmsWYnNTtBKmQOxQXF+L3RenhMcQQSJV/BhHVB2MBfEILvuIrN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3083
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YRUca178Ay3ParkNdGBMbSqxLKxdSS2pJWGNo/hJDI=;
 b=QGRxMjhCL26MT/S/n9pBj/CYXemOXUFb9SeE5fUOpGfifgwl0bI7nqpABgT32W8NOyA+TKowrDGMlIyR0Etj2hB4cyl9flUh5elniU+ivhDBuj7yP9szQ4wjxq3XhkOzGwoi5GLkhUI9/EXl0vZA6TqpqFXELMiGb93Orc3QdMI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============2132419053=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2132419053==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB2778C3828D2FA626FEA1FB22F0840DM6PR12MB2778namp_"

--_000_DM6PR12MB2778C3828D2FA626FEA1FB22F0840DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If Navi12 is the same as Navi10, then you can easily add the KFD support fi=
rst, as it only involves a couple of lines because of recent simplification=
. Then have this patch next.

Regards,
Yong
________________________________
From: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Sent: Tuesday, September 24, 2019 6:28 PM
To: Zhao, Yong <Yong.Zhao@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side


I will push to drm-next branch . After check the code again , this change w=
ill cause  issue in the  kfd since CHIP_NAVI12  not added  in other place w=
here check the device_info->asic_family  in kfd code .  I think it's better=
 just set the  family ID as CHIP_NAVI10  since there is no difference from =
the kfd side for NAVI10, NAVI12 and    NAVI14.  I will send  another review=
 .


Regards

shaoyun.liu


On 2019-09-24 6:17 p.m., Zhao, Yong wrote:
Reviewed-by: Yong Zhao <Yong.Zhao@amd.com><mailto:Yong.Zhao@amd.com>

Make sure to push to the new 5.3 branch.

Yong

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org><mailto:amd-gfx-bounce=
s@lists.freedesktop.org> on behalf of Liu, Shaoyun <Shaoyun.Liu@amd.com><ma=
ilto:Shaoyun.Liu@amd.com>
Sent: Tuesday, September 24, 2019 6:16 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Cc: Liu, Shaoyun <Shaoyun.Liu@amd.com><mailto:Shaoyun.Liu@amd.com>
Subject: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side

Add device info for both navi12 PF and VF

Change-Id: Ifb4035e65c12d153fc30e593fe109f9c7e0541f4
Signed-off-by: shaoyunl <shaoyun.liu@amd.com><mailto:shaoyun.liu@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c
index f329b82..edfbae5c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -387,6 +387,24 @@ static const struct kfd_device_info navi10_device_info=
 =3D {
         .num_sdma_queues_per_engine =3D 8,
 };

+static const struct kfd_device_info navi12_device_info =3D {
+       .asic_family =3D CHIP_NAVI12,
+       .asic_name =3D "navi12",
+       .max_pasid_bits =3D 16,
+       .max_no_of_hqd  =3D 24,
+       .doorbell_size  =3D 8,
+       .ih_ring_entry_size =3D 8 * sizeof(uint32_t),
+       .event_interrupt_class =3D &event_interrupt_class_v9,
+       .num_of_watch_points =3D 4,
+       .mqd_size_aligned =3D MQD_SIZE_ALIGNED,
+       .needs_iommu_device =3D false,
+       .supports_cwsr =3D true,
+       .needs_pci_atomics =3D false,
+       .num_sdma_engines =3D 2,
+       .num_xgmi_sdma_engines =3D 0,
+       .num_sdma_queues_per_engine =3D 8,
+};
+
 static const struct kfd_device_info navi14_device_info =3D {
         .asic_family =3D CHIP_NAVI14,
         .asic_name =3D "navi14",
@@ -425,6 +443,7 @@ static const struct kfd_device_info *kfd_supported_devi=
ces[][2] =3D {
         [CHIP_RENOIR] =3D {&renoir_device_info, NULL},
         [CHIP_ARCTURUS] =3D {&arcturus_device_info, &arcturus_device_info}=
,
         [CHIP_NAVI10] =3D {&navi10_device_info, NULL},
+       [CHIP_NAVI12] =3D {&navi12_device_info, &navi12_device_info},
         [CHIP_NAVI14] =3D {&navi14_device_info, NULL},
 };

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB2778C3828D2FA626FEA1FB22F0840DM6PR12MB2778namp_
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
If Navi12 is the same as Navi10, then you can easily add the KFD support fi=
rst, as it only involves a couple of lines because of recent simplification=
. Then have this patch next.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yong</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Liu, Shaoyun &lt;Shao=
yun.Liu@amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 24, 2019 6:28 PM<br>
<b>To:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side</f=
ont>
<div>&nbsp;</div>
</div>
<div style=3D"background-color:#FFFFFF">
<p>I will push to drm-next branch . After check the code again , this chang=
e will cause&nbsp; issue in the&nbsp; kfd since CHIP_NAVI12&nbsp; not added=
&nbsp; in other place where check the device_info-&gt;asic_family&nbsp; in =
kfd code .&nbsp; I think it's better just set the&nbsp; family ID as CHIP_N=
AVI10&nbsp;
 since there is no difference from the kfd side for NAVI10, NAVI12 and&nbsp=
;&nbsp;&nbsp; NAVI14.&nbsp; I will send&nbsp; another review .
<br>
</p>
<p><br>
</p>
<p>Regards</p>
<p>shaoyun.liu&nbsp; <br>
</p>
<p><br>
</p>
<div class=3D"x_moz-cite-prefix">On 2019-09-24 6:17 p.m., Zhao, Yong wrote:=
<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif">
Reviewed-by: Yong Zhao <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:=
Yong.Zhao@amd.com">
&lt;Yong.Zhao@amd.com&gt;</a></div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif">
Make sure to push to the new 5.3 branch.</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif">
<br>
</div>
<div style=3D"margin:0px; font-size:12pt; font-family:Calibri,Arial,Helveti=
ca,sans-serif">
Yong</div>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:amd-gfx-bounces@lists.f=
reedesktop.org">
&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of Liu, Shaoyun=
 <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Shaoyun.Liu@amd.com">
&lt;Shaoyun.Liu@amd.com&gt;</a><br>
<b>Sent:</b> Tuesday, September 24, 2019 6:16 PM<br>
<b>To:</b> <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@l=
ists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Cc:</b> Liu, Shaoyun <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto=
:Shaoyun.Liu@amd.com">
&lt;Shaoyun.Liu@amd.com&gt;</a><br>
<b>Subject:</b> [PATCH] drm/amdkfd: Add NAVI12 support from kfd side</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Add device info for both navi12 PF and VF<br>
<br>
Change-Id: Ifb4035e65c12d153fc30e593fe109f9c7e0541f4<br>
Signed-off-by: shaoyunl <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto=
:shaoyun.liu@amd.com">
&lt;shaoyun.liu@amd.com&gt;</a><br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_device.c | 19 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 19 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/=
amdkfd/kfd_device.c<br>
index f329b82..edfbae5c 100644<br>
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_device.c<br>
@@ -387,6 &#43;387,24 @@ static const struct kfd_device_info navi10_device_=
info =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_sdma_queues_per_engin=
e =3D 8,<br>
&nbsp;};<br>
&nbsp;<br>
&#43;static const struct kfd_device_info navi12_device_info =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_NAVI12,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;navi12&quot;=
,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_pasid_bits =3D 16,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .max_no_of_hqd&nbsp; =3D 24,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .doorbell_size&nbsp; =3D 8,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ih_ring_entry_size =3D 8 * sizeo=
f(uint32_t),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .event_interrupt_class =3D &amp;e=
vent_interrupt_class_v9,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_of_watch_points =3D 4,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .mqd_size_aligned =3D MQD_SIZE_AL=
IGNED,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .needs_iommu_device =3D false,<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .supports_cwsr =3D true,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .needs_pci_atomics =3D false,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_sdma_engines =3D 2,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_xgmi_sdma_engines =3D 0,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_sdma_queues_per_engine =3D 8=
,<br>
&#43;};<br>
&#43;<br>
&nbsp;static const struct kfd_device_info navi14_device_info =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_family =3D CHIP_NAVI=
14,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .asic_name =3D &quot;navi1=
4&quot;,<br>
@@ -425,6 &#43;443,7 @@ static const struct kfd_device_info *kfd_supported_=
devices[][2] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [CHIP_RENOIR] =3D {&amp;re=
noir_device_info, NULL},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [CHIP_ARCTURUS] =3D {&amp;=
arcturus_device_info, &amp;arcturus_device_info},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [CHIP_NAVI10] =3D {&amp;na=
vi10_device_info, NULL},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [CHIP_NAVI12] =3D {&amp;navi12_de=
vice_info, &amp;navi12_device_info},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [CHIP_NAVI14] =3D {&amp;na=
vi14_device_info, NULL},<br>
&nbsp;};<br>
&nbsp;<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freede=
sktop.org">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</blockquote>
</div>
</body>
</html>

--_000_DM6PR12MB2778C3828D2FA626FEA1FB22F0840DM6PR12MB2778namp_--

--===============2132419053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2132419053==--

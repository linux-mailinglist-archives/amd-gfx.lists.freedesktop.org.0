Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA1BDE6C
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 15:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613236E843;
	Wed, 25 Sep 2019 13:00:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690044.outbound.protection.outlook.com [40.107.69.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17DC6E843
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Sep 2019 13:00:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEhkftWdqp7r01x2vQl47NPqB3mxTk5VhjQwnF1e7bs4Q5AdwfKrTA5VsaIcbFFDYDmCZjWIX4id4ruX8Xxwh3QGRvcK/iuVBHh7/ue372IHsorGnsvVgpzlDRrySb3VZKHJHB2epzU9vl4VKNvwZpLXf7EDJoKarguP1MAGgUI1a+mpcty562a3MAlo84SkfuDDKZRynRxDHIeCFSZFDpNrnvCskJ9CPWZU0Yo+xgr14jK5ebsWsapW4JdJo9vahnTyqOq3mZsTQqwguW7+dX5zuoUIfZLS59gFj5OSvWG59qtP+5N/V0AXdb0ko6FfEep21LQ8PT0hNtjp8yHzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeN7NjP2huQerARFjdHE+Z829c8WAEi+nTcNe0EP3Go=;
 b=NkPGFbvVOVt4MTSHHX42NEs5P7nRU/E9Mimw65yggnmKKD2E3himxmC8Gja0CoakKi+Fewd8s6N+YTs0lOdtP/cTnFXOx7e1U6LJooC+LifEZ2GbNPai/ITyAQHRNobO711h7dps9763h0dBRRQvx6KIc8nk27PHln4pTklTdZDKwtv9ATco6laLw3rGgF2itMMPyFQOVsqQHYElCX/8QiQHLucEXOho4sIs32U1kDOyqekOO6MXTc1mNJYUlqWgilRBZ2dtPm65DzMGIVRLLWiy4mQc3NurAiaY5bFwDRm0yfhVCQLba3HF87IQZLFjHMNnni2dGQ/q0gtAEVyTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1812.namprd12.prod.outlook.com (10.175.102.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Wed, 25 Sep 2019 13:00:11 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2284.023; Wed, 25 Sep
 2019 13:00:11 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Index: AQHVcyVY+HhwweOsFky1b/6VDbMwBac8W/o+
Date: Wed, 25 Sep 2019 13:00:11 +0000
Message-ID: <BN6PR12MB1809F0717D9D94EBC3ED1E9FF7870@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c23b6a49-84b1-4857-caf8-08d741b84cc6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1812; 
x-ms-traffictypediagnostic: BN6PR12MB1812:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB18128B77DFADAA89FC757E18F7870@BN6PR12MB1812.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(189003)(199004)(14454004)(7736002)(64756008)(66556008)(25786009)(66476007)(66446008)(966005)(606006)(86362001)(6246003)(33656002)(2501003)(66946007)(76116006)(256004)(66066001)(478600001)(76176011)(186003)(99286004)(7696005)(19627405001)(26005)(53546011)(6506007)(102836004)(3846002)(105004)(6116002)(2906002)(5660300002)(52536014)(6436002)(236005)(9686003)(6306002)(55016002)(54896002)(229853002)(486006)(476003)(11346002)(71190400001)(71200400001)(446003)(74316002)(81156014)(110136005)(8936002)(316002)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1812;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +EG1Bx7xsMTkgAB8aN4UBeuc7D0a+rxW7wat3Hj1ayrs9GbbkXRfk75yFsAvWiGh75Qry0LaUKZETONa/FtzUojOaLEzxMPvhfhGA/9O1kGsYSHeWnK9KFQ1zTxtOFESS55lmec/l5EXivZ+UFeqRHAS5gOgfJVU+1JCzgQITPSvtVbe2Vmdt0NT4TOvxM3OsxExbyYLe6WARISnYIOCV88XYAVgEAGkifEo+3CK1EOa2MezN3wjNxboP2sF7x23t4/W+cwovMcjzHrWzGXd4KuwTaW78WVosC3iNANtpXJOKgHvRv73WckYoGmhAAXohaL51VgvMCMsniL6nzVB03QgLVpQ/LmQQMGda4J1GErPVtixnqSQDrlCtuE88HE5ql0oc4MQux5urvtnDEloR1uuQONH70UUe5BreJDcWF5C9OiY4LYBIO9MV2emEIM5QYawqMRG4e0inW7VaFhd/A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c23b6a49-84b1-4857-caf8-08d741b84cc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:00:11.2369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Li6Vcwt93N8EL1NX0exq483lv/cwQtT6WdIw2WCm/5e23QE18DQC9VB0QTg41cxqzBHWFg7NxkgLBpRadpdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1812
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeN7NjP2huQerARFjdHE+Z829c8WAEi+nTcNe0EP3Go=;
 b=2wgT/YbhOql/thH2YFgj9pGzh/IW75ryrawJkLjY9dhsFsWwMZw8IkixW2tkLgESlE/StLtAes6wKTZo0i/mw3qzMOXNnMJZMVj+7uEDQPjY7PygoVJ+EKgFHooVtQyU4NA+c7TWdlQ8VV5a1u+9OLtTRwA2YBvXc3zlDOpVATE=
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
Content-Type: multipart/mixed; boundary="===============1469947970=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1469947970==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F0717D9D94EBC3ED1E9FF7870BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F0717D9D94EBC3ED1E9FF7870BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liu, Sha=
oyun <Shaoyun.Liu@amd.com>
Sent: Tuesday, September 24, 2019 6:13 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Subject: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side

Add device info for both navi12 PF and VF

Change-Id: Ifb4035e65c12d153fc30e593fe109f9c7e0541f4
Signed-off-by: shaoyunl <shaoyun.liu@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809F0717D9D94EBC3ED1E9FF7870BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Liu, Shaoyun &lt;Shaoyun.Liu@=
amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 24, 2019 6:13 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liu, Shaoyun &lt;Shaoyun.Liu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Add NAVI12 support from kfd side</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add device info for both navi12 PF and VF<br>
<br>
Change-Id: Ifb4035e65c12d153fc30e593fe109f9c7e0541f4<br>
Signed-off-by: shaoyunl &lt;shaoyun.liu@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809F0717D9D94EBC3ED1E9FF7870BN6PR12MB1809namp_--

--===============1469947970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1469947970==--

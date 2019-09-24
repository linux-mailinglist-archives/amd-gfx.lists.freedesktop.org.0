Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4EFBD4D4
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 00:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8E86EAFF;
	Tue, 24 Sep 2019 22:17:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B096EAFF
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 22:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwIqOu5vRmFB3etug5U6nQemcSwqgFWI1S/nn+zVZpmYiLIptSyAQSJ1S8qIbUozJPwZwdD9uMPRz+eJJSiH4kmhwgLR9mgOWsem9TjuAJBQUf4wL4/cXrJx5Ed8J96v4BGMuINVykjB+J8JSFYYMwdtXWJvDfnoLz0fXFXNzDxdcZQ/iLTpLd0JXszxZRIqRVFWSQMmNlmVk5iyv6vnCjI1Lwre5qxbCbdNQR9dxXHzUW40ZYQbnIU4y8pI0aVl/I0CN4z78LBopMgG6yS4m0JL5jvoSA9MV2jsGeElnLnk9aCW5YYiUVIwElyvgswuKOTsCGijcNn1oZ/X+c78Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+KTT0IN7I4ECas6U62isfjHUsScog4fj5oS0CXmWvs=;
 b=TfHMEH/QWDva88SEu8NBocZb6H8QjFfoCEPzEa8Vq++cVVxleaG4PjBk+EW7g4MQ0u7T4lqgGFge878CmgC4hSC2a5ZaN/gz/qCSf8ix80761M4NZROjYrPYhrrvFpKYTVmjgudpn3CsvUlif/Z26EiP+HnTYrk3q7FWlYzMKAtS+IO2qwB27JcKc8cCbnEzayDiV1N5yYWFQJ1rcF7Rbk+ML1EOaqRq9VF4vibI3gNx7Mq4yVxnE6RLHtakzKyHLNetlxJVu+CBe4hvBhoAAn2KArqMYQK6fAovx5LvKPMI/BOcMEqCPi83KCGHheOB32usap3hY/BOkvUDU/za6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB4042.namprd12.prod.outlook.com (10.141.185.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Tue, 24 Sep 2019 22:17:46 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 22:17:46 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side
Thread-Index: AQHVcyWw/zVyQ3bhHEGig/0OmRjs5qc7ZV78
Date: Tue, 24 Sep 2019 22:17:46 +0000
Message-ID: <DM6PR12MB27788F751A7E9247F1BC1EF1F0840@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <1569363372-18620-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1569363372-18620-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83e3d049-e935-4c2c-9997-08d7413d0702
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4042; 
x-ms-traffictypediagnostic: DM6PR12MB4042:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB40422679608D22C323D16955F0840@DM6PR12MB4042.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(199004)(189003)(8936002)(52536014)(476003)(186003)(66446008)(64756008)(66556008)(66476007)(5660300002)(966005)(66066001)(7696005)(76116006)(99286004)(91956017)(606006)(66946007)(2906002)(74316002)(3846002)(54896002)(2501003)(11346002)(6116002)(236005)(6306002)(9686003)(55016002)(7736002)(446003)(76176011)(53546011)(86362001)(14454004)(229853002)(256004)(6246003)(81156014)(81166006)(19627405001)(26005)(6436002)(110136005)(6506007)(102836004)(25786009)(33656002)(105004)(71190400001)(71200400001)(478600001)(316002)(486006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4042;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w4WCFOHNWQtu/RNeFqKHsoncuov3AwRvb7qaIuDM+ndFgm3r/iDg8C8N8/hNLSpPy/Z+RLuWqzlflhhqKomRpPFNVJWmCtHuAX0gYr6sDDvra65bsR4uWra5FG+gPUTJyJh/4yJrFx47+PC0Q18W/Ncos7KsOzeyr8ckranKbOWFRrKx69YRJCgB0G8Xg7ugzuURb0B8u4k86cQFTLg/zhPN2dD9VfERvwt2WSTo5sRA4Yxb3OUy3CQ68/2necKylU4B1Pzm3J8lJSa5IqoDFS8TH5IUodJ0wIUQL7HEN9a5ZShkwyJZcWzpI2Wx0VxliHm1L+/BSw/KvfTkZNL4v13BY61C2czSHNHqrL6MzaZTBSsP8JvNDLwuSVuknRTQZ2s01lkN0gpmEvx8m2PJEcrT/kE5K0EwrNXIduWLEK/bhxwu9IjOTH8yKRS8EBlnYK7Je2fpNqGGNEb+x2LOLw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e3d049-e935-4c2c-9997-08d7413d0702
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 22:17:46.1126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oW668NYQOS4NctTdAuCT0EzHrnsB3kvKcFuJutr/XC1BEbUoVkASQLcyzo+Rt2n6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+KTT0IN7I4ECas6U62isfjHUsScog4fj5oS0CXmWvs=;
 b=XSAzeAWzwbvwv8IjKH6CkqZeW//2Xi1jZ11b4arQlGD+3xbbqWcNlwqgfmhdeu9zSfax3sW0xwtjIAATrbaHxsa1Bnkyx4/YKIDJS2Olkw6qkRGBKVTbN7aSqaiF+SPPcXLxyDkXRuGWdTLw9907ZuQg92PMQ87lJ6qxI0UKe9k=
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
Content-Type: multipart/mixed; boundary="===============1790417761=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1790417761==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB27788F751A7E9247F1BC1EF1F0840DM6PR12MB2778namp_"

--_000_DM6PR12MB27788F751A7E9247F1BC1EF1F0840DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Yong Zhao <Yong.Zhao@amd.com>

Make sure to push to the new 5.3 branch.

Yong

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liu, Sha=
oyun <Shaoyun.Liu@amd.com>
Sent: Tuesday, September 24, 2019 6:16 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Subject: [PATCH] drm/amdkfd: Add NAVI12 support from kfd side

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

--_000_DM6PR12MB27788F751A7E9247F1BC1EF1F0840DM6PR12MB2778namp_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Reviewed-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Make sure to push to the new 5.3 branch.</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Yong</div>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liu, Shaoyun &lt;Shaoyun.Liu@=
amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 24, 2019 6:16 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liu, Shaoyun &lt;Shaoyun.Liu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Add NAVI12 support from kfd side</font>
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

--_000_DM6PR12MB27788F751A7E9247F1BC1EF1F0840DM6PR12MB2778namp_--

--===============1790417761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1790417761==--

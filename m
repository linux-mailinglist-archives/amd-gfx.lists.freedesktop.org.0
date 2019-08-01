Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC1F7DF1B
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CE06E6EE;
	Thu,  1 Aug 2019 15:29:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680040.outbound.protection.outlook.com [40.107.68.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F7A6E6EE
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:29:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eS7ClZTClbLJOZWH+WSgr+JIXM8e0LHPczidQQjZDvnf0wvsGf73KJqIVBlD7C1TL1L32aZ7pByeFI46MxgcOAhqTL8CWcXhC0FsTrLew9SLz0xtlSRqfUQbL451ZiOnZtDItqCeYXq+whHChircJ34VLnCcbibzhwkmmKt7VRsWBbZFJTbYoz4MolX9XFeLpBc7PbR/8tvOvrcyh2xyfxfS97WX8eWys3ROt5cGncdgnmFZpTRVPRe+XD2bx5+ouxeEzFwslJkWNj3uOfEJbi3SKEQfbu8FAQeAlEuFWwlUL0+wDXcKLKJLZlSAtLyObL4XJkIshXxQIB4gjSMEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB9tZ4QagJiJ0IjNOWZVUAuY/3rWOadzfBwvTVGiqjs=;
 b=F93xjcVo1yITfxgLkS0RcnKHLh3Is5GOWAO4zwBXkeHezoYLYswuBd80BCUiX+otX2ImV2/USLwOljxzH4X9hsE7n7CgqRTUSBuZZCOiMztYB3oo7nE3HSB7Tf188tljbkkpNZCEDhovgQWaTd5B1hT0mu2yCqcldtzjWZIewPlKCdbexbWJocCFLvw/G/tALArhwoUJfVt8eRdq2GhUXfgOZwaDCUqwmQbYPs+TyRgbLA3Pb3/L9H8mQHK4rx86Xs5BGY0rTfaaz+fN/pIKuxwinLM++vLXLXVP4Jv8DiOwLIDZRd5DqlH3YSRD5jtLtrav1ibSs8CKGUumVcUdfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1298.namprd12.prod.outlook.com (10.168.224.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 15:29:26 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:29:26 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: initialize new parameters and functions
 for amdgpu_umc structure
Thread-Topic: [PATCH 3/6] drm/amdgpu: initialize new parameters and functions
 for amdgpu_umc structure
Thread-Index: AQHVSDSI50mGfwoF7U2LnS3zn5pUUKbma1oX
Date: Thu, 1 Aug 2019 15:29:25 +0000
Message-ID: <BN6PR12MB1809BF9509C442E4F3284F7CF7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>,
 <20190801064311.7307-4-tao.zhou1@amd.com>
In-Reply-To: <20190801064311.7307-4-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d91a00b3-7ebb-4fd6-10f3-08d716950972
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1298; 
x-ms-traffictypediagnostic: BN6PR12MB1298:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB129818ACB29E01FDBA63640CF7DE0@BN6PR12MB1298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:348;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(19627405001)(229853002)(71200400001)(478600001)(55016002)(110136005)(316002)(6306002)(54896002)(186003)(966005)(236005)(9686003)(256004)(26005)(7736002)(102836004)(25786009)(53546011)(3846002)(6116002)(6506007)(606006)(53936002)(7696005)(5660300002)(14454004)(33656002)(2501003)(52536014)(11346002)(446003)(8936002)(81166006)(68736007)(81156014)(486006)(105004)(66476007)(66556008)(64756008)(66446008)(76116006)(99286004)(66946007)(2906002)(86362001)(6246003)(66066001)(8676002)(6636002)(76176011)(71190400001)(476003)(74316002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1298;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j5+fTFN7e678lBJDZy4xpfYB6NZJBedU6LKwx8SVkyeZ+8akqgtAHRVWR0UQc8gBvjwxprlL6bWYQWUBpvG0RtPnloUK+qbbcBoYu/Y2j8s1gUojLLxgGSmNPmqA6x7NoDtekamKnKNQ1rL3euLm7fbhbW2gZyJK2XwRWgFRvrhpAh6IzLAU7yAvOZsk9zT8U8YKHZ0rAFMdqNpgQZO8icgxQ1nC25pw46lMSQxvRHRHFscK2CiseEV1aU+39QFmKdDOvibtMV5SeoS3hSW8RU6tcKWnuej7fCzkNl7xMAuF+0SKiJiVNDSjenSiuKDU4ob2FHKb9Q8H52aBduQnI6FI5MK3rkjHl6P+KzzXcb0PH2zCVP7A+WMhkktrHOX/FW2N8XjAp24bhE1tpE0DA19+pqMh9NTiIOYKPezFIMk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91a00b3-7ebb-4fd6-10f3-08d716950972
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:29:25.8593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1298
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB9tZ4QagJiJ0IjNOWZVUAuY/3rWOadzfBwvTVGiqjs=;
 b=h1eYC8GSuMYV2lzdjNjnJx/KJilMQ4ANfX9p51oLDesZdrUgj6wbTCFvX/RgLfK4+ee0oDM/GIkbGTgo14wKt/Aq77OKQ/Rave2IbK0Fjl5pLnpg9XcNNk/lp392JVn3nBhEaY4O2L41nmB1WDNrgkbhNa5c+RvdMWm/Brhe/Ao=
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
Content-Type: multipart/mixed; boundary="===============1236868536=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1236868536==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809BF9509C442E4F3284F7CF7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809BF9509C442E4F3284F7CF7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please include a patch description.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tao Zhou=
 <tao.zhou1@amd.com>
Sent: Thursday, August 1, 2019 2:43 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhang, H=
awking <Hawking.Zhang@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Chen, Guchu=
n <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>
Subject: [PATCH 3/6] drm/amdgpu: initialize new parameters and functions fo=
r amdgpu_umc structure

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c |  7 +++++--
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c | 10 +++++++++-
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.h |  3 +++
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c
index ee06cbe2a7e7..3486b4ce7770 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -631,8 +631,11 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_devic=
e *adev)
 {
         switch (adev->asic_type) {
         case CHIP_VEGA20:
-               adev->umc.max_ras_err_cnt_per_query =3D
-                       UMC_V6_1_UMC_INSTANCE_NUM * UMC_V6_1_CHANNEL_INSTAN=
CE_NUM;
+               adev->umc.max_ras_err_cnt_per_query =3D UMC_V6_1_TOTAL_CHAN=
NEL_NUM;
+               adev->umc.channel_inst_num =3D UMC_V6_1_CHANNEL_INSTANCE_NU=
M;
+               adev->umc.umc_inst_num =3D UMC_V6_1_UMC_INSTANCE_NUM;
+               adev->umc.channel_offs =3D UMC_V6_1_PER_CHANNEL_OFFSET;
+               adev->umc.channel_idx_tbl =3D &umc_v6_1_channel_idx_tbl[0][=
0];
                 adev->umc.funcs =3D &umc_v6_1_funcs;
                 break;
         default:
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.c
index 035e4fea472c..9ba015d7eb57 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c
@@ -41,7 +41,7 @@
 /* offset in 256B block */
 #define OFFSET_IN_256B_BLOCK(addr)              ((addr) & 0xffULL)

-static uint32_t
+const uint32_t
         umc_v6_1_channel_idx_tbl[UMC_V6_1_UMC_INSTANCE_NUM][UMC_V6_1_CHANN=
EL_INSTANCE_NUM] =3D {
                 {2, 18, 11, 27},        {4, 20, 13, 29},
                 {1, 17, 8, 24},         {7, 23, 14, 30},
@@ -235,7 +235,15 @@ static void umc_v6_1_query_ras_error_address(struct am=
dgpu_device *adev,
         umc_v6_1_disable_umc_index_mode(adev);
 }

+static void umc_v6_1_ras_init(struct amdgpu_device *adev)
+{
+
+}
+
 const struct amdgpu_umc_funcs umc_v6_1_funcs =3D {
+       .ras_init =3D umc_v6_1_ras_init,
         .query_ras_error_count =3D umc_v6_1_query_ras_error_count,
         .query_ras_error_address =3D umc_v6_1_query_ras_error_address,
+       .enable_umc_index_mode =3D umc_v6_1_enable_umc_index_mode,
+       .disable_umc_index_mode =3D umc_v6_1_disable_umc_index_mode,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.h
index bddaf14a77f9..ad4598c0e495 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h
@@ -24,6 +24,7 @@
 #define __UMC_V6_1_H__

 #include "soc15_common.h"
+#include "amdgpu.h"

 /* HBM  Memory Channel Width */
 #define UMC_V6_1_HBM_MEMORY_CHANNEL_WIDTH       128
@@ -37,5 +38,7 @@
 #define UMC_V6_1_PER_CHANNEL_OFFSET             0x800

 extern const struct amdgpu_umc_funcs umc_v6_1_funcs;
+extern const uint32_t
+       umc_v6_1_channel_idx_tbl[UMC_V6_1_UMC_INSTANCE_NUM][UMC_V6_1_CHANNE=
L_INSTANCE_NUM];

 #endif
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809BF9509C442E4F3284F7CF7DE0BN6PR12MB1809namp_
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
Please include a patch description. <br>
</div>
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
ounces@lists.freedesktop.org&gt; on behalf of Tao Zhou &lt;tao.zhou1@amd.co=
m&gt;<br>
<b>Sent:</b> Thursday, August 1, 2019 2:43 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Li, Dennis &lt;Dennis.Li=
@amd.com&gt;; Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; Pan, Xinhui &lt;Xin=
hui.Pan@amd.com&gt;<br>
<b>Cc:</b> Zhou1, Tao &lt;Tao.Zhou1@amd.com&gt;<br>
<b>Subject:</b> [PATCH 3/6] drm/amdgpu: initialize new parameters and funct=
ions for amdgpu_umc structure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Tao Zhou &lt;tao.zhou1@amd.com&gt;<=
br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c |&nbsp; 7 &#43;&#43;&#43;&#43;&=
#43;--<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/umc_v6_1.c | 10 &#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/umc_v6_1.h |&nbsp; 3 &#43;&#43;&#43;<br>
&nbsp;3 files changed, 17 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c<br>
index ee06cbe2a7e7..3486b4ce7770 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
@@ -631,8 &#43;631,11 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_d=
evice *adev)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type=
) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGA20:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;umc.max_ras_err_cnt_per_query =3D<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UMC_V6_1_UMC_INS=
TANCE_NUM * UMC_V6_1_CHANNEL_INSTANCE_NUM;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;umc.max_ras_err_cnt_per_query =3D UMC_V6_1_TOTAL_CH=
ANNEL_NUM;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;umc.channel_inst_num =3D UMC_V6_1_CHANNEL_INSTANCE_=
NUM;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;umc.umc_inst_num =3D UMC_V6_1_UMC_INSTANCE_NUM;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;umc.channel_offs =3D UMC_V6_1_PER_CHANNEL_OFFSET;<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;umc.channel_idx_tbl =3D &amp;umc_v6_1_channel_idx_t=
bl[0][0];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;umc.funcs =3D &amp;umc_v6_1_funcs;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.c<br>
index 035e4fea472c..9ba015d7eb57 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c<br>
@@ -41,7 &#43;41,7 @@<br>
&nbsp;/* offset in 256B block */<br>
&nbsp;#define OFFSET_IN_256B_BLOCK(addr)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((addr) &amp; 0xffULL)<br>
&nbsp;<br>
-static uint32_t<br>
&#43;const uint32_t<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; umc_v6_1_channel_idx_tbl[U=
MC_V6_1_UMC_INSTANCE_NUM][UMC_V6_1_CHANNEL_INSTANCE_NUM] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {2, 18, 11, 27},&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {4, 20, 13, 29},<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; {1, 17, 8, 24},&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; {7, 23, 14, 30},<br>
@@ -235,7 &#43;235,15 @@ static void umc_v6_1_query_ras_error_address(struc=
t amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; umc_v6_1_disable_umc_index=
_mode(adev);<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static void umc_v6_1_ras_init(struct amdgpu_device *adev)<br>
&#43;{<br>
&#43;<br>
&#43;}<br>
&#43;<br>
&nbsp;const struct amdgpu_umc_funcs umc_v6_1_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ras_init =3D umc_v6_1_ras_init,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .query_ras_error_count =3D=
 umc_v6_1_query_ras_error_count,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .query_ras_error_address =
=3D umc_v6_1_query_ras_error_address,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enable_umc_index_mode =3D umc_v6=
_1_enable_umc_index_mode,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .disable_umc_index_mode =3D umc_v=
6_1_disable_umc_index_mode,<br>
&nbsp;};<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.h<br>
index bddaf14a77f9..ad4598c0e495 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h<br>
@@ -24,6 &#43;24,7 @@<br>
&nbsp;#define __UMC_V6_1_H__<br>
&nbsp;<br>
&nbsp;#include &quot;soc15_common.h&quot;<br>
&#43;#include &quot;amdgpu.h&quot;<br>
&nbsp;<br>
&nbsp;/* HBM&nbsp; Memory Channel Width */<br>
&nbsp;#define UMC_V6_1_HBM_MEMORY_CHANNEL_WIDTH&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 128<br>
@@ -37,5 &#43;38,7 @@<br>
&nbsp;#define UMC_V6_1_PER_CHANNEL_OFFSET&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x800<br>
&nbsp;<br>
&nbsp;extern const struct amdgpu_umc_funcs umc_v6_1_funcs;<br>
&#43;extern const uint32_t<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; umc_v6_1_channel_idx_tbl[UMC_V6_1=
_UMC_INSTANCE_NUM][UMC_V6_1_CHANNEL_INSTANCE_NUM];<br>
&nbsp;<br>
&nbsp;#endif<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809BF9509C442E4F3284F7CF7DE0BN6PR12MB1809namp_--

--===============1236868536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1236868536==--

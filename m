Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1667DF1D
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B276E6F3;
	Thu,  1 Aug 2019 15:29:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740082.outbound.protection.outlook.com [40.107.74.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC396E6F3
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:29:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lM8JfR6+knLGQafi77R2iZhH8Kz1+3nOmwM18qsoZf+xRvQQc6TWNAjqJp3P4mrqSxgYapwQ+31MxGIdiMoJ69GPG+NoQ7GLp3MF0kPPBIg32WrhA9RJA6rd0WM/ZQWQzTBhhT6eOy3e86LQf8jzDJNSXE8U6igD5j1QC1A/t1zIE+iBZI3GATk+kdgzfvitoiLmALSRj45R0ss7jYxnWKmag2816zXhw4FJb+Y2XFxtgHBrEE/jDt/RABx16QYkJZ0OXQwXoO5vnr+IDZ95Rb+A8DAOfEeeTpqTzLlLR/QZwBjcVHifEBnx0xyfeu9URsqMu4gccWXNONZSpVBxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95qmtEmyn2UiVIScOe5emurjwlE/yqX6Vc3JHnb5GOo=;
 b=mBv/AjaXufSrUx6ZG/pMiCssAaF0lSsRL9+vTPKywWjxh5BYToQDqpdC9nZwbsRFqrbxml26bvsnjdOLtpUP6FJPxoQL9izYCTmKbNq3imrAi63HtyfG7oVWMmOUi8taUnmetaESgIONZCSZLZ0jHOF6AIXdTz4uOp97tU+W17pG2GxwRghD11FrjY3P9H5lth90au8mLpOvKXpc0ID5ZIHKCqAg7G9gSSYbh8qKvJiepgwrI4ZQPIROIiNBxhdbIvIXTF0y6EfpMnexlaprR6a8PX12G3EtizEgacd6aQ9ZSpg0WxX0Y3J95tT5M1KL2KykCA6SPDbL/2U4v7j/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1138.namprd12.prod.outlook.com (10.168.229.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Thu, 1 Aug 2019 15:29:56 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:29:56 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 4/6] drm/amdgpu: add macro of umc for each channel
Thread-Topic: [PATCH 4/6] drm/amdgpu: add macro of umc for each channel
Thread-Index: AQHVSDSRoyl9nDJUPkCRUlVZX2aP5abma3gz
Date: Thu, 1 Aug 2019 15:29:55 +0000
Message-ID: <BN6PR12MB18091E05F855AC098E2E7011F7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>,
 <20190801064311.7307-5-tao.zhou1@amd.com>
In-Reply-To: <20190801064311.7307-5-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2225040a-e9a8-4206-3c00-08d716951b61
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1138; 
x-ms-traffictypediagnostic: BN6PR12MB1138:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1138701516944EB6B5947DD0F7DE0@BN6PR12MB1138.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(189003)(199004)(7736002)(66066001)(316002)(54896002)(9686003)(6636002)(236005)(478600001)(5660300002)(53936002)(229853002)(6246003)(81156014)(966005)(81166006)(52536014)(14454004)(68736007)(2501003)(8676002)(86362001)(6306002)(25786009)(8936002)(99286004)(53546011)(66946007)(66556008)(33656002)(3846002)(7696005)(19627405001)(6116002)(76116006)(476003)(74316002)(446003)(66476007)(66446008)(64756008)(11346002)(105004)(606006)(186003)(110136005)(71190400001)(76176011)(486006)(71200400001)(55016002)(102836004)(26005)(256004)(6506007)(2906002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1138;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NiLLQ9P98ESSLcEYKHHCLEThgH0I1ooGL9ah3UEHHRVU9Ss4ESgkepsxZFMj6zYfrLCnd2/+Y7W68z1b4U3qv1iPylBFJuOeNMZYhrhj4VJS6V3jKrH79xAaVAB/UGyJt1/JNgrsBSqwoJ7u8isXA1/Fet/ot+40XjsF0zIJx8WISXfO16AxbOBsQ9xoWEXxfWWG8p2mO7AUAtgnm+wC0b30O340XvcxJb8ppdc4WBqDoO8IV2cAJNB3uE5n5+Xblu7w+hrdsb+Tqlam92zO67MLRtIKM4T0RJhuaCD4lqvAas+7l0PIYI3/otRNiTPRvigrSuUWhexkviX0Xl4pqjoZMWsanDcekQV5CC96HwYIdfahUA8lDT8QDPy49QiHyCmL5dXTWULESFOn9Z9AkVFA1C/Anhh99TpMDjFQQ0U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2225040a-e9a8-4206-3c00-08d716951b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:29:55.9690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95qmtEmyn2UiVIScOe5emurjwlE/yqX6Vc3JHnb5GOo=;
 b=R0DBl7w7cB9B+1K9VXVCNHiCI79uCnhB0ZUGIukuGxjWVQ5hRyORV8iAiATg1vMJq0ukVn0QbN4ZXyXizigEOvgUuMqLMQdcfP1U7A0aku/+C19dwnQJHVyNT585DobXveOJ2UIjb+GWLmhsI3dHgXSWtAg88N93C0arjcWpiLA=
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
Content-Type: multipart/mixed; boundary="===============1262487834=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1262487834==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091E05F855AC098E2E7011F7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB18091E05F855AC098E2E7011F7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please include a patch description.  Explain why you need the new helper fu=
nction.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tao Zhou=
 <tao.zhou1@amd.com>
Sent: Thursday, August 1, 2019 2:43 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhang, H=
awking <Hawking.Zhang@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Chen, Guchu=
n <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>
Subject: [PATCH 4/6] drm/amdgpu: add macro of umc for each channel

common function for all umc versions

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_umc.h
index 2604f5076867..9efdd66279e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
@@ -21,6 +21,29 @@
 #ifndef __AMDGPU_UMC_H__
 #define __AMDGPU_UMC_H__

+/*
+ * void (*func)(struct amdgpu_device *adev, struct ras_err_data *err_data,
+ *                             uint32_t umc_reg_offset, uint32_t channel_i=
ndex)
+ */
+#define amdgpu_umc_for_each_channel(func)      \
+       struct ras_err_data *err_data =3D (struct ras_err_data *)ras_error_=
status;        \
+       uint32_t umc_inst, channel_inst, umc_reg_offset, channel_index; \
+       for (umc_inst =3D 0; umc_inst < adev->umc.umc_inst_num; umc_inst++)=
 {     \
+               /* enable the index mode to query eror count per channel */=
     \
+               adev->umc.funcs->enable_umc_index_mode(adev, umc_inst); \
+               for (channel_inst =3D 0;  \
+                       channel_inst < adev->umc.channel_inst_num;      \
+                       channel_inst++) {       \
+                       /* calc the register offset according to channel in=
stance */    \
+                       umc_reg_offset =3D adev->umc.channel_offs * channel=
_inst; \
+                       /* get channel index of interleaved memory */   \
+                       channel_index =3D adev->umc.channel_idx_tbl[      \
+                               umc_inst * adev->umc.channel_inst_num + cha=
nnel_inst];  \
+                       (func)(adev, err_data, umc_reg_offset, channel_inde=
x);  \
+               }       \
+       }       \
+       adev->umc.funcs->disable_umc_index_mode(adev);
+
 struct amdgpu_umc_funcs {
         void (*ras_init)(struct amdgpu_device *adev);
         void (*query_ras_error_count)(struct amdgpu_device *adev,
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18091E05F855AC098E2E7011F7DE0BN6PR12MB1809namp_
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
Please include a patch description.&nbsp; Explain why you need the new help=
er function.</div>
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
<b>Subject:</b> [PATCH 4/6] drm/amdgpu: add macro of umc for each channel</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">common function for all umc versions<br>
<br>
Signed-off-by: Tao Zhou &lt;tao.zhou1@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h | 23 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 23 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_umc.h<br>
index 2604f5076867..9efdd66279e5 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h<br>
@@ -21,6 &#43;21,29 @@<br>
&nbsp;#ifndef __AMDGPU_UMC_H__<br>
&nbsp;#define __AMDGPU_UMC_H__<br>
&nbsp;<br>
&#43;/*<br>
&#43; * void (*func)(struct amdgpu_device *adev, struct ras_err_data *err_d=
ata,<br>
&#43; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t umc_reg_offset, uint32_t channel_index)<=
br>
&#43; */<br>
&#43;#define amdgpu_umc_for_each_channel(func)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ras_err_data *err_data =3D=
 (struct ras_err_data *)ras_error_status;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t umc_inst, channel_inst, =
umc_reg_offset, channel_index; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (umc_inst =3D 0; umc_inst &lt=
; adev-&gt;umc.umc_inst_num; umc_inst&#43;&#43;) {&nbsp;&nbsp;&nbsp;&nbsp; =
\<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* enable the index mode to query eror count per channel */&=
nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;umc.funcs-&gt;enable_umc_index_mode(adev, umc_inst)=
; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; for (channel_inst =3D 0;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel_inst=
 &lt; adev-&gt;umc.channel_inst_num;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel_inst=
&#43;&#43;) {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* calc the =
register offset according to channel instance */&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; umc_reg_offs=
et =3D adev-&gt;umc.channel_offs * channel_inst; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* get chann=
el index of interleaved memory */&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel_inde=
x =3D adev-&gt;umc.channel_idx_tbl[&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; umc_inst * adev-&gt;umc.channel_inst_nu=
m &#43; channel_inst];&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (func)(adev,=
 err_data, umc_reg_offset, channel_index);&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;umc.funcs-&gt;disable_um=
c_index_mode(adev);<br>
&#43;<br>
&nbsp;struct amdgpu_umc_funcs {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*ras_init)(struct am=
dgpu_device *adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*query_ras_error_cou=
nt)(struct amdgpu_device *adev,<br>
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

--_000_BN6PR12MB18091E05F855AC098E2E7011F7DE0BN6PR12MB1809namp_--

--===============1262487834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1262487834==--

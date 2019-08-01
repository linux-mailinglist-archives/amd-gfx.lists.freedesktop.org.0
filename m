Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610267DF1A
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1F46E6EC;
	Thu,  1 Aug 2019 15:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690081.outbound.protection.outlook.com [40.107.69.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CA56E6EC
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTnZDhFjnIdvOuXAS0qcnVlIyMmohGZoy4+nuEjOUdDwvzj/YxJ+rU726msrZ9tN0zfXZmUECZiLYXidC0m6h4i8pVIpEXqJl3SyCChyB9QzjbWlpsyRipDTEKd8xQtB+TMiEiOfbkrfTMCcEBTacWXmzpFX4J4GOJGREXMc4ETF2cpvXOHNRwhGKMb+NGyB9IFAaldR9lDsfmqGwTJWLlemdlO/k+mWCiFALTDfwtttFI7ufkkdEXfZ42ch0Sv6ASlGCjnbLAlZf+pKStURtsDCXhaOLRAa9x1gtmr41AdvVCzPBdSsUjZVmcHbq7Q8gC3A/QIQoIHcZcokfvPFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEmppMRk0Jw9PWB6qfPc4GaVnFHeUEDOB0Phl7MP0ew=;
 b=UT5yBhkRQAaOJs8T11ZPhEdtkPORpX+db/oIQ4MFayRc2BjCb65uWW2LmsfEH2eVc7YGb7dGhOw5VFfbpfbxd+tGExWhyp14EF+6mb+JlK6V2v9F78ga7qWRzYZXc2XgMFNdEQW6j+XWMQv8B/Bp6kwWU2iqM4ZhPXsz53Fjo4ks628QfaR71qcuPpvjD+cfkzhImIOW2uH6Z76uvUzJbzx2G7loh5CZUNSoPRq8AlOH3aFhTasXkyYjQQ5Tlol7y3ZHNdHUXhmGyzXlUQlfJByAgcyOXuwYIp6zmqaOYZlT4jB7bSHFmNLNMzWuPhjHghCMlqGCci23sqsNEYCmSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1201.namprd12.prod.outlook.com (10.168.229.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 1 Aug 2019 15:29:05 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:29:05 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 2/6] drm/amdgpu: add more parameters and functions to
 amdgpu_umc structure
Thread-Topic: [PATCH 2/6] drm/amdgpu: add more parameters and functions to
 amdgpu_umc structure
Thread-Index: AQHVSDSFL/1TayMiwUCx/vi/iT0IjabmayME
Date: Thu, 1 Aug 2019 15:29:05 +0000
Message-ID: <BN6PR12MB1809A6E7001A75A2748EFCD4F7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>,
 <20190801064311.7307-3-tao.zhou1@amd.com>
In-Reply-To: <20190801064311.7307-3-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b84f55b1-436f-4a28-fab3-08d71694fd24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1201; 
x-ms-traffictypediagnostic: BN6PR12MB1201:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1201EFE6444AE0189798F653F7DE0@BN6PR12MB1201.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(7736002)(26005)(966005)(66066001)(3846002)(99286004)(66556008)(7696005)(53936002)(76176011)(6436002)(2906002)(9686003)(236005)(54896002)(6116002)(102836004)(52536014)(66946007)(76116006)(66446008)(105004)(71200400001)(53546011)(2501003)(229853002)(5660300002)(71190400001)(55016002)(6506007)(19627405001)(64756008)(478600001)(81166006)(446003)(476003)(6306002)(33656002)(11346002)(81156014)(486006)(66476007)(606006)(186003)(68736007)(8676002)(256004)(25786009)(86362001)(14444005)(8936002)(110136005)(6636002)(14454004)(6246003)(74316002)(316002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1201;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jM8ml8JNtx8r1j/3k1MndIDwcqoxLZEXobteE34v5SCWgrBPAxzNHjxCQJGbVLWUd3haBI8/OQZgqlPWYFQxhXQHsBDDxMBPiG9rfv42GsUxQEbp+JqIKyKKNlkgs/UwqzooxFizxetle00SxwEYWZu1htvsI9ebqWLUPXuad3u6GGGtBRQt3I5CQU092EEpn9C/utIe4N4GqZMTJRlvwiIOKDGBftvZhiPMfxsvNsuircbFxkjehanOchqvc5ox4fCQOJmXKraxneB8m9obkHDqGU0l/lLygQmy+u8f5VSFI2F8LLNvZjD4slKVIHAPtloyZn9Bhf7+JZvf3twvyM/ngYBlgRvI8Skadp7VLP0VoA6RdlzRxgEzqAGnxw67+YehjRui8dK2fL5NQweQsZn1iXNElcYdcqsGFJcsFUU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b84f55b1-436f-4a28-fab3-08d71694fd24
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:29:05.3015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1201
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEmppMRk0Jw9PWB6qfPc4GaVnFHeUEDOB0Phl7MP0ew=;
 b=jWhOMZ/xqigwM6Wy1+D99w3SabUq6PvIxf9ZdLIYXtVcbTIMy7HdQTVnch+I/Pe5L9YV4MEeiKKxug8pDeTVvnxHjFpBDU7AsHVfNt3/Bcow0DYYKPzl5RbkWS/vWqEwcIztvyC/qHF8wCakApxHMEThqeRv1Btd2n1rXPUMRkQ=
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
Content-Type: multipart/mixed; boundary="===============0698754436=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0698754436==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809A6E7001A75A2748EFCD4F7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809A6E7001A75A2748EFCD4F7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please include a patch description.  Explain why you need the new interface=
.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tao Zhou=
 <tao.zhou1@amd.com>
Sent: Thursday, August 1, 2019 2:43 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhang, H=
awking <Hawking.Zhang@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Chen, Guchu=
n <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>
Subject: [PATCH 2/6] drm/amdgpu: add more parameters and functions to amdgp=
u_umc structure

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h | 13 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.h   |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_umc.h
index dfa1a39e57af..2604f5076867 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h
@@ -22,15 +22,28 @@
 #define __AMDGPU_UMC_H__

 struct amdgpu_umc_funcs {
+       void (*ras_init)(struct amdgpu_device *adev);
         void (*query_ras_error_count)(struct amdgpu_device *adev,
                                         void *ras_error_status);
         void (*query_ras_error_address)(struct amdgpu_device *adev,
                                         void *ras_error_status);
+       void (*enable_umc_index_mode)(struct amdgpu_device *adev,
+                                       uint32_t umc_instance);
+       void (*disable_umc_index_mode)(struct amdgpu_device *adev);
 };

 struct amdgpu_umc {
         /* max error count in one ras query call */
         uint32_t max_ras_err_cnt_per_query;
+       /* number of umc channel instance with memory map register access *=
/
+       uint32_t channel_inst_num;
+       /* number of umc instance with memory map register access */
+       uint32_t umc_inst_num;
+       /* UMC regiser per channel offset */
+       uint32_t channel_offs;
+       /* channel index table of interleaved memory */
+       const uint32_t *channel_idx_tbl;
+
         const struct amdgpu_umc_funcs *funcs;
 };

diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.h
index d25ae414f4d8..bddaf14a77f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h
@@ -31,6 +31,8 @@
 #define UMC_V6_1_CHANNEL_INSTANCE_NUM           4
 /* number of umc instance with memory map register access */
 #define UMC_V6_1_UMC_INSTANCE_NUM               8
+/* total channel instances in one umc block */
+#define UMC_V6_1_TOTAL_CHANNEL_NUM     (UMC_V6_1_CHANNEL_INSTANCE_NUM * UM=
C_V6_1_UMC_INSTANCE_NUM)
 /* UMC regiser per channel offset */
 #define UMC_V6_1_PER_CHANNEL_OFFSET             0x800

--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809A6E7001A75A2748EFCD4F7DE0BN6PR12MB1809namp_
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
Please include a patch description.&nbsp; Explain why you need the new inte=
rface.</div>
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
<b>Subject:</b> [PATCH 2/6] drm/amdgpu: add more parameters and functions t=
o amdgpu_umc structure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Tao Zhou &lt;tao.zhou1@amd.com&gt;<=
br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h | 13 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/umc_v6_1.h&nbsp;&nbsp; |&nbsp; 2 &#43;&#43=
;<br>
&nbsp;2 files changed, 15 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_umc.h<br>
index dfa1a39e57af..2604f5076867 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h<br>
@@ -22,15 &#43;22,28 @@<br>
&nbsp;#define __AMDGPU_UMC_H__<br>
&nbsp;<br>
&nbsp;struct amdgpu_umc_funcs {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*ras_init)(struct amdgpu_de=
vice *adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*query_ras_error_cou=
nt)(struct amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; void *ras_error_status);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*query_ras_error_add=
ress)(struct amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; void *ras_error_status);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*enable_umc_index_mode)(str=
uct amdgpu_device *adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; uint32_t umc_instance);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void (*disable_umc_index_mode)(st=
ruct amdgpu_device *adev);<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct amdgpu_umc {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* max error count in one =
ras query call */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t max_ras_err_cnt_p=
er_query;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of umc channel instance=
 with memory map register access */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t channel_inst_num;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* number of umc instance with me=
mory map register access */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t umc_inst_num;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* UMC regiser per channel offset=
 */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t channel_offs;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* channel index table of interle=
aved memory */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const uint32_t *channel_idx_tbl;<=
br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct amdgpu_umc_fu=
ncs *funcs;<br>
&nbsp;};<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.h<br>
index d25ae414f4d8..bddaf14a77f9 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.h<br>
@@ -31,6 &#43;31,8 @@<br>
&nbsp;#define UMC_V6_1_CHANNEL_INSTANCE_NUM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
&nbsp;/* number of umc instance with memory map register access */<br>
&nbsp;#define UMC_V6_1_UMC_INSTANCE_NUM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8<br>
&#43;/* total channel instances in one umc block */<br>
&#43;#define UMC_V6_1_TOTAL_CHANNEL_NUM&nbsp;&nbsp;&nbsp;&nbsp; (UMC_V6_1_C=
HANNEL_INSTANCE_NUM * UMC_V6_1_UMC_INSTANCE_NUM)<br>
&nbsp;/* UMC regiser per channel offset */<br>
&nbsp;#define UMC_V6_1_PER_CHANNEL_OFFSET&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x800<br>
&nbsp;<br>
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

--_000_BN6PR12MB1809A6E7001A75A2748EFCD4F7DE0BN6PR12MB1809namp_--

--===============0698754436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0698754436==--

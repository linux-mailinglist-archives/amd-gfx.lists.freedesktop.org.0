Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1109C7DF0E
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 17:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3DE6E6E6;
	Thu,  1 Aug 2019 15:28:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680055.outbound.protection.outlook.com [40.107.68.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB616E6E6
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 15:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUlf9ibQ6/DCRyz81zIX9xBz3xLzE1hzQHL8QXV87pCtL5awQhIasqea7+bDV0pCLyFeLE1iy1PBip1j82Wq/VRGedgLKVB4daYvkO0GHMkrmOJ/sLdFXJMfTAUjcVKUT6xPKFKczpYTS/LBuKD7kehtUAxWdm5zt32nZnb9yBZofRrolq6Y2cw7GD4Gc7fR1leBPQ4Gzpt34VsIBLzpUz80StKa/DXSf9C8TEc9tYiDazAaaLf0sZzVm1n12xBnJ/2Gu4+zHgu8se8dv/FscCEuCreI9BHgem/J1R7MiUoPIBswapoywW1vpJX/UU97rj51njPVwsjVN0HCaxjKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpLSbDDuUr6A73NAGDAspXoA2VqatytdsmPBifV90yI=;
 b=fSc2riHI8Q84oC54L9vcbHeZ5hHMPGj9mYhmJNUQzf7ufcmE+OduzVVVfBQgyiLO3PyFOPvrJ8T053LweY7nd5EJ92kPqM5vHXWFnqbCOeAX8Eyhc2jz3qUht+yGywiZ8z9f0DJwAH9ZLY2qZ1VwwtLO7HmH1FLoluL0WdelS38nxd7GD1ENCO9bm/lhI8GzUyAeW07wVQACpep4QUWTzwMMrQH1Ll57Fc0p72RgY2AKxNGgqCH/c8+YfwXh9zoUVr+yStdUiPkgryonByB1FuBmCtYfN06pqMNHbWbKyb3aehk1/XtcDKwtdd3+z+5BxSGcjlFKKhnaJS3I3kYqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1298.namprd12.prod.outlook.com (10.168.224.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 1 Aug 2019 15:28:26 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.017; Thu, 1 Aug 2019
 15:28:26 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 1/6] drm/amdgpu: remove the clear of MCA_ADDR
Thread-Topic: [PATCH 1/6] drm/amdgpu: remove the clear of MCA_ADDR
Thread-Index: AQHVSDR+MD/O3KfCa06fwAaq+GqVqqbmawtp
Date: Thu, 1 Aug 2019 15:28:26 +0000
Message-ID: <BN6PR12MB1809613A2F9A81630841D6BAF7DE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>,
 <20190801064311.7307-2-tao.zhou1@amd.com>
In-Reply-To: <20190801064311.7307-2-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.6.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d99ada2-82cc-4b24-ceab-08d71694e5d1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1298; 
x-ms-traffictypediagnostic: BN6PR12MB1298:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB12988978EE238EE8192D773DF7DE0@BN6PR12MB1298.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 01165471DB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(199004)(189003)(19627405001)(229853002)(71200400001)(478600001)(55016002)(110136005)(316002)(6306002)(54896002)(186003)(966005)(236005)(9686003)(256004)(26005)(7736002)(102836004)(25786009)(53546011)(3846002)(6116002)(6506007)(606006)(53936002)(7696005)(5660300002)(14454004)(33656002)(2501003)(52536014)(11346002)(446003)(8936002)(81166006)(68736007)(81156014)(486006)(105004)(66476007)(66556008)(64756008)(66446008)(76116006)(99286004)(66946007)(2906002)(86362001)(6246003)(66066001)(8676002)(6636002)(76176011)(71190400001)(476003)(74316002)(6436002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1298;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j0zq4vmxJqit6xLpd8lumGP4AgkjsbKEt52nMz3GNRiTRV6swVB8Bq+UayXupTDc3wUuxkxwgfKcZvXGf/ntUXZRtW7utdfc8yI8TbO6u8duE3S26WDBXYoSQU89EPDNPafOYWsExK86HpPJKvQbP/8gWUHs3NN48SIf01GX3k5E6fwLHhvvdFpAn+kydz7yNkgJ2tLbSEcUBAyNbe4fvD27AgnkFZ3vcVuRKsd+O1XsWWOEq1I7B5ZXM4sahiJWY1lr9/OMDgFajsACkp/ay4AH0/7GKKPLBxYeA6z2T1GACmrs4iB2eGyS71h2AqyJrNGc6WJYxnC+B5vTnTh/HSk2VFyniDu6LCAtm0bs6EiT/GlloAH8NhEhxRs6v9WYGEtK41NhfEae/VahcBOJtE4D6MwhiTHai9NSq9voAQA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d99ada2-82cc-4b24-ceab-08d71694e5d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2019 15:28:26.1258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1298
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpLSbDDuUr6A73NAGDAspXoA2VqatytdsmPBifV90yI=;
 b=NFcBfzlFfmnS9umckbJiufrXiwGn2ADM0Uq2J4YTfSKFPmdUe9P3M5ro63VIChMwf9KZ6YZ4rv39974lAWCSC0u/cNDueiSRNsGSnU3BMmUMbjdTq7XwmmA4Bk3ze2f7c0l253uQszc7c4mLyHHPwGp35k14nfpIz9wSLwneIF8=
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
Content-Type: multipart/mixed; boundary="===============0310606727=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0310606727==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809613A2F9A81630841D6BAF7DE0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809613A2F9A81630841D6BAF7DE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tao Zhou=
 <tao.zhou1@amd.com>
Sent: Thursday, August 1, 2019 2:43 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Zhang, H=
awking <Hawking.Zhang@amd.com>; Li, Dennis <Dennis.Li@amd.com>; Chen, Guchu=
n <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: Zhou1, Tao <Tao.Zhou1@amd.com>
Subject: [PATCH 1/6] drm/amdgpu: remove the clear of MCA_ADDR

clearing MCA_STATUS is enough to reset the whole MCA, writing zero to
MCA_ADDR is unnecessary

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/umc_v6_1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.c
index bff1a12f2cc9..035e4fea472c 100644
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c
@@ -229,8 +229,6 @@ static void umc_v6_1_query_ras_error_address(struct amd=
gpu_device *adev,

                         /* clear umc status */
                         WREG64(mc_umc_status_addr + umc_reg_offset, 0x0ULL=
);
-                       /* clear error address register */
-                       WREG64_PCIE(smnMCA_UMC0_MCUMC_ADDRT0 + umc_reg_offs=
et * 4, 0x0ULL);
                 }
         }

--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809613A2F9A81630841D6BAF7DE0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Tao Zhou &lt;tao.zhou1@amd.co=
m&gt;<br>
<b>Sent:</b> Thursday, August 1, 2019 2:43 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Li, Dennis &lt;Dennis.Li=
@amd.com&gt;; Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; Pan, Xinhui &lt;Xin=
hui.Pan@amd.com&gt;<br>
<b>Cc:</b> Zhou1, Tao &lt;Tao.Zhou1@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/6] drm/amdgpu: remove the clear of MCA_ADDR</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">clearing MCA_STATUS is enough to reset the whole M=
CA, writing zero to<br>
MCA_ADDR is unnecessary<br>
<br>
Signed-off-by: Tao Zhou &lt;tao.zhou1@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/umc_v6_1.c | 2 --<br>
&nbsp;1 file changed, 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c b/drivers/gpu/drm/amd/am=
dgpu/umc_v6_1.c<br>
index bff1a12f2cc9..035e4fea472c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/umc_v6_1.c<br>
@@ -229,8 &#43;229,6 @@ static void umc_v6_1_query_ras_error_address(struct=
 amdgpu_device *adev,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* cl=
ear umc status */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG6=
4(mc_umc_status_addr &#43; umc_reg_offset, 0x0ULL);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* clear error a=
ddress register */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG64_PCIE(smnM=
CA_UMC0_MCUMC_ADDRT0 &#43; umc_reg_offset * 4, 0x0ULL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
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

--_000_BN6PR12MB1809613A2F9A81630841D6BAF7DE0BN6PR12MB1809namp_--

--===============0310606727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0310606727==--

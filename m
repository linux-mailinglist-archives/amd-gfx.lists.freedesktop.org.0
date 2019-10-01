Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDDC3F2E
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 19:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9CF6E870;
	Tue,  1 Oct 2019 17:58:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740075.outbound.protection.outlook.com [40.107.74.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722786E870
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 17:58:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3z7KeCULZiNyj+8oIVc9iKnPE5zB47ZtG2KMQWA9PSxIYXWqTQHMjGogTI+MWFWaf9w+atit4DhdC1Bf8KKRG3EwPOkzrz5af7SDFDqZQxXmCzMNPPNSFacSTtG+n8jIwITlZ/wC2BWKzHVMEMlGVzQRRNMJuv3VAVBqX4Cif3ZcouyKal3epwdKOm11eX8KoQWmZvtcV1AhdweEqRUGTN2FiUVVx6MqF1iCDY7rlD+fIOG14ID6GqDyaLExwUcPBxyME4br9CA75e3dOIRNGlx2BQ6xlIJW2w+CvwDt9JNhN3n5wGMNy8og3MCcd0NpGUsX6Vp7aNB9VBrjuRD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMvri7s1rk2KGig1InxDAraR1as8Le99p6jkwuAIFEc=;
 b=dcI6KcVLXq15AXVSzSu/pYChLSMHztAc5gHl48UzpteRnO9GbsbLWgecn+4tRWkFWbPCzTJwCsrPmuZS3sFna5GYrLmNJRc+5n4pHOrSYY84w+AsFA2kt1hIq2UT6hS9sQqqCVIfsfFMb+mqw8tW+p49YyXAejTW+giGd+ALfKjNAV6SxYSH+2wPCHR6ajQyrvMslMw0OdeLO9BErkigjf66u9XREgOA+WKoITUxGuMDKFgJOeQlaHsQ0wm2o0fJLuFbz1xHyhyFR3fipR2BtJr8LEMTGnqFGMgkVPHOTdcdjApH5fLhMHRU5zW787UJbiANUUUm+NVUjRGjgyOneQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1636.namprd12.prod.outlook.com (10.172.19.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 17:58:50 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 17:58:49 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhao, Yong" <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Export setup_vm_pt_regs() logic for mmhub 2.0
Thread-Topic: [PATCH] drm/amdgpu: Export setup_vm_pt_regs() logic for mmhub 2.0
Thread-Index: AQHVda52BhoGjaZDq06LGLvHg8S08adGGE4v
Date: Tue, 1 Oct 2019 17:58:49 +0000
Message-ID: <BN6PR12MB18094FAAA3A261BF9DFD1C22F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190928034012.28228-1-Yong.Zhao@amd.com>
In-Reply-To: <20190928034012.28228-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f14306c2-09bd-480b-541f-08d746990378
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1636:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB16367BC141928840B3048274F79D0@BN6PR12MB1636.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(66446008)(64756008)(966005)(25786009)(76116006)(66556008)(66476007)(66946007)(5660300002)(478600001)(7736002)(76176011)(74316002)(110136005)(316002)(2501003)(7696005)(99286004)(52536014)(606006)(256004)(33656002)(6306002)(6436002)(55016002)(8936002)(19627405001)(14454004)(6506007)(53546011)(66066001)(102836004)(81156014)(236005)(26005)(71190400001)(71200400001)(486006)(2906002)(86362001)(81166006)(6116002)(229853002)(6246003)(11346002)(446003)(186003)(3846002)(105004)(476003)(54896002)(8676002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1636;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyXAzP0eY6TL08MEwQjPdNhJB1RqkAMTc/p04lWOFO21IlD23RkgZV/HvZOLgn30B1S6J4OSHG/kS/2aXbveDb4ejQEKNFXKQAwVcNfDxTXT5Som/QW9RV0amv58Ssr6rIC910OD6mdB9ODJYrrzPhtSg6nV5AFIPYsh5rB4LzRicHN1jAfEll/1EZvYVHh0NeoITF18MKVLU6y9kZ5t6j4tr66ZWcCswmdPRXjuICY95vZZOmFSThCK9S5zNmqUYIIWsV5+lu860VPwE/AkdU2YrcyMvA3Oc8OqKJ1IRugPTIPoxhuSzKs3ohybGZzEW0mzm/FwdPg2JO9CLfbXJwaCbl8Q5Hn0kOCEGUXizwFqNbBz6uDfcNmJ7A/w27mQtNCTbJoj/e+BKDFu0bGjYtFr48/stCsskm5Cwc2KSIVfZ8Vz0P+VAU2K/wOE8g1y9a67ON+cSR55R7Mf3zdBbw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14306c2-09bd-480b-541f-08d746990378
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 17:58:49.7233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T79mq7B6Qy7azULy8mKvz80P8V59zhTGGhruFOzkGKOqorsa9R59swAdHe7iKmnGdhW4MFlq/Db3HR+1NIiGRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1636
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMvri7s1rk2KGig1InxDAraR1as8Le99p6jkwuAIFEc=;
 b=jdWmc0yLNUkUmDhm3bd6afcW1IVCHhBbYaiB7O3uuYmzTYYpZoUKio83Jj+uZ3dSilVbmDci85v+Ilu3kdVGTGe+1wDeLDzmaNXrTJraGDj9aOhD1iKOYWC/VoTKvFk+gShrkkFOeymbvBd/XfldOZA1AadMHQN4zd8uG57fHWs=
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
Content-Type: multipart/mixed; boundary="===============1695083167=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1695083167==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18094FAAA3A261BF9DFD1C22F79D0BN6PR12MB1809namp_"

--_000_BN6PR12MB18094FAAA3A261BF9DFD1C22F79D0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhao, Yo=
ng <Yong.Zhao@amd.com>
Sent: Friday, September 27, 2019 11:40 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhao, Yong <Yong.Zhao@amd.com>
Subject: [PATCH] drm/amdgpu: Export setup_vm_pt_regs() logic for mmhub 2.0

The KFD code will call this function later.

Change-Id: I5993323603799963e9eb473852b6c72de2172ed6
Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c | 19 ++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h |  2 ++
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v2_0.c
index 86ed8cb915a8..2eea702de8ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -31,20 +31,25 @@

 #include "soc15_common.h"

-static void mmhub_v2_0_init_gart_pt_regs(struct amdgpu_device *adev)
+void mmhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid=
,
+                               uint64_t page_table_base)
 {
-       uint64_t value =3D amdgpu_gmc_pd_addr(adev->gart.bo);
+       /* two registers distance between mmMMVM_CONTEXT0_* to mmMMVM_CONTE=
XT1_* */
+       int offset =3D mmMMVM_CONTEXT1_PAGE_TABLE_BASE_ADDR_LO32
+                       - mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32;

-       WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,
-                    lower_32_bits(value));
+       WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_=
LO32,
+                       offset * vmid, lower_32_bits(page_table_base));

-       WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,
-                    upper_32_bits(value));
+       WREG32_SOC15_OFFSET(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_=
HI32,
+                       offset * vmid, upper_32_bits(page_table_base));
 }

 static void mmhub_v2_0_init_gart_aperture_regs(struct amdgpu_device *adev)
 {
-       mmhub_v2_0_init_gart_pt_regs(adev);
+       uint64_t pt_base =3D amdgpu_gmc_pd_addr(adev->gart.bo);
+
+       mmhub_v2_0_setup_vm_pt_regs(adev, 0, pt_base);

         WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT0_PAGE_TABLE_START_ADDR_LO32,
                      (u32)(adev->gmc.gart_start >> 12));
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v2_0.h
index db16f3ece218..3ea4344f0315 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h
@@ -31,5 +31,7 @@ void mmhub_v2_0_init(struct amdgpu_device *adev);
 int mmhub_v2_0_set_clockgating(struct amdgpu_device *adev,
                                enum amd_clockgating_state state);
 void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u32 *flags);
+void mmhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid=
,
+                               uint64_t page_table_base);

 #endif
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18094FAAA3A261BF9DFD1C22F79D0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Zhao, Yong &lt;Yong.Zhao@amd.=
com&gt;<br>
<b>Sent:</b> Friday, September 27, 2019 11:40 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Export setup_vm_pt_regs() logic for mmh=
ub 2.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The KFD code will call this function later.<br>
<br>
Change-Id: I5993323603799963e9eb473852b6c72de2172ed6<br>
Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c | 19 &#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-------<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h |&nbsp; 2 &#43;&#43;<br>
&nbsp;2 files changed, 14 insertions(&#43;), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v2_0.c<br>
index 86ed8cb915a8..2eea702de8ee 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c<br>
@@ -31,20 &#43;31,25 @@<br>
&nbsp;<br>
&nbsp;#include &quot;soc15_common.h&quot;<br>
&nbsp;<br>
-static void mmhub_v2_0_init_gart_pt_regs(struct amdgpu_device *adev)<br>
&#43;void mmhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t =
vmid,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t page_table_base)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t value =3D amdgpu_gmc_pd_addr=
(adev-&gt;gart.bo);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* two registers distance between=
 mmMMVM_CONTEXT0_* to mmMMVM_CONTEXT1_* */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int offset =3D mmMMVM_CONTEXT1_PA=
GE_TABLE_BASE_ADDR_LO32<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - mmMMVM_CON=
TEXT0_PAGE_TABLE_BASE_ADDR_LO32;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT=
0_PAGE_TABLE_BASE_ADDR_LO32,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lower_32_bits(value));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmM=
MVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset * vmi=
d, lower_32_bits(page_table_base));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(MMHUB, 0, mmMMVM_CONTEXT=
0_PAGE_TABLE_BASE_ADDR_HI32,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upper_32_bits(value));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(MMHUB, 0, mmM=
MVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset * vmi=
d, upper_32_bits(page_table_base));<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static void mmhub_v2_0_init_gart_aperture_regs(struct amdgpu_device *=
adev)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmhub_v2_0_init_gart_pt_regs(adev);<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t pt_base =3D amdgpu_gmc_p=
d_addr(adev-&gt;gart.bo);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmhub_v2_0_setup_vm_pt_regs(adev,=
 0, pt_base);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(MMHUB, 0, mmM=
MVM_CONTEXT0_PAGE_TABLE_START_ADDR_LO32,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (u32)(adev-&gt;gmc.gart=
_start &gt;&gt; 12));<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h b/drivers/gpu/drm/amd/=
amdgpu/mmhub_v2_0.h<br>
index db16f3ece218..3ea4344f0315 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.h<br>
@@ -31,5 &#43;31,7 @@ void mmhub_v2_0_init(struct amdgpu_device *adev);<br>
&nbsp;int mmhub_v2_0_set_clockgating(struct amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_clockgating_state state);<br>
&nbsp;void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u32 *flag=
s);<br>
&#43;void mmhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t =
vmid,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t page_table_base);<br>
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

--_000_BN6PR12MB18094FAAA3A261BF9DFD1C22F79D0BN6PR12MB1809namp_--

--===============1695083167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1695083167==--

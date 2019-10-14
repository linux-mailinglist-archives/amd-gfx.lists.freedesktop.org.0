Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1491D6384
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 15:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6736E26F;
	Mon, 14 Oct 2019 13:15:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E66E26F
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 13:15:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuXt2btMVRZOWJ7C7OkslTzLBNEmYXkz8fTeO8+ltyzYQqvCOBtGXiwRlcpg4uA+Rfo4/xlWzFvsdBuua9qt4TCeW9Qv0fB9KnfgbP8vqfc8UtKqg7gXqgqSsDkGyNb8d2mvIbcW24Q67XPNXDa9GIP/hwYbBAzNljsTdgUhs09MW64rJMMpIDTO9py1o69dfKMQPT/aFYmugH/Zok7ju0doNBZ2qlGMTAHJCa6Frs5ognYdKRWbxiCbF82XBFTNepYLsQC7CbN3JXgqViKfNld8Brfg1jPtwZDqR3ws8sGL9tZl+b000lh1Q5sYIcUzn8dEt9v6BtVuoT8zjtwuzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh9cLv8zIO5ziM0dflhqosO11kiuiMLkaf44DiKk82A=;
 b=JA/fu5UBumv9KROfbQWSMhH6d6rm7cua9lzI86h8l8OVk/uEMgX0A5tvRwFqxEe4f4YVHk/jTC8TWhhWXOtgtPXYA/NekeUcWf+G0/pFue7FAD3qNWtLUa2bSsb+33AtCfqqrP1nV9BRqAWukXq6NV0oYwkGf75x5bk257foMBIFyczo+szE/EkeKmn9EInFhcrPPTco5naDxJL1WWuJGZz6ZYDpoOAPwJGy3uGKq98todcFVh2Zafg8B3FikYLVoHE1xQKEdpiWzBB0c8vzBZyj6ZNrtHAoAm4aTKa/98KA8kbza/KiNDokUV6bNoZ1NRLD0YYk6V2gn7riOgJuGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1249.namprd12.prod.outlook.com (10.168.227.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 14 Oct 2019 13:15:00 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.021; Mon, 14 Oct
 2019 13:15:00 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: enable Arcturus runtime VCN dpm on/off
Thread-Topic: [PATCH] drm/amd/powerplay: enable Arcturus runtime VCN dpm on/off
Thread-Index: AQHVgK1KrH2hppOh/kG0Y9vHgbg4TKdaIVnj
Date: Mon, 14 Oct 2019 13:14:59 +0000
Message-ID: <BN6PR12MB18095C51849ABD21E0153E8DF7900@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191012032925.4212-1-evan.quan@amd.com>
In-Reply-To: <20191012032925.4212-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6b1df2e-b28f-4ab8-19ca-08d750a8845e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1249:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1249CBDD6C6F3D5EEC007AACF7900@BN6PR12MB1249.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(189003)(199004)(76116006)(606006)(110136005)(71190400001)(71200400001)(7736002)(74316002)(26005)(66946007)(86362001)(186003)(105004)(5660300002)(14454004)(66476007)(2501003)(66556008)(64756008)(66066001)(66446008)(99286004)(478600001)(966005)(236005)(54896002)(6306002)(53546011)(3846002)(6506007)(6116002)(2906002)(14444005)(316002)(33656002)(256004)(9686003)(8936002)(52536014)(446003)(11346002)(476003)(25786009)(486006)(55016002)(7696005)(6246003)(102836004)(81156014)(6436002)(8676002)(81166006)(19627405001)(76176011)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1249;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NrakcmVq+c75LZMdQY4M94fEsIqCHTp9o9C4b6gGklCIO5LxXU7MaNlzT1jyKabrJ8fdN/GEQcdBFrLRtz0GDwcJqnKqOiQbkGnLnWEMy4cLJUr/ucEv+EZdS0ScCjU/DFw10r/wcvhPlLQpvz16axCVPHLsA2IU/OsMcRh1WovNK5IoJNRnOwH4GsFQ1QSrF4jPxLkpjmhdrazwTRZipQ2n7seIjYhjdIsQyyFXmeYXVlhj22twkn/PBKFA78yiv+2kVVsWcU9g9u4NRP9n9EL+w44swiF8KoUcFBCy6Mylr7TsGOoGXc9OyhtRMekpPK7M/OUNtnCfi+CvjApSsi/HpRaKRT4TmJNfVVtPd2aqhwfRP3LlP0bzles127NvQSKtloYS2MoWFUdHBUBcWNktg1Zf9U5d5zNR8aUofdIC4ALzX/tdnO4gI2sa7wxnsW1Z7tq8ZBM2hWmcgVwZsA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b1df2e-b28f-4ab8-19ca-08d750a8845e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 13:15:00.0422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ki20uWBhsqQ3AvaJMjLLcm9jvpo44ejeFoAO5bzdSJ8ngOF6qfJkfHIaXAC6pQyIBK9kxuymRO0Khy0QIzCBVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1249
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eh9cLv8zIO5ziM0dflhqosO11kiuiMLkaf44DiKk82A=;
 b=xC2SAAHhhnIhrMvpCqVNwj87JUSXLa2RiVXFyP2DznheioimiMBm3EidasxCZHTIyk32mzFaqFxv/dTId8s2in30/rX+psHihe8osQVr7CT/SrGFLSbM1G4qW1r0szW/MbCb+jcMq7w3USOLyp+A+Mze43ZG3Szd5W+HhJ51Bdw=
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
Content-Type: multipart/mixed; boundary="===============0354049016=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0354049016==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18095C51849ABD21E0153E8DF7900BN6PR12MB1809namp_"

--_000_BN6PR12MB18095C51849ABD21E0153E8DF7900BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Quan, Ev=
an <Evan.Quan@amd.com>
Sent: Friday, October 11, 2019 11:29 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amd/powerplay: enable Arcturus runtime VCN dpm on/off

Enable runtime VCN DPM on/off on Arcturus.

Change-Id: Ie7d94d67cb4c622c96acced1b5ef0f4e63db5aad
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c        |  7 +++++
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 30 ++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v2_5.c
index 2608c932a775..d270df892223 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -25,6 +25,7 @@
 #include <drm/drmP.h>
 #include "amdgpu.h"
 #include "amdgpu_vcn.h"
+#include "amdgpu_pm.h"
 #include "soc15.h"
 #include "soc15d.h"
 #include "vcn_v2_0.h"
@@ -709,6 +710,9 @@ static int vcn_v2_5_start(struct amdgpu_device *adev)
         uint32_t rb_bufsz, tmp;
         int i, j, k, r;

+       if (adev->pm.dpm_enabled)
+               amdgpu_dpm_enable_uvd(adev, true);
+
         for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
                 if (adev->vcn.harvest_config & (1 << i))
                         continue;
@@ -939,6 +943,9 @@ static int vcn_v2_5_stop(struct amdgpu_device *adev)
                         ~UVD_POWER_STATUS__UVD_POWER_STATUS_MASK);
         }

+       if (adev->pm.dpm_enabled)
+               amdgpu_dpm_enable_uvd(adev, false);
+
         return 0;
 }

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index a00b60968909..6731fed5458e 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -1907,6 +1907,35 @@ static bool arcturus_is_dpm_running(struct smu_conte=
xt *smu)
         return !!(feature_enabled & SMC_DPM_FEATURE);
 }

+static int arcturus_dpm_set_uvd_enable(struct smu_context *smu, bool enabl=
e)
+{
+       struct smu_power_context *smu_power =3D &smu->smu_power;
+       struct smu_power_gate *power_gate =3D &smu_power->power_gate;
+       int ret =3D 0;
+
+       if (enable) {
+               if (!smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
+                       ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_VC=
N_PG_BIT, 1);
+                       if (ret) {
+                               pr_err("[EnableVCNDPM] failed!\n");
+                               return ret;
+                       }
+               }
+               power_gate->vcn_gated =3D false;
+       } else {
+               if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {
+                       ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_VC=
N_PG_BIT, 0);
+                       if (ret) {
+                               pr_err("[DisableVCNDPM] failed!\n");
+                               return ret;
+                       }
+               }
+               power_gate->vcn_gated =3D true;
+       }
+
+       return ret;
+}
+
 static const struct pptable_funcs arcturus_ppt_funcs =3D {
         /* translate smu index into arcturus specific index */
         .get_smu_msg_index =3D arcturus_get_smu_msg_index,
@@ -1945,6 +1974,7 @@ static const struct pptable_funcs arcturus_ppt_funcs =
=3D {
         .dump_pptable =3D arcturus_dump_pptable,
         .get_power_limit =3D arcturus_get_power_limit,
         .is_dpm_running =3D arcturus_is_dpm_running,
+       .dpm_set_uvd_enable =3D arcturus_dpm_set_uvd_enable,
 };

 void arcturus_set_ppt_funcs(struct smu_context *smu)
--
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18095C51849ABD21E0153E8DF7900BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Quan, Evan &lt;Evan.Quan@amd.=
com&gt;<br>
<b>Sent:</b> Friday, October 11, 2019 11:29 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: enable Arcturus runtime VCN dpm =
on/off</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Enable runtime VCN DPM on/off on Arcturus.<br>
<br>
Change-Id: Ie7d94d67cb4c622c96acced1b5ef0f4e63db5aad<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp; 7 &#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 30 &#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;<br>
&nbsp;2 files changed, 37 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v2_5.c<br>
index 2608c932a775..d270df892223 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c<br>
@@ -25,6 &#43;25,7 @@<br>
&nbsp;#include &lt;drm/drmP.h&gt;<br>
&nbsp;#include &quot;amdgpu.h&quot;<br>
&nbsp;#include &quot;amdgpu_vcn.h&quot;<br>
&#43;#include &quot;amdgpu_pm.h&quot;<br>
&nbsp;#include &quot;soc15.h&quot;<br>
&nbsp;#include &quot;soc15d.h&quot;<br>
&nbsp;#include &quot;vcn_v2_0.h&quot;<br>
@@ -709,6 &#43;710,9 @@ static int vcn_v2_5_start(struct amdgpu_device *ade=
v)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t rb_bufsz, tmp;<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, j, k, r;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.dpm_enabled)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_dpm_enable_uvd(adev, true);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-=
&gt;vcn.num_vcn_inst; &#43;&#43;i) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
@@ -939,6 &#43;943,9 @@ static int vcn_v2_5_stop(struct amdgpu_device *adev=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~UVD_=
POWER_STATUS__UVD_POWER_STATUS_MASK);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.dpm_enabled)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; amdgpu_dpm_enable_uvd(adev, false);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index a00b60968909..6731fed5458e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -1907,6 &#43;1907,35 @@ static bool arcturus_is_dpm_running(struct smu_c=
ontext *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return !!(feature_enabled =
&amp; SMC_DPM_FEATURE);<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int arcturus_dpm_set_uvd_enable(struct smu_context *smu, bool e=
nable)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_power_context *smu_pow=
er =3D &amp;smu-&gt;smu_power;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_power_gate *power_gate=
 =3D &amp;smu_power-&gt;power_gate;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (enable) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_=
feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, 1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;[EnableVCNDPM] failed!\n&q=
uot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; power_gate-&gt;vcn_gated =3D false;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (smu_feature_is_enabled(smu, SMU_FEATURE_VCN_PG_BIT)) {<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_=
feature_set_enabled(smu, SMU_FEATURE_VCN_PG_BIT, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;[DisableVCNDPM] failed!\n&=
quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; power_gate-&gt;vcn_gated =3D true;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs arcturus_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* translate smu index int=
o arcturus specific index */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D arc=
turus_get_smu_msg_index,<br>
@@ -1945,6 &#43;1974,7 @@ static const struct pptable_funcs arcturus_ppt_fu=
ncs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dump_pptable =3D arcturus=
_dump_pptable,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_power_limit =3D arctu=
rus_get_power_limit,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .is_dpm_running =3D arctur=
us_is_dpm_running,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpm_set_uvd_enable =3D arcturus_=
dpm_set_uvd_enable,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void arcturus_set_ppt_funcs(struct smu_context *smu)<br>
-- <br>
2.23.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18095C51849ABD21E0153E8DF7900BN6PR12MB1809namp_--

--===============0354049016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0354049016==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000EC71AF6
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 17:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732FF6E2D7;
	Tue, 23 Jul 2019 15:00:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D306C6E2D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 15:00:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHat7jEcJA++I+6l3+3mtQdW9tl+mEkTcBDPVY0Qr1hlwAAK4ULRzRw/qng1gx1iovDVG6IbeAGLnqMQuKLTdNAFG3U5OavXWjnZWvjWle6j4By76ZsTQ8juXlpLTHM1MJTppuSsYhZnTs4CG/xguaavmYAUz2TCYaogl/Cqz8/HcztmQJkbBAvZJSWojyo0SYGqhYJD+l3TR7QDLAQtFbAk/k3ikvowc2NjGubEqj0V1CHshTNU7E4yuSwLN12041LjP4vHrYiu00VewHd6DnDEDDY5ISPceOVfq3DHYkVAj1jv1ObdRobkiIlHDXO62J4hPsS31MOkalL/AUUahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I+Dvv5vQoRWbweAgJ2JAOn98L62ubgV+92TblYSLDs=;
 b=VjIu9hk/hh0edtxxh41+z2zIib7hzE4xCWOHw9C6maNohBW3PX94rBcDi5B/NN2F2Ji9DTjAMXuyff9xuCWn7mfBqzRzYv4PZnSht9M6QItVeFmkHMQOeaJlMwLsorfch+68QfAGYL2bBogbhv2AfHbkKtGasi0/WL7l4LrLdeh48lwda037tAg7W67SfJoFXROOT3+O98cFJ2nj9h6YheTG9fsNKoqdXjVPSCIc5P174zFBmTqgPOIJHfqUB7gZf8JBFN0rGhDsWeKTN8I2i9R4eMxdyoYXz2nv22D86YXpb0XrWAWUiZtYGNIyXV2Lal4HmTwRAmRZekWTq8gyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1540.namprd12.prod.outlook.com (10.172.17.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 15:00:08 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 15:00:08 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: some cosmetic fixes
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: some cosmetic fixes
Thread-Index: AQHVQTJ2Yl/fx+/hWESkECkyfPfR7abYTCbg
Date: Tue, 23 Jul 2019 15:00:08 +0000
Message-ID: <BN6PR12MB18092BC08806A0B2342C54DCF7C70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190723084112.11439-1-evan.quan@amd.com>,
 <20190723084112.11439-2-evan.quan@amd.com>
In-Reply-To: <20190723084112.11439-2-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2132b974-67cd-488e-1632-08d70f7e73ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1540; 
x-ms-traffictypediagnostic: BN6PR12MB1540:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB15407FA779C1244056C8AE5EF7C70@BN6PR12MB1540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(199004)(189003)(66446008)(64756008)(66556008)(66476007)(6246003)(52536014)(25786009)(66946007)(5660300002)(102836004)(966005)(55016002)(486006)(76116006)(26005)(6436002)(76176011)(53936002)(186003)(53546011)(86362001)(81166006)(9686003)(6306002)(236005)(54896002)(81156014)(14444005)(8936002)(256004)(478600001)(8676002)(71200400001)(71190400001)(68736007)(19627405001)(33656002)(2906002)(14454004)(110136005)(2501003)(105004)(6506007)(66066001)(229853002)(446003)(476003)(11346002)(99286004)(6116002)(606006)(7736002)(7696005)(3846002)(316002)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1540;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ferGHBNhh6609r8kKKli+FEchmPBmvcfz2HnMgtvIxI6JQ1ArCMM2aH3q/P2C3AIrqFsi7O8PEO3cZVOIa5ntBOyD1hDQvrZZIA65TuIOCRRJMjjzU4LeawUz2FyxtjJAzksa+Z4WwTK30fmZNZGwcD4AlC+McV5ZxrDcrBg901Loii21/g4MtdJH7X1jvpUnMIFK3yFbwBfFoy0ZAlZsnkcUWbBgMoth4yeI3rlTLk85xAU3gb90UmwdmBkOoXITXWTAQoKsTYB6xsyCUshO2eOQueZvdIDqIDwmSsWBXZpMehoYXDBBEZSWQVIk/gyOw8zSbdajnk8/LeHB+E4OPmzYeUc7n5uHFgwFVhc0XFtAhfbC+qB8t5rusfo2sbnU+ctq/8TywBHh9ndxmsg9BKV+2ec7avAiNj/ezPZVqU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2132b974-67cd-488e-1632-08d70f7e73ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:00:08.0408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7I+Dvv5vQoRWbweAgJ2JAOn98L62ubgV+92TblYSLDs=;
 b=mM80VrNX2xm6sSo6j+Hk13LQ9ARwdfjSVZFbBhfZpInwLjllJfPlzoGUVmAyF27dgjEP8XNfcSO1Z9CsWOthTSEXid2Ic70zRgjxpfzoHk+ZUjN2JRcpSMd1MQC1DeFL0/aJP25h7RXgeMcLHa+qt3OjG3QmeJgcBknmEdkq+xE=
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
Content-Type: multipart/mixed; boundary="===============1204709327=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1204709327==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18092BC08806A0B2342C54DCF7C70BN6PR12MB1809namp_"

--_000_BN6PR12MB18092BC08806A0B2342C54DCF7C70BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Tuesday, July 23, 2019 4:41 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH 2/2] drm/amd/powerplay: some cosmetic fixes

Drop redundant check, duplicate check, duplicate setting
and fix the return value.

Change-Id: I04171bcac82f17152371d05e6958d4fc072c0f6b
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c     | 33 +++++++++++-----------
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 30 ++++++++------------
 2 files changed, 28 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index 866097d5cf26..aad3e105901b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -367,13 +367,6 @@ static ssize_t amdgpu_set_dpm_forced_performance_level=
(struct device *dev,
              (ddev->switch_power_state !=3D DRM_SWITCH_POWER_ON))
                 return -EINVAL;

-       if (!amdgpu_sriov_vf(adev)) {
-               if (is_support_sw_smu(adev))
-                       current_level =3D smu_get_performance_level(&adev->=
smu);
-               else if (adev->powerplay.pp_funcs->get_performance_level)
-                       current_level =3D amdgpu_dpm_get_performance_level(=
adev);
-       }
-
         if (strncmp("low", buf, strlen("low")) =3D=3D 0) {
                 level =3D AMD_DPM_FORCED_LEVEL_LOW;
         } else if (strncmp("high", buf, strlen("high")) =3D=3D 0) {
@@ -397,17 +390,23 @@ static ssize_t amdgpu_set_dpm_forced_performance_leve=
l(struct device *dev,
                 goto fail;
         }

-        if (amdgpu_sriov_vf(adev)) {
-                if (amdgim_is_hwperf(adev) &&
-                    adev->virt.ops->force_dpm_level) {
-                        mutex_lock(&adev->pm.mutex);
-                        adev->virt.ops->force_dpm_level(adev, level);
-                        mutex_unlock(&adev->pm.mutex);
-                        return count;
-                } else {
-                        return -EINVAL;
+       /* handle sriov case here */
+       if (amdgpu_sriov_vf(adev)) {
+               if (amdgim_is_hwperf(adev) &&
+                   adev->virt.ops->force_dpm_level) {
+                       mutex_lock(&adev->pm.mutex);
+                       adev->virt.ops->force_dpm_level(adev, level);
+                       mutex_unlock(&adev->pm.mutex);
+                       return count;
+               } else {
+                       return -EINVAL;
                 }
-        }
+       }
+
+       if (is_support_sw_smu(adev))
+               current_level =3D smu_get_performance_level(&adev->smu);
+       else if (adev->powerplay.pp_funcs->get_performance_level)
+               current_level =3D amdgpu_dpm_get_performance_level(adev);

         if (current_level =3D=3D level)
                 return count;
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 266614e27392..a92d13b513da 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1398,6 +1398,7 @@ int smu_adjust_power_state_dynamic(struct smu_context=
 *smu,

         if (!smu->pm_enabled)
                 return -EINVAL;
+
         if (!skip_display_settings) {
                 ret =3D smu_display_config_changed(smu);
                 if (ret) {
@@ -1406,8 +1407,6 @@ int smu_adjust_power_state_dynamic(struct smu_context=
 *smu,
                 }
         }

-       if (!smu->pm_enabled)
-               return -EINVAL;
         ret =3D smu_apply_clocks_adjust_rules(smu);
         if (ret) {
                 pr_err("Failed to apply clocks adjust rules!");
@@ -1426,9 +1425,14 @@ int smu_adjust_power_state_dynamic(struct smu_contex=
t *smu,
                 ret =3D smu_asic_set_performance_level(smu, level);
                 if (ret) {
                         ret =3D smu_default_set_performance_level(smu, lev=
el);
+                       if (ret) {
+                               pr_err("Failed to set performance level!");
+                               return ret;
+                       }
                 }
-               if (!ret)
-                       smu_dpm_ctx->dpm_level =3D level;
+
+               /* update the saved copy */
+               smu_dpm_ctx->dpm_level =3D level;
         }

         if (smu_dpm_ctx->dpm_level !=3D AMD_DPM_FORCED_LEVEL_MANUAL) {
@@ -1487,28 +1491,18 @@ enum amd_dpm_forced_level smu_get_performance_level=
(struct smu_context *smu)

 int smu_force_performance_level(struct smu_context *smu, enum amd_dpm_forc=
ed_level level)
 {
-       int ret =3D 0;
-       int i;
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
+       int ret =3D 0;

         if (!smu_dpm_ctx->dpm_context)
                 return -EINVAL;

-       for (i =3D 0; i < smu->adev->num_ip_blocks; i++) {
-               if (smu->adev->ip_blocks[i].version->type =3D=3D AMD_IP_BLO=
CK_TYPE_SMC)
-                       break;
-       }
-
-
-       smu->adev->ip_blocks[i].version->funcs->enable_umd_pstate(smu, &lev=
el);
-       ret =3D smu_handle_task(smu, level,
-                             AMD_PP_TASK_READJUST_POWER_STATE);
+       ret =3D smu_enable_umd_pstate(smu, &level);
         if (ret)
                 return ret;

-       mutex_lock(&smu->mutex);
-       smu_dpm_ctx->dpm_level =3D level;
-       mutex_unlock(&smu->mutex);
+       ret =3D smu_handle_task(smu, level,
+                             AMD_PP_TASK_READJUST_POWER_STATE);

         return ret;
 }
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18092BC08806A0B2342C54DCF7C70BN6PR12MB1809namp_
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
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 4:41 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: some cosmetic fixes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Drop redundant check, duplicate check, duplicate s=
etting<br>
and fix the return value.<br>
<br>
Change-Id: I04171bcac82f17152371d05e6958d4fc072c0f6b<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c&nbsp;&nbsp;&nbsp;&nbsp; | 33 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----------<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 30 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;------------<br>
&nbsp;2 files changed, 28 insertions(&#43;), 35 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index 866097d5cf26..aad3e105901b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -367,13 &#43;367,6 @@ static ssize_t amdgpu_set_dpm_forced_performance_l=
evel(struct device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; (ddev-&gt;switch_power_state !=3D DRM_SWITCH_POWER_ON))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (is_support_sw_smu(adev))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_level =
=3D smu_get_performance_level(&amp;adev-&gt;smu);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else if (adev-&gt;powerplay.pp_funcs-&gt;get_performance_level)<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_level =
=3D amdgpu_dpm_get_performance_level(adev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncmp(&quot;low&quot=
;, buf, strlen(&quot;low&quot;)) =3D=3D 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; level =3D AMD_DPM_FORCED_LEVEL_LOW;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (strncmp(&quot;h=
igh&quot;, buf, strlen(&quot;high&quot;)) =3D=3D 0) {<br>
@@ -397,17 &#43;390,23 @@ static ssize_t amdgpu_set_dpm_forced_performance_=
level(struct device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev)) {<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (amdgim_is_hwperf(adev) &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;virt.ops-&gt;force_dpm_le=
vel) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock=
(&amp;adev-&gt;pm.mutex);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;v=
irt.ops-&gt;force_dpm_level(adev, level);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlo=
ck(&amp;adev-&gt;pm.mutex);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return cou=
nt;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EI=
NVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* handle sriov case here */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (amdgim_is_hwperf(adev) &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;virt.ops-&gt;force_dpm_leve=
l) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&=
amp;adev-&gt;pm.mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;vir=
t.ops-&gt;force_dpm_level(adev, level);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock=
(&amp;adev-&gt;pm.mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return count=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINV=
AL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; current_level =3D smu_get_performance_level(&amp;adev-&gt;sm=
u);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;powerplay.pp_fu=
ncs-&gt;get_performance_level)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; current_level =3D amdgpu_dpm_get_performance_level(adev);<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (current_level =3D=3D l=
evel)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return count;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 266614e27392..a92d13b513da 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -1398,6 &#43;1398,7 @@ int smu_adjust_power_state_dynamic(struct smu_con=
text *smu,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!skip_display_settings=
) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_display_config_changed(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
@@ -1406,8 &#43;1407,6 @@ int smu_adjust_power_state_dynamic(struct smu_con=
text *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_apply_clocks_a=
djust_rules(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to apply clocks adjust rules!&quo=
t;);<br>
@@ -1426,9 &#43;1425,14 @@ int smu_adjust_power_state_dynamic(struct smu_co=
ntext *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_asic_set_performance_level(smu, level);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
=3D smu_default_set_performance_level(smu, level);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to set performance =
level!&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_dpm_ctx-&gt;=
dpm_level =3D level;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* update the saved copy */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; smu_dpm_ctx-&gt;dpm_level =3D level;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_dpm_ctx-&gt;dpm_le=
vel !=3D AMD_DPM_FORCED_LEVEL_MANUAL) {<br>
@@ -1487,28 &#43;1491,18 @@ enum amd_dpm_forced_level smu_get_performance_l=
evel(struct smu_context *smu)<br>
&nbsp;<br>
&nbsp;int smu_force_performance_level(struct smu_context *smu, enum amd_dpm=
_forced_level level)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_c=
ontext)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; smu-&gt;adev-&gt=
;num_ip_blocks; i&#43;&#43;) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (smu-&gt;adev-&gt;ip_blocks[i].version-&gt;type =3D=3D AMD_IP=
_BLOCK_TYPE_SMC)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;adev-&gt;ip_blocks[i].version=
-&gt;funcs-&gt;enable_umd_pstate(smu, &amp;level);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_handle_task(smu, level,<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; AMD_PP_TASK_READJUST_POWER_STATE);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_enable_umd_pstate(smu=
, &amp;level);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;mutex);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_dpm_ctx-&gt;dpm_level =3D level;<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;smu-&gt;mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_handle_task(smu, leve=
l,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; AMD_PP_TASK_READJUST_POWER_STATE);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18092BC08806A0B2342C54DCF7C70BN6PR12MB1809namp_--

--===============1204709327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1204709327==--

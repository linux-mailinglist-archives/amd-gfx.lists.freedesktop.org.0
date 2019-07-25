Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D1074E96
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 14:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8393E6E73D;
	Thu, 25 Jul 2019 12:56:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700046.outbound.protection.outlook.com [40.107.70.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0CE6E73D
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 12:56:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4cBkFLWIMyI8PsijDPPJzr2Kajw3Lunz1047XufIOS5nZtYF4R+uHUdJRh151kJiS+aDQr7MryOs++cFMkcaJkvuhehIAWQdJ2X8Vq1i69MZDe1wIcxCRhlA5sHwJhQ2oxjBbFa67gS8kVDvuaQA6WVclV0WdjXLSe+NQzN4lp8YotmLi4kMo/LDTIIZk2W3ikyQU+KGWRyC5Mf2NkvKKv9TyP7WCs/lqHMr7Nvq69+w/5U0BvKU0hrNjJYx5JpPe7wtu3+rZ02VC9K2CdFo2dC9jaeD1l6bzSJ7JsJsL/ObfFf/0kf8+J/2WGPYZ4ESejG/kF5avcZgdhvSMspqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RQKuPy0Ak5jcXrIw2Kt/XANMS3A+iALWyePmcKZU+U=;
 b=OD6Pd0kUpFwk5wpuNyS8f+meXIRZNvzNtVXcEPZ10iyO4K/trUTIT5GmgyOuzGmenkPFzGqFZk7GfnG8DC0CfMUgl5UZqTb+djlli7n+YTW+1H5/tfjYmQOAxkTHrg8tbLIoYFoqUj9PLTEJfV9bOgm2yFVSSN/2V0DJJbH+PbEeDVusKjIS5GmQ0D4Gyj4fsTfxya0kaJ2aPAeGi7pKSdQMAWu1Gd5K6zaZ2gGhgTRHVMu3pBAxUYtYc14CKcnD2WOYs+DLTEl9HIX3rV/EuyvD4T/DsVQyWk3LtC4gmBiIY/ZpGn3+SbX5nav0m2Cv4K3Kc+0yOWJpVWtgwGAWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1681.namprd12.prod.outlook.com (10.172.19.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 12:56:16 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.013; Thu, 25 Jul
 2019 12:56:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix null pointer dereference around
 dpm state relates
Thread-Topic: [PATCH] drm/amd/powerplay: fix null pointer dereference around
 dpm state relates
Thread-Index: AQHVQqDRyZSW+0onJ0S1KR+pNcrSxKbbS16r
Date: Thu, 25 Jul 2019 12:56:16 +0000
Message-ID: <BN6PR12MB1809FBE4FABB39A03C5D40F2F7C10@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190725042354.1931-1-evan.quan@amd.com>
In-Reply-To: <20190725042354.1931-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f53bee38-b238-4bba-7f36-08d710ff7b3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1681; 
x-ms-traffictypediagnostic: BN6PR12MB1681:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1681B6180148AADBB079F4B0F7C10@BN6PR12MB1681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:378;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(199004)(189003)(64756008)(606006)(2501003)(6506007)(105004)(6246003)(476003)(186003)(25786009)(486006)(19627405001)(66446008)(14444005)(76176011)(26005)(74316002)(446003)(256004)(966005)(81156014)(2906002)(81166006)(7696005)(6116002)(3846002)(86362001)(53936002)(102836004)(229853002)(11346002)(14454004)(316002)(52536014)(110136005)(8936002)(9686003)(71200400001)(66066001)(54896002)(66946007)(99286004)(7736002)(66476007)(66556008)(8676002)(236005)(53546011)(76116006)(6436002)(55016002)(68736007)(33656002)(6306002)(478600001)(71190400001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1681;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SsS8Lr6roq6xEDBWvr1tljUF6GSbeJkzCso+NHEaLYqETJL88AoQzmMaiiUXLFwz3Fr23zBmxab23Wow+H0YUWyKJO5v+SYPktJ2vgEy2ygQJiBP9O47VqABXzdFuQZ1bsA9pKz1idktnvLzMEFqqJQIQtZz77sZPeJiFT90oaUQoK4Rq+lZSr5pJuH0m/WSTM6kcGbgnoRGk0Oz3jdhq0jnsr2zMoYXhnnVuUVunOwh7JzAAbH0BxQlgWbH83SPQ4zRLBjAV9d58PAp2CI/ay8tuCLldC8TwuCMSKrVaOcrT1dWkoiON+3bL7w3n3KePa4dxDAC7ol+lkUS7QEMq4rijlD5AkaCHkWQd7txu2Rlyb1KwseY2UPu+/XnRtVai51i1THclXFcXzeDMFBdAmhLC2HQ5qYI3n7e0+J4YKE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53bee38-b238-4bba-7f36-08d710ff7b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 12:56:16.3919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1681
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RQKuPy0Ak5jcXrIw2Kt/XANMS3A+iALWyePmcKZU+U=;
 b=Sm9iFKBPBrBKU0Nbh64YwEx8nuA4JrmiybUJsQSTTqbXTIDp/iGcNe7PAU/MrCyyl3WwQGT4WuHo34XUXz4cyj9Bui7xrDPK+KaL6LNwk/Pray3MjZ/ScxijjcoD2mbNxzLfLPipcKNBhRnqyJ/HwUCnWR9Tsy2BdjRJjG50vas=
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
Content-Type: multipart/mixed; boundary="===============0161186923=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0161186923==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809FBE4FABB39A03C5D40F2F7C10BN6PR12MB1809namp_"

--_000_BN6PR12MB1809FBE4FABB39A03C5D40F2F7C10BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Thursday, July 25, 2019 12:23 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amd/powerplay: fix null pointer dereference around dpm=
 state relates

DPM state relates are not supported on the new SW SMU ASICs. But still
it's not OK to trigger null pointer dereference on accessing them.

Change-Id: I368d108fbea438ed5d9e3b849d006ddd5308052b
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c     | 18 +++++++++++++-----
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c |  3 ++-
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index 304626b21a8c..61312b02b5c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -209,12 +209,16 @@ static ssize_t amdgpu_get_dpm_state(struct device *de=
v,
         struct amdgpu_device *adev =3D ddev->dev_private;
         enum amd_pm_state_type pm;

-       if (is_support_sw_smu(adev) && adev->smu.ppt_funcs->get_current_pow=
er_state)
-               pm =3D amdgpu_smu_get_current_power_state(adev);
-       else if (adev->powerplay.pp_funcs->get_current_power_state)
+       if (is_support_sw_smu(adev)) {
+               if (adev->smu.ppt_funcs->get_current_power_state)
+                       pm =3D amdgpu_smu_get_current_power_state(adev);
+               else
+                       pm =3D adev->pm.dpm.user_state;
+       } else if (adev->powerplay.pp_funcs->get_current_power_state) {
                 pm =3D amdgpu_dpm_get_current_power_state(adev);
-       else
+       } else {
                 pm =3D adev->pm.dpm.user_state;
+       }

         return snprintf(buf, PAGE_SIZE, "%s\n",
                         (pm =3D=3D POWER_STATE_TYPE_BATTERY) ? "battery" :
@@ -241,7 +245,11 @@ static ssize_t amdgpu_set_dpm_state(struct device *dev=
,
                 goto fail;
         }

-       if (adev->powerplay.pp_funcs->dispatch_tasks) {
+       if (is_support_sw_smu(adev)) {
+               mutex_lock(&adev->pm.mutex);
+               adev->pm.dpm.user_state =3D state;
+               mutex_unlock(&adev->pm.mutex);
+       } else if (adev->powerplay.pp_funcs->dispatch_tasks) {
                 amdgpu_dpm_dispatch_task(adev, AMD_PP_TASK_ENABLE_USER_STA=
TE, &state);
         } else {
                 mutex_lock(&adev->pm.mutex);
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index a5079b93caa3..3ecd67e6e65c 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -304,7 +304,8 @@ int smu_get_power_num_states(struct smu_context *smu,

         /* not support power state */
         memset(state_info, 0, sizeof(struct pp_states_info));
-       state_info->nums =3D 0;
+       state_info->nums =3D 1;
+       state_info->states[0] =3D POWER_STATE_TYPE_DEFAULT;

         return 0;
 }
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809FBE4FABB39A03C5D40F2F7C10BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Thursday, July 25, 2019 12:23 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: fix null pointer dereference aro=
und dpm state relates</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">DPM state relates are not supported on the new SW =
SMU ASICs. But still<br>
it's not OK to trigger null pointer dereference on accessing them.<br>
<br>
Change-Id: I368d108fbea438ed5d9e3b849d006ddd5308052b<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c&nbsp;&nbsp;&nbsp;&nbsp; | 18 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c |&nbsp; 3 &#43;&#43;-<br>
&nbsp;2 files changed, 15 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index 304626b21a8c..61312b02b5c7 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -209,12 &#43;209,16 @@ static ssize_t amdgpu_get_dpm_state(struct device=
 *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D ddev-&gt;dev_private;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pm_state_type pm;=
<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev) &amp;&amp=
; adev-&gt;smu.ppt_funcs-&gt;get_current_power_state)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pm =3D amdgpu_smu_get_current_power_state(adev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;powerplay.pp_funcs-=
&gt;get_current_power_state)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev)) {<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;smu.ppt_funcs-&gt;get_current_power_state)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm =3D amdgp=
u_smu_get_current_power_state(adev);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm =3D adev-=
&gt;pm.dpm.user_state;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (adev-&gt;powerplay.pp_=
funcs-&gt;get_current_power_state) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pm =3D amdgpu_dpm_get_current_power_state(adev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pm =3D adev-&gt;pm.dpm.user_state;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return snprintf(buf, PAGE_=
SIZE, &quot;%s\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (pm =
=3D=3D POWER_STATE_TYPE_BATTERY) ? &quot;battery&quot; :<br>
@@ -241,7 &#43;245,11 @@ static ssize_t amdgpu_set_dpm_state(struct device =
*dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;powerplay.pp_funcs-&gt;d=
ispatch_tasks) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev)) {<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mutex_lock(&amp;adev-&gt;pm.mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; adev-&gt;pm.dpm.user_state =3D state;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;pm.mutex);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (adev-&gt;powerplay.pp_=
funcs-&gt;dispatch_tasks) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_dpm_dispatch_task(adev, AMD_PP_TASK_ENABLE_USE=
R_STATE, &amp;state);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;adev-&gt;pm.mutex);<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index a5079b93caa3..3ecd67e6e65c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -304,7 &#43;304,8 @@ int smu_get_power_num_states(struct smu_context *sm=
u,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* not support power state=
 */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(state_info, 0, size=
of(struct pp_states_info));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state_info-&gt;nums =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state_info-&gt;nums =3D 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state_info-&gt;states[0] =3D POWE=
R_STATE_TYPE_DEFAULT;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
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

--_000_BN6PR12MB1809FBE4FABB39A03C5D40F2F7C10BN6PR12MB1809namp_--

--===============0161186923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0161186923==--

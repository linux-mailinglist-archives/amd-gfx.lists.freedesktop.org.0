Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0228D74E90
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jul 2019 14:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F0889CC9;
	Thu, 25 Jul 2019 12:53:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265589CC9
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jul 2019 12:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyNYlrsoqEQ14ZL+bLYMphfA/NhR6qb1DvSfoAs9fTnebAXl+Fy0qNnyevfQki3g2NI3KyCvBU87NMIGhfcAKaPtV9tWg95Syps/a2z+xDDM4cAcmVSAM0fabyzBlNLtzZyfBvbrpXeN4jDvB0D/ABh4+3uDmmJx70XDUreBdTb3P4oIOKue5khihTqh+N5ftmlOOwD9ib0AX8qyQZGywfRlNhIW5SislM07dawtzOXsHN+gqcq/bPNJJDWYk0P2lyKyHKDv2+U/x9Ux9QATslJ8+sEAjD435MHD4CfDWrIh7hsHyrSW+8vcrhPtD4E7VAgPILyR9ndJzQlQyveWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHOpG2dpmCkQBETk/ulotDVvLpFhWPee+APC8TAVcSE=;
 b=i1CQHmYqiCKOLXSYwzLmtuTvXjIJFROay4Nq2IWspt3I+UXxrby45Bd63EtF5Mvhe79PPchxkZoeaHPjQ9E5F6B6fWJAu/gPRbFP3l7fRzLbmTTWMY9ExiqWEQWGlKXf9jssv8cH06GGsPys1/Yquem6pyttN59hasDdCHx+36ZsU01g4uPKIlrPVIRDfXFcosyaqYK/pHHSiwFGWr5zcFcOtkgncj/7NSxjCggExszkc3eDb+VS9xj4No9ihrotTMoAVnGBCgQvRyyY6QRxrodI0Na1F+lAxqjYn/1rjm1cd/b7Wdx759fUd+GBMp/bVCS5T70toeKvfZGNcK6Xug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1569.namprd12.prod.outlook.com (10.172.19.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Thu, 25 Jul 2019 12:53:36 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.013; Thu, 25 Jul
 2019 12:53:36 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: minor fixes around SW SMU power and
 fan setting
Thread-Topic: [PATCH] drm/amd/powerplay: minor fixes around SW SMU power and
 fan setting
Thread-Index: AQHVQpI4+oknBB8QCU6meA3lIKixkabbSr3o
Date: Thu, 25 Jul 2019 12:53:36 +0000
Message-ID: <BN6PR12MB1809C804B96AC0FD64DC40C6F7C10@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190725023930.22521-1-evan.quan@amd.com>
In-Reply-To: <20190725023930.22521-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 383cb17b-e449-44a8-e1b1-08d710ff1bc8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1569; 
x-ms-traffictypediagnostic: BN6PR12MB1569:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB15694D1A40CF186147B6C8B4F7C10@BN6PR12MB1569.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:79;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(199004)(189003)(6246003)(6116002)(99286004)(316002)(446003)(105004)(66476007)(26005)(66556008)(11346002)(14444005)(64756008)(81156014)(186003)(81166006)(52536014)(14454004)(8676002)(19627405001)(7736002)(476003)(71190400001)(229853002)(86362001)(74316002)(256004)(5660300002)(71200400001)(66446008)(76116006)(110136005)(8936002)(9686003)(236005)(486006)(2501003)(2906002)(966005)(54896002)(6436002)(3846002)(53546011)(25786009)(606006)(6506007)(55016002)(68736007)(7696005)(478600001)(53936002)(66066001)(76176011)(102836004)(33656002)(6306002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1569;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bMwn680oK3n+EKl+mDVv0npqDXF2SnT73uJayjyFfBxfK5+Hu7/OmYhs/U11zGtBDQEj+bAzL2iJIJQQuLycbifcafmkxxHEOvxC09zJbOQ1iL/cHsnYpnbcR5ykcRxsKbmxHBkWWca3NtWRLHHq9xXfEc0ovgLBMI//wJKv8bTfWqS2hEf43H5N0CtexMxfMXLMKwnZlN1nnRhw0AlFMgOLCMm3w+06/Oe4adsKmcdGb8SMbbC0hCAs7Tu3jh9LjSTR/pG/u6+ozqwyI6j29zDhB+7vyqouC6gp0Mci/eWP7h/+0T3U23BcypAZllzkdcDb3FSQEG5L2UHIdDAdiuY1SLMlxBLa3UX8y0Os1mCxQq1hg1ChOcY4YboLZK6f3AchvhopcVRl3NgNW/jAW7371r65tikKydJAJAYu/M0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383cb17b-e449-44a8-e1b1-08d710ff1bc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 12:53:36.1400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1569
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHOpG2dpmCkQBETk/ulotDVvLpFhWPee+APC8TAVcSE=;
 b=npRl04DNJhEfEgq2LN7XJfgpj2ZT+GDihsSJKAX+oGjmdbTSnlM3ydl1aG6I/aSMpmKQBX2IuCTeVMvncKcAwpD9idYjCh7mnRsQXUiGgyyWNPxKylJOL0Nl2HKLMhn3RNATWw9tRaLRiXhEZEkKLu+Eq8EIILhLk9aQmUS7A1g=
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
Content-Type: multipart/mixed; boundary="===============0533821001=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0533821001==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809C804B96AC0FD64DC40C6F7C10BN6PR12MB1809namp_"

--_000_BN6PR12MB1809C804B96AC0FD64DC40C6F7C10BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Wednesday, July 24, 2019 10:39 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amd/powerplay: minor fixes around SW SMU power and fan=
 setting

Add checking for possible invalid input and null pointer. And
drop redundant code.

Change-Id: I6ebd6acd944e821fb19af77ed1eaa8c4b1d407ce
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c    | 22 ++++++++++-----------
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 24 +++++++++++------------
 2 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index bdf537d3f459..9aa00d67e61d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -1667,20 +1667,16 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct =
device *dev,
              (adev->ddev->switch_power_state !=3D DRM_SWITCH_POWER_ON))
                 return -EINVAL;

-       if (is_support_sw_smu(adev)) {
-               err =3D kstrtoint(buf, 10, &value);
-               if (err)
-                       return err;
+       err =3D kstrtoint(buf, 10, &value);
+       if (err)
+               return err;

+       if (is_support_sw_smu(adev)) {
                 smu_set_fan_control_mode(&adev->smu, value);
         } else {
                 if (!adev->powerplay.pp_funcs->set_fan_control_mode)
                         return -EINVAL;

-               err =3D kstrtoint(buf, 10, &value);
-               if (err)
-                       return err;
-
                 amdgpu_dpm_set_fan_control_mode(adev, value);
         }

@@ -2100,16 +2096,18 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct de=
vice *dev,
                 return err;

         value =3D value / 1000000; /* convert to Watt */
+
         if (is_support_sw_smu(adev)) {
-               adev->smu.funcs->set_power_limit(&adev->smu, value);
+               err =3D smu_set_power_limit(&adev->smu, value);
         } else if (adev->powerplay.pp_funcs && adev->powerplay.pp_funcs->s=
et_power_limit) {
                 err =3D adev->powerplay.pp_funcs->set_power_limit(adev->po=
werplay.pp_handle, value);
-               if (err)
-                       return err;
         } else {
-               return -EINVAL;
+               err =3D -EINVAL;
         }

+       if (err)
+               return err;
+
         return count;
 }

diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index d1486c3e1357..8ac9acabebf8 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1092,6 +1092,8 @@ static int smu_v11_0_set_power_limit(struct smu_conte=
xt *smu, uint32_t n)
                 max_power_limit *=3D (100 + smu->smu_table.TDPODLimit);
                 max_power_limit /=3D 100;
         }
+       if (n > max_power_limit)
+               return -EINVAL;

         if (smu_feature_is_enabled(smu, SMU_FEATURE_PPT_BIT))
                 ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetPptLim=
it, n);
@@ -1407,17 +1409,17 @@ smu_v11_0_get_fan_control_mode(struct smu_context *=
smu)
 }

 static int
-smu_v11_0_smc_fan_control(struct smu_context *smu, bool start)
+smu_v11_0_auto_fan_control(struct smu_context *smu, bool auto_fan_control)
 {
         int ret =3D 0;

         if (smu_feature_is_supported(smu, SMU_FEATURE_FAN_CONTROL_BIT))
                 return 0;

-       ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT, s=
tart);
+       ret =3D smu_feature_set_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT, a=
uto_fan_control);
         if (ret)
                 pr_err("[%s]%s smc FAN CONTROL feature failed!",
-                      __func__, (start ? "Start" : "Stop"));
+                      __func__, (auto_fan_control ? "Start" : "Stop"));

         return ret;
 }
@@ -1441,16 +1443,15 @@ static int
 smu_v11_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
 {
         struct amdgpu_device *adev =3D smu->adev;
-       uint32_t duty100;
-       uint32_t duty;
+       uint32_t duty100, duty;
         uint64_t tmp64;
-       bool stop =3D 0;

         if (speed > 100)
                 speed =3D 100;

-       if (smu_v11_0_smc_fan_control(smu, stop))
+       if (smu_v11_0_auto_fan_control(smu, 0))
                 return -EINVAL;
+
         duty100 =3D REG_GET_FIELD(RREG32_SOC15(THM, 0, mmCG_FDO_CTRL1),
                                 CG_FDO_CTRL1, FMAX_DUTY100);
         if (!duty100)
@@ -1472,18 +1473,16 @@ smu_v11_0_set_fan_control_mode(struct smu_context *=
smu,
                                uint32_t mode)
 {
         int ret =3D 0;
-       bool start =3D 1;
-       bool stop  =3D 0;

         switch (mode) {
         case AMD_FAN_CTRL_NONE:
                 ret =3D smu_v11_0_set_fan_speed_percent(smu, 100);
                 break;
         case AMD_FAN_CTRL_MANUAL:
-               ret =3D smu_v11_0_smc_fan_control(smu, stop);
+               ret =3D smu_v11_0_auto_fan_control(smu, 0);
                 break;
         case AMD_FAN_CTRL_AUTO:
-               ret =3D smu_v11_0_smc_fan_control(smu, start);
+               ret =3D smu_v11_0_auto_fan_control(smu, 1);
                 break;
         default:
                 break;
@@ -1503,13 +1502,12 @@ static int smu_v11_0_set_fan_speed_rpm(struct smu_c=
ontext *smu,
         struct amdgpu_device *adev =3D smu->adev;
         int ret;
         uint32_t tach_period, crystal_clock_freq;
-       bool stop =3D 0;

         if (!speed)
                 return -EINVAL;

         mutex_lock(&(smu->mutex));
-       ret =3D smu_v11_0_smc_fan_control(smu, stop);
+       ret =3D smu_v11_0_auto_fan_control(smu, 0);
         if (ret)
                 goto set_fan_speed_rpm_failed;

--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809C804B96AC0FD64DC40C6F7C10BN6PR12MB1809namp_
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
<b>Sent:</b> Wednesday, July 24, 2019 10:39 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: minor fixes around SW SMU power =
and fan setting</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add checking for possible invalid input and null p=
ointer. And<br>
drop redundant code.<br>
<br>
Change-Id: I6ebd6acd944e821fb19af77ed1eaa8c4b1d407ce<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c&nbsp;&nbsp;&nbsp; | 22 &#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----------<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 24 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;------------<br>
&nbsp;2 files changed, 21 insertions(&#43;), 25 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index bdf537d3f459..9aa00d67e61d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -1667,20 &#43;1667,16 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(str=
uct device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; (adev-&gt;ddev-&gt;switch_power_state !=3D DRM_SWITCH_POWER_ON))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; err =3D kstrtoint(buf, 10, &amp;value);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (err)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D kstrtoint(buf, 10, &amp;v=
alue);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return err;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev)) {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; smu_set_fan_control_mode(&amp;adev-&gt;smu, value);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;powerplay.pp_funcs-&gt;set_fan_control_=
mode)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; err =3D kstrtoint(buf, 10, &amp;value);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (err)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_dpm_set_fan_control_mode(adev, value);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
@@ -2100,16 &#43;2096,18 @@ static ssize_t amdgpu_hwmon_set_power_cap(struc=
t device *dev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return err;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value =3D value / 1000000;=
 /* convert to Watt */<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_support_sw_smu(adev=
)) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adev-&gt;smu.funcs-&gt;set_power_limit(&amp;adev-&gt;smu, value)=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; err =3D smu_set_power_limit(&amp;adev-&gt;smu, value);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (adev-&gt;powerp=
lay.pp_funcs &amp;&amp; adev-&gt;powerplay.pp_funcs-&gt;set_power_limit) {<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; err =3D adev-&gt;powerplay.pp_funcs-&gt;set_power_lim=
it(adev-&gt;powerplay.pp_handle, value);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (err)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; err =3D -EINVAL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return err;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return count;<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index d1486c3e1357..8ac9acabebf8 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -1092,6 &#43;1092,8 @@ static int smu_v11_0_set_power_limit(struct smu_c=
ontext *smu, uint32_t n)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; max_power_limit *=3D (100 &#43; smu-&gt;smu_table.TDP=
ODLimit);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; max_power_limit /=3D 100;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (n &gt; max_power_limit)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_feature_is_enabled=
(smu, SMU_FEATURE_PPT_BIT))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetP=
ptLimit, n);<br>
@@ -1407,17 &#43;1409,17 @@ smu_v11_0_get_fan_control_mode(struct smu_conte=
xt *smu)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int<br>
-smu_v11_0_smc_fan_control(struct smu_context *smu, bool start)<br>
&#43;smu_v11_0_auto_fan_control(struct smu_context *smu, bool auto_fan_cont=
rol)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_feature_is_support=
ed(smu, SMU_FEATURE_FAN_CONTROL_BIT))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_set_enabled(smu, =
SMU_FEATURE_FAN_CONTROL_BIT, start);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_set_enabled(s=
mu, SMU_FEATURE_FAN_CONTROL_BIT, auto_fan_control);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;[%s]%s smc FAN CONTROL feature failed!&q=
uot;,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __func__, (start ? &qu=
ot;Start&quot; : &quot;Stop&quot;));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __func__, (auto_fa=
n_control ? &quot;Start&quot; : &quot;Stop&quot;));<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
@@ -1441,16 &#43;1443,15 @@ static int<br>
&nbsp;smu_v11_0_set_fan_speed_percent(struct smu_context *smu, uint32_t spe=
ed)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D smu-&gt;adev;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t duty100;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t duty;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t duty100, duty;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t tmp64;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool stop =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (speed &gt; 100)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; speed =3D 100;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_v11_0_smc_fan_control(smu, st=
op))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_v11_0_auto_fan_control(sm=
u, 0))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; duty100 =3D REG_GET_FIELD(=
RREG32_SOC15(THM, 0, mmCG_FDO_CTRL1),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CG_FDO_CTRL1, FMAX_DUTY100);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!duty100)<br>
@@ -1472,18 &#43;1473,16 @@ smu_v11_0_set_fan_control_mode(struct smu_conte=
xt *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t mode)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool start =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool stop&nbsp; =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (mode) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_FAN_CTRL_NONE:<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_v11_0_set_fan_speed_percent(smu, 100);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_FAN_CTRL_MANUAL:<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_v11_0_smc_fan_control(smu, stop);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_v11_0_auto_fan_control(smu, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_FAN_CTRL_AUTO:<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_v11_0_smc_fan_control(smu, start);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_v11_0_auto_fan_control(smu, 1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
@@ -1503,13 &#43;1502,12 @@ static int smu_v11_0_set_fan_speed_rpm(struct s=
mu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D smu-&gt;adev;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t tach_period, crys=
tal_clock_freq;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool stop =3D 0;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!speed)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;(smu-&gt;m=
utex));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_v11_0_smc_fan_control(smu=
, stop);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_v11_0_auto_fan_contro=
l(smu, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto set_fan_speed_rpm_failed;<br>
&nbsp;<br>
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

--_000_BN6PR12MB1809C804B96AC0FD64DC40C6F7C10BN6PR12MB1809namp_--

--===============0533821001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0533821001==--

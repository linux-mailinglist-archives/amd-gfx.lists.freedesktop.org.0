Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D761CA28
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2019 16:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98CE8929B;
	Tue, 14 May 2019 14:20:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750043.outbound.protection.outlook.com [40.107.75.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642F3880C6
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2019 14:20:21 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1810.namprd12.prod.outlook.com (10.175.101.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 14:20:16 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1878.024; Tue, 14 May
 2019 14:20:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: support sw smu hotspot and memory
 temperature retrieval
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: support sw smu hotspot and memory
 temperature retrieval
Thread-Index: AQHVCkbsNxsPr4gHkE6bLAKGq6ehU6Zqq3Sb
Date: Tue, 14 May 2019 14:20:16 +0000
Message-ID: <BN6PR12MB180993535A9C4563EBAA66B6F7080@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190514111922.21780-1-evan.quan@amd.com>,
 <20190514111922.21780-2-evan.quan@amd.com>
In-Reply-To: <20190514111922.21780-2-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76a8e738-15c7-4814-a585-08d6d87749a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1810; 
x-ms-traffictypediagnostic: BN6PR12MB1810:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1810D2FF91CD7D8056291D79F7080@BN6PR12MB1810.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(39860400002)(376002)(396003)(136003)(199004)(189003)(6246003)(8936002)(186003)(8676002)(86362001)(6116002)(68736007)(3846002)(81156014)(99286004)(229853002)(81166006)(7736002)(606006)(26005)(7696005)(71190400001)(53936002)(71200400001)(6436002)(9686003)(55016002)(25786009)(6306002)(54896002)(74316002)(2906002)(236005)(66066001)(14454004)(105004)(72206003)(66476007)(102836004)(76116006)(66556008)(76176011)(19627405001)(110136005)(73956011)(66946007)(5660300002)(6506007)(11346002)(53546011)(446003)(52536014)(476003)(966005)(316002)(66446008)(64756008)(486006)(478600001)(33656002)(256004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1810;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3wH/GusPwpvXjX5FWZ6evkND6xBnbrpXBgnlfL8Vtu5GMT4/RpxP4onA+1rVijn8yKuKvldYcxCcbbK88sXhi4gLJp4E8j5zco+odSwCMF3y6hsHPBBC9teBcQXSOLCRdqdJWUIVh7WSm4fvWWqh1O3dQe6xVQ1lZN8c6+MxgbinLQB844c8+y+NHkF7DJ7ALWc9R1ICDZrWVSu2rMjkhbtSaOmxXSf9zponQY47As/+FDiGjAJ9z/YNcQQGg3SYw4aSGIouQVajWm9D48xEBjix/CSkzNFOpS/kmBLPQSC5GzqK29KBGXildDPcPZKw36Amvj5gLZSrsER5CnNxt81bhGhfZefLwmHw7nXkYMqpHZI3VuoYvcXpEF0NfZvsVHikdQysKYN8COcSnezafJgiaB7yQMAA03akr16BW1c=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a8e738-15c7-4814-a585-08d6d87749a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 14:20:16.6422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1810
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QiUJdSDHHcsi5HmM5SVcJSTVirPk7J0oLwfQnmbMqQ=;
 b=ZhBoMBvEEEzld9Vr3qEY8iICwBJMYKVvD5Oo35jPJNZ4kfy/uFAHL0Iwvb3LUHP7noLh9OgDsxCYnzay7VApnThr9CoXkhW5q0a8bvDNZOXCtRSh46vSM+fBlwjX9vneNY9p4d9mrV7NLCtiV1SzCCgTC27Uiw9TBTRnt33sZJo=
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
Content-Type: multipart/mixed; boundary="===============0286548877=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0286548877==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180993535A9C4563EBAA66B6F7080BN6PR12MB1809namp_"

--_000_BN6PR12MB180993535A9C4563EBAA66B6F7080BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Tuesday, May 14, 2019 7:19 AM
To: amd-gfx@lists.freedesktop.org
Cc: Quan, Evan
Subject: [PATCH 2/2] drm/amd/powerplay: support sw smu hotspot and memory t=
emperature retrieval

[CAUTION: External Email]

Support hotspot and memory temperature retrieval on sw smu routine.

Change-Id: If2ed1e2835f4b158a4a6d93aee8b358af18b9bfc
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |  3 +
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 74 ++++++++++++++++---
 2 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h
index aa8d81f4111e..02c965d64256 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -36,6 +36,9 @@
 #define smnMP0_FW_INTF                 0x30101c0
 #define smnMP1_PUB_CTRL                        0x3010b14

+#define TEMP_RANGE_MIN                 (0)
+#define TEMP_RANGE_MAX                 (80 * 1000)
+
 struct smu_11_0_max_sustainable_clocks {
        uint32_t display_clock;
        uint32_t phy_clock;
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index 738ae1d2ef17..0eea93c8dff7 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1011,9 +1011,20 @@ static int smu_v11_0_get_current_clk_freq(struct smu=
_context *smu, uint32_t clk_
 static int smu_v11_0_get_thermal_range(struct smu_context *smu,
                                struct PP_TemperatureRange *range)
 {
+       PPTable_t *pptable =3D smu->smu_table.driver_pptable;
        memcpy(range, &SMU7ThermalWithDelayPolicy[0], sizeof(struct PP_Temp=
eratureRange));

-       range->max =3D smu->smu_table.software_shutdown_temp *
+       range->max =3D pptable->TedgeLimit *
+               PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->edge_emergency_max =3D (pptable->TedgeLimit + CTF_OFFSET_EDG=
E) *
+               PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->hotspot_crit_max =3D pptable->ThotspotLimit *
+               PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->hotspot_emergency_max =3D (pptable->ThotspotLimit + CTF_OFFS=
ET_HOTSPOT) *
+               PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->mem_crit_max =3D pptable->ThbmLimit *
+               PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->mem_emergency_max =3D (pptable->ThbmLimit + CTF_OFFSET_HBM)*
                PP_TEMPERATURE_UNITS_PER_CENTIGRADES;

        return 0;
@@ -1078,7 +1089,16 @@ static int smu_v11_0_set_thermal_fan_table(struct sm=
u_context *smu)
 static int smu_v11_0_start_thermal_control(struct smu_context *smu)
 {
        int ret =3D 0;
-       struct PP_TemperatureRange range;
+       struct PP_TemperatureRange range =3D {
+               TEMP_RANGE_MIN,
+               TEMP_RANGE_MAX,
+               TEMP_RANGE_MAX,
+               TEMP_RANGE_MIN,
+               TEMP_RANGE_MAX,
+               TEMP_RANGE_MAX,
+               TEMP_RANGE_MIN,
+               TEMP_RANGE_MAX,
+               TEMP_RANGE_MAX};
        struct amdgpu_device *adev =3D smu->adev;

        smu_v11_0_get_thermal_range(smu, &range);
@@ -1098,6 +1118,13 @@ static int smu_v11_0_start_thermal_control(struct sm=
u_context *smu)

        adev->pm.dpm.thermal.min_temp =3D range.min;
        adev->pm.dpm.thermal.max_temp =3D range.max;
+       adev->pm.dpm.thermal.max_edge_emergency_temp =3D range.edge_emergen=
cy_max;
+       adev->pm.dpm.thermal.min_hotspot_temp =3D range.hotspot_min;
+       adev->pm.dpm.thermal.max_hotspot_crit_temp =3D range.hotspot_crit_m=
ax;
+       adev->pm.dpm.thermal.max_hotspot_emergency_temp =3D range.hotspot_e=
mergency_max;
+       adev->pm.dpm.thermal.min_mem_temp =3D range.mem_min;
+       adev->pm.dpm.thermal.max_mem_crit_temp =3D range.mem_crit_max;
+       adev->pm.dpm.thermal.max_mem_emergency_temp =3D range.mem_emergency=
_max;

        return ret;
 }
@@ -1151,22 +1178,45 @@ static int smu_v11_0_get_current_activity_percent(s=
truct smu_context *smu,
        return 0;
 }

-static int smu_v11_0_thermal_get_temperature(struct smu_context *smu, uint=
32_t *value)
+static int smu_v11_0_thermal_get_temperature(struct smu_context *smu,
+                                            enum amd_pp_sensors sensor,
+                                            uint32_t *value)
 {
        struct amdgpu_device *adev =3D smu->adev;
+       SmuMetrics_t metrics;
        uint32_t temp =3D 0;
+       int ret =3D 0;

        if (!value)
                return -EINVAL;

-       temp =3D RREG32_SOC15(THM, 0, mmCG_MULT_THERMAL_STATUS);
-       temp =3D (temp & CG_MULT_THERMAL_STATUS__CTF_TEMP_MASK) >>
-                       CG_MULT_THERMAL_STATUS__CTF_TEMP__SHIFT;
+       ret =3D smu_v11_0_get_metrics_table(smu, &metrics);
+       if (ret)
+               return ret;
+
+       switch (sensor) {
+       case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+               temp =3D RREG32_SOC15(THM, 0, mmCG_MULT_THERMAL_STATUS);
+               temp =3D (temp & CG_MULT_THERMAL_STATUS__CTF_TEMP_MASK) >>
+                               CG_MULT_THERMAL_STATUS__CTF_TEMP__SHIFT;

-       temp =3D temp & 0x1ff;
-       temp *=3D SMU11_TEMPERATURE_UNITS_PER_CENTIGRADES;
+               temp =3D temp & 0x1ff;
+               temp *=3D SMU11_TEMPERATURE_UNITS_PER_CENTIGRADES;

-       *value =3D temp;
+               *value =3D temp;
+               break;
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
+               *value =3D metrics.TemperatureEdge *
+                       PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+               break;
+       case AMDGPU_PP_SENSOR_MEM_TEMP:
+               *value =3D metrics.TemperatureHBM *
+                       PP_TEMPERATURE_UNITS_PER_CENTIGRADES;
+               break;
+       default:
+               pr_err("Invalid sensor for retrieving temp\n");
+               return -EINVAL;
+       }

        return 0;
 }
@@ -1235,8 +1285,10 @@ static int smu_v11_0_read_sensor(struct smu_context =
*smu,
                ret =3D smu_get_current_clk_freq(smu, PPCLK_GFXCLK, (uint32=
_t *)data);
                *size =3D 4;
                break;
-       case AMDGPU_PP_SENSOR_GPU_TEMP:
-               ret =3D smu_v11_0_thermal_get_temperature(smu, (uint32_t *)=
data);
+       case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
+       case AMDGPU_PP_SENSOR_MEM_TEMP:
+               ret =3D smu_v11_0_thermal_get_temperature(smu, sensor, (uin=
t32_t *)data);
                *size =3D 4;
                break;
        case AMDGPU_PP_SENSOR_GPU_POWER:
--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180993535A9C4563EBAA66B6F7080BN6PR12MB1809namp_
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
<b>Sent:</b> Tuesday, May 14, 2019 7:19 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: support sw smu hotspot and m=
emory temperature retrieval</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Support hotspot and memory temperature retrieval on sw smu routine.<br>
<br>
Change-Id: If2ed1e2835f4b158a4a6d93aee8b358af18b9bfc<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |&nbsp; 3 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp; | 7=
4 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;---<br>
&nbsp;2 files changed, 66 insertions(&#43;), 11 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h<br>
index aa8d81f4111e..02c965d64256 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
@@ -36,6 &#43;36,9 @@<br>
&nbsp;#define smnMP0_FW_INTF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x30101c0<br>
&nbsp;#define smnMP1_PUB_CTRL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 0x3010b14<br>
<br>
&#43;#define TEMP_RANGE_MIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0)<br>
&#43;#define TEMP_RANGE_MAX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (80 * 1000)<br>
&#43;<br>
&nbsp;struct smu_11_0_max_sustainable_clocks {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t display_clock;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t phy_clock;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index 738ae1d2ef17..0eea93c8dff7 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -1011,9 &#43;1011,20 @@ static int smu_v11_0_get_current_clk_freq(struct=
 smu_context *smu, uint32_t clk_<br>
&nbsp;static int smu_v11_0_get_thermal_range(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct PP_TemperatureRange *range)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu-&gt;sm=
u_table.driver_pptable;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(range, &amp;SMU7ThermalWi=
thDelayPolicy[0], sizeof(struct PP_TemperatureRange));<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D smu-&gt;smu_table.s=
oftware_shutdown_temp *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D pptable-&gt;Ted=
geLimit *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; PP_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;edge_emergency_max =3D =
(pptable-&gt;TedgeLimit &#43; CTF_OFFSET_EDGE) *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; PP_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_crit_max =3D pp=
table-&gt;ThotspotLimit *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; PP_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_emergency_max =
=3D (pptable-&gt;ThotspotLimit &#43; CTF_OFFSET_HOTSPOT) *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; PP_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_crit_max =3D pptabl=
e-&gt;ThbmLimit *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; PP_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_emergency_max =3D (=
pptable-&gt;ThbmLimit &#43; CTF_OFFSET_HBM)*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; PP_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
@@ -1078,7 &#43;1089,16 @@ static int smu_v11_0_set_thermal_fan_table(struc=
t smu_context *smu)<br>
&nbsp;static int smu_v11_0_start_thermal_control(struct smu_context *smu)<b=
r>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct PP_TemperatureRange range;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct PP_TemperatureRange range =
=3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MIN,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MAX,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MAX,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MIN,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MAX,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MAX,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MIN,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MAX,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; TEMP_RANGE_MAX};<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D s=
mu-&gt;adev;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_v11_0_get_thermal_range(smu,=
 &amp;range);<br>
@@ -1098,6 &#43;1118,13 @@ static int smu_v11_0_start_thermal_control(struc=
t smu_context *smu)<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_temp=
 =3D range.min;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_temp=
 =3D range.max;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_edge_=
emergency_temp =3D range.edge_emergency_max;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_hotsp=
ot_temp =3D range.hotspot_min;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_hotsp=
ot_crit_temp =3D range.hotspot_crit_max;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_hotsp=
ot_emergency_temp =3D range.hotspot_emergency_max;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_mem_t=
emp =3D range.mem_min;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_mem_c=
rit_temp =3D range.mem_crit_max;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_mem_e=
mergency_temp =3D range.mem_emergency_max;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
@@ -1151,22 &#43;1178,45 @@ static int smu_v11_0_get_current_activity_perce=
nt(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
<br>
-static int smu_v11_0_thermal_get_temperature(struct smu_context *smu, uint=
32_t *value)<br>
&#43;static int smu_v11_0_thermal_get_temperature(struct smu_context *smu,<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pp_sensors sensor,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *value)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D s=
mu-&gt;adev;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SmuMetrics_t metrics;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t temp =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -EINVAL;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp =3D RREG32_SOC15(THM, 0, mmCG_MU=
LT_THERMAL_STATUS);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp =3D (temp &amp; CG_MULT_THERMAL_=
STATUS__CTF_TEMP_MASK) &gt;&gt;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CG_MULT_THERMAL_=
STATUS__CTF_TEMP__SHIFT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_v11_0_get_metrics_tab=
le(smu, &amp;metrics);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (sensor) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTSPOT_TEM=
P:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; temp =3D RREG32_SOC15(THM, 0, mmCG_MULT_THERMAL_STATUS);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; temp =3D (temp &amp; CG_MULT_THERMAL_STATUS__CTF_TEMP_MASK) =
&gt;&gt;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CG_MULT_THERMAL_STATUS__CTF_TEMP__SHIFT=
;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp =3D temp &amp; 0x1ff;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temp *=3D SMU11_TEMPERATURE_UNITS_PER=
_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; temp =3D temp &amp; 0x1ff;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; temp *=3D SMU11_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D temp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D temp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.TemperatureEdge *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_TEMPERATU=
RE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_TEMP:<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.TemperatureHBM *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_TEMPERATU=
RE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;Invalid sensor for retrieving temp\n&quot;);<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
@@ -1235,8 &#43;1285,10 @@ static int smu_v11_0_read_sensor(struct smu_cont=
ext *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ret =3D smu_get_current_clk_freq(smu, PPCLK_GFXCLK, (uint32=
_t *)data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TEMP:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_v11_0_thermal_get_temperature(smu, (uint32_t *)data)=
;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTSPOT_TEM=
P:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_TEMP:<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_v11_0_thermal_get_temperature(smu, sensor, (uint=
32_t *)data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_POWER:=
<br>
--<br>
2.21.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180993535A9C4563EBAA66B6F7080BN6PR12MB1809namp_--

--===============0286548877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0286548877==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1920290073
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 13:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9A1893C9;
	Fri, 16 Aug 2019 11:04:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740078.outbound.protection.outlook.com [40.107.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4D89241
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 11:04:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfBiU/U1Tq6Oh8g9rbaBJCRl/uTiaZcIM0+PA9/x+cMeRPM1639HjaDdA2QRg7iXARx63VQ+Fm26WMZ2LnnLEWkVHtf8ORcm/WOhkNS0JfSROzprhhIZfjiXbK1I8TKMuIQFvZmhGkVZEJ/JsCBq7FKKHR6b/VvvwevfEEZpEZWfHmAEEWLUkjJXTYgIG297A+ihv7N+KJZhpTep4ZyIkYLIcacgdXtkWENK/gW24q4WhLAHqDy57cEP+xTiP2puM+AnuZI+xoMIckMflV+E9C7DBPkxl/dF8I4rpQ0q243xLhR6UYNggNY4IJPZBOtw/8GOKImWugYjr+qJs9urOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a2vU/Px70sNv/S3XICxL0nqR7JvIoxuDlYaWRw8sAk=;
 b=Ru8HvtvvOQLCb6cmsOpuNbGYYjyyg1PphSJ7BQ757aTuXo31QG27MYaKsmFPV0KiFMf4e6bwsslEqZBbvURep1K9tqtDjDQrluJO+ThjTbi/2+TFw44Eqbwdmzf4wdh9uNo5RX9VLqgPeuCUm7e5GT5IVqLNuPNODxcjtaXXHypDpN/GqEp3m8+FWiFizSwa2l0tdJzlxzBA3yCvSb/QsYJzXy9AVL8q5wvpMu48A6hdE2ywNdCQZg7LQU47YmholN+F76CMXg4F8T+njKwXZJSCWATK0YeLgdGt9OxCu7hZWcx2+JpqGFqwDcrQ0wPQ4zb4DvreL7E2XY2h9evvJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4176.namprd12.prod.outlook.com (52.135.49.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 11:04:27 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 11:04:27 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: correct SW smu11 thermal range settings
Thread-Topic: [PATCH] drm/amd/powerplay: correct SW smu11 thermal range
 settings
Thread-Index: AQHVVBV03PGSKtC2PUWkHX0qZgm8jab9mM0o
Date: Fri, 16 Aug 2019 11:04:27 +0000
Message-ID: <MN2PR12MB3296E3E1C79504DD56058410A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190816093144.21892-1-evan.quan@amd.com>
In-Reply-To: <20190816093144.21892-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c19517f-3a07-4bd3-9f7d-08d722398121
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4176; 
x-ms-traffictypediagnostic: MN2PR12MB4176:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4176E7D297764E7AF13E925EA2AF0@MN2PR12MB4176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(66066001)(19627405001)(102836004)(256004)(53546011)(99286004)(6506007)(33656002)(7696005)(81156014)(14444005)(229853002)(7736002)(8936002)(8676002)(74316002)(76176011)(81166006)(86362001)(53936002)(3846002)(6116002)(6436002)(2501003)(25786009)(71200400001)(2906002)(6246003)(71190400001)(64756008)(66446008)(55016002)(5660300002)(186003)(66476007)(66556008)(66946007)(966005)(9686003)(316002)(110136005)(6306002)(54896002)(236005)(606006)(105004)(26005)(446003)(14454004)(478600001)(476003)(76116006)(91956017)(11346002)(52536014)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4176;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WHoFCXCwnON1NeVrmCsCi7p8hmfVpRiNn8lyVZ8BRxwp6PCp5O74/OL7xAH+aktMNB+kZy9Sa4Xe+49kZ5GQJnSaX/CfBn6xXeW7VTAz+W2B5aPJNHxpMh2Mhk2DmR13KdLDxAq9O2YWIhqFXSQgoR/MQj745ZFeaBPcZlj3hJRHH5pDRbJJ6Q3zwsgVeZvIR738bOdGoPZZvIKciyYiDe/daIn7OOKS3diQ0DiiY+BVzJARQ9FpM93P58z/hO54Nx7C8d1K9HQBjOL6socoieOQndkAh1UZ4J8fIfEF1LJ4lAer0sA5bGPDh6wkH+Hp5MPjNBF8xBg0/kLxpEYiMVI9+Eh2b7UEUNKGhi5fg8DRTljY3yAQBaXIA6kZM3edM9uEtjluq6mtNbq5YLUezFGygiqbZsjAQJiE9MGFxHc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c19517f-3a07-4bd3-9f7d-08d722398121
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 11:04:27.0199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUbQkIQIY9GxAbq0QBzE63F0ZXRTM8+xH536FLUQFYjUGHYmuHloyYiWR3xbR3Ih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0a2vU/Px70sNv/S3XICxL0nqR7JvIoxuDlYaWRw8sAk=;
 b=Y2imGVNC4a+gEu52pVdKWHFCY4kKjR/+pN+NHkkS+Q6K1xj/S4W5o194NlueB/IdCRn+G2StQ+zUsUWz5TVGS9hg6LaO2ULOdHE3NlINTI6gBWwvD4mPp1Wj5I1tauEhXFE28Cl50hLCW1MlawoNWgAPLWD7xccOFcxh8jsjlnU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0972715297=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0972715297==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296E3E1C79504DD56058410A2AF0MN2PR12MB3296namp_"

--_000_MN2PR12MB3296E3E1C79504DD56058410A2AF0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Evan,

the temperature min value should be 0, not -273 on smu11.
you can refrence window driver code or register spec.
        output_ptr->operating_temperature_min_Limit =3D 0;
        output_ptr->operating_temperature_max_Limit =3D ppt_info->software_=
shutdown_temp;
and in smu11, the thermal control has a 8bit register to set min and max va=
lue, and the unit is temperature.
so there is something wrong with this patch.

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Friday, August 16, 2019 5:31 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amd/powerplay: correct SW smu11 thermal range settings

Problems with current settings:
1. The min value was overrided to 0 on Vega20 & Navi10. While
   the expected should be -273.15 C.
2. The thermal min/max threshold was output in wrong unit on
   Navi10 & Arcturus. As TEMP_RANGE_MIN/MAX is already in
   millicelsius. And "*1000" in smu_v11_0_start_thermal_control
   makes the output wrongly.

Change-Id: I2f1866edd1baf264f521310343f492eaede26c33
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c  | 10 ----
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |  6 +++
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    |  5 +-
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 51 +++++++------------
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    | 20 +++++---
 5 files changed, 38 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index 4060607fbb35..1a1f64a9e1e0 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -880,23 +880,14 @@ static int arcturus_force_clk_levels(struct smu_conte=
xt *smu,
         return ret;
 }

-static const struct smu_temperature_range arcturus_thermal_policy[] =3D
-{
-       {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 990=
00},
-       { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 1=
20000},
-};
-
 static int arcturus_get_thermal_temperature_range(struct smu_context *smu,
                                                 struct smu_temperature_ran=
ge *range)
 {
-
         PPTable_t *pptable =3D smu->smu_table.driver_pptable;

         if (!range)
                 return -EINVAL;

-       memcpy(range, &arcturus_thermal_policy[0], sizeof(struct smu_temper=
ature_range));
-
         range->max =3D pptable->TedgeLimit *
                 SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
         range->edge_emergency_max =3D (pptable->TedgeLimit + CTF_OFFSET_ED=
GE) *
@@ -910,7 +901,6 @@ static int arcturus_get_thermal_temperature_range(struc=
t smu_context *smu,
         range->mem_emergency_max =3D (pptable->TmemLimit + CTF_OFFSET_HBM)=
*
                 SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;

-
         return 0;
 }

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h
index 0a22fa48ff5a..59b2045e37e4 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -64,6 +64,12 @@
 #define WORKLOAD_MAP(profile, workload) \
         [profile] =3D {1, (workload)}

+static const struct smu_temperature_range smu11_thermal_policy[] =3D
+{
+       {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 990=
00},
+       { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 1=
20000},
+};
+
 struct smu_11_0_cmn2aisc_mapping {
         int     valid_mapping;
         int     map_to;
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index d7d4186b762f..e804d18f61d0 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1505,9 +1505,8 @@ static int navi10_get_thermal_temperature_range(struc=
t smu_context *smu,
         if (!range || !powerplay_table)
                 return -EINVAL;

-       /* The unit is temperature */
-       range->min =3D 0;
-       range->max =3D powerplay_table->software_shutdown_temp;
+       range->max =3D powerplay_table->software_shutdown_temp *
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;

         return 0;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index df7b65360ac7..5f5fd3a88e48 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1125,23 +1125,17 @@ static int smu_v11_0_get_current_clk_freq(struct sm=
u_context *smu,
 }

 static int smu_v11_0_set_thermal_range(struct smu_context *smu,
-                                      struct smu_temperature_range *range)
+                                      struct smu_temperature_range range)
 {
         struct amdgpu_device *adev =3D smu->adev;
         int low =3D SMU_THERMAL_MINIMUM_ALERT_TEMP;
         int high =3D SMU_THERMAL_MAXIMUM_ALERT_TEMP;
         uint32_t val;

-       if (!range)
-               return -EINVAL;
-
-       if (low < range->min)
-               low =3D range->min;
-       if (high > range->max)
-               high =3D range->max;
-
-       low =3D max(SMU_THERMAL_MINIMUM_ALERT_TEMP, range->min);
-       high =3D min(SMU_THERMAL_MAXIMUM_ALERT_TEMP, range->max);
+       low =3D max(SMU_THERMAL_MINIMUM_ALERT_TEMP,
+                       range.min / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES);
+       high =3D min(SMU_THERMAL_MAXIMUM_ALERT_TEMP,
+                       range.max / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES);

         if (low > high)
                 return -EINVAL;
@@ -1177,27 +1171,20 @@ static int smu_v11_0_enable_thermal_alert(struct sm=
u_context *smu)
 static int smu_v11_0_start_thermal_control(struct smu_context *smu)
 {
         int ret =3D 0;
-       struct smu_temperature_range range =3D {
-               TEMP_RANGE_MIN,
-               TEMP_RANGE_MAX,
-               TEMP_RANGE_MAX,
-               TEMP_RANGE_MIN,
-               TEMP_RANGE_MAX,
-               TEMP_RANGE_MAX,
-               TEMP_RANGE_MIN,
-               TEMP_RANGE_MAX,
-               TEMP_RANGE_MAX};
+       struct smu_temperature_range range;
         struct amdgpu_device *adev =3D smu->adev;

         if (!smu->pm_enabled)
                 return ret;

+       memcpy(&range, &smu11_thermal_policy[0], sizeof(struct smu_temperat=
ure_range));
+
         ret =3D smu_get_thermal_temperature_range(smu, &range);
         if (ret)
                 return ret;

         if (smu->smu_table.thermal_controller_type) {
-               ret =3D smu_v11_0_set_thermal_range(smu, &range);
+               ret =3D smu_v11_0_set_thermal_range(smu, range);
                 if (ret)
                         return ret;

@@ -1210,17 +1197,15 @@ static int smu_v11_0_start_thermal_control(struct s=
mu_context *smu)
                         return ret;
         }

-       adev->pm.dpm.thermal.min_temp =3D range.min * SMU_TEMPERATURE_UNITS=
_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_temp =3D range.max * SMU_TEMPERATURE_UNITS=
_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_edge_emergency_temp =3D range.edge_emergen=
cy_max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.min_hotspot_temp =3D range.hotspot_min * SMU_T=
EMPERATURE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_hotspot_crit_temp =3D range.hotspot_crit_m=
ax * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_hotspot_emergency_temp =3D range.hotspot_e=
mergency_max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.min_mem_temp =3D range.mem_min * SMU_TEMPERATU=
RE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_mem_crit_temp =3D range.mem_crit_max * SMU=
_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_mem_emergency_temp =3D range.mem_emergency=
_max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.min_temp =3D range.min * SMU_TEMPERATURE_UNITS=
_PER_CENTIGRADES;
-       adev->pm.dpm.thermal.max_temp =3D range.max * SMU_TEMPERATURE_UNITS=
_PER_CENTIGRADES;
+       adev->pm.dpm.thermal.min_temp =3D range.min;
+       adev->pm.dpm.thermal.max_temp =3D range.max;
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
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index acf075393c13..e14363182691 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3113,14 +3113,18 @@ static int vega20_get_thermal_temperature_range(str=
uct smu_context *smu,
         if (!range || !powerplay_table)
                 return -EINVAL;

-       /* The unit is temperature */
-       range->min =3D 0;
-       range->max =3D powerplay_table->usSoftwareShutdownTemp;
-       range->edge_emergency_max =3D (pptable->TedgeLimit + CTF_OFFSET_EDG=
E);
-       range->hotspot_crit_max =3D pptable->ThotspotLimit;
-       range->hotspot_emergency_max =3D (pptable->ThotspotLimit + CTF_OFFS=
ET_HOTSPOT);
-       range->mem_crit_max =3D pptable->ThbmLimit;
-       range->mem_emergency_max =3D (pptable->ThbmLimit + CTF_OFFSET_HBM);
+       range->max =3D powerplay_table->usSoftwareShutdownTemp *
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->edge_emergency_max =3D (pptable->TedgeLimit + CTF_OFFSET_EDG=
E) *
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->hotspot_crit_max =3D pptable->ThotspotLimit *
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->hotspot_emergency_max =3D (pptable->ThotspotLimit + CTF_OFFS=
ET_HOTSPOT) *
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->mem_crit_max =3D pptable->ThbmLimit *
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       range->mem_emergency_max =3D (pptable->ThbmLimit + CTF_OFFSET_HBM) =
*
+               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;


         return 0;
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296E3E1C79504DD56058410A2AF0MN2PR12MB3296namp_
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
Hi Evan,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
the temperature min value should be 0, not -273 on smu11.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
you can refrence window driver code or register spec.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<i><span>&nbsp; &nbsp; &nbsp; &nbsp; output_ptr-&gt;operating_temperature_m=
in_Limit =3D 0; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
<br>
</span><span>&nbsp; &nbsp; &nbsp; &nbsp; output_ptr-&gt;operating_temperatu=
re_max_Limit =3D ppt_info-&gt;software_shutdown_temp;</span></i><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
and in smu11, the thermal control has a 8bit register to set min and max va=
lue, and th<span>e unit is temperature.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>so there is something wrong with this patch.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span></span>
<div><br>
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Friday, August 16, 2019 5:31 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: correct SW smu11 thermal range s=
ettings</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Problems with current settings:<br>
1. The min value was overrided to 0 on Vega20 &amp; Navi10. While<br>
&nbsp;&nbsp; the expected should be -273.15 C.<br>
2. The thermal min/max threshold was output in wrong unit on<br>
&nbsp;&nbsp; Navi10 &amp; Arcturus. As TEMP_RANGE_MIN/MAX is already in<br>
&nbsp;&nbsp; millicelsius. And &quot;*1000&quot; in smu_v11_0_start_thermal=
_control<br>
&nbsp;&nbsp; makes the output wrongly.<br>
<br>
Change-Id: I2f1866edd1baf264f521310343f492eaede26c33<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c&nbsp; | 10 ----<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h |&nbsp; 6 &#43;&#43;&#4=
3;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp; |&nbsp; =
5 &#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp; | 5=
1 &#43;&#43;&#43;&#43;&#43;&#43;&#43;------------<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp; | 20 &#4=
3;&#43;&#43;&#43;&#43;---<br>
&nbsp;5 files changed, 38 insertions(&#43;), 54 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index 4060607fbb35..1a1f64a9e1e0 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -880,23 &#43;880,14 @@ static int arcturus_force_clk_levels(struct smu_c=
ontext *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
-static const struct smu_temperature_range arcturus_thermal_policy[] =3D<br=
>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-273150,&nbsp; 99000, 99000, -273150=
, 99000, 99000, -273150, 99000, 99000},<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 120000, 120000, 120000, 120000, 120=
000, 120000, 120000, 120000, 120000},<br>
-};<br>
-<br>
&nbsp;static int arcturus_get_thermal_temperature_range(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_=
temperature_range *range)<br>
&nbsp;{<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu=
-&gt;smu_table.driver_pptable;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(range, &amp;arcturus_thermal_p=
olicy[0], sizeof(struct smu_temperature_range));<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D pptable-=
&gt;TedgeLimit *<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;edge_emergency_m=
ax =3D (pptable-&gt;TedgeLimit &#43; CTF_OFFSET_EDGE) *<br>
@@ -910,7 &#43;901,6 @@ static int arcturus_get_thermal_temperature_range(s=
truct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_emergency_ma=
x =3D (pptable-&gt;TmemLimit &#43; CTF_OFFSET_HBM)*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&nbsp;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h<br>
index 0a22fa48ff5a..59b2045e37e4 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
@@ -64,6 &#43;64,12 @@<br>
&nbsp;#define WORKLOAD_MAP(profile, workload) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [profile] =3D {1, (workloa=
d)}<br>
&nbsp;<br>
&#43;static const struct smu_temperature_range smu11_thermal_policy[] =3D<b=
r>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-273150,&nbsp; 99000, 99000, -27=
3150, 99000, 99000, -273150, 99000, 99000},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 120000, 120000, 120000, 120000,=
 120000, 120000, 120000, 120000, 120000},<br>
&#43;};<br>
&#43;<br>
&nbsp;struct smu_11_0_cmn2aisc_mapping {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp=
; valid_mapping;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp=
; map_to;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index d7d4186b762f..e804d18f61d0 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1505,9 &#43;1505,8 @@ static int navi10_get_thermal_temperature_range(s=
truct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range || !powerplay_t=
able)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The unit is temperature */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;min =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D powerplay_table-&gt=
;software_shutdown_temp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D powerplay_table=
-&gt;software_shutdown_temp *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index df7b65360ac7..5f5fd3a88e48 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -1125,23 &#43;1125,17 @@ static int smu_v11_0_get_current_clk_freq(struc=
t smu_context *smu,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int smu_v11_0_set_thermal_range(struct smu_context *smu,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
truct smu_temperature_range *range)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; struct smu_temperature_range range)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D smu-&gt;adev;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int low =3D SMU_THERMAL_MI=
NIMUM_ALERT_TEMP;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int high =3D SMU_THERMAL_M=
AXIMUM_ALERT_TEMP;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t val;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (low &lt; range-&gt;min)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; low =3D range-&gt;min;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (high &gt; range-&gt;max)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; high =3D range-&gt;max;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low =3D max(SMU_THERMAL_MINIMUM_ALERT=
_TEMP, range-&gt;min);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; high =3D min(SMU_THERMAL_MAXIMUM_ALER=
T_TEMP, range-&gt;max);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low =3D max(SMU_THERMAL_MINIMUM_A=
LERT_TEMP,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range.min / =
SMU_TEMPERATURE_UNITS_PER_CENTIGRADES);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; high =3D min(SMU_THERMAL_MAXIMUM_=
ALERT_TEMP,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range.max / =
SMU_TEMPERATURE_UNITS_PER_CENTIGRADES);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (low &gt; high)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
@@ -1177,27 &#43;1171,20 @@ static int smu_v11_0_enable_thermal_alert(struc=
t smu_context *smu)<br>
&nbsp;static int smu_v11_0_start_thermal_control(struct smu_context *smu)<b=
r>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_temperature_range range =
=3D {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MIN,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MAX,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MAX,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MIN,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MAX,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MAX,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MIN,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MAX,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TEMP_RANGE_MAX};<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_temperature_range rang=
e;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D smu-&gt;adev;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;range, &amp;smu11_the=
rmal_policy[0], sizeof(struct smu_temperature_range));<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_thermal_te=
mperature_range(smu, &amp;range);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;smu_table.ther=
mal_controller_type) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ret =3D smu_v11_0_set_thermal_range(smu, &amp;range);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_v11_0_set_thermal_range(smu, range);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
&nbsp;<br>
@@ -1210,17 &#43;1197,15 @@ static int smu_v11_0_start_thermal_control(stru=
ct smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_temp =3D =
range.min * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_temp =3D =
range.max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_edge_emer=
gency_temp =3D range.edge_emergency_max * SMU_TEMPERATURE_UNITS_PER_CENTIGR=
ADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_hotspot_t=
emp =3D range.hotspot_min * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_hotspot_c=
rit_temp =3D range.hotspot_crit_max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_hotspot_e=
mergency_temp =3D range.hotspot_emergency_max * SMU_TEMPERATURE_UNITS_PER_C=
ENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_mem_temp =
=3D range.mem_min * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_mem_crit_=
temp =3D range.mem_crit_max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_mem_emerg=
ency_temp =3D range.mem_emergency_max * SMU_TEMPERATURE_UNITS_PER_CENTIGRAD=
ES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_temp =3D =
range.min * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_temp =3D =
range.max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_temp =
=3D range.min;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_temp =
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
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index acf075393c13..e14363182691 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -3113,14 &#43;3113,18 @@ static int vega20_get_thermal_temperature_range=
(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range || !powerplay_t=
able)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The unit is temperature */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;min =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D powerplay_table-&gt=
;usSoftwareShutdownTemp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;edge_emergency_max =3D (ppt=
able-&gt;TedgeLimit &#43; CTF_OFFSET_EDGE);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_crit_max =3D pptabl=
e-&gt;ThotspotLimit;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_emergency_max =3D (=
pptable-&gt;ThotspotLimit &#43; CTF_OFFSET_HOTSPOT);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_crit_max =3D pptable-&g=
t;ThbmLimit;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_emergency_max =3D (ppta=
ble-&gt;ThbmLimit &#43; CTF_OFFSET_HBM);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D powerplay_table=
-&gt;usSoftwareShutdownTemp *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;edge_emergency_max =3D =
(pptable-&gt;TedgeLimit &#43; CTF_OFFSET_EDGE) *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_crit_max =3D pp=
table-&gt;ThotspotLimit *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_emergency_max =
=3D (pptable-&gt;ThotspotLimit &#43; CTF_OFFSET_HOTSPOT) *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_crit_max =3D pptabl=
e-&gt;ThbmLimit *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_emergency_max =3D (=
pptable-&gt;ThbmLimit &#43; CTF_OFFSET_HBM) *<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
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

--_000_MN2PR12MB3296E3E1C79504DD56058410A2AF0MN2PR12MB3296namp_--

--===============0972715297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0972715297==--

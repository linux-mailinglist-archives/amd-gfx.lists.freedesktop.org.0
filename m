Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9A7156F
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 11:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B620F89D79;
	Tue, 23 Jul 2019 09:41:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9218089D79
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 09:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ild6G0Ko6moPlWgwwM+zOar9KVOAJb3qNb9qUdSrYRJmja+bU628jS/WF33tgWBgdsC+vRwcS527zzJ23tWhsJXnQgP6IqXIHviU7rr8kZhiuM9Xxq5A9rEDy2jHJKnd+/vkmRzY2zqfDtKeGRnbVqTkrz2nzsC1VnSN8qb4HDsI/mhjLa/ySROCFMqNzpsONJHOlGHQuVnMHlhvoPszFxuze4nSljV/dBq+DF9yv4Tb2UM+2BPfPHjnjziI0Pmni4yU67gFLP+pZBj412PVxa8dL5NZ3r3zH5WsaJ7r2gmUmznfUZgSFPvQfb0Po47VmLaHNJcBqi18FrNy6Q/Jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhCqiznqeuFzkEztgt7VJV6XSsODoT6/HtBBUT8PG1U=;
 b=bnJOU5bgOEDEKphYcVYrTtormErpFoerwA4PdbfjedWbMHyEFBhdKXaCUtrh1fevKkbVqsSlBL6y35HBZCWbXyhiYl5FH//1wqTnqmWwxlzfCBFAluG/sdA17T6GQdMsiSnhBnh+u8ORtdiAh8/h8iuYCzlGjVBpAGeNbX3/dSNFJradXJ2lvSHlT2t7Z43AvwXLrJlOmN8lqg0rgMO/YZFQHb82GSLllDdN1JFRDVB4/2fCBUdedROSr0+1X13mG8jqCtruI9r2U6o2KLJKYGgcIiq4lt4p6KEGSyPFkfqq5ZOwUtqIUngAYu0jAJvHx5V4VePj90Ysy9We99GIvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3518.namprd12.prod.outlook.com (20.179.82.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 09:41:49 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::40cc:2c68:41f3:c5b5%7]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 09:41:49 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: add callback function of
 get_thermal_temperature_range
Thread-Topic: [PATCH] drm/amd/powerplay: add callback function of
 get_thermal_temperature_range
Thread-Index: AQHVQTlyjZ5kvroa60KvH7CerObgK6bX8S5YgAACBZA=
Date: Tue, 23 Jul 2019 09:41:49 +0000
Message-ID: <MN2PR12MB359856831E7B51C3ACC751F98EC70@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <20190723093109.2701-1-kevin1.wang@amd.com>
 <MN2PR12MB3296C871CFC59740F88F4407A2C70@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296C871CFC59740F88F4407A2C70@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eea90ff8-159e-47c7-7231-08d70f51fc72
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3518; 
x-ms-traffictypediagnostic: MN2PR12MB3518:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR12MB3518B45BAC401669DA62669D8EC70@MN2PR12MB3518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(199004)(189003)(790700001)(86362001)(68736007)(3846002)(316002)(6116002)(99286004)(110136005)(4326008)(11346002)(446003)(6506007)(53546011)(25786009)(6246003)(76176011)(2501003)(2906002)(7696005)(102836004)(33656002)(26005)(55016002)(76116006)(6306002)(9686003)(66946007)(66476007)(66446008)(64756008)(66556008)(236005)(186003)(6436002)(54896002)(476003)(53936002)(81156014)(8936002)(256004)(486006)(52536014)(14454004)(7736002)(74316002)(66066001)(71200400001)(8676002)(229853002)(5660300002)(71190400001)(81166006)(478600001)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3518;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fE6rexSXR+u8aAHx6LJCFJrZ6Rrc0wTtZ0pFlUxB83ZwrOHZ6ukydsXdbvtMlY03hBN///dEloRutjvwac3j9sc4yrDidixxw2CRqgynoH8i28RS0Idhz2Q4BCGjg/xMmqY8tM/tAW+VncWJvgDw1+ARQBIPHhPqknTWsGPq3mKGK3fBC4Yeut82e2cR9lasUR4P2UexuUxuxoVyRgXtGltd5s1lsDrPg5OlfEiZHXuIge5g7feyMjYzAWZKHqjqRE05UiNJBHc2GYQLJNJyqiXqsD2+7rZCV9ekSuFaOvkTm8KxXBsBxWSKOy2yW/6P4t1lBbZldzsBGH8OaOpcgv5/thRnEBUScPZccpyGjN6v2/xa1oP3jOnTrvrqm0dp8J7AtRWBZKdgmATLaR82hZXaptOXqUHx1sH30koFTbw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea90ff8-159e-47c7-7231-08d70f51fc72
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 09:41:49.7131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyfeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhCqiznqeuFzkEztgt7VJV6XSsODoT6/HtBBUT8PG1U=;
 b=GXXdyKk741Q2KqiOzgO2NNKqh5Jsz+eNHUL5TWpkAjKChAbzV5goXDL6WWLqmW3+H1Dnl3OZcolt9ORoKBUQdDXQJiJ6S0TAKLnguUph90pH5CHwjZw+6MXByiKNppNEbbgEDYqIl3ssAqRwhZakgbHMV4qM0mL+Y8ORHetz5lU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: multipart/mixed; boundary="===============1174685148=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1174685148==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB359856831E7B51C3ACC751F98EC70MN2PR12MB3598namp_"

--_000_MN2PR12MB359856831E7B51C3ACC751F98EC70MN2PR12MB3598namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kenneth Feng <kenneth.feng@amd.com<mailto:kenneth.feng@amd.com=
>>


From: Wang, Kevin(Yang)
Sent: Tuesday, July 23, 2019 5:36 PM
To: amd-gfx@lists.freedesktop.org; Feng, Kenneth <Kenneth.Feng@amd.com>
Cc: Huang, Ray <Ray.Huang@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: add callback function of get_therma=
l_temperature_range


@Feng, Kenneth<mailto:Kenneth.Feng@amd.com>



please help me review this patch, this patch is reveiwed before.

but this patch is missed from navi10 topic branch.



Best Regards,
Kevin

________________________________
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>
Sent: Tuesday, July 23, 2019 5:31:47 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com<mailto:Kenneth.Feng@amd.com>>; Huan=
g, Ray <Ray.Huang@amd.com<mailto:Ray.Huang@amd.com>>; Wang, Kevin(Yang) <Ke=
vin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; Feng, Kenneth <Kenneth.Feng=
@amd.com<mailto:Kenneth.Feng@amd.com>>
Subject: [PATCH] drm/amd/powerplay: add callback function of get_thermal_te=
mperature_range

1. the thermal temperature is asic related data, move the code logic to
xxx_ppt.c.
2. replace data structure PP_TemperatureRange with
smu_temperature_range.
3. change temperature uint from temp*1000 to temp (temperature uint).

Signed-off-by: Kevin Wang <kevin1.wang@amd.com<mailto:kevin1.wang@amd.com>>
Signed-off-by: Kenneth Feng <kenneth.feng@amd.com<mailto:kenneth.feng@amd.c=
om>>
Acked-by: Huang Rui <ray.huang@amd.com<mailto:ray.huang@amd.com>>
---
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  1 -
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c    | 17 ++++++++++
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 18 ++++++----
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c    | 34 ++++++-------------
 4 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index 34093ddca105..7105f8041088 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -439,7 +439,6 @@ struct smu_table_context
         struct smu_table                *tables;
         uint32_t                        table_count;
         struct smu_table                memory_pool;
-       uint16_t                        software_shutdown_temp;
         uint8_t                         thermal_controller_type;
         uint16_t                        TDPODLimit;

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 46e2913e4af4..a4c4d4997189 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1638,6 +1638,22 @@ static int navi10_set_performance_level(struct smu_c=
ontext *smu, enum amd_dpm_fo
         return ret;
 }

+static int navi10_get_thermal_temperature_range(struct smu_context *smu,
+                                               struct smu_temperature_rang=
e *range)
+{
+       struct smu_table_context *table_context =3D &smu->smu_table;
+       struct smu_11_0_powerplay_table *powerplay_table =3D table_context-=
>power_play_table;
+
+       if (!range || !powerplay_table)
+               return -EINVAL;
+
+       /* The unit is temperature */
+       range->min =3D 0;
+       range->max =3D powerplay_table->software_shutdown_temp;
+
+       return 0;
+}
+
 static const struct pptable_funcs navi10_ppt_funcs =3D {
         .tables_init =3D navi10_tables_init,
         .alloc_dpm_context =3D navi10_allocate_dpm_context,
@@ -1674,6 +1690,7 @@ static const struct pptable_funcs navi10_ppt_funcs =
=3D {
         .get_ppfeature_status =3D navi10_get_ppfeature_status,
         .set_ppfeature_status =3D navi10_set_ppfeature_status,
         .set_performance_level =3D navi10_set_performance_level,
+       .get_thermal_temperature_range =3D navi10_get_thermal_temperature_r=
ange,
 };

 void navi10_set_ppt_funcs(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index 76bc157525d0..4ad9e0c5a637 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -1147,10 +1147,8 @@ static int smu_v11_0_set_thermal_range(struct smu_co=
ntext *smu,
                                        struct smu_temperature_range *range=
)
 {
         struct amdgpu_device *adev =3D smu->adev;
-       int low =3D SMU_THERMAL_MINIMUM_ALERT_TEMP *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       int high =3D SMU_THERMAL_MAXIMUM_ALERT_TEMP *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       int low =3D SMU_THERMAL_MINIMUM_ALERT_TEMP;
+       int high =3D SMU_THERMAL_MAXIMUM_ALERT_TEMP;
         uint32_t val;

         if (!range)
@@ -1161,6 +1159,9 @@ static int smu_v11_0_set_thermal_range(struct smu_con=
text *smu,
         if (high > range->max)
                 high =3D range->max;

+       low =3D max(SMU_THERMAL_MINIMUM_ALERT_TEMP, range->min);
+       high =3D min(SMU_THERMAL_MAXIMUM_ALERT_TEMP, range->max);
+
         if (low > high)
                 return -EINVAL;

@@ -1169,8 +1170,8 @@ static int smu_v11_0_set_thermal_range(struct smu_con=
text *smu,
         val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_IH_HW_ENA, =
1);
         val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_INTH_MASK, =
0);
         val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, THERM_INTL_MASK, =
0);
-       val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, DIG_THERM_INTH, (h=
igh / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES));
-       val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, DIG_THERM_INTL, (l=
ow / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES));
+       val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, DIG_THERM_INTH, (h=
igh & 0xff));
+       val =3D REG_SET_FIELD(val, THM_THERMAL_INT_CTRL, DIG_THERM_INTL, (l=
ow & 0xff));
         val =3D val & (~THM_THERMAL_INT_CTRL__THERM_TRIGGER_MASK_MASK);

         WREG32_SOC15(THM, 0, mmTHM_THERMAL_INT_CTRL, val);
@@ -1209,7 +1210,10 @@ static int smu_v11_0_start_thermal_control(struct sm=
u_context *smu)

         if (!smu->pm_enabled)
                 return ret;
+
         ret =3D smu_get_thermal_temperature_range(smu, &range);
+       if (ret)
+               return ret;

         if (smu->smu_table.thermal_controller_type) {
                 ret =3D smu_v11_0_set_thermal_range(smu, &range);
@@ -1234,6 +1238,8 @@ static int smu_v11_0_start_thermal_control(struct smu=
_context *smu)
         adev->pm.dpm.thermal.min_mem_temp =3D range.mem_min;
         adev->pm.dpm.thermal.max_mem_crit_temp =3D range.mem_crit_max;
         adev->pm.dpm.thermal.max_mem_emergency_temp =3D range.mem_emergenc=
y_max;
+       adev->pm.dpm.thermal.min_temp =3D range.min * SMU_TEMPERATURE_UNITS=
_PER_CENTIGRADES;
+       adev->pm.dpm.thermal.max_temp =3D range.max * SMU_TEMPERATURE_UNITS=
_PER_CENTIGRADES;

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index bcd0efaf7bbd..deb102ffedc2 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -463,7 +463,6 @@ static int vega20_store_powerplay_table(struct smu_cont=
ext *smu)
         memcpy(table_context->driver_pptable, &powerplay_table->smcPPTable=
,
                sizeof(PPTable_t));

-       table_context->software_shutdown_temp =3D powerplay_table->usSoftwa=
reShutdownTemp;
         table_context->thermal_controller_type =3D powerplay_table->ucTher=
malControllerType;
         table_context->TDPODLimit =3D le32_to_cpu(powerplay_table->OverDri=
ve8Table.ODSettingsMax[ATOM_VEGA20_ODSETTING_POWERPERCENTAGE]);

@@ -3235,35 +3234,24 @@ static int vega20_set_watermarks_table(struct smu_c=
ontext *smu,
         return 0;
 }

-static const struct smu_temperature_range vega20_thermal_policy[] =3D
-{
-       {-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 990=
00},
-       { 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 1=
20000},
-};
-
 static int vega20_get_thermal_temperature_range(struct smu_context *smu,
                                                 struct smu_temperature_ran=
ge*range)
 {
-
+       struct smu_table_context *table_context =3D &smu->smu_table;
+       ATOM_Vega20_POWERPLAYTABLE *powerplay_table =3D table_context->powe=
r_play_table;
         PPTable_t *pptable =3D smu->smu_table.driver_pptable;

-       if (!range)
+       if (!range || !powerplay_table)
                 return -EINVAL;

-       memcpy(range, &vega20_thermal_policy[0], sizeof(struct smu_temperat=
ure_range));
-
-       range->max =3D pptable->TedgeLimit *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       range->edge_emergency_max =3D (pptable->TedgeLimit + CTF_OFFSET_EDG=
E) *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       range->hotspot_crit_max =3D pptable->ThotspotLimit *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       range->hotspot_emergency_max =3D (pptable->ThotspotLimit + CTF_OFFS=
ET_HOTSPOT) *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       range->mem_crit_max =3D pptable->ThbmLimit *
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
-       range->mem_emergency_max =3D (pptable->ThbmLimit + CTF_OFFSET_HBM)*
-               SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+       /* The unit is temperature */
+       range->min =3D 0;
+       range->max =3D powerplay_table->usSoftwareShutdownTemp;
+       range->edge_emergency_max =3D (pptable->TedgeLimit + CTF_OFFSET_EDG=
E);
+       range->hotspot_crit_max =3D pptable->ThotspotLimit;
+       range->hotspot_emergency_max =3D (pptable->ThotspotLimit + CTF_OFFS=
ET_HOTSPOT);
+       range->mem_crit_max =3D pptable->ThbmLimit;
+       range->mem_emergency_max =3D (pptable->ThbmLimit + CTF_OFFSET_HBM);


         return 0;
--
2.22.0

--_000_MN2PR12MB359856831E7B51C3ACC751F98EC70MN2PR12MB3598namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p
	{mso-style-priority:99;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Reviewed-by: Kenneth Feng &lt;<a href=3D"mailto:k=
enneth.feng@amd.com">kenneth.feng@amd.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Wang, Kevin(Yang)
<br>
<b>Sent:</b> Tuesday, July 23, 2019 5:36 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org; Feng, Kenneth &lt;Kenneth.Feng@am=
d.com&gt;<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: add callback function of get=
_thermal_temperature_range<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"divtagdefaultwrapper">
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
a href=3D"mailto:Kenneth.Feng@amd.com">@Feng, Kenneth</a><o:p></o:p></span>=
</p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">p=
lease help me review this patch, this patch is reveiwed before.<o:p></o:p><=
/span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">b=
ut&nbsp;this patch is missed from navi10 topic branch.<o:p></o:p></span></p=
>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">B=
est Regards,<br>
Kevin<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Wang, =
Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com">Kevin1.Wang@amd.com<=
/a>&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 5:31:47 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kennet=
h.Feng@amd.com</a>&gt;; Huang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com"=
>Ray.Huang@amd.com</a>&gt;; Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.=
Wang@amd.com">Kevin1.Wang@amd.com</a>&gt;; Feng, Kenneth
 &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.Feng@amd.com</a>&gt;<b=
r>
<b>Subject:</b> [PATCH] drm/amd/powerplay: add callback function of get_the=
rmal_temperature_range</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">1. the thermal temperature is asic related data, move the code =
logic to<br>
xxx_ppt.c.<br>
2. replace data structure PP_TemperatureRange with<br>
smu_temperature_range.<br>
3. change temperature uint from temp*1000 to temp (temperature uint).<br>
<br>
Signed-off-by: Kevin Wang &lt;<a href=3D"mailto:kevin1.wang@amd.com">kevin1=
.wang@amd.com</a>&gt;<br>
Signed-off-by: Kenneth Feng &lt;<a href=3D"mailto:kenneth.feng@amd.com">ken=
neth.feng@amd.com</a>&gt;<br>
Acked-by: Huang Rui &lt;<a href=3D"mailto:ray.huang@amd.com">ray.huang@amd.=
com</a>&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&nbsp; =
1 -<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp; | 17 &#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp; | 1=
8 &#43;&#43;&#43;&#43;&#43;&#43;----<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp; | 34 &#4=
3;&#43;&#43;&#43;&#43;&#43;-------------<br>
&nbsp;4 files changed, 40 insertions(&#43;), 30 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index 34093ddca105..7105f8041088 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -439,7 &#43;439,6 @@ struct smu_table_context<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *tables;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_count;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memory_pool;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; software_shutdown_temp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; thermal_controller_type;=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TDPODLimit;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 46e2913e4af4..a4c4d4997189 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1638,6 &#43;1638,22 @@ static int navi10_set_performance_level(struct s=
mu_context *smu, enum amd_dpm_fo<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int navi10_get_thermal_temperature_range(struct smu_context *sm=
u,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_tempera=
ture_range *range)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *table_c=
ontext =3D &amp;smu-&gt;smu_table;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_11_0_powerplay_table *=
powerplay_table =3D table_context-&gt;power_play_table;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range || !powerplay_table)<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return -EINVAL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The unit is temperature */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;min =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D powerplay_table=
-&gt;software_shutdown_temp;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs navi10_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .tables_init =3D navi10_ta=
bles_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .alloc_dpm_context =3D nav=
i10_allocate_dpm_context,<br>
@@ -1674,6 &#43;1690,7 @@ static const struct pptable_funcs navi10_ppt_func=
s =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_ppfeature_status =3D =
navi10_get_ppfeature_status,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_ppfeature_status =3D =
navi10_set_ppfeature_status,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_performance_level =3D=
 navi10_set_performance_level,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_thermal_temperature_range =
=3D navi10_get_thermal_temperature_range,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void navi10_set_ppt_funcs(struct smu_context *smu)<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index 76bc157525d0..4ad9e0c5a637 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -1147,10 &#43;1147,8 @@ static int smu_v11_0_set_thermal_range(struct sm=
u_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; struct smu_temperature_range *range)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D smu-&gt;adev;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int low =3D SMU_THERMAL_MINIMUM_ALERT=
_TEMP *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int high =3D SMU_THERMAL_MAXIMUM_ALER=
T_TEMP *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int low =3D SMU_THERMAL_MINIMUM_A=
LERT_TEMP;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int high =3D SMU_THERMAL_MAXIMUM_=
ALERT_TEMP;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t val;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range)<br>
@@ -1161,6 &#43;1159,9 @@ static int smu_v11_0_set_thermal_range(struct smu=
_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (high &gt; range-&gt;ma=
x)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; high =3D range-&gt;max;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; low =3D max(SMU_THERMAL_MINIMUM_A=
LERT_TEMP, range-&gt;min);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; high =3D min(SMU_THERMAL_MAXIMUM_=
ALERT_TEMP, range-&gt;max);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (low &gt; high)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
@@ -1169,8 &#43;1170,8 @@ static int smu_v11_0_set_thermal_range(struct smu=
_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val,=
 THM_THERMAL_INT_CTRL, THERM_IH_HW_ENA, 1);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val,=
 THM_THERMAL_INT_CTRL, THERM_INTH_MASK, 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val,=
 THM_THERMAL_INT_CTRL, THERM_INTL_MASK, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val, THM_THERMA=
L_INT_CTRL, DIG_THERM_INTH, (high / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES))=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val, THM_THERMA=
L_INT_CTRL, DIG_THERM_INTL, (low / SMU_TEMPERATURE_UNITS_PER_CENTIGRADES));=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val, THM_TH=
ERMAL_INT_CTRL, DIG_THERM_INTH, (high &amp; 0xff));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D REG_SET_FIELD(val, THM_TH=
ERMAL_INT_CTRL, DIG_THERM_INTL, (low &amp; 0xff));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D val &amp; (~THM_TH=
ERMAL_INT_CTRL__THERM_TRIGGER_MASK_MASK);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(THM, 0, mmTHM=
_THERMAL_INT_CTRL, val);<br>
@@ -1209,7 &#43;1210,10 @@ static int smu_v11_0_start_thermal_control(struc=
t smu_context *smu)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_thermal_te=
mperature_range(smu, &amp;range);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;smu_table.ther=
mal_controller_type) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_v11_0_set_thermal_range(smu, &amp;range);=
<br>
@@ -1234,6 &#43;1238,8 @@ static int smu_v11_0_start_thermal_control(struct=
 smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.mi=
n_mem_temp =3D range.mem_min;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.ma=
x_mem_crit_temp =3D range.mem_crit_max;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.ma=
x_mem_emergency_temp =3D range.mem_emergency_max;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.min_temp =
=3D range.min * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm.thermal.max_temp =
=3D range.max * SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index bcd0efaf7bbd..deb102ffedc2 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -463,7 &#43;463,6 @@ static int vega20_store_powerplay_table(struct smu_=
context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(table_context-&gt;d=
river_pptable, &amp;powerplay_table-&gt;smcPPTable,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; sizeof(PPTable_t));<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_context-&gt;software_shutdown_t=
emp =3D powerplay_table-&gt;usSoftwareShutdownTemp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_context-&gt;thermal_=
controller_type =3D powerplay_table-&gt;ucThermalControllerType;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_context-&gt;TDPODLim=
it =3D le32_to_cpu(powerplay_table-&gt;OverDrive8Table.ODSettingsMax[ATOM_V=
EGA20_ODSETTING_POWERPERCENTAGE]);<br>
&nbsp;<br>
@@ -3235,35 &#43;3234,24 @@ static int vega20_set_watermarks_table(struct s=
mu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-static const struct smu_temperature_range vega20_thermal_policy[] =3D<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {-273150,&nbsp; 99000, 99000, -273150=
, 99000, 99000, -273150, 99000, 99000},<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { 120000, 120000, 120000, 120000, 120=
000, 120000, 120000, 120000, 120000},<br>
-};<br>
-<br>
&nbsp;static int vega20_get_thermal_temperature_range(struct smu_context *s=
mu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_=
temperature_range*range)<br>
&nbsp;{<br>
-<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *table_c=
ontext =3D &amp;smu-&gt;smu_table;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ATOM_Vega20_POWERPLAYTABLE *power=
play_table =3D table_context-&gt;power_play_table;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu=
-&gt;smu_table.driver_pptable;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!range || !powerplay_table)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(range, &amp;vega20_thermal_pol=
icy[0], sizeof(struct smu_temperature_range));<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D pptable-&gt;TedgeLi=
mit *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;edge_emergency_max =3D (ppt=
able-&gt;TedgeLimit &#43; CTF_OFFSET_EDGE) *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_crit_max =3D pptabl=
e-&gt;ThotspotLimit *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_emergency_max =3D (=
pptable-&gt;ThotspotLimit &#43; CTF_OFFSET_HOTSPOT) *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_crit_max =3D pptable-&g=
t;ThbmLimit *<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_emergency_max =3D (ppta=
ble-&gt;ThbmLimit &#43; CTF_OFFSET_HBM)*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The unit is temperature */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;min =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;max =3D powerplay_table=
-&gt;usSoftwareShutdownTemp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;edge_emergency_max =3D =
(pptable-&gt;TedgeLimit &#43; CTF_OFFSET_EDGE);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_crit_max =3D pp=
table-&gt;ThotspotLimit;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;hotspot_emergency_max =
=3D (pptable-&gt;ThotspotLimit &#43; CTF_OFFSET_HOTSPOT);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_crit_max =3D pptabl=
e-&gt;ThbmLimit;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; range-&gt;mem_emergency_max =3D (=
pptable-&gt;ThbmLimit &#43; CTF_OFFSET_HBM);<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
-- <br>
2.22.0<o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB359856831E7B51C3ACC751F98EC70MN2PR12MB3598namp_--

--===============1174685148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1174685148==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F76E64B
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 15:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE636E834;
	Fri, 19 Jul 2019 13:27:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239596E834
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 13:27:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcXAxQgrWFOiIEPsWvIgQVAJJNRmhy8sS6Kj/nrIY3U0erFKivmjPXoDLSQIWJonsZtYfUtiXA2RcI8WqqbtD1pZ6Bg16q3yTa7GkhxdyPjedXOtwp61KUpuEyHGBu4fzL8daxge+PxzOJmUbxZvO/czRIqWUnE62LeZod1PwfhHecou7L37Y3og3XQmRUEpFrsN1PcOLvWlAxbXMD6P/5QLY5lDPRNxYfKYhD0+zHtIM9YCpL5gBSvps+UEgvhDd7jpJw4RbK9+tazu2BY7kaj/Y222nmBS7IeSoiNfuIdlV9PGgzMYVUaTtSH17zEnc6sPl+95ZWqdX9FYSkNA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7UmW1xQzzo8M06LspxmQ3TCgxaNYYuDdENpKG78HM4=;
 b=jgtZMCgtMLH2JDXs/eHp9pW09T2MSpKwRD1d+sfWdBpgZ0tf32E8bJkr0zyKr05G0t3+3igSL3h8uUQmi1q+9OUTtQ0oVuYNYuPzZBOV0QLOWqiPXbXoKYquX4mR0tj+gaTEK2YXyxAKSDVDeHHDUl8R7nlMK/wbBSrmGI41HFK5YvKnBWzndab183BLWOahm/ttMVQb5F2wcok127qAKZ4JL6FtgfZqoQDVKuFCfiydnm6phHD1G3z6gBDmmTtvOZqXygQVVxj5MajFlXxEoP51neoM6xeY6GgFDwrWFr6TW9mMuceVctNJGQbk+ZuX8TQkq/SJglpY3HmNsS+Ehw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1892.namprd12.prod.outlook.com (10.175.102.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 13:27:00 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 13:27:00 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: refine AMDGPU_PP_SENSOR_XXX index for
 powerplay
Thread-Topic: [PATCH] drm/amd/powerplay: refine AMDGPU_PP_SENSOR_XXX index for
 powerplay
Thread-Index: AQHVPivmXOL/dwbHQE2i0uo6zQGG06bR7uBE
Date: Fri, 19 Jul 2019 13:26:59 +0000
Message-ID: <BN6PR12MB1809F9A641D069E726088390F7CB0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190719121700.19656-1-kevin1.wang@amd.com>
In-Reply-To: <20190719121700.19656-1-kevin1.wang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43aa8ef7-e751-41a0-e0c3-08d70c4cc795
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1892; 
x-ms-traffictypediagnostic: BN6PR12MB1892:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1892B7827A0665081023C870F7CB0@BN6PR12MB1892.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(189003)(199004)(236005)(3846002)(25786009)(606006)(6116002)(186003)(54906003)(110136005)(33656002)(68736007)(26005)(8936002)(6436002)(64756008)(6306002)(446003)(11346002)(476003)(66066001)(8676002)(55016002)(316002)(9686003)(86362001)(478600001)(6246003)(105004)(54896002)(7736002)(256004)(81166006)(14444005)(81156014)(14454004)(4326008)(486006)(6506007)(71190400001)(7696005)(76176011)(99286004)(966005)(74316002)(19627405001)(102836004)(53936002)(66556008)(53546011)(66446008)(5660300002)(66946007)(229853002)(52536014)(76116006)(66476007)(2906002)(2501003)(71200400001)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1892;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZTBV4p9EaL1igw2MGgNknqDhZAT6w2TaXlmObE/oXyWFr7ddzQu7oMFx3z1A8rs+Axhzy7ZZimfqGnQto8KfhGN9okvxLUVhpbZUQx8F38T6/Qoq7xwHFYFHwrkerHCne/wSxH+X5nb0jWsk9Gn5I5cl1PjKrqlEAxEW5UOEObHOjcTiwQDBhqu6HpMOKQ+iVmuVN67Hhim6RdgUUHU7vfnZJXXxvbOgRhlDL4r0jugheJMDqNOWVTagkesy3aI/VNOceenZBJKYj2n/Pn4zCIRLYkez610IeNuGpGLETAEmKsmzbsMh3ZGfEreKUqO6HAWNtd8Fa2+hLNa63HxHrvQrxKSMzeDljFVHeBXVdYDxhnXj2Uyhu2qlUgeiFa090ffCU/2RW8ZkSmhz/CPC1Kc6SPQFfGPtXYCEEO1XTKE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43aa8ef7-e751-41a0-e0c3-08d70c4cc795
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 13:26:59.9591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1892
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7UmW1xQzzo8M06LspxmQ3TCgxaNYYuDdENpKG78HM4=;
 b=gjR/2yndrCEzkRjXVk0NiNimyD6HuWUaVBOH/1ygiYrFi67T1fexJEDFQtXP7pRNAgFfry0J2ZPgIo6rAPAtaeIRKLbZGAwsBkwztlgNfEb1c3pBWsbTIPFGu9gpPtLSoOaKkdRsJoV1LkD0VxObN7XPdqNule+JUoPcHlIyIK8=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============0088042744=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0088042744==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F9A641D069E726088390F7CB0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F9A641D069E726088390F7CB0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Wang, Ke=
vin(Yang) <Kevin1.Wang@amd.com>
Sent: Friday, July 19, 2019 8:17 AM
To: amd-gfx@lists.freedesktop.org
Cc: Wang, Kevin(Yang); Huang, Ray; Feng, Kenneth; Quan, Evan
Subject: [PATCH] drm/amd/powerplay: refine AMDGPU_PP_SENSOR_XXX index for p=
owerplay

for patch:
drm/amd/powerplay: expose current hotspot and memory temperatures V2

this patch will add some new sensor type to enum amd_pp_sensors,
we should add these types to tail to be compatible with the sensor in
effect.

eg: some application will use old amd_pp_sensors type, likes umr.
the umr will use sensor index to get specific sensor value by sysfs
of "/sys/kernel/debug/dri/0/amdgpu_sensors", the old change will cause
the umr can't get correct value, it should be update sensor index by
this header for itself.

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/si_dpm.c                | 1 +
 drivers/gpu/drm/amd/include/kgd_pp_interface.h     | 6 +++---
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c  | 1 +
 drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c   | 1 +
 drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c   | 1 +
 drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 1 +
 drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c | 1 +
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 1 +
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c         | 2 ++
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         | 2 ++
 10 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdg=
pu/si_dpm.c
index d57e75e5c71f..9f120333dc71 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
@@ -8012,6 +8012,7 @@ static int si_dpm_read_sensor(void *handle, int idx,
                 }
                 return -EINVAL;
         case AMDGPU_PP_SENSOR_GPU_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *((uint32_t *)value) =3D si_dpm_get_temp(adev);
                 *size =3D 4;
                 return 0;
diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/d=
rm/amd/include/kgd_pp_interface.h
index 9733bbf9bc72..af71da7d9896 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -112,9 +112,6 @@ enum amd_pp_sensors {
         AMDGPU_PP_SENSOR_MEM_LOAD,
         AMDGPU_PP_SENSOR_GFX_MCLK,
         AMDGPU_PP_SENSOR_GPU_TEMP,
-       AMDGPU_PP_SENSOR_EDGE_TEMP =3D AMDGPU_PP_SENSOR_GPU_TEMP,
-       AMDGPU_PP_SENSOR_HOTSPOT_TEMP,
-       AMDGPU_PP_SENSOR_MEM_TEMP,
         AMDGPU_PP_SENSOR_VCE_POWER,
         AMDGPU_PP_SENSOR_UVD_POWER,
         AMDGPU_PP_SENSOR_GPU_POWER,
@@ -123,6 +120,9 @@ enum amd_pp_sensors {
         AMDGPU_PP_SENSOR_ENABLED_SMC_FEATURES_MASK,
         AMDGPU_PP_SENSOR_MIN_FAN_RPM,
         AMDGPU_PP_SENSOR_MAX_FAN_RPM,
+       AMDGPU_PP_SENSOR_EDGE_TEMP,
+       AMDGPU_PP_SENSOR_HOTSPOT_TEMP,
+       AMDGPU_PP_SENSOR_MEM_TEMP,
 };

 enum amd_pp_task {
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gp=
u/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
index e32ae9d3373c..c6d8b399cc80 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
@@ -1130,6 +1130,7 @@ static int smu10_read_sensor(struct pp_hwmgr *hwmgr, =
int idx,
                 *size =3D 4;
                 break;
         case AMDGPU_PP_SENSOR_GPU_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *((uint32_t *)value) =3D smu10_thermal_get_temperature(hwm=
gr);
                 break;
         default:
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu=
/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
index 10d66e3c7a9f..1195f86f86af 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
@@ -3546,6 +3546,7 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmgr, i=
nt idx,
                 *size =3D 4;
                 return 0;
         case AMDGPU_PP_SENSOR_GPU_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *((uint32_t *)value) =3D smu7_thermal_get_temperature(hwmg=
r);
                 *size =3D 4;
                 return 0;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu=
/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
index 019d6a206492..b2fc57dfb467 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c
@@ -1769,6 +1769,7 @@ static int smu8_read_sensor(struct pp_hwmgr *hwmgr, i=
nt idx,
                 *((uint32_t *)value) =3D data->vce_power_gated ? 0 : 1;
                 return 0;
         case AMDGPU_PP_SENSOR_GPU_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *((uint32_t *)value) =3D smu8_thermal_get_temperature(hwmg=
r);
                 return 0;
         default:
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index 1d9bb29adaef..a309aeed53ab 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -3794,6 +3794,7 @@ static int vega10_read_sensor(struct pp_hwmgr *hwmgr,=
 int idx,
                 *size =3D 4;
                 break;
         case AMDGPU_PP_SENSOR_GPU_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *((uint32_t *)value) =3D vega10_thermal_get_temperature(hw=
mgr);
                 *size =3D 4;
                 break;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
index efb6d3762feb..69d1255db091 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c
@@ -1368,6 +1368,7 @@ static int vega12_read_sensor(struct pp_hwmgr *hwmgr,=
 int idx,
                         *size =3D 4;
                 break;
         case AMDGPU_PP_SENSOR_GPU_TEMP:
+       case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *((uint32_t *)value) =3D vega12_thermal_get_temperature(hw=
mgr);
                 *size =3D 4;
                 break;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index f27c6fbb192e..172321f44940 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -2185,6 +2185,7 @@ static int vega20_read_sensor(struct pp_hwmgr *hwmgr,=
 int idx,
                 *((uint32_t *)value) =3D vega20_thermal_get_temperature(hw=
mgr);
                 *size =3D 4;
                 break;
+       case AMDGPU_PP_SENSOR_GPU_TEMP:
         case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 ret =3D vega20_get_metrics_table(hwmgr, &metrics_table);
                 if (ret)
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 0a53695785b6..35e5aa152ee1 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1341,6 +1341,7 @@ static int navi10_thermal_get_temperature(struct smu_=
context *smu,
                 *value =3D metrics.TemperatureHotspot *
                         SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
                 break;
+       case AMDGPU_PP_SENSOR_GPU_TEMP:
         case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *value =3D metrics.TemperatureEdge *
                         SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
@@ -1384,6 +1385,7 @@ static int navi10_read_sensor(struct smu_context *smu=
,
                 break;
         case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
         case AMDGPU_PP_SENSOR_EDGE_TEMP:
+       case AMDGPU_PP_SENSOR_GPU_TEMP:
         case AMDGPU_PP_SENSOR_MEM_TEMP:
                 ret =3D navi10_thermal_get_temperature(smu, sensor, (uint3=
2_t *)data);
                 *size =3D 4;
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index b44ec7c670c5..55996f3a1883 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3123,6 +3123,7 @@ static int vega20_thermal_get_temperature(struct smu_=
context *smu,

                 *value =3D temp;
                 break;
+       case AMDGPU_PP_SENSOR_GPU_TEMP:
         case AMDGPU_PP_SENSOR_EDGE_TEMP:
                 *value =3D metrics.TemperatureEdge *
                         SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
@@ -3166,6 +3167,7 @@ static int vega20_read_sensor(struct smu_context *smu=
,
                 *size =3D 4;
                 break;
         case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+       case AMDGPU_PP_SENSOR_GPU_TEMP:
         case AMDGPU_PP_SENSOR_EDGE_TEMP:
         case AMDGPU_PP_SENSOR_MEM_TEMP:
                 ret =3D vega20_thermal_get_temperature(smu, sensor, (uint3=
2_t *)data);
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809F9A641D069E726088390F7CB0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Wang, Kevin(Yang) &lt;Kevin1.=
Wang@amd.com&gt;<br>
<b>Sent:</b> Friday, July 19, 2019 8:17 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Wang, Kevin(Yang); Huang, Ray; Feng, Kenneth; Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: refine AMDGPU_PP_SENSOR_XXX inde=
x for powerplay</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">for patch:<br>
drm/amd/powerplay: expose current hotspot and memory temperatures V2<br>
<br>
this patch will add some new sensor type to enum amd_pp_sensors,<br>
we should add these types to tail to be compatible with the sensor in<br>
effect.<br>
<br>
eg: some application will use old amd_pp_sensors type, likes umr.<br>
the umr will use sensor index to get specific sensor value by sysfs<br>
of &quot;/sys/kernel/debug/dri/0/amdgpu_sensors&quot;, the old change will =
cause<br>
the umr can't get correct value, it should be update sensor index by<br>
this header for itself.<br>
<br>
Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/si_dpm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/include/kgd_pp_interface.h&nbsp;&nbsp;&nbsp;&nbsp=
; | 6 &#43;&#43;&#43;---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c&nbsp;&nbsp; | 1 &#43=
;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c&nbsp;&nbsp; | 1 &#43=
;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 2 &#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 2 &#43;&#43;<br>
&nbsp;10 files changed, 14 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdg=
pu/si_dpm.c<br>
index d57e75e5c71f..9f120333dc71 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/si_dpm.c<br>
@@ -8012,6 &#43;8012,7 @@ static int si_dpm_read_sensor(void *handle, int i=
dx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_=
TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D si_dpm_get_temp(adev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/d=
rm/amd/include/kgd_pp_interface.h<br>
index 9733bbf9bc72..af71da7d9896 100644<br>
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/kgd_pp_interface.h<br>
@@ -112,9 &#43;112,6 @@ enum amd_pp_sensors {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_MEM_LOAD,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_GFX_MCLK,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_GPU_TEMP,=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_EDGE_TEMP =3D AMDGPU=
_PP_SENSOR_GPU_TEMP,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_HOTSPOT_TEMP,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_MEM_TEMP,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_VCE_POWER=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_UVD_POWER=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_GPU_POWER=
,<br>
@@ -123,6 &#43;120,9 @@ enum amd_pp_sensors {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_ENABLED_S=
MC_FEATURES_MASK,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_MIN_FAN_R=
PM,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_MAX_FAN_R=
PM,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_EDGE_TEMP,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_HOTSPOT_TEMP,<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_PP_SENSOR_MEM_TEMP,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;enum amd_pp_task {<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gp=
u/drm/amd/powerplay/hwmgr/smu10_hwmgr.c<br>
index e32ae9d3373c..c6d8b399cc80 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c<br>
@@ -1130,6 &#43;1130,7 @@ static int smu10_read_sensor(struct pp_hwmgr *hwm=
gr, int idx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_=
TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D smu10_thermal_get_temperatur=
e(hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu=
/drm/amd/powerplay/hwmgr/smu7_hwmgr.c<br>
index 10d66e3c7a9f..1195f86f86af 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c<br>
@@ -3546,6 &#43;3546,7 @@ static int smu7_read_sensor(struct pp_hwmgr *hwmg=
r, int idx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_=
TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D smu7_thermal_get_temperature=
(hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c b/drivers/gpu=
/drm/amd/powerplay/hwmgr/smu8_hwmgr.c<br>
index 019d6a206492..b2fc57dfb467 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/smu8_hwmgr.c<br>
@@ -1769,6 &#43;1769,7 @@ static int smu8_read_sensor(struct pp_hwmgr *hwmg=
r, int idx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D data-&gt;vce_power_gated ? 0=
 : 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_=
TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D smu8_thermal_get_temperature=
(hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c<br>
index 1d9bb29adaef..a309aeed53ab 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c<br>
@@ -3794,6 &#43;3794,7 @@ static int vega10_read_sensor(struct pp_hwmgr *hw=
mgr, int idx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_=
TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D vega10_thermal_get_temperatu=
re(hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c<br>
index efb6d3762feb..69d1255db091 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_hwmgr.c<br>
@@ -1368,6 &#43;1368,7 @@ static int vega12_read_sensor(struct pp_hwmgr *hw=
mgr, int idx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *size=
 =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_=
TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE_TEMP:<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D vega12_thermal_get_temperatu=
re(hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
index f27c6fbb192e..172321f44940 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
@@ -2185,6 &#43;2185,7 @@ static int vega20_read_sensor(struct pp_hwmgr *hw=
mgr, int idx,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *((uint32_t *)value) =3D vega20_thermal_get_temperatu=
re(hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TEMP:<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE=
_TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D vega20_get_metrics_table(hwmgr, &amp;metrics_=
table);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ret)<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 0a53695785b6..35e5aa152ee1 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1341,6 &#43;1341,7 @@ static int navi10_thermal_get_temperature(struct =
smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *value =3D metrics.TemperatureHotspot *<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_T=
EMPERATURE_UNITS_PER_CENTIGRADES;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TEMP:<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE=
_TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *value =3D metrics.TemperatureEdge *<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_T=
EMPERATURE_UNITS_PER_CENTIGRADES;<br>
@@ -1384,6 &#43;1385,7 @@ static int navi10_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTS=
POT_TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE=
_TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TEMP:<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_=
TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D navi10_thermal_get_temperature(smu, sensor, (=
uint32_t *)data);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index b44ec7c670c5..55996f3a1883 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -3123,6 &#43;3123,7 @@ static int vega20_thermal_get_temperature(struct =
smu_context *smu,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *value =3D temp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TEMP:<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE=
_TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *value =3D metrics.TemperatureEdge *<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SMU_T=
EMPERATURE_UNITS_PER_CENTIGRADES;<br>
@@ -3166,6 &#43;3167,7 @@ static int vega20_read_sensor(struct smu_context =
*smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *size =3D 4;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_HOTS=
POT_TEMP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_GPU_TEMP:<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_EDGE=
_TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_PP_SENSOR_MEM_=
TEMP:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D vega20_thermal_get_temperature(smu, sensor, (=
uint32_t *)data);<br>
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

--_000_BN6PR12MB1809F9A641D069E726088390F7CB0BN6PR12MB1809namp_--

--===============0088042744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0088042744==--

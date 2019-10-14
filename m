Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312F1D5991
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Oct 2019 04:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19CD6E1B1;
	Mon, 14 Oct 2019 02:31:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720057.outbound.protection.outlook.com [40.107.72.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1626E1AA
 for <amd-gfx@lists.freedesktop.org>; Mon, 14 Oct 2019 02:31:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lru4D9DM5o005NYc/b/mVK1R/pJVPK/cQ9Yvxl0EyzimxbxObR5YT+pYcjzfAntP8lhG50A3DWNa0SDoZ2JQGEF1c5aNeYNwad/dVksrEoXB6CursAgp3F3eV5c6bA/Gh+JZCBwxUbxf4QWhK9ZAkvbv587PbbtLU+MMutmB9qlsvDrUQ/jNt+tsw3bs3ppwrOcnNbBIYUvJNLHYAWcN/xWRb2JUdX1/ichabg861voG0YWjG+DEHkZRL1Rp0HkzA9Ez0lISFH7NrC9zdf7sWbN0mM4Lw5JGHdI5A6yEbinuF1u2NtmSVeDDUbW9OIoPoxI3VtJPHxUoOGAdUFyFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao0Qp4deZfasaPNeudKH4PsPKh468PIelf2sZToG88U=;
 b=hy5XfUeteYga55KdPJL8FQWNeCU/BZqApOuwdzn3EfftTQXQtDkkBMFlHEVY0K+KA5aWA8W7yBHsO9WB6cyqNqd7DBQX39P8/pppKF2pWDuxmUVWoEfSM13Bki3gUjCS+fIvixfg+Msjk+o9AVl3AbOaqYGakdsU2mlNJqQ0ZwPGDYtcjO9lozY/QF0eKg33JKLKiCRC4rR4UhX8bcnUICBT9bWF0so4oDrA74umXEdB2kCjv15QI+lKSOTnkaqQ0QZ8Wfkwq/e6FPudvlEqVz2OlHj3wd95Rwltek28lm+z+HOa/vkV83f95yQ/ABfAbKKsfdRM5oxmLJWC5Cf8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3566.namprd12.prod.outlook.com (20.178.243.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Mon, 14 Oct 2019 02:31:31 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 02:31:31 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/powerplay: bug fix for pcie parameters override
Thread-Topic: [PATCH v2] drm/amd/powerplay: bug fix for pcie parameters
 override
Thread-Index: AQHVgB9pVvoJ+A1XwUCJMtjnAHfYp6dZbp1Y
Date: Mon, 14 Oct 2019 02:31:30 +0000
Message-ID: <MN2PR12MB32967A1844094CCFCB600069A2900@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1570790025-8274-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1570790025-8274-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd1a5694-243f-4874-43b4-08d7504e9f85
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3566:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35665399E0667FB5104817B6A2900@MN2PR12MB3566.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(199004)(189003)(2906002)(8936002)(256004)(9686003)(76176011)(52536014)(33656002)(316002)(14444005)(478600001)(53546011)(3846002)(6506007)(6116002)(6306002)(236005)(102836004)(81166006)(55016002)(7696005)(6246003)(229853002)(966005)(54896002)(8676002)(6436002)(19627405001)(81156014)(11346002)(446003)(25786009)(476003)(486006)(186003)(86362001)(26005)(74316002)(7736002)(105004)(2501003)(99286004)(66446008)(5660300002)(110136005)(14454004)(66066001)(64756008)(66556008)(66476007)(30864003)(71200400001)(71190400001)(66946007)(76116006)(91956017)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3566;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0rV+fYHbFNDb/to6W0g0BSThmjGYKP1kjd1y9j9v/5sr7WC+mARcXGrOxxNLj04+H1yRBGcVAUMyt3ubWN94a11QUJQvyHK1obXXFfjDCRHSPpK5ph8t6joUWnGc4BUHkq45CCFo7a4Zc0/ZPPoyUVevb+1VQjhQPI99aUjjSx9apJoUotCUY03ZwqUgQmr3x4Cm4yApAy1aWf5T8GpSoP7QXiBPkVd7jyMxtz3x+4SwWMJcaNpiR9udUhee64iHxY5uLOHKIZrqXaqT6bED3fQ8A8U4gc5/EoU2ej8ZadbNYO7RCA6J7CiIhNo1dj6sEzHfLJ/7a8UilYLXcDe70O4ksAmj5mNvhLrO0gPgTjWkVuYwy3YLAPlOuC95sN96e7sOvu/A1sH0QhDfCntSnypQvhSafx1bQ/g+gvf5huqSA0ekIZkB06IjKp4eUlEuRepdg6U+1BLBy0TTvmttWQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1a5694-243f-4874-43b4-08d7504e9f85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 02:31:30.8517 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kw6RYoEDGpDTN4ytior1c4o2Fp/X9A9g9LmmMWz8+hOusfy+St4hbj/lo/T/w9oC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3566
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao0Qp4deZfasaPNeudKH4PsPKh468PIelf2sZToG88U=;
 b=Ry/KDeDlt3XxfHo3mI1RAm4gBebhtRhyoxDfqwGR3Fulzn+xK+qkcMphJMOfU3pfNro/VcNpJ6ZvJybIk3oYeiVRAY8drrTF0xOVKM4koVR7Zb793zFMWsg1ortzs3lgilvvEOqjPu01QQjQwpUrBDkOTHt6bawT/YThpYrlU+g=
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
Content-Type: multipart/mixed; boundary="===============0164853561=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0164853561==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32967A1844094CCFCB600069A2900MN2PR12MB3296namp_"

--_000_MN2PR12MB32967A1844094CCFCB600069A2900MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kenneth =
Feng <kenneth.feng@amd.com>
Sent: Friday, October 11, 2019 6:33 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: [PATCH v2] drm/amd/powerplay: bug fix for pcie parameters override

Bug fix for pcie paramerers override on swsmu.
Below is a scenario to have this problem.
pptable definition on pcie dpm:
0 -> pcie gen speed:1, pcie lanes: *16
1 -> pcie gen speed:4, pcie lanes: *16
Then if we have a system only have the capbility:
pcie gen speed: 3, pcie lanes: *8,
we will override dpm 1 to pcie gen speed 3, pcie lanes *8.
But the code skips the dpm 0 configuration.
So the real pcie dpm parameters are:
0 -> pcie gen speed:1, pcie lanes: *16
1 -> pcie gen speed:3, pcie lanes: *8
Then the wrong pcie lanes will be toggled.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c     | 44 ----------------------=
----
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h |  8 +++++
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c     | 23 ++++++++++++++
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c      | 44 ++++++++++++++++++++++=
++++
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c     | 25 ++++++++++++++-
 5 files changed, 99 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index c9266ea..de54da2 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -945,50 +945,6 @@ static int smu_fini_fb_allocations(struct smu_context =
*smu)
         return 0;
 }

-static int smu_override_pcie_parameters(struct smu_context *smu)
-{
-       struct amdgpu_device *adev =3D smu->adev;
-       uint32_t pcie_gen =3D 0, pcie_width =3D 0, smu_pcie_arg;
-       int ret;
-
-       if (adev->flags & AMD_IS_APU)
-               return 0;
-
-       if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN4)
-               pcie_gen =3D 3;
-       else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3=
)
-               pcie_gen =3D 2;
-       else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2=
)
-               pcie_gen =3D 1;
-       else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1=
)
-               pcie_gen =3D 0;
-
-       /* Bit 31:16: LCLK DPM level. 0 is DPM0, and 1 is DPM1
-        * Bit 15:8:  PCIE GEN, 0 to 3 corresponds to GEN1 to GEN4
-        * Bit 7:0:   PCIE lane width, 1 to 7 corresponds is x1 to x32
-        */
-       if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16)
-               pcie_width =3D 6;
-       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12)
-               pcie_width =3D 5;
-       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8)
-               pcie_width =3D 4;
-       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4)
-               pcie_width =3D 3;
-       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2)
-               pcie_width =3D 2;
-       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X1)
-               pcie_width =3D 1;
-
-       smu_pcie_arg =3D (1 << 16) | (pcie_gen << 8) | pcie_width;
-       ret =3D smu_send_smc_msg_with_param(smu,
-                                         SMU_MSG_OverridePcieParameters,
-                                         smu_pcie_arg);
-       if (ret)
-               pr_err("[%s] Attempt to override pcie params failed!\n", __=
func__);
-       return ret;
-}
-
 static int smu_smc_table_hw_init(struct smu_context *smu,
                                  bool initialize)
 {
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index ccf711c..809de0d 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -468,6 +468,7 @@ struct pptable_funcs {
         int (*get_power_limit)(struct smu_context *smu, uint32_t *limit, b=
ool asic_default);
         int (*get_dpm_clk_limited)(struct smu_context *smu, enum smu_clk_t=
ype clk_type,
                                    uint32_t dpm_level, uint32_t *freq);
+       int (*update_pcie_parameters)(struct smu_context *smu, uint32_t pci=
e_gen_cap, uint32_t pcie_width_cap);
 };

 struct smu_funcs
@@ -550,6 +551,7 @@ struct smu_funcs
         int (*mode2_reset)(struct smu_context *smu);
         int (*get_dpm_ultimate_freq)(struct smu_context *smu, enum smu_clk=
_type clk_type, uint32_t *min, uint32_t *max);
         int (*set_soft_freq_limited_range)(struct smu_context *smu, enum s=
mu_clk_type clk_type, uint32_t min, uint32_t max);
+       int (*override_pcie_parameters)(struct smu_context *smu);
 };

 #define smu_init_microcode(smu) \
@@ -782,6 +784,12 @@ struct smu_funcs
 #define smu_set_soft_freq_limited_range(smu, clk_type, min, max) \
                 ((smu)->funcs->set_soft_freq_limited_range ? (smu)->funcs-=
>set_soft_freq_limited_range((smu), (clk_type), (min), (max)) : -EINVAL)

+#define smu_override_pcie_parameters(smu) \
+               ((smu)->funcs->override_pcie_parameters ? (smu)->funcs->ove=
rride_pcie_parameters((smu)) : 0)
+
+#define smu_update_pcie_parameters(smu, pcie_gen_cap, pcie_width_cap) \
+               ((smu)->ppt_funcs->update_pcie_parameters ? (smu)->ppt_func=
s->update_pcie_parameters((smu), (pcie_gen_cap), (pcie_width_cap)) : 0)
+
 extern int smu_get_atom_data_table(struct smu_context *smu, uint32_t table=
,
                                    uint16_t *size, uint8_t *frev, uint8_t =
*crev,
                                    uint8_t **addr);
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index a583cf8..a2f33cf 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1592,6 +1592,28 @@ static int navi10_get_power_limit(struct smu_context=
 *smu,
         return 0;
 }

+static int navi10_update_pcie_parameters(struct smu_context *smu,
+                                    uint32_t pcie_gen_cap,
+                                    uint32_t pcie_width_cap)
+{
+       PPTable_t *pptable =3D smu->smu_table.driver_pptable;
+       int ret, i;
+       uint32_t smu_pcie_arg;
+
+       for (i =3D 0; i < NUM_LINK_LEVELS; i++) {
+               smu_pcie_arg =3D (i << 16) |
+                       ((pptable->PcieGenSpeed[i] <=3D pcie_gen_cap) ? (pp=
table->PcieGenSpeed[i] << 8) :
+                               (pcie_gen_cap << 8)) | ((pptable->PcieLaneC=
ount[i] <=3D pcie_width_cap) ?
+                                       pptable->PcieLaneCount[i] : pcie_wi=
dth_cap);
+               ret =3D smu_send_smc_msg_with_param(smu,
+                                         SMU_MSG_OverridePcieParameters,
+                                         smu_pcie_arg);
+       }
+
+       return ret;
+}
+
+
 static const struct pptable_funcs navi10_ppt_funcs =3D {
         .tables_init =3D navi10_tables_init,
         .alloc_dpm_context =3D navi10_allocate_dpm_context,
@@ -1630,6 +1652,7 @@ static const struct pptable_funcs navi10_ppt_funcs =
=3D {
         .get_thermal_temperature_range =3D navi10_get_thermal_temperature_=
range,
         .display_disable_memory_clock_switch =3D navi10_display_disable_me=
mory_clock_switch,
         .get_power_limit =3D navi10_get_power_limit,
+       .update_pcie_parameters =3D navi10_update_pcie_parameters,
 };

 void navi10_set_ppt_funcs(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index c9e90d5..a812ae5 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -35,6 +35,7 @@
 #include "vega20_ppt.h"
 #include "arcturus_ppt.h"
 #include "navi10_ppt.h"
+#include "amd_pcie.h"

 #include "asic_reg/thm/thm_11_0_2_offset.h"
 #include "asic_reg/thm/thm_11_0_2_sh_mask.h"
@@ -1792,6 +1793,48 @@ static int smu_v11_0_set_soft_freq_limited_range(str=
uct smu_context *smu, enum s
         return ret;
 }

+static int smu_v11_0_override_pcie_parameters(struct smu_context *smu)
+{
+       struct amdgpu_device *adev =3D smu->adev;
+       uint32_t pcie_gen =3D 0, pcie_width =3D 0;
+       int ret;
+
+       if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN4)
+               pcie_gen =3D 3;
+       else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3=
)
+               pcie_gen =3D 2;
+       else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2=
)
+               pcie_gen =3D 1;
+       else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1=
)
+               pcie_gen =3D 0;
+
+       /* Bit 31:16: LCLK DPM level. 0 is DPM0, and 1 is DPM1
+        * Bit 15:8:  PCIE GEN, 0 to 3 corresponds to GEN1 to GEN4
+        * Bit 7:0:   PCIE lane width, 1 to 7 corresponds is x1 to x32
+        */
+       if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X16)
+               pcie_width =3D 6;
+       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X12)
+               pcie_width =3D 5;
+       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X8)
+               pcie_width =3D 4;
+       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X4)
+               pcie_width =3D 3;
+       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X2)
+               pcie_width =3D 2;
+       else if (adev->pm.pcie_mlw_mask & CAIL_PCIE_LINK_WIDTH_SUPPORT_X1)
+               pcie_width =3D 1;
+
+       ret =3D smu_update_pcie_parameters(smu, pcie_gen, pcie_width);
+
+       if (ret)
+               pr_err("[%s] Attempt to override pcie params failed!\n", __=
func__);
+
+       return ret;
+
+}
+
+
 static const struct smu_funcs smu_v11_0_funcs =3D {
         .init_microcode =3D smu_v11_0_init_microcode,
         .load_microcode =3D smu_v11_0_load_microcode,
@@ -1844,6 +1887,7 @@ static const struct smu_funcs smu_v11_0_funcs =3D {
         .baco_reset =3D smu_v11_0_baco_reset,
         .get_dpm_ultimate_freq =3D smu_v11_0_get_dpm_ultimate_freq,
         .set_soft_freq_limited_range =3D smu_v11_0_set_soft_freq_limited_r=
ange,
+       .override_pcie_parameters =3D smu_v11_0_override_pcie_parameters,
 };

 void smu_v11_0_set_smu_funcs(struct smu_context *smu)
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index f655ebd..adca84a 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3135,6 +3135,28 @@ static int vega20_get_thermal_temperature_range(stru=
ct smu_context *smu,
         return 0;
 }

+static int vega20_update_pcie_parameters(struct smu_context *smu,
+                                    uint32_t pcie_gen_cap,
+                                    uint32_t pcie_width_cap)
+{
+       PPTable_t *pptable =3D smu->smu_table.driver_pptable;
+       int ret, i;
+       uint32_t smu_pcie_arg;
+
+       for (i =3D 0; i < NUM_LINK_LEVELS; i++) {
+               smu_pcie_arg =3D (i << 16) |
+                       ((pptable->PcieGenSpeed[i] <=3D pcie_gen_cap) ? (pp=
table->PcieGenSpeed[i] << 8) :
+                               (pcie_gen_cap << 8)) | ((pptable->PcieLaneC=
ount[i] <=3D pcie_width_cap) ?
+                                       pptable->PcieLaneCount[i] : pcie_wi=
dth_cap);
+               ret =3D smu_send_smc_msg_with_param(smu,
+                                         SMU_MSG_OverridePcieParameters,
+                                         smu_pcie_arg);
+       }
+
+       return ret;
+}
+
+
 static const struct pptable_funcs vega20_ppt_funcs =3D {
         .tables_init =3D vega20_tables_init,
         .alloc_dpm_context =3D vega20_allocate_dpm_context,
@@ -3177,7 +3199,8 @@ static const struct pptable_funcs vega20_ppt_funcs =
=3D {
         .get_fan_speed_percent =3D vega20_get_fan_speed_percent,
         .get_fan_speed_rpm =3D vega20_get_fan_speed_rpm,
         .set_watermarks_table =3D vega20_set_watermarks_table,
-       .get_thermal_temperature_range =3D vega20_get_thermal_temperature_r=
ange
+       .get_thermal_temperature_range =3D vega20_get_thermal_temperature_r=
ange,
+       .update_pcie_parameters =3D vega20_update_pcie_parameters
 };

 void vega20_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32967A1844094CCFCB600069A2900MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kenneth Feng &lt;kenneth.feng=
@amd.com&gt;<br>
<b>Sent:</b> Friday, October 11, 2019 6:33 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH v2] drm/amd/powerplay: bug fix for pcie parameters o=
verride</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Bug fix for pcie paramerers override on swsmu.<br>
Below is a scenario to have this problem.<br>
pptable definition on pcie dpm:<br>
0 -&gt; pcie gen speed:1, pcie lanes: *16<br>
1 -&gt; pcie gen speed:4, pcie lanes: *16<br>
Then if we have a system only have the capbility:<br>
pcie gen speed: 3, pcie lanes: *8,<br>
we will override dpm 1 to pcie gen speed 3, pcie lanes *8.<br>
But the code skips the dpm 0 configuration.<br>
So the real pcie dpm parameters are:<br>
0 -&gt; pcie gen speed:1, pcie lanes: *16<br>
1 -&gt; pcie gen speed:3, pcie lanes: *8<br>
Then the wrong pcie lanes will be toggled.<br>
<br>
Signed-off-by: Kenneth Feng &lt;kenneth.feng@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp;&nbsp; | =
44 --------------------------<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h |&nbsp; 8 &#43;&#43;&#=
43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | 44 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp; | =
25 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<=
br>
&nbsp;5 files changed, 99 insertions(&#43;), 45 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index c9266ea..de54da2 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -945,50 &#43;945,6 @@ static int smu_fini_fb_allocations(struct smu_cont=
ext *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-static int smu_override_pcie_parameters(struct smu_context *smu)<br>
-{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D smu-&g=
t;adev;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t pcie_gen =3D 0, pcie_width =
=3D 0, smu_pcie_arg;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;flags &amp; AMD_IS_APU)<=
br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pcie_gen_mask &amp; C=
AIL_PCIE_LINK_SPEED_SUPPORT_GEN4)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_gen =3D 3;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_gen_mask &a=
mp; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_gen =3D 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_gen_mask &a=
mp; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_gen =3D 1;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_gen_mask &a=
mp; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_gen =3D 0;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit 31:16: LCLK DPM level. 0 is DP=
M0, and 1 is DPM1<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Bit 15:8:&nbsp; PCIE GEN, 0 t=
o 3 corresponds to GEN1 to GEN4<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Bit 7:0:&nbsp;&nbsp; PCIE lan=
e width, 1 to 7 corresponds is x1 to x32<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pcie_mlw_mask &amp; C=
AIL_PCIE_LINK_WIDTH_SUPPORT_X16)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_width =3D 6;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mask &a=
mp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X12)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_width =3D 5;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mask &a=
mp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X8)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_width =3D 4;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mask &a=
mp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X4)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_width =3D 3;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mask &a=
mp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X2)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_width =3D 2;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mask &a=
mp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X1)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pcie_width =3D 1;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_pcie_arg =3D (1 &lt;&lt; 16) | (p=
cie_gen &lt;&lt; 8) | pcie_width;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(s=
mu,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; SMU_MSG_OverridePcieParameters,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; smu_pcie_arg);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pr_err(&quot;[%s] Attempt to override pcie params failed!\n&quot=
;, __func__);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-}<br>
-<br>
&nbsp;static int smu_smc_table_hw_init(struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool initialize)<br>
&nbsp;{<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index ccf711c..809de0d 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -468,6 &#43;468,7 @@ struct pptable_funcs {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_power_limit)(str=
uct smu_context *smu, uint32_t *limit, bool asic_default);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_dpm_clk_limited)=
(struct smu_context *smu, enum smu_clk_type clk_type,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t dpm_l=
evel, uint32_t *freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*update_pcie_parameters)(str=
uct smu_context *smu, uint32_t pcie_gen_cap, uint32_t pcie_width_cap);<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct smu_funcs<br>
@@ -550,6 &#43;551,7 @@ struct smu_funcs<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*mode2_reset)(struct =
smu_context *smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_dpm_ultimate_fre=
q)(struct smu_context *smu, enum smu_clk_type clk_type, uint32_t *min, uint=
32_t *max);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_soft_freq_limite=
d_range)(struct smu_context *smu, enum smu_clk_type clk_type, uint32_t min,=
 uint32_t max);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*override_pcie_parameters)(s=
truct smu_context *smu);<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;#define smu_init_microcode(smu) \<br>
@@ -782,6 &#43;784,12 @@ struct smu_funcs<br>
&nbsp;#define smu_set_soft_freq_limited_range(smu, clk_type, min, max) \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;set_soft_freq_limited_range ? (s=
mu)-&gt;funcs-&gt;set_soft_freq_limited_range((smu), (clk_type), (min), (ma=
x)) : -EINVAL)<br>
&nbsp;<br>
&#43;#define smu_override_pcie_parameters(smu) \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ((smu)-&gt;funcs-&gt;override_pcie_parameters ? (smu)-&gt;fu=
ncs-&gt;override_pcie_parameters((smu)) : 0)<br>
&#43;<br>
&#43;#define smu_update_pcie_parameters(smu, pcie_gen_cap, pcie_width_cap) =
\<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs-&gt;update_pcie_parameters ? (smu)-&gt;=
ppt_funcs-&gt;update_pcie_parameters((smu), (pcie_gen_cap), (pcie_width_cap=
)) : 0)<br>
&#43;<br>
&nbsp;extern int smu_get_atom_data_table(struct smu_context *smu, uint32_t =
table,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t *size=
, uint8_t *frev, uint8_t *crev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t **addr=
);<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index a583cf8..a2f33cf 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1592,6 &#43;1592,28 @@ static int navi10_get_power_limit(struct smu_con=
text *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int navi10_update_pcie_parameters(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t =
pcie_gen_cap,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t =
pcie_width_cap)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu-&gt;sm=
u_table.driver_pptable;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t smu_pcie_arg;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; NUM_LINK_LEV=
ELS; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; smu_pcie_arg =3D (i &lt;&lt; 16) |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((pptable-&g=
t;PcieGenSpeed[i] &lt;=3D pcie_gen_cap) ? (pptable-&gt;PcieGenSpeed[i] &lt;=
&lt; 8) :<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (pcie_gen_cap &lt;&lt; 8)) | ((pptable-=
&gt;PcieLaneCount[i] &lt;=3D pcie_width_cap) ?<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; pptable-&gt;PcieLaneCount[i] : pcie_width_cap);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; SMU_MSG_OverridePcieParameters,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; smu_pcie_arg);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;<br>
&nbsp;static const struct pptable_funcs navi10_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .tables_init =3D navi10_ta=
bles_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .alloc_dpm_context =3D nav=
i10_allocate_dpm_context,<br>
@@ -1630,6 &#43;1652,7 @@ static const struct pptable_funcs navi10_ppt_func=
s =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_thermal_temperature_r=
ange =3D navi10_get_thermal_temperature_range,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .display_disable_memory_cl=
ock_switch =3D navi10_display_disable_memory_clock_switch,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_power_limit =3D navi1=
0_get_power_limit,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .update_pcie_parameters =3D navi1=
0_update_pcie_parameters,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void navi10_set_ppt_funcs(struct smu_context *smu)<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index c9e90d5..a812ae5 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -35,6 &#43;35,7 @@<br>
&nbsp;#include &quot;vega20_ppt.h&quot;<br>
&nbsp;#include &quot;arcturus_ppt.h&quot;<br>
&nbsp;#include &quot;navi10_ppt.h&quot;<br>
&#43;#include &quot;amd_pcie.h&quot;<br>
&nbsp;<br>
&nbsp;#include &quot;asic_reg/thm/thm_11_0_2_offset.h&quot;<br>
&nbsp;#include &quot;asic_reg/thm/thm_11_0_2_sh_mask.h&quot;<br>
@@ -1792,6 &#43;1793,48 @@ static int smu_v11_0_set_soft_freq_limited_range=
(struct smu_context *smu, enum s<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int smu_v11_0_override_pcie_parameters(struct smu_context *smu)=
<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t pcie_gen =3D 0, pcie_wid=
th =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pcie_gen_mask &am=
p; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN4)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_gen =3D 3;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_gen_mas=
k &amp; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_gen =3D 2;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_gen_mas=
k &amp; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_gen =3D 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_gen_mas=
k &amp; CAIL_PCIE_LINK_SPEED_SUPPORT_GEN1)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_gen =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Bit 31:16: LCLK DPM level. 0 i=
s DPM0, and 1 is DPM1<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Bit 15:8:&nbsp; PCIE GEN,=
 0 to 3 corresponds to GEN1 to GEN4<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Bit 7:0:&nbsp;&nbsp; PCIE=
 lane width, 1 to 7 corresponds is x1 to x32<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pcie_mlw_mask &am=
p; CAIL_PCIE_LINK_WIDTH_SUPPORT_X16)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_width =3D 6;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mas=
k &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X12)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_width =3D 5;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mas=
k &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X8)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_width =3D 4;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mas=
k &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X4)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_width =3D 3;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mas=
k &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X2)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_width =3D 2;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (adev-&gt;pm.pcie_mlw_mas=
k &amp; CAIL_PCIE_LINK_WIDTH_SUPPORT_X1)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pcie_width =3D 1;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_update_pcie_parameter=
s(smu, pcie_gen, pcie_width);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;[%s] Attempt to override pcie params failed!\n&=
quot;, __func__);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;}<br>
&#43;<br>
&#43;<br>
&nbsp;static const struct smu_funcs smu_v11_0_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init_microcode =3D smu_v1=
1_0_init_microcode,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .load_microcode =3D smu_v1=
1_0_load_microcode,<br>
@@ -1844,6 &#43;1887,7 @@ static const struct smu_funcs smu_v11_0_funcs =3D=
 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .baco_reset =3D smu_v11_0_=
baco_reset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_dpm_ultimate_freq =3D=
 smu_v11_0_get_dpm_ultimate_freq,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_soft_freq_limited_ran=
ge =3D smu_v11_0_set_soft_freq_limited_range,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .override_pcie_parameters =3D smu=
_v11_0_override_pcie_parameters,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void smu_v11_0_set_smu_funcs(struct smu_context *smu)<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index f655ebd..adca84a 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -3135,6 &#43;3135,28 @@ static int vega20_get_thermal_temperature_range(=
struct smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int vega20_update_pcie_parameters(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t =
pcie_gen_cap,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t =
pcie_width_cap)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu-&gt;sm=
u_table.driver_pptable;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t smu_pcie_arg;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; NUM_LINK_LEV=
ELS; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; smu_pcie_arg =3D (i &lt;&lt; 16) |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((pptable-&g=
t;PcieGenSpeed[i] &lt;=3D pcie_gen_cap) ? (pptable-&gt;PcieGenSpeed[i] &lt;=
&lt; 8) :<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (pcie_gen_cap &lt;&lt; 8)) | ((pptable-=
&gt;PcieLaneCount[i] &lt;=3D pcie_width_cap) ?<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; pptable-&gt;PcieLaneCount[i] : pcie_width_cap);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; SMU_MSG_OverridePcieParameters,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; smu_pcie_arg);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;<br>
&nbsp;static const struct pptable_funcs vega20_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .tables_init =3D vega20_ta=
bles_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .alloc_dpm_context =3D veg=
a20_allocate_dpm_context,<br>
@@ -3177,7 &#43;3199,8 @@ static const struct pptable_funcs vega20_ppt_func=
s =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_fan_speed_percent =3D=
 vega20_get_fan_speed_percent,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_fan_speed_rpm =3D veg=
a20_get_fan_speed_rpm,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_watermarks_table =3D =
vega20_set_watermarks_table,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_thermal_temperature_range =3D ve=
ga20_get_thermal_temperature_range<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_thermal_temperature_range =
=3D vega20_get_thermal_temperature_range,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .update_pcie_parameters =3D vega2=
0_update_pcie_parameters<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void vega20_set_ppt_funcs(struct smu_context *smu)<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32967A1844094CCFCB600069A2900MN2PR12MB3296namp_--

--===============0164853561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0164853561==--

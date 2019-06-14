Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CBA45D9A
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 15:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175D489249;
	Fri, 14 Jun 2019 13:13:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612A989249
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 13:13:38 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1875.namprd12.prod.outlook.com (10.175.99.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 14 Jun 2019 13:13:36 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.012; Fri, 14 Jun 2019
 13:13:36 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: detect version of smu backend
Thread-Topic: [PATCH] drm/amd/powerplay: detect version of smu backend
Thread-Index: AQHVIn8KZ/U1XAfn8k2SxNtVYR7JyKabIOH3
Date: Fri, 14 Jun 2019 13:13:35 +0000
Message-ID: <BN6PR12MB18098EE94146CE430C417DB1F7EE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1560495689-12881-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1560495689-12881-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a8355cc-e6c3-4537-a8f2-08d6f0ca1bd0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1875; 
x-ms-traffictypediagnostic: BN6PR12MB1875:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB18754E42992A9EFBB7538FCDF7EE0@BN6PR12MB1875.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:31;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(136003)(346002)(396003)(366004)(199004)(189003)(74316002)(236005)(7736002)(9686003)(6246003)(186003)(3846002)(53936002)(7696005)(486006)(52536014)(33656002)(55016002)(8936002)(6306002)(26005)(6506007)(105004)(99286004)(54896002)(53546011)(446003)(102836004)(5660300002)(66066001)(76176011)(11346002)(6436002)(72206003)(76116006)(81166006)(4326008)(966005)(19627405001)(68736007)(8676002)(64756008)(229853002)(2906002)(86362001)(66476007)(66446008)(476003)(6116002)(73956011)(66946007)(256004)(71190400001)(14454004)(66556008)(2501003)(14444005)(110136005)(606006)(316002)(81156014)(54906003)(71200400001)(478600001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1875;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ox8iAzHs5fO0/KAsrCQBO0Bv4uox2GH7kV05aZIG71QF6cQp0LHoDago9bXiZnfxSQImjdhUeqczpbHLFMiCi9T+rWlvTlCb9FlT134hFNKjT1pmrXPaPpviUGEmDXD56MOAYl0PIZ2L60LuI2Q8JrRJQvJdR0kPhJJQTg640j/lqRNbNMqNAIhBT8RRIXJgk8y6FCb1sitYfUxfjitXG01UV6cUpsitjtH+k5L4yZX6/P9Hk1+W0yCSOmDv+AB+SoNXelI0cQw8hYvhLwawJZmHBKcgW4iL+CTvD9qLvbC5pbo0QLOhCa21fOoP1I9gTTSVoNlf9kgMbAHb2/J7QZR0G77+wHx7wM3K1MbPCWndUlaM63ZOXpVy4CBDLu2tGe10Pb6eNOLaMPdJeGlUUoCalGAcaZQxOhkhk5ilKdQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8355cc-e6c3-4537-a8f2-08d6f0ca1bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 13:13:35.7621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20sd8EvLlXoJAXryVD/jYXlks1BJhuB8HruRFrkjBrQ=;
 b=Tzd1amnLkHvW2IVXyQKjyw6Qm1FZk8RzP+OjFb+ky9GKx/uugw+3q3d7oKsJFVJHzjbTZK4BKJY0iED/3d4mhS4aMcbiH4gXX6izEbbDjcjIt80fFEKX5rALynBVj3HjC5r1CiUXJ26eSkbaixRF2+I9MkOLR7VrQ2pHrN4LAu8=
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
Content-Type: multipart/mixed; boundary="===============0368821962=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0368821962==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18098EE94146CE430C417DB1F7EE0BN6PR12MB1809namp_"

--_000_BN6PR12MB18098EE94146CE430C417DB1F7EE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Prike Li=
ang <Prike.Liang@amd.com>
Sent: Friday, June 14, 2019 3:01 AM
To: amd-gfx@lists.freedesktop.org
Cc: Liang, Prike; Huang, Ray; Feng, Kenneth; Quan, Evan
Subject: [PATCH] drm/amd/powerplay: detect version of smu backend

Change-Id: Ib050c8cf0c2c5af4c1f747cf596860f9be01a2d3
Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c             | 1 +
 drivers/gpu/drm/amd/powerplay/inc/hwmgr.h               | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c        | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c      | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c   | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c     | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c      | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c     | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c    | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c    | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c    | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c     | 1 +
 13 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/=
amd/powerplay/hwmgr/hwmgr.c
index f1d326c..b996819 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
@@ -194,6 +194,7 @@ int hwmgr_sw_init(struct pp_hwmgr *hwmgr)
                 return -EINVAL;

         phm_register_irq_handlers(hwmgr);
+       pr_info("hwmgr_sw_init smu backed is %s\n",hwmgr->smumgr_funcs->nam=
e);

         return hwmgr->smumgr_funcs->smu_init(hwmgr);
 }
diff --git a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h b/drivers/gpu/drm/am=
d/powerplay/inc/hwmgr.h
index c92999a..47dbecc 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
@@ -190,6 +190,7 @@ struct phm_vce_clock_voltage_dependency_table {
 };

 struct pp_smumgr_func {
+       char *name;
         int (*smu_init)(struct pp_hwmgr  *hwmgr);
         int (*smu_fini)(struct pp_hwmgr  *hwmgr);
         int (*start_smu)(struct pp_hwmgr  *hwmgr);
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu=
/drm/amd/powerplay/smumgr/ci_smumgr.c
index 9ef57fc..022f3c8 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
@@ -2935,6 +2935,7 @@ static int ci_update_smc_table(struct pp_hwmgr *hwmgr=
, uint32_t type)
 }

 const struct pp_smumgr_func ci_smu_funcs =3D {
+       .name =3D "ci_smu",
         .smu_init =3D ci_smu_init,
         .smu_fini =3D ci_smu_fini,
         .start_smu =3D ci_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c b/drivers/g=
pu/drm/amd/powerplay/smumgr/fiji_smumgr.c
index 0ce85b7..da025b1 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
@@ -2643,6 +2643,7 @@ static int fiji_update_dpm_settings(struct pp_hwmgr *=
hwmgr,
 }

 const struct pp_smumgr_func fiji_smu_funcs =3D {
+       .name =3D "fiji_smu",
         .smu_init =3D &fiji_smu_init,
         .smu_fini =3D &smu7_smu_fini,
         .start_smu =3D &fiji_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c b/driver=
s/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
index f24f13d..f414f22 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c
@@ -2661,6 +2661,7 @@ static bool iceland_is_dpm_running(struct pp_hwmgr *h=
wmgr)
 }

 const struct pp_smumgr_func iceland_smu_funcs =3D {
+       .name =3D "iceland_smu",
         .smu_init =3D &iceland_smu_init,
         .smu_fini =3D &smu7_smu_fini,
         .start_smu =3D &iceland_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c b/driv=
ers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
index 0d8958e..fbac2d3 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
@@ -2550,6 +2550,7 @@ static int polaris10_update_dpm_settings(struct pp_hw=
mgr *hwmgr,
 }

 const struct pp_smumgr_func polaris10_smu_funcs =3D {
+       .name =3D "polaris10_smu",
         .smu_init =3D polaris10_smu_init,
         .smu_fini =3D smu7_smu_fini,
         .start_smu =3D polaris10_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c b/drivers/=
gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c
index 6d11076a..ca66035 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c
@@ -291,6 +291,7 @@ static int smu10_smc_table_manager(struct pp_hwmgr *hwm=
gr, uint8_t *table, uint1


 const struct pp_smumgr_func smu10_smu_funcs =3D {
+       .name =3D "smu10_smu",
         .smu_init =3D &smu10_smu_init,
         .smu_fini =3D &smu10_smu_fini,
         .start_smu =3D &smu10_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c b/drivers/g=
pu/drm/amd/powerplay/smumgr/smu8_smumgr.c
index e2787e1..8189fe4 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c
@@ -881,6 +881,7 @@ static bool smu8_is_dpm_running(struct pp_hwmgr *hwmgr)
 }

 const struct pp_smumgr_func smu8_smu_funcs =3D {
+       .name =3D "smu8_smu",
         .smu_init =3D smu8_smu_init,
         .smu_fini =3D smu8_smu_fini,
         .start_smu =3D smu8_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c b/drivers/=
gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
index 060c0f7..be5b7df 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c
@@ -3240,6 +3240,7 @@ static int tonga_update_dpm_settings(struct pp_hwmgr =
*hwmgr,
 }

 const struct pp_smumgr_func tonga_smu_funcs =3D {
+       .name =3D "tonga_smu",
         .smu_init =3D &tonga_smu_init,
         .smu_fini =3D &smu7_smu_fini,
         .start_smu =3D &tonga_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c b/drivers=
/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
index c81acc3..7bfef8d 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
@@ -346,6 +346,7 @@ static int vega10_smc_table_manager(struct pp_hwmgr *hw=
mgr, uint8_t *table,
 }

 const struct pp_smumgr_func vega10_smu_funcs =3D {
+       .name =3D "vega10_smu",
         .smu_init =3D &vega10_smu_init,
         .smu_fini =3D &vega10_smu_fini,
         .start_smu =3D &vega10_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c b/drivers=
/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
index 1eaf0fa..9ad07a91c 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
@@ -386,6 +386,7 @@ static int vega12_smc_table_manager(struct pp_hwmgr *hw=
mgr, uint8_t *table,
 }

 const struct pp_smumgr_func vega12_smu_funcs =3D {
+       .name =3D"vega12_smu",
         .smu_init =3D &vega12_smu_init,
         .smu_fini =3D &vega12_smu_fini,
         .start_smu =3D &vega12_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c b/drivers=
/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
index f301a73..957446c 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
@@ -592,6 +592,7 @@ static int vega20_smc_table_manager(struct pp_hwmgr *hw=
mgr, uint8_t *table,
 }

 const struct pp_smumgr_func vega20_smu_funcs =3D {
+       .name =3D "vega20_smu",
         .smu_init =3D &vega20_smu_init,
         .smu_fini =3D &vega20_smu_fini,
         .start_smu =3D &vega20_start_smu,
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c b/drivers/=
gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
index d499204..7c960b0 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
@@ -2279,6 +2279,7 @@ static int vegam_thermal_setup_fan_table(struct pp_hw=
mgr *hwmgr)
 }

 const struct pp_smumgr_func vegam_smu_funcs =3D {
+       .name =3D "vegam_smu",
         .smu_init =3D vegam_smu_init,
         .smu_fini =3D smu7_smu_fini,
         .start_smu =3D vegam_start_smu,
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18098EE94146CE430C417DB1F7EE0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Prike Liang &lt;Prike.Liang@a=
md.com&gt;<br>
<b>Sent:</b> Friday, June 14, 2019 3:01 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Liang, Prike; Huang, Ray; Feng, Kenneth; Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: detect version of smu backend</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Change-Id: Ib050c8cf0c2c5af4c1f747cf596860f9be01a2=
d3<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/hwmgr.h&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c&nbsp;&nbsp; | 1=
 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c&nbsp;&nbsp;&nbsp;=
&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c&nbsp;&nbsp;&nbsp;=
&nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c&nbsp;&nbsp;&nbsp=
; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c&nbsp;&nbsp;&nbsp=
; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c&nbsp;&nbsp;&nbsp=
; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c&nbsp;&nbsp;&nbsp;=
&nbsp; | 1 &#43;<br>
&nbsp;13 files changed, 13 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/=
amd/powerplay/hwmgr/hwmgr.c<br>
index f1d326c..b996819 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c<br>
@@ -194,6 &#43;194,7 @@ int hwmgr_sw_init(struct pp_hwmgr *hwmgr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; phm_register_irq_handlers(=
hwmgr);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_info(&quot;hwmgr_sw_init smu b=
acked is %s\n&quot;,hwmgr-&gt;smumgr_funcs-&gt;name);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return hwmgr-&gt;smumgr_fu=
ncs-&gt;smu_init(hwmgr);<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h b/drivers/gpu/drm/am=
d/powerplay/inc/hwmgr.h<br>
index c92999a..47dbecc 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h<br>
@@ -190,6 &#43;190,7 @@ struct phm_vce_clock_voltage_dependency_table {<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct pp_smumgr_func {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *name;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*smu_init)(struct pp_=
hwmgr&nbsp; *hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*smu_fini)(struct pp_=
hwmgr&nbsp; *hwmgr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*start_smu)(struct pp=
_hwmgr&nbsp; *hwmgr);<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu=
/drm/amd/powerplay/smumgr/ci_smumgr.c<br>
index 9ef57fc..022f3c8 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c<br>
@@ -2935,6 &#43;2935,7 @@ static int ci_update_smc_table(struct pp_hwmgr *h=
wmgr, uint32_t type)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func ci_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;ci_smu&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D ci_smu_init,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D ci_smu_fini,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D ci_start_sm=
u,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c b/drivers/g=
pu/drm/amd/powerplay/smumgr/fiji_smumgr.c<br>
index 0ce85b7..da025b1 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c<br>
@@ -2643,6 &#43;2643,7 @@ static int fiji_update_dpm_settings(struct pp_hwm=
gr *hwmgr,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func fiji_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;fiji_smu&quot;,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;fiji_sm=
u_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;smu7_sm=
u_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;fiji_s=
tart_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c b/driver=
s/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c<br>
index f24f13d..f414f22 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/iceland_smumgr.c<br>
@@ -2661,6 &#43;2661,7 @@ static bool iceland_is_dpm_running(struct pp_hwmg=
r *hwmgr)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func iceland_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;iceland_smu&quot;=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;iceland=
_smu_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;smu7_sm=
u_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;icelan=
d_start_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c b/driv=
ers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c<br>
index 0d8958e..fbac2d3 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c<b=
r>
@@ -2550,6 &#43;2550,7 @@ static int polaris10_update_dpm_settings(struct p=
p_hwmgr *hwmgr,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func polaris10_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;polaris10_smu&quo=
t;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D polaris10_sm=
u_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D smu7_smu_fin=
i,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D polaris10_s=
tart_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c b/drivers/=
gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c<br>
index 6d11076a..ca66035 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/smu10_smumgr.c<br>
@@ -291,6 &#43;291,7 @@ static int smu10_smc_table_manager(struct pp_hwmgr =
*hwmgr, uint8_t *table, uint1<br>
&nbsp;<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func smu10_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;smu10_smu&quot;,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;smu10_s=
mu_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;smu10_s=
mu_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;smu10_=
start_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c b/drivers/g=
pu/drm/amd/powerplay/smumgr/smu8_smumgr.c<br>
index e2787e1..8189fe4 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/smu8_smumgr.c<br>
@@ -881,6 &#43;881,7 @@ static bool smu8_is_dpm_running(struct pp_hwmgr *hw=
mgr)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func smu8_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;smu8_smu&quot;,<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D smu8_smu_ini=
t,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D smu8_smu_fin=
i,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D smu8_start_=
smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c b/drivers/=
gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c<br>
index 060c0f7..be5b7df 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/tonga_smumgr.c<br>
@@ -3240,6 &#43;3240,7 @@ static int tonga_update_dpm_settings(struct pp_hw=
mgr *hwmgr,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func tonga_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;tonga_smu&quot;,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;tonga_s=
mu_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;smu7_sm=
u_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;tonga_=
start_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c b/drivers=
/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c<br>
index c81acc3..7bfef8d 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c<br>
@@ -346,6 &#43;346,7 @@ static int vega10_smc_table_manager(struct pp_hwmgr=
 *hwmgr, uint8_t *table,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func vega10_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;vega10_smu&quot;,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;vega10_=
smu_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;vega10_=
smu_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;vega10=
_start_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c b/drivers=
/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c<br>
index 1eaf0fa..9ad07a91c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c<br>
@@ -386,6 &#43;386,7 @@ static int vega12_smc_table_manager(struct pp_hwmgr=
 *hwmgr, uint8_t *table,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func vega12_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D&quot;vega12_smu&quot;,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;vega12_=
smu_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;vega12_=
smu_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;vega12=
_start_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c b/drivers=
/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c<br>
index f301a73..957446c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c<br>
@@ -592,6 &#43;592,7 @@ static int vega20_smc_table_manager(struct pp_hwmgr=
 *hwmgr, uint8_t *table,<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func vega20_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;vega20_smu&quot;,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D &amp;vega20_=
smu_init,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D &amp;vega20_=
smu_fini,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D &amp;vega20=
_start_smu,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c b/drivers/=
gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c<br>
index d499204..7c960b0 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c<br>
@@ -2279,6 &#43;2279,7 @@ static int vegam_thermal_setup_fan_table(struct p=
p_hwmgr *hwmgr)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;const struct pp_smumgr_func vegam_smu_funcs =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .name =3D &quot;vegam_smu&quot;,<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_init =3D vegam_smu_in=
it,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .smu_fini =3D smu7_smu_fin=
i,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_smu =3D vegam_start=
_smu,<br>
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

--_000_BN6PR12MB18098EE94146CE430C417DB1F7EE0BN6PR12MB1809namp_--

--===============0368821962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0368821962==--

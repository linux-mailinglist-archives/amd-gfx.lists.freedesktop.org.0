Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC4AD9CD
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 15:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB59489B12;
	Mon,  9 Sep 2019 13:16:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271B89B12
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 13:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfSgmBiNE8iDnoBSD7YAHOCNpYm1xqlDt/BpZonAfj7kqkY+ZgCfRMM41Xi1rMY49nQKfiFPWqCiqhpmlewB37DN3IwH+GDl3fehFAfGacZUkYaa3tGf1Z8otckSL7JLodHKsYaoFcTUy02bw6J2azYk8ytXAqvG/H+5BXxH9l3t8Po/7QPJAc8fw5k3QAjeo4UVqxfPmAsgue4DKDTh1IIY2eu48lTPvw3cr9jkg/AIJHYekSw+j2PqRtRdaYw1d+WSYamtxzY3gHZfVzUB1leTW6sfljEIOpAjeSCSfijQ1rIZypwXNTtmbkNWKvc/r0Cn6Wk6olxHYssAhsIbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P9C9OufkKhLN43W45LAtBH70IM7OKg/FKJ1j3gySmc=;
 b=YlFs+VHWCQFkUeE6KXggZz3wuT8vQpUmFsBTHcXRQLyQge24P3ev5J4mF0hFa1haizoUKZ5MFSlWPrHMle1m6QuCqrWj8voOh+DBBvHr+QV0R/25L7GSVkCZQk6V401frVA2/tizri1oAs6gv/e6H03zgTk+AgHkskQrt8QjI2vJUJT5UnZ72O0V9Zq5ExjM3b70uix0XnbIPK0wvMOJrshZkcXJYyClpsTsbvNJ2mBcFG6J2SQ51g9IhrlkzZkIP5+9EMJlKeNeWVz6q5cZy5lEnr0rphRHrkx1vUy/0MV06l3Kdp9kWpshDRBMdUjUxij0RWXm8Yf2chVF7a2dqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 13:16:36 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 13:16:36 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: issue DC-BTC for arcturus on SMU
 init
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: issue DC-BTC for arcturus on SMU
 init
Thread-Index: AQHVZwJqvalKqRSteEuhJDoX60Yb6qcjU3z3
Date: Mon, 9 Sep 2019 13:16:36 +0000
Message-ID: <MN2PR12MB329633E823EFA5F505FA4624A2B70@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190909113311.28497-1-evan.quan@amd.com>
In-Reply-To: <20190909113311.28497-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1d6fcac-893b-4a1a-91f1-08d73527f137
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3056; 
x-ms-traffictypediagnostic: MN2PR12MB3056:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3056E98257F2273C839D3E96A2B70@MN2PR12MB3056.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(2906002)(66556008)(66574012)(66066001)(81156014)(5660300002)(7696005)(7736002)(74316002)(66946007)(66476007)(81166006)(8936002)(8676002)(102836004)(229853002)(6506007)(53546011)(26005)(6436002)(186003)(76116006)(76176011)(105004)(486006)(476003)(446003)(11346002)(53936002)(6246003)(236005)(9686003)(54896002)(6306002)(55016002)(316002)(110136005)(4326008)(256004)(54906003)(2501003)(25786009)(64756008)(66446008)(91956017)(33656002)(52536014)(6116002)(19627405001)(3846002)(478600001)(14454004)(966005)(86362001)(606006)(71200400001)(99286004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3056;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bb1TAT7vcP04l64PkZyrSKxnBXbPglfWZqiiLUsLVKIr9NCPVVM0JLj8J5sqs5nK3Y9T4f7CRZjDGb2bvjOArO9WmkbMmLEIyGfpk/joQfKk8h/KZaRKQ6AaiDI4bu4ZZOZPT/NUjPLQuPzDwC0cIhKpzMGPbTx0EQHsWub1JZpjuhsdLnQkuIUWPi9QhtwgKCGyK2urv0s4jzujgPgVkDyQ5bTlGY0oBI5tfXdLvJOCl1i722GcZtPjH7m9/GR1ggbeirr+INrrLRR2XG5i2xEqgPceaU2PFZclH9y04BHPuzjNz2HSNq0CXtm5mIc4/XH0seZ5f4VwcwFUvqa3ggcI2WtFbSCTqI04ajHBiHjT9+BL2hvisS3snHjjlkWTOxQMdmoKTUBpypRlOObDO+Uwql6RRP/D0/mWLXTalw0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d6fcac-893b-4a1a-91f1-08d73527f137
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 13:16:36.0943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVbpC3rHTaCShmt/zDq5aJnohZFQi/SAdHIEArO6cdhTYADJV/va0REnAK3lpS7G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P9C9OufkKhLN43W45LAtBH70IM7OKg/FKJ1j3gySmc=;
 b=xRD58l6yU4CYNRRRhDs5PCuk2ux8ORkTR77XyYbEw3PZYMAatZT7H5m4bZWTljWQVMVEzv5hvMFGZV4tGsOjUDESNgAS/wZidS2DMZG9FHud3RhBOQ3jgvOiWh1cD+NK7oieosc+UBvg+ImyBsBXtdwg+6ww8vnJdbjjoaKx6EI=
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: multipart/mixed; boundary="===============0365142683=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0365142683==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329633E823EFA5F505FA4624A2B70MN2PR12MB3296namp_"

--_000_MN2PR12MB329633E823EFA5F505FA4624A2B70MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Quan, Ev=
an <Evan.Quan@amd.com>
Sent: Monday, September 9, 2019 7:33 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Li, Candice <Candice.Li@amd.com>; Gui, Jack <Jack.Gui@amd.com>; Quan, E=
van <Evan.Quan@amd.com>
Subject: [PATCH 1/2] drm/amd/powerplay: issue DC-BTC for arcturus on SMU in=
it

Need to perform DC-BTC for arcturus on bootup.

Change-Id: I7f048ba17cafe8909c5ee1e00830e4f8527d1a05
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c      |  4 ++--
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c    | 17 ++++++++++++-----
 drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h  |  6 +++---
 .../gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h  |  3 +--
 drivers/gpu/drm/amd/powerplay/inc/smu_types.h   |  1 +
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c      |  2 +-
 6 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 2602d9fa2d77..f13e134be42e 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1079,8 +1079,8 @@ static int smu_smc_table_hw_init(struct smu_context *=
smu,
         if (ret)
                 return ret;

-       /* issue RunAfllBtc msg */
-       ret =3D smu_run_afll_btc(smu);
+       /* issue Run*Btc msg */
+       ret =3D smu_run_btc(smu);
         if (ret)
                 return ret;

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index 61cce5fed29f..7f6fc6d9a181 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -112,8 +112,7 @@ static struct smu_11_0_cmn2aisc_mapping arcturus_messag=
e_map[SMU_MSG_MAX_COUNT]
         MSG_MAP(PrepareMp1ForShutdown,               PPSMC_MSG_PrepareMp1F=
orShutdown),
         MSG_MAP(SoftReset,                           PPSMC_MSG_SoftReset),
         MSG_MAP(RunAfllBtc,                          PPSMC_MSG_RunAfllBtc)=
,
-       MSG_MAP(RunGfxDcBtc,                         PPSMC_MSG_RunGfxDcBtc)=
,
-       MSG_MAP(RunSocDcBtc,                         PPSMC_MSG_RunSocDcBtc)=
,
+       MSG_MAP(RunDcBtc,                            PPSMC_MSG_RunDcBtc),
         MSG_MAP(DramLogSetDramAddrHigh,              PPSMC_MSG_DramLogSetD=
ramAddrHigh),
         MSG_MAP(DramLogSetDramAddrLow,               PPSMC_MSG_DramLogSetD=
ramAddrLow),
         MSG_MAP(DramLogSetDramSize,                  PPSMC_MSG_DramLogSetD=
ramSize),
@@ -547,9 +546,17 @@ static int arcturus_append_powerplay_table(struct smu_=
context *smu)
         return 0;
 }

-static int arcturus_run_btc_afll(struct smu_context *smu)
+static int arcturus_run_btc(struct smu_context *smu)
 {
-       return smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc);
+       int ret =3D 0;
+
+       ret =3D smu_send_smc_msg(smu, SMU_MSG_RunAfllBtc);
+       if (ret) {
+               pr_err("RunAfllBtc failed!\n");
+               return ret;
+       }
+
+       return smu_send_smc_msg(smu, SMU_MSG_RunDcBtc);
 }

 static int arcturus_populate_umd_state_clk(struct smu_context *smu)
@@ -2307,7 +2314,7 @@ static const struct pptable_funcs arcturus_ppt_funcs =
=3D {
         /* init dpm */
         .get_allowed_feature_mask =3D arcturus_get_allowed_feature_mask,
         /* btc */
-       .run_afll_btc =3D arcturus_run_btc_afll,
+       .run_btc =3D arcturus_run_btc,
         /* dpm/clk tables */
         .set_default_dpm_table =3D arcturus_set_default_dpm_table,
         .populate_umd_state_clk =3D arcturus_populate_umd_state_clk,
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index 3c69065b029e..3de88d084615 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -427,7 +427,7 @@ struct pptable_funcs {
         int (*get_smu_table_index)(struct smu_context *smu, uint32_t index=
);
         int (*get_smu_power_index)(struct smu_context *smu, uint32_t index=
);
         int (*get_workload_type)(struct smu_context *smu, enum PP_SMC_POWE=
R_PROFILE profile);
-       int (*run_afll_btc)(struct smu_context *smu);
+       int (*run_btc)(struct smu_context *smu);
         int (*get_allowed_feature_mask)(struct smu_context *smu, uint32_t =
*feature_mask, uint32_t num);
         enum amd_pm_state_type (*get_current_power_state)(struct smu_conte=
xt *smu);
         int (*set_default_dpm_table)(struct smu_context *smu);
@@ -745,8 +745,8 @@ struct smu_funcs
         ((smu)->ppt_funcs? ((smu)->ppt_funcs->get_smu_power_index? (smu)->=
ppt_funcs->get_smu_power_index((smu), (src)) : -EINVAL) : -EINVAL)
 #define smu_workload_get_type(smu, profile) \
         ((smu)->ppt_funcs? ((smu)->ppt_funcs->get_workload_type? (smu)->pp=
t_funcs->get_workload_type((smu), (profile)) : -EINVAL) : -EINVAL)
-#define smu_run_afll_btc(smu) \
-       ((smu)->ppt_funcs? ((smu)->ppt_funcs->run_afll_btc? (smu)->ppt_func=
s->run_afll_btc((smu)) : 0) : 0)
+#define smu_run_btc(smu) \
+       ((smu)->ppt_funcs? ((smu)->ppt_funcs->run_btc? (smu)->ppt_funcs->ru=
n_btc((smu)) : 0) : 0)
 #define smu_get_allowed_feature_mask(smu, feature_mask, num) \
         ((smu)->ppt_funcs? ((smu)->ppt_funcs->get_allowed_feature_mask? (s=
mu)->ppt_funcs->get_allowed_feature_mask((smu), (feature_mask), (num)) : 0)=
 : 0)
 #define smu_set_deep_sleep_dcefclk(smu, clk) \
diff --git a/drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h b/drivers/g=
pu/drm/amd/powerplay/inc/arcturus_ppsmc.h
index 78e5927b7711..e3291259b249 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h
@@ -95,8 +95,7 @@

 //BTC
 #define PPSMC_MSG_RunAfllBtc                     0x30
-#define PPSMC_MSG_RunGfxDcBtc                    0x31
-#define PPSMC_MSG_RunSocDcBtc                    0x32
+#define PPSMC_MSG_RunDcBtc                       0x31

 //Debug
 #define PPSMC_MSG_DramLogSetDramAddrHigh         0x33
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_types.h
index b0dd05d431dd..ab8c92a60fc4 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h
@@ -114,6 +114,7 @@
        __SMU_DUMMY_MAP(PowerDownJpeg),                \
        __SMU_DUMMY_MAP(BacoAudioD3PME),               \
        __SMU_DUMMY_MAP(ArmD3),                        \
+       __SMU_DUMMY_MAP(RunDcBtc),                     \
        __SMU_DUMMY_MAP(RunGfxDcBtc),                  \
        __SMU_DUMMY_MAP(RunSocDcBtc),                  \
        __SMU_DUMMY_MAP(SetMemoryChannelEnable),       \
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 929f61891dfa..e9ecc3f7aab1 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -3145,7 +3145,7 @@ static const struct pptable_funcs vega20_ppt_funcs =
=3D {
         .get_smu_table_index =3D vega20_get_smu_table_index,
         .get_smu_power_index =3D vega20_get_pwr_src_index,
         .get_workload_type =3D vega20_get_workload_type,
-       .run_afll_btc =3D vega20_run_btc_afll,
+       .run_btc =3D vega20_run_btc_afll,
         .get_allowed_feature_mask =3D vega20_get_allowed_feature_mask,
         .get_current_power_state =3D vega20_get_current_power_state,
         .set_default_dpm_table =3D vega20_set_default_dpm_table,
--
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329633E823EFA5F505FA4624A2B70MN2PR12MB3296namp_
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
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Quan, Evan &lt;Evan.Quan@amd.=
com&gt;<br>
<b>Sent:</b> Monday, September 9, 2019 7:33 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Li, Candice &lt;Candice.Li@amd.com&gt;; Gui, Jack &lt;Jack.Gui@a=
md.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/amd/powerplay: issue DC-BTC for arcturus on=
 SMU init</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Need to perform DC-BTC for arcturus on bootup.<br>
<br>
Change-Id: I7f048ba17cafe8909c5ee1e00830e4f8527d1a05<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp; 4 &#43;&#43;--<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c&nbsp;&nbsp;&nbsp; | 17 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-----<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp; |&nbsp; 6 &#43;&=
#43;&#43;---<br>
&nbsp;.../gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h&nbsp; |&nbsp; 3 &#43;-=
-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_types.h&nbsp;&nbsp; |&nbsp; 1 &=
#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp; 2 &#43;-<br>
&nbsp;6 files changed, 20 insertions(&#43;), 13 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 2602d9fa2d77..f13e134be42e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -1079,8 &#43;1079,8 @@ static int smu_smc_table_hw_init(struct smu_conte=
xt *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* issue RunAfllBtc msg */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_run_afll_btc(smu);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* issue Run*Btc msg */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_run_btc(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index 61cce5fed29f..7f6fc6d9a181 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -112,8 &#43;112,7 @@ static struct smu_11_0_cmn2aisc_mapping arcturus_me=
ssage_map[SMU_MSG_MAX_COUNT]<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(PrepareMp1ForShutd=
own,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; PPSMC_MSG_PrepareMp1ForShutdown),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(SoftReset,&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; P=
PSMC_MSG_SoftReset),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(RunAfllBtc,&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPSMC_=
MSG_RunAfllBtc),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(RunGfxDcBtc,&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPSMC_MSG_RunGfxDcBtc)=
,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(RunSocDcBtc,&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPSMC_MSG_RunSocDcBtc)=
,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(RunDcBtc,&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PPS=
MC_MSG_RunDcBtc),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(DramLogSetDramAddr=
High,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; PPSMC_MSG_DramLogSetDramAddrHigh),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(DramLogSetDramAddr=
Low,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; PPSMC_MSG_DramLogSetDramAddrLow),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MSG_MAP(DramLogSetDramSize=
,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; PPSMC_MSG_DramLogSetDramSize),<br>
@@ -547,9 &#43;546,17 @@ static int arcturus_append_powerplay_table(struct =
smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-static int arcturus_run_btc_afll(struct smu_context *smu)<br>
&#43;static int arcturus_run_btc(struct smu_context *smu)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_send_smc_msg(smu, SMU_MSG_=
RunAfllBtc);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_send_smc_msg(smu, SMU=
_MSG_RunAfllBtc);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;RunAfllBtc failed!\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return smu_send_smc_msg(smu, SMU_=
MSG_RunDcBtc);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static int arcturus_populate_umd_state_clk(struct smu_context *smu)<b=
r>
@@ -2307,7 &#43;2314,7 @@ static const struct pptable_funcs arcturus_ppt_fu=
ncs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* init dpm */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_allowed_feature_mask =
=3D arcturus_get_allowed_feature_mask,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* btc */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .run_afll_btc =3D arcturus_run_btc_af=
ll,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .run_btc =3D arcturus_run_btc,<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* dpm/clk tables */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_default_dpm_table =3D=
 arcturus_set_default_dpm_table,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .populate_umd_state_clk =
=3D arcturus_populate_umd_state_clk,<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index 3c69065b029e..3de88d084615 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -427,7 &#43;427,7 @@ struct pptable_funcs {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_smu_table_index)=
(struct smu_context *smu, uint32_t index);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_smu_power_index)=
(struct smu_context *smu, uint32_t index);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_workload_type)(s=
truct smu_context *smu, enum PP_SMC_POWER_PROFILE profile);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*run_afll_btc)(struct smu_contex=
t *smu);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*run_btc)(struct smu_context=
 *smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*get_allowed_feature_=
mask)(struct smu_context *smu, uint32_t *feature_mask, uint32_t num);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pm_state_type (*g=
et_current_power_state)(struct smu_context *smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int (*set_default_dpm_tabl=
e)(struct smu_context *smu);<br>
@@ -745,8 &#43;745,8 @@ struct smu_funcs<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs? ((sm=
u)-&gt;ppt_funcs-&gt;get_smu_power_index? (smu)-&gt;ppt_funcs-&gt;get_smu_p=
ower_index((smu), (src)) : -EINVAL) : -EINVAL)<br>
&nbsp;#define smu_workload_get_type(smu, profile) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs? ((sm=
u)-&gt;ppt_funcs-&gt;get_workload_type? (smu)-&gt;ppt_funcs-&gt;get_workloa=
d_type((smu), (profile)) : -EINVAL) : -EINVAL)<br>
-#define smu_run_afll_btc(smu) \<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs? ((smu)-&gt;ppt_=
funcs-&gt;run_afll_btc? (smu)-&gt;ppt_funcs-&gt;run_afll_btc((smu)) : 0) : =
0)<br>
&#43;#define smu_run_btc(smu) \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs? ((smu)-&gt;=
ppt_funcs-&gt;run_btc? (smu)-&gt;ppt_funcs-&gt;run_btc((smu)) : 0) : 0)<br>
&nbsp;#define smu_get_allowed_feature_mask(smu, feature_mask, num) \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((smu)-&gt;ppt_funcs? ((sm=
u)-&gt;ppt_funcs-&gt;get_allowed_feature_mask? (smu)-&gt;ppt_funcs-&gt;get_=
allowed_feature_mask((smu), (feature_mask), (num)) : 0) : 0)<br>
&nbsp;#define smu_set_deep_sleep_dcefclk(smu, clk) \<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h b/drivers/g=
pu/drm/amd/powerplay/inc/arcturus_ppsmc.h<br>
index 78e5927b7711..e3291259b249 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/arcturus_ppsmc.h<br>
@@ -95,8 &#43;95,7 @@<br>
&nbsp;<br>
&nbsp;//BTC<br>
&nbsp;#define PPSMC_MSG_RunAfllBtc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0x30<br>
-#define PPSMC_MSG_RunGfxDcBtc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x31<=
br>
-#define PPSMC_MSG_RunSocDcBtc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x32<=
br>
&#43;#define PPSMC_MSG_RunDcBtc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 0x31<br>
&nbsp;<br>
&nbsp;//Debug<br>
&nbsp;#define PPSMC_MSG_DramLogSetDramAddrHigh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0x33<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_types.h<br>
index b0dd05d431dd..ab8c92a60fc4 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_types.h<br>
@@ -114,6 &#43;114,7 @@<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(PowerDownJpeg),&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(BacoAudioD3PME),=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(ArmD3),&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(RunDcBtc),&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(RunGfxDcBtc),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(RunSocDcBtc),&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __SMU_DUMMY_MAP(SetMemoryChannel=
Enable),&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 929f61891dfa..e9ecc3f7aab1 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -3145,7 &#43;3145,7 @@ static const struct pptable_funcs vega20_ppt_func=
s =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D v=
ega20_get_smu_table_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_power_index =3D v=
ega20_get_pwr_src_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_workload_type =3D veg=
a20_get_workload_type,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .run_afll_btc =3D vega20_run_btc_afll=
,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .run_btc =3D vega20_run_btc_afll,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_allowed_feature_mask =
=3D vega20_get_allowed_feature_mask,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_current_power_state =
=3D vega20_get_current_power_state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_default_dpm_table =3D=
 vega20_set_default_dpm_table,<br>
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

--_000_MN2PR12MB329633E823EFA5F505FA4624A2B70MN2PR12MB3296namp_--

--===============0365142683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0365142683==--

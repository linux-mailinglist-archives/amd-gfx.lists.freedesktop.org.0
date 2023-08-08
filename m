Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF457738AB
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Aug 2023 09:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175F710E3AE;
	Tue,  8 Aug 2023 07:40:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F021B10E094
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Aug 2023 06:40:57 +0000 (UTC)
Date: Tue, 08 Aug 2023 06:40:42 +0000
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="PpUcRl+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1691476851; x=1691736051;
 bh=rLyqhqtc/MDZ2VUlG4CH6NUh7rXYVmwrFO5WIOp1Wv0=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=PpUcRl+QCCH8VQQTilrvzfFeQsLP9st5SaVucMJyUkTUCUClrq6MB6Njhm8ew+8kG
 RfEHf2/R5IogGt3Dw/F5wKWk1AAlQnytSBFsV39Y/yWQGL6JexkPkwEDEWTTQYWu7l
 dCx9UgDrNUS7U4cE8/Vt8mgwzy7T3lo8h4AjIFbN0tZPieeqg0a060hagzrg16xY7v
 VZmxobXOSg0tFv4iBP9nQ3DhP43aF5Yw37k1N1s0FxIXQTQjVyMPmQdqYK5lguh4X+
 BeLrvZgsG1ZFhO87xcFpmKs2v6P/AMqzXkyLuLGTTSrrbskvTJcVyOlXGNWcYZ4oHR
 PYwPAI/IjbAJw==
To: amd-gfx@lists.freedesktop.org
From: Umio Yasuno <coelacanth_dream@protonmail.com>
Subject: [PATCH] fix throttle_status for other than MP0 11.0.7
Message-ID: <20230808064025.1008680-1-coelacanth_dream@protonmail.com>
Feedback-ID: 19510729:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 08 Aug 2023 07:40:23 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2720
Signed-off-by: Umio Yasuno <coelacanth_dream@protonmail.com>
---
 .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/driv=
ers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 85d53597e..548d25cf3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -578,7 +578,9 @@ static int sienna_cichlid_tables_init(struct smu_contex=
t *smu)
 =09return -ENOMEM;
 }
=20
-static uint32_t sienna_cichlid_get_throttler_status_locked(struct smu_cont=
ext *smu)
+static uint32_t sienna_cichlid_get_throttler_status_locked(struct smu_cont=
ext *smu,
+=09=09=09=09=09=09=09   bool use_metrics_v3,
+=09=09=09=09=09=09=09   bool use_metrics_v2)
 {
 =09struct smu_table_context *smu_table=3D &smu->smu_table;
 =09SmuMetricsExternal_t *metrics_ext =3D
@@ -586,13 +588,11 @@ static uint32_t sienna_cichlid_get_throttler_status_l=
ocked(struct smu_context *s
 =09uint32_t throttler_status =3D 0;
 =09int i;
=20
-=09if ((smu->adev->ip_versions[MP1_HWIP][0] =3D=3D IP_VERSION(11, 0, 7)) &=
&
-=09     (smu->smc_fw_version >=3D 0x3A4900)) {
+=09if (use_metrics_v3) {
 =09=09for (i =3D 0; i < THROTTLER_COUNT; i++)
 =09=09=09throttler_status |=3D
 =09=09=09=09(metrics_ext->SmuMetrics_V3.ThrottlingPercentage[i] ? 1U << i =
: 0);
-=09} else if ((smu->adev->ip_versions[MP1_HWIP][0] =3D=3D IP_VERSION(11, 0=
, 7)) &&
-=09     (smu->smc_fw_version >=3D 0x3A4300)) {
+=09} else if (use_metrics_v2) {
 =09=09for (i =3D 0; i < THROTTLER_COUNT; i++)
 =09=09=09throttler_status |=3D
 =09=09=09=09(metrics_ext->SmuMetrics_V2.ThrottlingPercentage[i] ? 1U << i =
: 0);
@@ -854,7 +854,7 @@ static int sienna_cichlid_get_smu_metrics_data(struct s=
mu_context *smu,
 =09=09=09metrics->TemperatureVrSoc) * SMU_TEMPERATURE_UNITS_PER_CENTIGRADE=
S;
 =09=09break;
 =09case METRICS_THROTTLER_STATUS:
-=09=09*value =3D sienna_cichlid_get_throttler_status_locked(smu);
+=09=09*value =3D sienna_cichlid_get_throttler_status_locked(smu, use_metri=
cs_v3, use_metrics_v2);
 =09=09break;
 =09case METRICS_CURR_FANSPEED:
 =09=09*value =3D use_metrics_v3 ? metrics_v3->CurrFanSpeed :
@@ -4056,7 +4056,7 @@ static ssize_t sienna_cichlid_get_gpu_metrics(struct =
smu_context *smu,
 =09gpu_metrics->current_dclk1 =3D use_metrics_v3 ? metrics_v3->CurrClock[P=
PCLK_DCLK_1] :
 =09=09use_metrics_v2 ? metrics_v2->CurrClock[PPCLK_DCLK_1] : metrics->Curr=
Clock[PPCLK_DCLK_1];
=20
-=09gpu_metrics->throttle_status =3D sienna_cichlid_get_throttler_status_lo=
cked(smu);
+=09gpu_metrics->throttle_status =3D sienna_cichlid_get_throttler_status_lo=
cked(smu, use_metrics_v3, use_metrics_v2);
 =09gpu_metrics->indep_throttle_status =3D
 =09=09=09smu_cmn_get_indep_throttler_status(gpu_metrics->throttle_status,
 =09=09=09=09=09=09=09   sienna_cichlid_throttler_map);
--=20
2.40.1



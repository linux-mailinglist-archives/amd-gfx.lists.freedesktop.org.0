Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3EAA6D83
	for <lists+amd-gfx@lfdr.de>; Fri,  2 May 2025 11:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5165410E8DB;
	Fri,  2 May 2025 09:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="Gh0SzYKk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Fri, 02 May 2025 06:47:09 UTC
Received: from mail-106109.protonmail.ch (mail-106109.protonmail.ch
 [79.135.106.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7A210E15F
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 May 2025 06:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1746168047; x=1746427247;
 bh=Rz68PaThzXa95CG6beDQUf5BSIp5YgymyHN+afgVJ+M=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=Gh0SzYKkZv8UpWQLtO0UfudQqUUAy8OHuJqAcllVPKuAhHVFBxlI7q1PkQxD3ZA/g
 WCBj60XGbY0vLY/Ry2qf3l4bgv3EljiskHuIIubw7+7BvKvMPxHFuVqBR8GLkqqLoo
 gq8MMN2SHzOTBShXC7kZxSKrA9Uytk/pNWc4xNBgJRkRhqLGv7WipN5A/NsllwrhSX
 Af6Oliw3oGzJ8xPUe8KmugMnE9ZBiyPIJ5rO+Wvt0dpjqaDOGrLHra9R+R86rTjdOU
 tnjRz1C4OX5qDOMkiizpym1mk6/TwJmpBmNpa7zjvyRTHIW/q8Ct2nHqSABMAnxhIg
 t2QjjaWb8zo5A==
Date: Fri, 02 May 2025 06:40:44 +0000
To: amd-gfx@lists.freedesktop.org
From: Umio Yasuno <coelacanth_dream@protonmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Evan Quan <evan.quan@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
Subject: [PATCH] drm/amdgpu/smu13: set the threshold for TEMP_HOTSPOT
 throttling
Message-ID: <20250502063202.32382-1-coelacanth_dream@protonmail.com>
Feedback-ID: 19510729:user:proton
X-Pm-Message-ID: 07991e5e072468ec6a0639e3099883c732c09e64
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 May 2025 09:05:32 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ThrottlingPercentage for TEMP_HOTSPOT on SMU v13.0.0/7 is almost always
greater then or equal to 1, so we set the threshold value.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3251

Signed-off-by: Umio Yasuno <coelacanth_dream@protonmail.com>
---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c    | 13 ++++++++++---
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c    | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 5a9711e8c..f708f0ccd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -744,14 +744,21 @@ static int smu_v13_0_0_system_features_control(struct=
 smu_context *smu,
 =09return smu_v13_0_system_features_control(smu, en);
 }
=20
+#define SMU_13_0_0_TEMP_HOTSPOT_THRESHOLD=0990
 static uint32_t smu_v13_0_get_throttler_status(SmuMetrics_t *metrics)
 {
 =09uint32_t throttler_status =3D 0;
 =09int i;
=20
-=09for (i =3D 0; i < THROTTLER_COUNT; i++)
-=09=09throttler_status |=3D
-=09=09=09(metrics->ThrottlingPercentage[i] ? 1U << i : 0);
+=09for (i =3D 0; i < THROTTLER_COUNT; i++) {
+=09=09if(i =3D=3D THROTTLER_TEMP_HOTSPOT_BIT) {
+=09=09=09throttler_status |=3D
+=09=09=09=09((metrics->ThrottlingPercentage[i] >=3D SMU_13_0_0_TEMP_HOTSPO=
T_THRESHOLD) ? 1U << i : 0);
+=09=09} else {
+=09=09=09throttler_status |=3D
+=09=09=09=09(metrics->ThrottlingPercentage[i] ? 1U << i : 0);
+=09=09}
+=09}
=20
 =09return throttler_status;
 }
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers=
/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index c8f4f6fb4..ff49b835b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -736,14 +736,21 @@ static bool smu_v13_0_7_is_dpm_running(struct smu_con=
text *smu)
 =09return !!(feature_enabled & SMC_DPM_FEATURE);
 }
=20
+#define SMU_13_0_7_TEMP_HOTSPOT_THRESHOLD=0990
 static uint32_t smu_v13_0_7_get_throttler_status(SmuMetrics_t *metrics)
 {
 =09uint32_t throttler_status =3D 0;
 =09int i;
=20
-=09for (i =3D 0; i < THROTTLER_COUNT; i++)
-=09=09throttler_status |=3D
-=09=09=09(metrics->ThrottlingPercentage[i] ? 1U << i : 0);
+=09for (i =3D 0; i < THROTTLER_COUNT; i++) {
+=09=09if(i =3D=3D THROTTLER_TEMP_HOTSPOT_BIT) {
+=09=09=09throttler_status |=3D
+=09=09=09=09((metrics->ThrottlingPercentage[i] >=3D SMU_13_0_7_TEMP_HOTSPO=
T_THRESHOLD) ? 1U << i : 0);
+=09=09} else {
+=09=09=09throttler_status |=3D
+=09=09=09=09(metrics->ThrottlingPercentage[i] ? 1U << i : 0);
+=09=09}
+=09}
=20
 =09return throttler_status;
 }
--=20
2.39.5



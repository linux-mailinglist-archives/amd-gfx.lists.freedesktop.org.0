Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC71FC77F
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2020 09:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F636EAA9;
	Wed, 17 Jun 2020 07:34:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80206E250
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 07:16:53 +0000 (UTC)
Received: from localhost.localdomain (ip5f5af534.dynamic.kabel-deutschland.de
 [95.90.245.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8CAD12000C0C4;
 Wed, 17 Jun 2020 09:16:50 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amdgpu: Warn about disabled DPM
Date: Wed, 17 Jun 2020 09:16:31 +0200
Message-Id: <20200617071631.7274-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:34:39 +0000
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Currently, besides there is no explicit message, that DPM is disabled.
The user would need to know, that the missing success line is an
indicator.

    [drm] amdgpu: dpm initialized

So, add an explicit message, and make it log level warning, as disabling
dpm is not the default.

Resolves: https://gitlab.freedesktop.org/drm/amd/-/issues/1173
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/gpu/drm/amd/amdgpu/kv_dpm.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/si_dpm.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/kv_dpm.c b/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
index 4b3faaccecb9..071215e8039a 100644
--- a/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
@@ -3014,8 +3014,10 @@ static int kv_dpm_sw_init(void *handle)
 	adev->pm.current_mclk = adev->clock.default_mclk;
 	adev->pm.int_thermal_type = THERMAL_TYPE_NONE;
 
-	if (amdgpu_dpm == 0)
+	if (amdgpu_dpm == 0) {
+		DRM_WARN("amdgpu: dpm disabled\n");
 		return 0;
+	}
 
 	INIT_WORK(&adev->pm.dpm.thermal.work, amdgpu_dpm_thermal_work_handler);
 	mutex_lock(&adev->pm.mutex);
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
index c00ba4b23c9a..6af89587f80c 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
@@ -7687,8 +7687,10 @@ static int si_dpm_sw_init(void *handle)
 	adev->pm.current_mclk = adev->clock.default_mclk;
 	adev->pm.int_thermal_type = THERMAL_TYPE_NONE;
 
-	if (amdgpu_dpm == 0)
+	if (amdgpu_dpm == 0) {
+		DRM_INFO("amdgpu: dpm disabled\n");
 		return 0;
+	}
 
 	ret = si_dpm_init_microcode(adev);
 	if (ret)
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

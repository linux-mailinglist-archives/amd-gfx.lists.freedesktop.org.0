Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E55201ACF
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2020 21:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3346E4CD;
	Fri, 19 Jun 2020 19:01:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1D66E430
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2020 18:50:25 +0000 (UTC)
Received: from localhost.localdomain (ip5f5af4f7.dynamic.kabel-deutschland.de
 [95.90.244.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 32E86206442F3;
 Fri, 19 Jun 2020 20:50:24 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/amdgpu: Inform user about effect of running
 without DPM
Date: Fri, 19 Jun 2020 20:50:08 +0200
Message-Id: <20200619185009.12966-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619185009.12966-1-pmenzel@molgen.mpg.de>
References: <20200619185009.12966-1-pmenzel@molgen.mpg.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jun 2020 19:01:06 +0000
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Currently, most users have no idea about the effects of failed DPM
initialization. So add it to the log message.

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/gpu/drm/amd/amdgpu/kv_dpm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/si_dpm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/kv_dpm.c b/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
index b179bdc17cdc..f054ded902f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/kv_dpm.c
@@ -3033,7 +3033,7 @@ static int kv_dpm_sw_init(void *handle)
 dpm_failed:
 	kv_dpm_fini(adev);
 	mutex_unlock(&adev->pm.mutex);
-	drm_err(adev, "amdgpu: dpm initialization failed\n");
+	drm_err(adev, "amdgpu: dpm initialization failed. Clocks set up by firmware will be used. Most likely they are low, so performance might suffer.\n");
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
index 8ba673ca2f5e..f7edc1d50df4 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
@@ -7710,7 +7710,7 @@ static int si_dpm_sw_init(void *handle)
 dpm_failed:
 	si_dpm_fini(adev);
 	mutex_unlock(&adev->pm.mutex);
-	drm_err(adev, "amdgpu: dpm initialization failed\n");
+	drm_err(adev, "amdgpu: dpm initialization failed. Clocks set up by firmware will be used. Most likely they are low, so performance might suffer.\n");
 	return ret;
 }
 
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

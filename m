Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798029A1F5F
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2024 12:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD3510E7D3;
	Thu, 17 Oct 2024 10:06:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A2B10E7DC
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2024 10:06:23 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49HA6JNG1492248; Thu, 17 Oct 2024 15:36:19 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49HA6JN81492247;
 Thu, 17 Oct 2024 15:36:19 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v4 15/15] drm/amdgpu: validate get_clockgating_state before use
Date: Thu, 17 Oct 2024 15:36:15 +0530
Message-Id: <20241017100615.1492144-16-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017100615.1492144-1-sunil.khatri@amd.com>
References: <20241017100615.1492144-1-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Validate the function pointer for get_clockgating_state
before making a function call.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c    | 9 ++++++---
 drivers/gpu/drm/amd/amdgpu/soc21.c | 6 ++++--
 drivers/gpu/drm/amd/amdgpu/soc24.c | 6 ++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 6b72169be8f8..40c720b32c59 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1084,11 +1084,14 @@ static void nv_common_get_clockgating_state(void *handle, u64 *flags)
 	if (amdgpu_sriov_vf(adev))
 		*flags = 0;
 
-	adev->nbio.funcs->get_clockgating_state(adev, flags);
+	if (adev->nbio.funcs && adev->nbio.funcs->get_clockgating_state)
+		adev->nbio.funcs->get_clockgating_state(adev, flags);
 
-	adev->hdp.funcs->get_clock_gating_state(adev, flags);
+	if (adev->hdp.funcs && adev->hdp.funcs->get_clock_gating_state)
+		adev->hdp.funcs->get_clock_gating_state(adev, flags);
 
-	adev->smuio.funcs->get_clock_gating_state(adev, flags);
+	if (adev->smuio.funcs && adev->smuio.funcs->get_clock_gating_state)
+		adev->smuio.funcs->get_clock_gating_state(adev, flags);
 }
 
 static const struct amd_ip_funcs nv_common_ip_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 1c07ebdc0d1f..196286be35b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -975,9 +975,11 @@ static void soc21_common_get_clockgating_state(void *handle, u64 *flags)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	adev->nbio.funcs->get_clockgating_state(adev, flags);
+	if (adev->nbio.funcs && adev->nbio.funcs->get_clockgating_state)
+		adev->nbio.funcs->get_clockgating_state(adev, flags);
 
-	adev->hdp.funcs->get_clock_gating_state(adev, flags);
+	if (adev->hdp.funcs && adev->hdp.funcs->get_clock_gating_state)
+		adev->hdp.funcs->get_clock_gating_state(adev, flags);
 }
 
 static const struct amd_ip_funcs soc21_common_ip_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index 3af10ef4b793..f4278a0fa8f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -564,9 +564,11 @@ static void soc24_common_get_clockgating_state(void *handle, u64 *flags)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	adev->nbio.funcs->get_clockgating_state(adev, flags);
+	if (adev->nbio.funcs && adev->nbio.funcs->get_clockgating_state)
+		adev->nbio.funcs->get_clockgating_state(adev, flags);
 
-	adev->hdp.funcs->get_clock_gating_state(adev, flags);
+	if (adev->hdp.funcs && adev->hdp.funcs->get_clock_gating_state)
+		adev->hdp.funcs->get_clock_gating_state(adev, flags);
 
 	return;
 }
-- 
2.34.1


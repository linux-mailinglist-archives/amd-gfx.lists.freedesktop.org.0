Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABAF998CFD
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2024 18:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6525310E98A;
	Thu, 10 Oct 2024 16:16:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554FC10E991
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2024 16:16:19 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49AGGEV11003560; Thu, 10 Oct 2024 21:46:14 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49AGGELe1003559;
 Thu, 10 Oct 2024 21:46:14 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 06/14] drm/amdgpu: validate suspend before function call
Date: Thu, 10 Oct 2024 21:46:01 +0530
Message-Id: <20241010161609.1003502-7-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010161609.1003502-1-sunil.khatri@amd.com>
References: <20241010161609.1003502-1-sunil.khatri@amd.com>
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

Before making a function call to suspend, validate
the function pointer like we do in sw_init.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/aldebaran.c      | 15 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 26 ++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c   | 12 ++++++----
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c | 15 ++++++------
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c   | 15 ++++++------
 5 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
index c1ff24335a0c..e55d680d95ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -85,13 +85,14 @@ static int aldebaran_mode2_suspend_ip(struct amdgpu_device *adev)
 			      AMD_IP_BLOCK_TYPE_SDMA))
 			continue;
 
-		r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
-
-		if (r) {
-			dev_err(adev->dev,
-				"suspend of IP block <%s> failed %d\n",
-				adev->ip_blocks[i].version->funcs->name, r);
-			return r;
+		if (adev->ip_blocks[i].version->funcs->suspend) {
+			r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
+			if (r) {
+				dev_err(adev->dev,
+					"suspend of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name, r);
+				return r;
+			}
 		}
 
 		adev->ip_blocks[i].status.hw = false;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 340141a74c12..51607ac8adb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3471,12 +3471,14 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
 			continue;
 
 		/* XXX handle errors */
-		r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
-		/* XXX handle errors */
-		if (r) {
-			DRM_ERROR("suspend of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
-			return r;
+		if (adev->ip_blocks[i].version->funcs->suspend) {
+			r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
+			/* XXX handle errors */
+			if (r) {
+				DRM_ERROR("suspend of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name, r);
+				return r;
+			}
 		}
 
 		adev->ip_blocks[i].status.hw = false;
@@ -3553,11 +3555,13 @@ static int amdgpu_device_ip_suspend_phase2(struct amdgpu_device *adev)
 			continue;
 
 		/* XXX handle errors */
-		r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
-		/* XXX handle errors */
-		if (r) {
-			DRM_ERROR("suspend of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+		if (adev->ip_blocks[i].version->funcs->suspend) {
+			r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
+			/* XXX handle errors */
+			if (r) {
+				DRM_ERROR("suspend of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name, r);
+			}
 		}
 		adev->ip_blocks[i].status.hw = false;
 		/* handle putting the SMC in the appropriate state */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index 3e2724590dbf..6bc75aa1c3b1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -40,11 +40,13 @@ static int amdgpu_reset_xgmi_reset_on_init_suspend(struct amdgpu_device *adev)
 			continue;
 
 		/* XXX handle errors */
-		r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
-		/* XXX handle errors */
-		if (r) {
-			dev_err(adev->dev, "suspend of IP block <%s> failed %d",
-				adev->ip_blocks[i].version->funcs->name, r);
+		if (adev->ip_blocks[i].version->funcs->suspend) {
+			r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
+			/* XXX handle errors */
+			if (r) {
+				dev_err(adev->dev, "suspend of IP block <%s> failed %d",
+					adev->ip_blocks[i].version->funcs->name, r);
+			}
 		}
 		adev->ip_blocks[i].status.hw = false;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c b/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
index 475b7df3a908..10dece12509f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
+++ b/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
@@ -81,13 +81,14 @@ static int sienna_cichlid_mode2_suspend_ip(struct amdgpu_device *adev)
 			      AMD_IP_BLOCK_TYPE_SDMA))
 			continue;
 
-		r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
-
-		if (r) {
-			dev_err(adev->dev,
-				"suspend of IP block <%s> failed %d\n",
-				adev->ip_blocks[i].version->funcs->name, r);
-			return r;
+		if (adev->ip_blocks[i].version->funcs->suspend) {
+			r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
+			if (r) {
+				dev_err(adev->dev,
+					"suspend of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name, r);
+				return r;
+			}
 		}
 		adev->ip_blocks[i].status.hw = false;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c b/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
index 5ea9090b5040..ab049f0b4d39 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
@@ -80,13 +80,14 @@ static int smu_v13_0_10_mode2_suspend_ip(struct amdgpu_device *adev)
 			      AMD_IP_BLOCK_TYPE_MES))
 			continue;
 
-		r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
-
-		if (r) {
-			dev_err(adev->dev,
-				"suspend of IP block <%s> failed %d\n",
-				adev->ip_blocks[i].version->funcs->name, r);
-			return r;
+		if (adev->ip_blocks[i].version->funcs->suspend) {
+			r = adev->ip_blocks[i].version->funcs->suspend(&adev->ip_blocks[i]);
+			if (r) {
+				dev_err(adev->dev,
+					"suspend of IP block <%s> failed %d\n",
+					adev->ip_blocks[i].version->funcs->name, r);
+				return r;
+			}
 		}
 		adev->ip_blocks[i].status.hw = false;
 	}
-- 
2.34.1


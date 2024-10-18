Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D919A3F82
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2024 15:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C2E10E926;
	Fri, 18 Oct 2024 13:23:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547A710E919
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2024 13:23:44 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49IDNdkD1638278; Fri, 18 Oct 2024 18:53:39 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49IDNd7c1638277;
 Fri, 18 Oct 2024 18:53:39 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 01/12] drm/amdgpu: validate hw_fini before function call
Date: Fri, 18 Oct 2024 18:53:16 +0530
Message-Id: <20241018132327.1638247-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018132327.1638247-1-sunil.khatri@amd.com>
References: <20241018132327.1638247-1-sunil.khatri@amd.com>
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

Before making a function call to hw_fini, validate
the function pointer like we do in sw_init.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 38 +++++++++++++---------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ef715b2bbcdb..b7277bef7463 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3269,6 +3269,25 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+static void amdgpu_ip_block_hw_fini(struct amdgpu_ip_block *ip_block)
+{
+	int r;
+
+	if (ip_block->version->funcs->hw_fini) {
+		DRM_ERROR("hw_fini of IP block <%s> not defined\n",
+			  ip_block->version->funcs->name);
+	} else {
+		r = ip_block->version->funcs->hw_fini(ip_block);
+		/* XXX handle errors */
+		if (r) {
+			DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
+				  ip_block->version->funcs->name, r);
+		}
+	}
+
+	ip_block->status.hw = false;
+}
+
 /**
  * amdgpu_device_smu_fini_early - smu hw_fini wrapper
  *
@@ -3278,7 +3297,7 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
  */
 static void amdgpu_device_smu_fini_early(struct amdgpu_device *adev)
 {
-	int i, r;
+	int i;
 
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) > IP_VERSION(9, 0, 0))
 		return;
@@ -3287,13 +3306,7 @@ static void amdgpu_device_smu_fini_early(struct amdgpu_device *adev)
 		if (!adev->ip_blocks[i].status.hw)
 			continue;
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
-			r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
-			/* XXX handle errors */
-			if (r) {
-				DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
-			}
-			adev->ip_blocks[i].status.hw = false;
+			amdgpu_ip_block_hw_fini(&adev->ip_blocks[i]);
 			break;
 		}
 	}
@@ -3326,14 +3339,7 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 		if (!adev->ip_blocks[i].status.hw)
 			continue;
 
-		r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
-		/* XXX handle errors */
-		if (r) {
-			DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
-		}
-
-		adev->ip_blocks[i].status.hw = false;
+		amdgpu_ip_block_hw_fini(&adev->ip_blocks[i]);
 	}
 
 	if (amdgpu_sriov_vf(adev)) {
-- 
2.34.1


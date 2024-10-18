Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234989A3F80
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2024 15:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A75D10E923;
	Fri, 18 Oct 2024 13:23:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECBA10E91C
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2024 13:23:44 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49IDNdO31638298; Fri, 18 Oct 2024 18:53:39 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49IDNdwd1638297;
 Fri, 18 Oct 2024 18:53:39 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 05/12] drm/amdgpu: validate resume before function call
Date: Fri, 18 Oct 2024 18:53:20 +0530
Message-Id: <20241018132327.1638247-6-sunil.khatri@amd.com>
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

Before making a function call to resume, validate
the function pointer like we do in sw_init.

Use the helper function amdgpu_ip_block_resume where
same checks and calls are repeated.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/aldebaran.c      | 13 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 64 ++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c | 20 ++-----
 drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c   | 10 +---
 5 files changed, 49 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/aldebaran.c b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
index 07f195a89e9a..3a588fecb0c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/aldebaran.c
+++ b/drivers/gpu/drm/amd/amdgpu/aldebaran.c
@@ -239,7 +239,7 @@ static int aldebaran_mode2_restore_ip(struct amdgpu_device *adev)
 		dev_err(adev->dev, "Failed to get BIF handle\n");
 		return -EINVAL;
 	}
-	r = cmn_block->version->funcs->resume(cmn_block);
+	r = amdgpu_ip_block_resume(cmn_block);
 	if (r)
 		return r;
 
@@ -275,15 +275,10 @@ static int aldebaran_mode2_restore_ip(struct amdgpu_device *adev)
 		      adev->ip_blocks[i].version->type ==
 			      AMD_IP_BLOCK_TYPE_SDMA))
 			continue;
-		r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-		if (r) {
-			dev_err(adev->dev,
-				"resume of IP block <%s> failed %d\n",
-				adev->ip_blocks[i].version->funcs->name, r);
-			return r;
-		}
 
-		adev->ip_blocks[i].status.hw = true;
+		r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+		if (r)
+			return r;
 	}
 
 	for (i = 0; i < adev->num_ip_blocks; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index df57efa019ba..fba10ad44be9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -366,6 +366,8 @@ bool amdgpu_device_ip_is_valid(struct amdgpu_device *adev,
 			      enum amd_ip_block_type block_type);
 int amdgpu_ip_block_suspend(struct amdgpu_ip_block *ip_block);
 
+int amdgpu_ip_block_resume(struct amdgpu_ip_block *ip_block);
+
 #define AMDGPU_MAX_IP_NUM 16
 
 struct amdgpu_ip_block_status {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2dca9fd14ad3..e77050224865 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -290,6 +290,24 @@ int amdgpu_ip_block_suspend(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
+int amdgpu_ip_block_resume(struct amdgpu_ip_block *ip_block)
+{
+	int r;
+
+	if (ip_block->version->funcs->resume) {
+		r = ip_block->version->funcs->resume(ip_block);
+		if (r) {
+			dev_err(ip_block->adev->dev,
+				"resume of IP block <%s> failed %d\n",
+				ip_block->version->funcs->name, r);
+			return r;
+		}
+	}
+
+	ip_block->status.hw = true;
+	return 0;
+}
+
 /**
  * DOC: board_info
  *
@@ -2762,12 +2780,9 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 				break;
 
 			if (amdgpu_in_reset(adev) || adev->in_suspend) {
-				r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-				if (r) {
-					DRM_ERROR("resume of IP block <%s> failed %d\n",
-							  adev->ip_blocks[i].version->funcs->name, r);
+				r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+				if (r)
 					return r;
-				}
 			} else {
 				r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 				if (r) {
@@ -2775,9 +2790,8 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 							  adev->ip_blocks[i].version->funcs->name, r);
 					return r;
 				}
+				adev->ip_blocks[i].status.hw = true;
 			}
-
-			adev->ip_blocks[i].status.hw = true;
 			break;
 		}
 	}
@@ -3683,15 +3697,19 @@ static int amdgpu_device_ip_reinit_late_sriov(struct amdgpu_device *adev)
 				block->status.hw)
 				continue;
 
-			if (block->version->type == AMD_IP_BLOCK_TYPE_SMC)
-				r = block->version->funcs->resume(&adev->ip_blocks[i]);
-			else
+			if (block->version->type == AMD_IP_BLOCK_TYPE_SMC) {
+				r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+				if (r)
+					return r;
+			} else {
 				r = block->version->funcs->hw_init(&adev->ip_blocks[i]);
-
-			DRM_INFO("RE-INIT-late: %s %s\n", block->version->funcs->name, r?"failed":"succeeded");
-			if (r)
-				return r;
-			block->status.hw = true;
+				if (r) {
+					DRM_ERROR("hw_init of IP block <%s> failed %d\n",
+						  adev->ip_blocks[i].version->funcs->name, r);
+					return r;
+				}
+				block->status.hw = true;
+			}
 		}
 	}
 
@@ -3722,13 +3740,9 @@ static int amdgpu_device_ip_resume_phase1(struct amdgpu_device *adev)
 		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH ||
 		    (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP && amdgpu_sriov_vf(adev))) {
 
-			r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-			if (r) {
-				DRM_ERROR("resume of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+			r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+			if (r)
 				return r;
-			}
-			adev->ip_blocks[i].status.hw = true;
 		}
 	}
 
@@ -3760,13 +3774,9 @@ static int amdgpu_device_ip_resume_phase2(struct amdgpu_device *adev)
 		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH ||
 		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP)
 			continue;
-		r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-		if (r) {
-			DRM_ERROR("resume of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+		r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+		if (r)
 			return r;
-		}
-		adev->ip_blocks[i].status.hw = true;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c b/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
index 341de4e38eeb..9b01e074af47 100644
--- a/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
+++ b/drivers/gpu/drm/amd/amdgpu/sienna_cichlid.c
@@ -169,15 +169,9 @@ static int sienna_cichlid_mode2_restore_ip(struct amdgpu_device *adev)
 
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH) {
-			r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-			if (r) {
-				dev_err(adev->dev,
-					"resume of IP block <%s> failed %d\n",
-					adev->ip_blocks[i].version->funcs->name, r);
+			r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+			if (r)
 				return r;
-			}
-
-			adev->ip_blocks[i].status.hw = true;
 		}
 	}
 
@@ -187,15 +181,9 @@ static int sienna_cichlid_mode2_restore_ip(struct amdgpu_device *adev)
 		      adev->ip_blocks[i].version->type ==
 			      AMD_IP_BLOCK_TYPE_SDMA))
 			continue;
-		r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-		if (r) {
-			dev_err(adev->dev,
-				"resume of IP block <%s> failed %d\n",
-				adev->ip_blocks[i].version->funcs->name, r);
+		r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+		if (r)
 			return r;
-		}
-
-		adev->ip_blocks[i].status.hw = true;
 	}
 
 	for (i = 0; i < adev->num_ip_blocks; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c b/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
index 12e792ca873b..e70ebad3f9fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
+++ b/drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c
@@ -180,15 +180,9 @@ static int smu_v13_0_10_mode2_restore_ip(struct amdgpu_device *adev)
 		      adev->ip_blocks[i].version->type ==
 			      AMD_IP_BLOCK_TYPE_SDMA))
 			continue;
-		r = adev->ip_blocks[i].version->funcs->resume(&adev->ip_blocks[i]);
-		if (r) {
-			dev_err(adev->dev,
-				"resume of IP block <%s> failed %d\n",
-				adev->ip_blocks[i].version->funcs->name, r);
+		r = amdgpu_ip_block_resume(&adev->ip_blocks[i]);
+		if (r)
 			return r;
-		}
-
-		adev->ip_blocks[i].status.hw = true;
 	}
 
 	for (i = 0; i < adev->num_ip_blocks; i++) {
-- 
2.34.1


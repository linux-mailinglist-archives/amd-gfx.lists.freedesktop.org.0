Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B823996D9D
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2024 16:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FCD10E744;
	Wed,  9 Oct 2024 14:25:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C0210E74D
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2024 14:25:18 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 499EPBjO891937; Wed, 9 Oct 2024 19:55:11 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 499EPBpL891936;
 Wed, 9 Oct 2024 19:55:11 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 05/13] drm/amdgpu: validate hw_fini before function call
Date: Wed,  9 Oct 2024 19:54:54 +0530
Message-Id: <20241009142502.891864-6-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009142502.891864-1-sunil.khatri@amd.com>
References: <20241009142502.891864-1-sunil.khatri@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cf84b50f2355..340141a74c12 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3287,11 +3287,14 @@ static void amdgpu_device_smu_fini_early(struct amdgpu_device *adev)
 		if (!adev->ip_blocks[i].status.hw)
 			continue;
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
-			r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
-			/* XXX handle errors */
-			if (r) {
-				DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
+			if (adev->ip_blocks[i].version->funcs->hw_fini) {
+				r = adev->ip_blocks[i].version->funcs->hw_fini(
+					&adev->ip_blocks[i]);
+				/* XXX handle errors */
+				if (r) {
+					DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
+						adev->ip_blocks[i].version->funcs->name, r);
+				}
 			}
 			adev->ip_blocks[i].status.hw = false;
 			break;
@@ -3325,12 +3328,13 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.hw)
 			continue;
-
-		r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
-		/* XXX handle errors */
-		if (r) {
-			DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
-				  adev->ip_blocks[i].version->funcs->name, r);
+		if (adev->ip_blocks[i].version->funcs->hw_fini) {
+			r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
+			/* XXX handle errors */
+			if (r) {
+				DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
+					  adev->ip_blocks[i].version->funcs->name, r);
+			}
 		}
 
 		adev->ip_blocks[i].status.hw = false;
-- 
2.34.1


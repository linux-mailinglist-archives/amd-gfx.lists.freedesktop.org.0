Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7279D5A99
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Nov 2024 09:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5229310E21B;
	Fri, 22 Nov 2024 08:03:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9716310E21B
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Nov 2024 08:03:45 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4AM83ewt2740512; Fri, 22 Nov 2024 13:33:40 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4AM83ek92740511;
 Fri, 22 Nov 2024 13:33:40 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 1/2] drm/amdgpu: Update the variable name to dma_buf
Date: Fri, 22 Nov 2024 13:33:35 +0530
Message-Id: <20241122080336.2740473-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Instead of fixing the warning for missing variable
its better to update the variable name to match
with the style followed in the code.

This will fix the below mentioned warning:
warning: Function parameter or struct member 'dbuf' not described in 'amdgpu_bo_create_isp_user'
warning: Excess function parameter 'dma_buf' description in 'amdgpu_bo_create_isp_user'

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4e6d218839f9..4f057996ef35 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -373,14 +373,14 @@ EXPORT_SYMBOL(amdgpu_bo_create_kernel);
  * 0 on success, negative error code otherwise.
  */
 int amdgpu_bo_create_isp_user(struct amdgpu_device *adev,
-			   struct dma_buf *dbuf, u32 domain, struct amdgpu_bo **bo,
+			   struct dma_buf *dma_buf, u32 domain, struct amdgpu_bo **bo,
 			   u64 *gpu_addr)
 
 {
 	struct drm_gem_object *gem_obj;
 	int r;
 
-	gem_obj = amdgpu_gem_prime_import(&adev->ddev, dbuf);
+	gem_obj = amdgpu_gem_prime_import(&adev->ddev, dma_buf);
 	*bo = gem_to_amdgpu_bo(gem_obj);
 	if (!(*bo)) {
 		dev_err(adev->dev, "failed to get valid isp user bo\n");
-- 
2.34.1


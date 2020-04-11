Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2C1A5F2F
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Apr 2020 17:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749EC6E0DC;
	Sun, 12 Apr 2020 15:24:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14E6E32B
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Apr 2020 14:04:02 +0000 (UTC)
Received: from localhost.localdomain ([90.126.162.40]) by mwinf5d41 with ME
 id RS3y2200H0scBcy03S3yw4; Sat, 11 Apr 2020 16:04:00 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 Apr 2020 16:04:00 +0200
X-ME-IP: 90.126.162.40
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 evan.quan@amd.com, andrey.grodzovsky@amd.com, Monk.Liu@amd.com,
 kent.russell@amd.com, le.ma@amd.com
Subject: [PATCH] drm/amdgpu: Add missing '\n' in log messages
Date: Sat, 11 Apr 2020 16:03:56 +0200
Message-Id: <20200411140356.28211-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Apr 2020 15:24:13 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

While at it, split some long lines that where not that far.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Most of them have been added in commit bd607166af7f ("drm/amdgpu: Enable reading FRU chip via I2C v3")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 87f7c129c8ce..3d0a50e8c36b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3249,25 +3249,25 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	r = device_create_file(adev->dev, &dev_attr_pcie_replay_count);
 	if (r) {
-		dev_err(adev->dev, "Could not create pcie_replay_count");
+		dev_err(adev->dev, "Could not create pcie_replay_count\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_product_name);
 	if (r) {
-		dev_err(adev->dev, "Could not create product_name");
+		dev_err(adev->dev, "Could not create product_name\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_product_number);
 	if (r) {
-		dev_err(adev->dev, "Could not create product_number");
+		dev_err(adev->dev, "Could not create product_number\n");
 		return r;
 	}
 
 	r = device_create_file(adev->dev, &dev_attr_serial_number);
 	if (r) {
-		dev_err(adev->dev, "Could not create serial_number");
+		dev_err(adev->dev, "Could not create serial_number\n");
 		return r;
 	}
 
@@ -4270,7 +4270,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		job_signaled = true;
 
 	if (job_signaled) {
-		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset");
+		dev_info(adev->dev, "Guilty job already signaled, skipping HW reset\n");
 		goto skip_hw_reset;
 	}
 
@@ -4339,10 +4339,12 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 		if (r) {
 			/* bad news, how to tell it to userspace ? */
-			dev_info(tmp_adev->dev, "GPU reset(%d) failed\n", atomic_read(&tmp_adev->gpu_reset_counter));
+			dev_info(tmp_adev->dev, "GPU reset(%d) failed\n",
+				 atomic_read(&tmp_adev->gpu_reset_counter));
 			amdgpu_vf_error_put(tmp_adev, AMDGIM_ERROR_VF_GPU_RESET_FAIL, 0, r);
 		} else {
-			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n", atomic_read(&tmp_adev->gpu_reset_counter));
+			dev_info(tmp_adev->dev, "GPU reset(%d) succeeded!\n",
+				 atomic_read(&tmp_adev->gpu_reset_counter));
 		}
 	}
 
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

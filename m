Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9498D875
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2024 16:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8D910E74A;
	Wed,  2 Oct 2024 14:00:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1610E74A
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2024 14:00:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 492E0FKL162337; Wed, 2 Oct 2024 19:30:15 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 492E0F60162336;
 Wed, 2 Oct 2024 19:30:15 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/amdgpu: change the comment from handle to ip_block
Date: Wed,  2 Oct 2024 19:30:13 +0530
Message-Id: <20241002140013.162323-1-sunil.khatri@amd.com>
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

htmldoc geenration depend upon the input arguments etc
to generate the document. After update of handle to
ip_block then update needs in comments too to fix the
warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410021904.YyGjlpk9-lkp@intel.com
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c           | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c           | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c           | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c           | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c         | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c         | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c         | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c            |  4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c            | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c            | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c            | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c            | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c            | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c          | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c          | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c          | 16 ++++++++--------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  4 ++--
 24 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index cf2d55c2fd98..8e0725198dae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -219,7 +219,7 @@ static const struct dmi_system_id acp_quirk_table[] = {
 /**
  * acp_hw_init - start and test ACP block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int acp_hw_init(struct amdgpu_ip_block *ip_block)
@@ -497,7 +497,7 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * acp_hw_fini - stop the hardware block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int acp_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 5a919dae8d8e..416e8b3fad79 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -46,7 +46,7 @@ static int isp_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * isp_hw_init - start and test isp block
  *
- * @handle: handle for amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int isp_hw_init(struct amdgpu_ip_block *ip_block)
@@ -69,7 +69,7 @@ static int isp_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * isp_hw_fini - stop the hardware block
  *
- * @handle: handle for amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int isp_hw_fini(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
index 33da094f1a7d..03b8b7cd5229 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
@@ -458,7 +458,7 @@ static int jpeg_v1_0_process_interrupt(struct amdgpu_device *adev,
 /**
  * jpeg_v1_0_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -478,7 +478,7 @@ int jpeg_v1_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v1_0_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 int jpeg_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
@@ -509,7 +509,7 @@ int jpeg_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v1_0_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG free up sw allocation
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index ec3d341fef61..6762b5c64ccb 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -41,7 +41,7 @@ static int jpeg_v2_0_set_powergating_state(void *handle,
 /**
  * jpeg_v2_0_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -61,7 +61,7 @@ static int jpeg_v2_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_0_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -104,7 +104,7 @@ static int jpeg_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_0_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -125,7 +125,7 @@ static int jpeg_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_0_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
@@ -142,7 +142,7 @@ static int jpeg_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -162,7 +162,7 @@ static int jpeg_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_0_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -182,7 +182,7 @@ static int jpeg_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_0_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 37cf415b6b41..4b8c801f204d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -50,7 +50,7 @@ static int amdgpu_ih_clientid_jpeg[] = {
 /**
  * jpeg_v2_5_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -81,7 +81,7 @@ static int jpeg_v2_5_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_5_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -153,7 +153,7 @@ static int jpeg_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_5_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -174,7 +174,7 @@ static int jpeg_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_5_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
@@ -202,7 +202,7 @@ static int jpeg_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_5_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -231,7 +231,7 @@ static int jpeg_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_5_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -251,7 +251,7 @@ static int jpeg_v2_5_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v2_5_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 2fa866a3e39d..7996209818b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -42,7 +42,7 @@ static int jpeg_v3_0_set_powergating_state(void *handle,
 /**
  * jpeg_v3_0_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -75,7 +75,7 @@ static int jpeg_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v3_0_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -118,7 +118,7 @@ static int jpeg_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v3_0_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -139,7 +139,7 @@ static int jpeg_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v3_0_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
@@ -156,7 +156,7 @@ static int jpeg_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v3_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -176,7 +176,7 @@ static int jpeg_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v3_0_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -196,7 +196,7 @@ static int jpeg_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v3_0_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 3cef4124b171..20e1fe89c463 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -48,7 +48,7 @@ static void jpeg_v4_0_dec_ring_set_wptr(struct amdgpu_ring *ring);
 /**
  * jpeg_v4_0_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -70,7 +70,7 @@ static int jpeg_v4_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -130,7 +130,7 @@ static int jpeg_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -151,7 +151,7 @@ static int jpeg_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
@@ -187,7 +187,7 @@ static int jpeg_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -210,7 +210,7 @@ static int jpeg_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -230,7 +230,7 @@ static int jpeg_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index cf6efe6db8b2..2a53537db135 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -68,7 +68,7 @@ static inline bool jpeg_v4_0_3_normalizn_reqd(struct amdgpu_device *adev)
 /**
  * jpeg_v4_0_3_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -88,7 +88,7 @@ static int jpeg_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_3_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -165,7 +165,7 @@ static int jpeg_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_3_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -299,7 +299,7 @@ static int jpeg_v4_0_3_start_sriov(struct amdgpu_device *adev)
 /**
  * jpeg_v4_0_3_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
@@ -358,7 +358,7 @@ static int jpeg_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_3_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -380,7 +380,7 @@ static int jpeg_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_3_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -400,7 +400,7 @@ static int jpeg_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_3_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index 2f9749b00eaf..ef2d4237925b 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -61,7 +61,7 @@ static int amdgpu_ih_clientid_jpeg[] = {
 /**
  * jpeg_v4_0_5_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -94,7 +94,7 @@ static int jpeg_v4_0_5_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_5_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -159,7 +159,7 @@ static int jpeg_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_5_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -180,7 +180,7 @@ static int jpeg_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_5_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
@@ -210,7 +210,7 @@ static int jpeg_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_5_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -237,7 +237,7 @@ static int jpeg_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_5_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -257,7 +257,7 @@ static int jpeg_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v4_0_5_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index a9a0b3f250de..7954a6fae464 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -42,7 +42,7 @@ static int jpeg_v5_0_0_set_powergating_state(void *handle,
 /**
  * jpeg_v5_0_0_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -62,7 +62,7 @@ static int jpeg_v5_0_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v5_0_0_sw_init - sw init for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -106,7 +106,7 @@ static int jpeg_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v5_0_0_sw_fini - sw fini for JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * JPEG suspend and free up sw allocation
  */
@@ -127,7 +127,7 @@ static int jpeg_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v5_0_0_hw_init - start and test JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  */
 static int jpeg_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
@@ -153,7 +153,7 @@ static int jpeg_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v5_0_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
@@ -173,7 +173,7 @@ static int jpeg_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v5_0_0_suspend - suspend JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend JPEG block
  */
@@ -193,7 +193,7 @@ static int jpeg_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * jpeg_v5_0_0_resume - resume JPEG block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init JPEG block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index c5540c30d1bb..3011b5853fb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -621,7 +621,7 @@ static void uvd_v3_1_enable_mgcg(struct amdgpu_device *adev,
 /**
  * uvd_v3_1_hw_init - start and test UVD block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -688,7 +688,7 @@ static int uvd_v3_1_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v3_1_hw_fini - stop the hardware block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the UVD block, mark ring as not ready any more
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 02e2dda63828..4852a2ab128f 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -147,7 +147,7 @@ static void uvd_v4_2_enable_mgcg(struct amdgpu_device *adev,
 /**
  * uvd_v4_2_hw_init - start and test UVD block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -202,7 +202,7 @@ static int uvd_v4_2_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v4_2_hw_fini - stop the hardware block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the UVD block, mark ring as not ready any more
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index d84b49064138..a24b210c79ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -143,7 +143,7 @@ static int uvd_v5_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v5_0_hw_init - start and test UVD block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -200,7 +200,7 @@ static int uvd_v5_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v5_0_hw_fini - stop the hardware block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the UVD block, mark ring as not ready any more
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index d14b1769f74c..b4eeeebfe095 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -455,7 +455,7 @@ static int uvd_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v6_0_hw_init - start and test UVD block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -524,7 +524,7 @@ static int uvd_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v6_0_hw_fini - stop the hardware block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the UVD block, mark ring as not ready any more
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 52ce3ac38215..55fa858328f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -510,7 +510,7 @@ static int uvd_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v7_0_hw_init - start and test UVD block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -588,7 +588,7 @@ static int uvd_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * uvd_v7_0_hw_fini - stop the hardware block
  *
- * @handle: handle used to pass amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the UVD block, mark ring as not ready any more
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index c069c6d89e38..129c759772c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -95,7 +95,7 @@ static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring);
 /**
  * vcn_v1_0_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -118,7 +118,7 @@ static int vcn_v1_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v1_0_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -213,7 +213,7 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v1_0_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -238,7 +238,7 @@ static int vcn_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v1_0_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -268,7 +268,7 @@ static int vcn_v1_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v1_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -290,7 +290,7 @@ static int vcn_v1_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v1_0_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -318,7 +318,7 @@ static int vcn_v1_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v1_0_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index c104c47301c7..19bbd49f760e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -100,7 +100,7 @@ static int vcn_v2_0_start_sriov(struct amdgpu_device *adev);
 /**
  * vcn_v2_0_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -124,7 +124,7 @@ static int vcn_v2_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_0_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -237,7 +237,7 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_0_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -268,7 +268,7 @@ static int vcn_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_0_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -305,7 +305,7 @@ static int vcn_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -326,7 +326,7 @@ static int vcn_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_0_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -346,7 +346,7 @@ static int vcn_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_0_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index e76e1168d6f8..30420ead7fc4 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -110,7 +110,7 @@ static int amdgpu_ih_clientid_vcns[] = {
 /**
  * vcn_v2_5_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -151,7 +151,7 @@ static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_5_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -295,7 +295,7 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_5_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -333,7 +333,7 @@ static int vcn_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_5_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -381,7 +381,7 @@ static int vcn_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_5_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -411,7 +411,7 @@ static int vcn_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_5_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -431,7 +431,7 @@ static int vcn_v2_5_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v2_5_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 51ea9a83204f..13632c22d2f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -116,7 +116,7 @@ static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
 /**
  * vcn_v3_0_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -153,7 +153,7 @@ static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v3_0_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -299,7 +299,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v3_0_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -338,7 +338,7 @@ static int vcn_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v3_0_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -413,7 +413,7 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v3_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -443,7 +443,7 @@ static int vcn_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v3_0_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -463,7 +463,7 @@ static int vcn_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v3_0_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index e33cc611f215..e7b7a8150ea7 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -106,7 +106,7 @@ static void vcn_v4_0_set_ras_funcs(struct amdgpu_device *adev);
 /**
  * vcn_v4_0_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -164,7 +164,7 @@ static int vcn_v4_0_fw_shared_init(struct amdgpu_device *adev, int inst_idx)
 /**
  * vcn_v4_0_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -253,7 +253,7 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -294,7 +294,7 @@ static int vcn_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -341,7 +341,7 @@ static int vcn_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -372,7 +372,7 @@ static int vcn_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -392,7 +392,7 @@ static int vcn_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
@@ -1973,7 +1973,7 @@ static bool vcn_v4_0_is_idle(void *handle)
 /**
  * vcn_v4_0_wait_for_idle - wait for VCN block idle
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Wait for VCN block idle
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index f02699a92e50..6dcae398b2dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -98,7 +98,7 @@ static void vcn_v4_0_3_enable_ras(struct amdgpu_device *adev,
 /**
  * vcn_v4_0_3_early_init - set function pointers
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  */
@@ -119,7 +119,7 @@ static int vcn_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_3_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -212,7 +212,7 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_3_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -249,7 +249,7 @@ static int vcn_v4_0_3_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_3_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -308,7 +308,7 @@ static int vcn_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_3_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -327,7 +327,7 @@ static int vcn_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_3_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -347,7 +347,7 @@ static int vcn_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_3_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
@@ -1565,7 +1565,7 @@ static bool vcn_v4_0_3_is_idle(void *handle)
 /**
  * vcn_v4_0_3_wait_for_idle - wait for VCN block idle
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Wait for VCN block idle
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 6d277ee27f46..edb9cd8390b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -104,7 +104,7 @@ static void vcn_v4_0_5_unified_ring_set_wptr(struct amdgpu_ring *ring);
 /**
  * vcn_v4_0_5_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -124,7 +124,7 @@ static int vcn_v4_0_5_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_5_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -220,7 +220,7 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_5_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -261,7 +261,7 @@ static int vcn_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_5_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -291,7 +291,7 @@ static int vcn_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_5_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -320,7 +320,7 @@ static int vcn_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_5_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -340,7 +340,7 @@ static int vcn_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v4_0_5_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
@@ -1467,7 +1467,7 @@ static bool vcn_v4_0_5_is_idle(void *handle)
 /**
  * vcn_v4_0_5_wait_for_idle - wait for VCN block idle
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Wait for VCN block idle
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 89e813b7ba5d..89bf29fa6f8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -87,7 +87,7 @@ static void vcn_v5_0_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
 /**
  * vcn_v5_0_0_early_init - set function pointers and load microcode
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Set ring and irq function pointers
  * Load microcode from filesystem
@@ -108,7 +108,7 @@ static int vcn_v5_0_0_early_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v5_0_0_sw_init - sw init for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Load firmware and sw initialization
  */
@@ -187,7 +187,7 @@ static int vcn_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v5_0_0_sw_fini - sw fini for VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * VCN suspend and free up sw allocation
  */
@@ -225,7 +225,7 @@ static int vcn_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v5_0_0_hw_init - start and test VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
@@ -255,7 +255,7 @@ static int vcn_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v5_0_0_hw_fini - stop the hardware block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Stop the VCN block, mark ring as not ready any more
  */
@@ -284,7 +284,7 @@ static int vcn_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v5_0_0_suspend - suspend VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * HW fini and suspend VCN block
  */
@@ -304,7 +304,7 @@ static int vcn_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
 /**
  * vcn_v5_0_0_resume - resume VCN block
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Resume firmware and hw init VCN block
  */
@@ -1194,7 +1194,7 @@ static bool vcn_v5_0_0_is_idle(void *handle)
 /**
  * vcn_v5_0_0_wait_for_idle - wait for VCN block idle
  *
- * @handle: amdgpu_device pointer
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Wait for VCN block idle
  */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 576a7404cf10..7616d7a509b9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2790,7 +2790,7 @@ static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
 
 /**
  * dm_hw_init() - Initialize DC device
- * @handle: The base driver device containing the amdgpu_dm device.
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Initialize the &struct amdgpu_display_manager device. This involves calling
  * the initializers of each DM component, then populating the struct with them.
@@ -2824,7 +2824,7 @@ static int dm_hw_init(struct amdgpu_ip_block *ip_block)
 
 /**
  * dm_hw_fini() - Teardown DC device
- * @handle: The base driver device containing the amdgpu_dm device.
+ * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
  *
  * Teardown components within &struct amdgpu_display_manager that require
  * cleanup. This involves cleaning up the DRM device, DC, and any modules that
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578098A71F
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2024 16:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908C110E52C;
	Mon, 30 Sep 2024 14:32:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1487310E51B
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2024 14:32:46 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48UEWFUS2682372; Mon, 30 Sep 2024 20:02:15 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 48UEWFD92682371;
 Mon, 30 Sep 2024 20:02:15 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 11/12] drm/amdgpu: update the handle ptr in hw_init
Date: Mon, 30 Sep 2024 20:00:18 +0530
Message-Id: <20240930143019.2682202-12-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930143019.2682202-1-sunil.khatri@amd.com>
References: <20240930143019.2682202-1-sunil.khatri@amd.com>
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

Update the *handle to amdgpu_ip_block ptr for all
functions pointers of hw_init.

Also update the ip_block ptr where ever needed as
there were cyclic dependency of hw_init on resume.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           | 10 ++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 14 +++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c           |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c      |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/cik.c                  |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c             |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c            | 13 ++++++-------
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c            | 13 ++++++-------
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/nv.c                   |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c          |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/si.c                   |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/si_dma.c               |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/si_ih.c                |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/soc15.c                |  6 +++---
 drivers/gpu/drm/amd/amdgpu/soc21.c                |  6 +++---
 drivers/gpu/drm/amd/amdgpu/soc24.c                |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             | 10 ++++------
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c             |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c            | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/vi.c                   |  8 +++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++--
 drivers/gpu/drm/amd/include/amd_shared.h          |  2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        |  4 ++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        |  4 ++--
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  |  7 +++----
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         |  6 +++---
 85 files changed, 287 insertions(+), 384 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 50eed2b46520..37d431a40184 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -222,7 +222,7 @@ static const struct dmi_system_id acp_quirk_table[] = {
  * @handle: handle used to pass amdgpu_device pointer
  *
  */
-static int acp_hw_init(void *handle)
+static int acp_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
 	u64 acp_base;
@@ -230,13 +230,7 @@ static int acp_hw_init(void *handle)
 	u32 count = 0;
 	struct i2s_platform_data *i2s_pdata = NULL;
 
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	const struct amdgpu_ip_block *ip_block =
-		amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_ACP);
-
-	if (!ip_block)
-		return -EINVAL;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amd_acp_hw_init(adev->acp.cgs_device,
 			    ip_block->version->major, ip_block->version->minor);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 39a60db44fc9..4b03029a6ea4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2684,7 +2684,7 @@ static int amdgpu_device_ip_hw_init_phase1(struct amdgpu_device *adev)
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON ||
 		    (amdgpu_sriov_vf(adev) && (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_PSP)) ||
 		    adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_IH) {
-			r = adev->ip_blocks[i].version->funcs->hw_init(adev);
+			r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 			if (r) {
 				DRM_ERROR("hw_init of IP block <%s> failed %d\n",
 					  adev->ip_blocks[i].version->funcs->name, r);
@@ -2709,7 +2709,7 @@ static int amdgpu_device_ip_hw_init_phase2(struct amdgpu_device *adev)
 		if (!amdgpu_ip_member_of_hwini(
 			    adev, adev->ip_blocks[i].version->type))
 			continue;
-		r = adev->ip_blocks[i].version->funcs->hw_init(adev);
+		r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 		if (r) {
 			DRM_ERROR("hw_init of IP block <%s> failed %d\n",
 				  adev->ip_blocks[i].version->funcs->name, r);
@@ -2751,7 +2751,7 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 					return r;
 				}
 			} else {
-				r = adev->ip_blocks[i].version->funcs->hw_init(adev);
+				r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 				if (r) {
 					DRM_ERROR("hw_init of IP block <%s> failed %d\n",
 							  adev->ip_blocks[i].version->funcs->name, r);
@@ -2865,7 +2865,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_COMMON) {
 			/* need to do common hw init early so everything is set up for gmc */
-			r = adev->ip_blocks[i].version->funcs->hw_init((void *)adev);
+			r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 			if (r) {
 				DRM_ERROR("hw_init %d failed %d\n", i, r);
 				goto init_failed;
@@ -2882,7 +2882,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 				DRM_ERROR("amdgpu_mem_scratch_init failed %d\n", r);
 				goto init_failed;
 			}
-			r = adev->ip_blocks[i].version->funcs->hw_init((void *)adev);
+			r = adev->ip_blocks[i].version->funcs->hw_init(&adev->ip_blocks[i]);
 			if (r) {
 				DRM_ERROR("hw_init %d failed %d\n", i, r);
 				goto init_failed;
@@ -3626,7 +3626,7 @@ static int amdgpu_device_ip_reinit_early_sriov(struct amdgpu_device *adev)
 				!block->status.valid)
 				continue;
 
-			r = block->version->funcs->hw_init(adev);
+			r = block->version->funcs->hw_init(&adev->ip_blocks[i]);
 			DRM_INFO("RE-INIT-early: %s %s\n", block->version->funcs->name, r?"failed":"succeeded");
 			if (r)
 				return r;
@@ -3668,7 +3668,7 @@ static int amdgpu_device_ip_reinit_late_sriov(struct amdgpu_device *adev)
 			if (block->version->type == AMD_IP_BLOCK_TYPE_SMC)
 				r = block->version->funcs->resume(&adev->ip_blocks[i]);
 			else
-				r = block->version->funcs->hw_init(adev);
+				r = block->version->funcs->hw_init(&adev->ip_blocks[i]);
 
 			DRM_INFO("RE-INIT-late: %s %s\n", block->version->funcs->name, r?"failed":"succeeded");
 			if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 64e7fe9186ee..a12b0725f0b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -49,9 +49,9 @@ static int isp_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: handle for amdgpu_device pointer
  *
  */
-static int isp_hw_init(void *handle)
+static int isp_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_isp *isp = &adev->isp;
 
 	const struct amdgpu_ip_block *ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index d77e64735a25..02d0022236d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2973,10 +2973,10 @@ static int psp_load_fw(struct amdgpu_device *adev)
 	return ret;
 }
 
-static int psp_hw_init(void *handle)
+static int psp_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int ret;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	mutex_lock(&adev->firmware.mutex);
 	/*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index 0e77f14232ce..aee4c1d4a53b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -839,9 +839,9 @@ static int umsch_mm_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int umsch_mm_hw_init(void *handle)
+static int umsch_mm_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = umsch_mm_load_microcode(&adev->umsch_mm);
@@ -882,9 +882,7 @@ static int umsch_mm_suspend(struct amdgpu_ip_block *ip_block)
 
 static int umsch_mm_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return umsch_mm_hw_init(adev);
+	return umsch_mm_hw_init(ip_block);
 }
 
 void amdgpu_umsch_fwlog_init(struct amdgpu_umsch_mm *umsch_mm)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index d876b407249d..2c810750f7d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -555,9 +555,9 @@ static int amdgpu_vkms_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int amdgpu_vkms_hw_init(void *handle)
+static int amdgpu_vkms_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	switch (adev->asic_type) {
 #ifdef CONFIG_DRM_AMDGPU_SI
@@ -618,13 +618,12 @@ static int amdgpu_vkms_suspend(struct amdgpu_ip_block *ip_block)
 
 static int amdgpu_vkms_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_vkms_hw_init(adev);
+	r = amdgpu_vkms_hw_init(ip_block);
 	if (r)
 		return r;
-	return drm_mode_config_helper_resume(adev_to_drm(adev));
+	return drm_mode_config_helper_resume(adev_to_drm(ip_block->adev));
 }
 
 static bool amdgpu_vkms_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index d9ace55dd520..2234c06b7d76 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -398,9 +398,9 @@ static int vpe_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vpe_hw_init(void *handle)
+static int vpe_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_vpe *vpe = &adev->vpe;
 	int ret;
 
@@ -445,9 +445,7 @@ static int vpe_suspend(struct amdgpu_ip_block *ip_block)
 
 static int vpe_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return vpe_hw_init(adev);
+	return vpe_hw_init(ip_block);
 }
 
 static void vpe_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index afe2d4c5d22a..1f8d941d26e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2134,9 +2134,9 @@ static int cik_common_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cik_common_hw_init(void *handle)
+static int cik_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* move the golden regs per IP block */
 	cik_init_golden_registers(adev);
@@ -2162,9 +2162,7 @@ static int cik_common_suspend(struct amdgpu_ip_block *ip_block)
 
 static int cik_common_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cik_common_hw_init(adev);
+	return cik_common_hw_init(ip_block);
 }
 
 static bool cik_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 3507442fe4d8..dfeac11f852e 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -321,9 +321,9 @@ static int cik_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cik_ih_hw_init(void *handle)
+static int cik_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return cik_ih_irq_init(adev);
 }
@@ -346,9 +346,7 @@ static int cik_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int cik_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cik_ih_hw_init(adev);
+	return cik_ih_hw_init(ip_block);
 }
 
 static bool cik_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index a37d2d00b83b..96744060b51e 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -989,10 +989,10 @@ static int cik_sdma_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cik_sdma_hw_init(void *handle)
+static int cik_sdma_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = cik_sdma_start(adev);
 	if (r)
@@ -1020,11 +1020,9 @@ static int cik_sdma_suspend(struct amdgpu_ip_block *ip_block)
 
 static int cik_sdma_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
 	cik_sdma_soft_reset(ip_block);
 
-	return cik_sdma_hw_init(adev);
+	return cik_sdma_hw_init(ip_block);
 }
 
 static bool cik_sdma_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index 4ae8156fe691..d14af4538ef1 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -312,10 +312,10 @@ static int cz_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cz_ih_hw_init(void *handle)
+static int cz_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = cz_ih_irq_init(adev);
 	if (r)
@@ -342,9 +342,7 @@ static int cz_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int cz_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cz_ih_hw_init(adev);
+	return cz_ih_hw_init(ip_block);
 }
 
 static bool cz_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index c630c877cb9e..111c03f07155 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2862,10 +2862,10 @@ static int dce_v10_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v10_0_hw_init(void *handle)
+static int dce_v10_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	dce_v10_0_init_golden_registers(adev);
 
@@ -2928,7 +2928,7 @@ static int dce_v10_0_resume(struct amdgpu_ip_block *ip_block)
 	amdgpu_atombios_encoder_set_backlight_level_to_reg(adev,
 							   adev->mode_info.bl_level);
 
-	ret = dce_v10_0_hw_init(adev);
+	ret = dce_v10_0_hw_init(ip_block);
 
 	/* turn on the BL */
 	if (adev->mode_info.bl_encoder) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index a8867fc701b8..4d030716eb00 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2989,10 +2989,10 @@ static int dce_v11_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v11_0_hw_init(void *handle)
+static int dce_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	dce_v11_0_init_golden_registers(adev);
 
@@ -3066,7 +3066,7 @@ static int dce_v11_0_resume(struct amdgpu_ip_block *ip_block)
 	amdgpu_atombios_encoder_set_backlight_level_to_reg(adev,
 							   adev->mode_info.bl_level);
 
-	ret = dce_v11_0_hw_init(adev);
+	ret = dce_v11_0_hw_init(ip_block);
 
 	/* turn on the BL */
 	if (adev->mode_info.bl_encoder) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 9b2bb2185305..d333e4f834d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2760,10 +2760,10 @@ static int dce_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v6_0_hw_init(void *handle)
+static int dce_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* disable vga render */
 	dce_v6_0_set_vga_render_state(adev, false);
@@ -2823,7 +2823,7 @@ static int dce_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	amdgpu_atombios_encoder_set_backlight_level_to_reg(adev,
 							   adev->mode_info.bl_level);
 
-	ret = dce_v6_0_hw_init(adev);
+	ret = dce_v6_0_hw_init(ip_block);
 
 	/* turn on the BL */
 	if (adev->mode_info.bl_encoder) {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index d834d7b17a0d..166fd991bfba 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2782,10 +2782,10 @@ static int dce_v8_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v8_0_hw_init(void *handle)
+static int dce_v8_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* disable vga render */
 	dce_v8_0_set_vga_render_state(adev, false);
@@ -2846,7 +2846,7 @@ static int dce_v8_0_resume(struct amdgpu_ip_block *ip_block)
 	amdgpu_atombios_encoder_set_backlight_level_to_reg(adev,
 							   adev->mode_info.bl_level);
 
-	ret = dce_v8_0_hw_init(adev);
+	ret = dce_v8_0_hw_init(ip_block);
 
 	/* turn on the BL */
 	if (adev->mode_info.bl_encoder) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index c7a5ae5be35b..e00ff7b62403 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7366,10 +7366,10 @@ static void gfx_v10_0_disable_gpa_mode(struct amdgpu_device *adev)
 	WREG32_SOC15(GC, 0, mmCPG_PSP_DEBUG, data);
 }
 
-static int gfx_v10_0_hw_init(void *handle)
+static int gfx_v10_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (!amdgpu_emu_mode)
 		gfx_v10_0_init_golden_registers(adev);
@@ -7465,7 +7465,7 @@ static int gfx_v10_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v10_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	return gfx_v10_0_hw_init(ip_block->adev);
+	return gfx_v10_0_hw_init(ip_block);
 }
 
 static bool gfx_v10_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 6d068154c133..601e3a3e31e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -4570,10 +4570,10 @@ static void gfx_v11_0_disable_gpa_mode(struct amdgpu_device *adev)
 	WREG32_SOC15(GC, 0, regCPG_PSP_DEBUG, data);
 }
 
-static int gfx_v11_0_hw_init(void *handle)
+static int gfx_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
 		if (adev->gfx.imu.funcs) {
@@ -4714,7 +4714,7 @@ static int gfx_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v11_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	return gfx_v11_0_hw_init(ip_block->adev);
+	return gfx_v11_0_hw_init(ip_block);
 }
 
 static bool gfx_v11_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 0bae09bec1bc..68f90aab45d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -3513,10 +3513,10 @@ static void gfx_v12_0_init_golden_registers(struct amdgpu_device *adev)
 	}
 }
 
-static int gfx_v12_0_hw_init(void *handle)
+static int gfx_v12_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->firmware.load_type == AMDGPU_FW_LOAD_RLC_BACKDOOR_AUTO) {
 		if (adev->gfx.imu.funcs && (amdgpu_dpm > 0)) {
@@ -3652,7 +3652,7 @@ static int gfx_v12_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v12_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	return gfx_v12_0_hw_init(ip_block->adev);
+	return gfx_v12_0_hw_init(ip_block);
 }
 
 static bool gfx_v12_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 57ddc0051648..bf3efe6bc4bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3122,10 +3122,10 @@ static int gfx_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gfx_v6_0_hw_init(void *handle)
+static int gfx_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gfx_v6_0_constants_init(adev);
 
@@ -3162,9 +3162,7 @@ static int gfx_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v6_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v6_0_hw_init(adev);
+	return gfx_v6_0_hw_init(ip_block);
 }
 
 static bool gfx_v6_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 09a0dcd59dd1..71a98a538b37 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4465,10 +4465,10 @@ static int gfx_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gfx_v7_0_hw_init(void *handle)
+static int gfx_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gfx_v7_0_constants_init(adev);
 
@@ -4508,9 +4508,7 @@ static int gfx_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v7_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v7_0_hw_init(adev);
+	return gfx_v7_0_hw_init(ip_block);
 }
 
 static bool gfx_v7_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index a7d92412585d..3d06b32074b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4783,10 +4783,10 @@ static void gfx_v8_0_cp_enable(struct amdgpu_device *adev, bool enable)
 	gfx_v8_0_cp_compute_enable(adev, enable);
 }
 
-static int gfx_v8_0_hw_init(void *handle)
+static int gfx_v8_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gfx_v8_0_init_golden_registers(adev);
 	gfx_v8_0_constants_init(adev);
@@ -4920,7 +4920,7 @@ static int gfx_v8_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v8_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	return gfx_v8_0_hw_init(ip_block->adev);
+	return gfx_v8_0_hw_init(ip_block);
 }
 
 static bool gfx_v8_0_check_soft_reset(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 03f502931448..9cef43d1edaa 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3991,10 +3991,10 @@ static void gfx_v9_0_cp_enable(struct amdgpu_device *adev, bool enable)
 	gfx_v9_0_cp_compute_enable(adev, enable);
 }
 
-static int gfx_v9_0_hw_init(void *handle)
+static int gfx_v9_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_gfx_cleaner_shader_init(adev, adev->gfx.cleaner_shader_size,
 				       adev->gfx.cleaner_shader_ptr);
@@ -4081,7 +4081,7 @@ static int gfx_v9_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v9_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	return gfx_v9_0_hw_init(ip_block->adev);
+	return gfx_v9_0_hw_init(ip_block);
 }
 
 static bool gfx_v9_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index ac53c6a1b849..fe6df1723013 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2345,10 +2345,10 @@ static void gfx_v9_4_3_xcc_fini(struct amdgpu_device *adev, int xcc_id)
 	gfx_v9_4_3_xcc_cp_compute_enable(adev, false, xcc_id);
 }
 
-static int gfx_v9_4_3_hw_init(void *handle)
+static int gfx_v9_4_3_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_gfx_cleaner_shader_init(adev, adev->gfx.cleaner_shader_size,
 				       adev->gfx.cleaner_shader_ptr);
@@ -2395,7 +2395,7 @@ static int gfx_v9_4_3_suspend(struct amdgpu_ip_block *ip_block)
 
 static int gfx_v9_4_3_resume(struct amdgpu_ip_block *ip_block)
 {
-	return gfx_v9_4_3_hw_init(ip_block->adev);
+	return gfx_v9_4_3_hw_init(ip_block);
 }
 
 static bool gfx_v9_4_3_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index c8fe545bf10e..80e724397d5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -985,9 +985,9 @@ static int gmc_v10_0_gart_enable(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int gmc_v10_0_hw_init(void *handle)
+static int gmc_v10_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	adev->gmc.flush_pasid_uses_kiq = !amdgpu_emu_mode;
@@ -1065,13 +1065,12 @@ static int gmc_v10_0_suspend(struct amdgpu_ip_block *ip_block)
 static int gmc_v10_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v10_0_hw_init(adev);
+	r = gmc_v10_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	amdgpu_vmid_reset_all(adev);
+	amdgpu_vmid_reset_all(ip_block->adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 68d3be40a6cb..c8e7e0162505 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -908,9 +908,9 @@ static int gmc_v11_0_gart_enable(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int gmc_v11_0_hw_init(void *handle)
+static int gmc_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	adev->gmc.flush_pasid_uses_kiq = !amdgpu_emu_mode;
@@ -973,13 +973,12 @@ static int gmc_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 static int gmc_v11_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v11_0_hw_init(adev);
+	r = gmc_v11_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	amdgpu_vmid_reset_all(adev);
+	amdgpu_vmid_reset_all(ip_block->adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index ce56f6c35932..7e3366253d31 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -894,10 +894,10 @@ static int gmc_v12_0_gart_enable(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int gmc_v12_0_hw_init(void *handle)
+static int gmc_v12_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* The sequence of these two function calls matters.*/
 	gmc_v12_0_init_golden_registers(adev);
@@ -957,13 +957,12 @@ static int gmc_v12_0_suspend(struct amdgpu_ip_block *ip_block)
 static int gmc_v12_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v12_0_hw_init(adev);
+	r = gmc_v12_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	amdgpu_vmid_reset_all(adev);
+	amdgpu_vmid_reset_all(ip_block->adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 892d2ba8769e..5f163d160c6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -889,10 +889,10 @@ static int gmc_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v6_0_hw_init(void *handle)
+static int gmc_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gmc_v6_0_mc_program(adev);
 
@@ -938,7 +938,7 @@ static int gmc_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	int r;
 	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v6_0_hw_init(adev);
+	r = gmc_v6_0_hw_init(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 3e75804edc7e..82959be636d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1074,10 +1074,10 @@ static int gmc_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v7_0_hw_init(void *handle)
+static int gmc_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gmc_v7_0_init_golden_registers(adev);
 
@@ -1123,13 +1123,12 @@ static int gmc_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 static int gmc_v7_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v7_0_hw_init(adev);
+	r = gmc_v7_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	amdgpu_vmid_reset_all(adev);
+	amdgpu_vmid_reset_all(ip_block->adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 7527748d9bfb..720a60689fe2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1187,10 +1187,10 @@ static int gmc_v8_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v8_0_hw_init(void *handle)
+static int gmc_v8_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gmc_v8_0_init_golden_registers(adev);
 
@@ -1244,13 +1244,12 @@ static int gmc_v8_0_suspend(struct amdgpu_ip_block *ip_block)
 static int gmc_v8_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v8_0_hw_init(adev);
+	r = gmc_v8_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	amdgpu_vmid_reset_all(adev);
+	amdgpu_vmid_reset_all(ip_block->adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 145db9472ed9..507952da94a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2308,9 +2308,9 @@ static int gmc_v9_0_gart_enable(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int gmc_v9_0_hw_init(void *handle)
+static int gmc_v9_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool value;
 	int i, r;
 
@@ -2438,13 +2438,12 @@ static int gmc_v9_0_suspend(struct amdgpu_ip_block *ip_block)
 static int gmc_v9_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = gmc_v9_0_hw_init(adev);
+	r = gmc_v9_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	amdgpu_vmid_reset_all(adev);
+	amdgpu_vmid_reset_all(ip_block->adev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index bd6a1dc39a56..9d37b93c8fd8 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -311,9 +311,9 @@ static int iceland_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int iceland_ih_hw_init(void *handle)
+static int iceland_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return iceland_ih_irq_init(adev);
 }
@@ -336,9 +336,7 @@ static int iceland_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int iceland_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return iceland_ih_hw_init(adev);
+	return iceland_ih_hw_init(ip_block);
 }
 
 static bool iceland_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 73c04e7acd30..0c0b7764cd8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -623,10 +623,10 @@ static int ih_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int ih_v6_0_hw_init(void *handle)
+static int ih_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = ih_v6_0_irq_init(adev);
 	if (r)
@@ -653,9 +653,7 @@ static int ih_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int ih_v6_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return ih_v6_0_hw_init(adev);
+	return ih_v6_0_hw_init(ip_block);
 }
 
 static bool ih_v6_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 793885260218..0b2db6e493fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -602,10 +602,10 @@ static int ih_v6_1_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int ih_v6_1_hw_init(void *handle)
+static int ih_v6_1_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = ih_v6_1_irq_init(adev);
 	if (r)
@@ -632,9 +632,7 @@ static int ih_v6_1_suspend(struct amdgpu_ip_block *ip_block)
 
 static int ih_v6_1_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return ih_v6_1_hw_init(adev);
+	return ih_v6_1_hw_init(ip_block);
 }
 
 static bool ih_v6_1_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 20944345b48f..da708cdecbbe 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -592,10 +592,10 @@ static int ih_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int ih_v7_0_hw_init(void *handle)
+static int ih_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = ih_v7_0_irq_init(adev);
 	if (r)
@@ -622,9 +622,7 @@ static int ih_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int ih_v7_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return ih_v7_0_hw_init(adev);
+	return ih_v7_0_hw_init(ip_block);
 }
 
 static bool ih_v7_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 46fdde0f5c1b..2829616894e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -128,9 +128,9 @@ static int jpeg_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v2_0_hw_init(void *handle)
+static int jpeg_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = adev->jpeg.inst->ring_dec;
 
 	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
@@ -190,13 +190,12 @@ static int jpeg_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 static int jpeg_v2_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v2_0_hw_init(adev);
+	r = jpeg_v2_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 4ff6ee91ec5b..558d3e097681 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -177,9 +177,9 @@ static int jpeg_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v2_5_hw_init(void *handle)
+static int jpeg_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, r;
 
@@ -261,11 +261,11 @@ static int jpeg_v2_5_resume(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v2_5_hw_init(adev);
+	r = jpeg_v2_5_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 173db8d4c088..ccd1093d5bb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -142,9 +142,9 @@ static int jpeg_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v3_0_hw_init(void *handle)
+static int jpeg_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = adev->jpeg.inst->ring_dec;
 
 	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
@@ -203,14 +203,13 @@ static int jpeg_v3_0_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int jpeg_v3_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v3_0_hw_init(adev);
+	r = jpeg_v3_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 02142b4576fb..2dfdefb4db40 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -154,9 +154,9 @@ static int jpeg_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v4_0_hw_init(void *handle)
+static int jpeg_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = adev->jpeg.inst->ring_dec;
 	int r;
 
@@ -237,14 +237,13 @@ static int jpeg_v4_0_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int jpeg_v4_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v4_0_hw_init(adev);
+	r = jpeg_v4_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 637b47ae3f45..abb9f8953c7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -302,9 +302,9 @@ static int jpeg_v4_0_3_start_sriov(struct amdgpu_device *adev)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v4_0_3_hw_init(void *handle)
+static int jpeg_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, j, r, jpeg_inst;
 
@@ -407,14 +407,13 @@ static int jpeg_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int jpeg_v4_0_3_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v4_0_3_hw_init(adev);
+	r = jpeg_v4_0_3_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index 929fdaa72bdc..7412d2d43bd4 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -183,9 +183,9 @@ static int jpeg_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v4_0_5_hw_init(void *handle)
+static int jpeg_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, r = 0;
 
@@ -264,14 +264,13 @@ static int jpeg_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int jpeg_v4_0_5_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v4_0_5_hw_init(adev);
+	r = jpeg_v4_0_5_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index 6740a704b11c..0c1749f6c4a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -130,9 +130,9 @@ static int jpeg_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
  * @handle: amdgpu_device pointer
  *
  */
-static int jpeg_v5_0_0_hw_init(void *handle)
+static int jpeg_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = adev->jpeg.inst->ring_dec;
 	int r;
 
@@ -200,14 +200,13 @@ static int jpeg_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int jpeg_v5_0_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_jpeg_resume(adev);
+	r = amdgpu_jpeg_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = jpeg_v5_0_0_hw_init(adev);
+	r = jpeg_v5_0_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index fc5498b2c4fc..4af5e9c13551 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -55,7 +55,7 @@ MODULE_FIRMWARE("amdgpu/gc_11_5_1_mes1.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_5_2_mes_2.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_5_2_mes1.bin");
 
-static int mes_v11_0_hw_init(void *handle);
+static int mes_v11_0_hw_init(struct amdgpu_ip_block *ip_block);
 static int mes_v11_0_hw_fini(void *handle);
 static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev);
 static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev);
@@ -1531,7 +1531,7 @@ static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev)
 		adev->mes.enable_legacy_queue_map = false;
 
 	if (adev->mes.enable_legacy_queue_map) {
-		r = mes_v11_0_hw_init(adev);
+		r = mes_v11_0_hw_init(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_MES]);
 		if (r)
 			goto failure;
 	}
@@ -1560,10 +1560,10 @@ static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int mes_v11_0_hw_init(void *handle)
+static int mes_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->mes.ring[0].sched.ready)
 		goto out;
@@ -1644,13 +1644,12 @@ static int mes_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 static int mes_v11_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = mes_v11_0_hw_init(adev);
+	r = mes_v11_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	return amdgpu_mes_resume(adev);
+	return amdgpu_mes_resume(ip_block->adev);
 }
 
 static int mes_v11_0_early_init(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
index 5b928315dab9..e7e6d00b16fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -39,7 +39,7 @@ MODULE_FIRMWARE("amdgpu/gc_12_0_1_mes.bin");
 MODULE_FIRMWARE("amdgpu/gc_12_0_1_mes1.bin");
 MODULE_FIRMWARE("amdgpu/gc_12_0_1_uni_mes.bin");
 
-static int mes_v12_0_hw_init(void *handle);
+static int mes_v12_0_hw_init(struct amdgpu_ip_block *ip_block);
 static int mes_v12_0_hw_fini(void *handle);
 static int mes_v12_0_kiq_hw_init(struct amdgpu_device *adev);
 static int mes_v12_0_kiq_hw_fini(struct amdgpu_device *adev);
@@ -1492,7 +1492,7 @@ static int mes_v12_0_kiq_hw_init(struct amdgpu_device *adev)
 	}
 
 	if (adev->mes.enable_legacy_queue_map) {
-		r = mes_v12_0_hw_init(adev);
+		r = mes_v12_0_hw_init(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_MES]);
 		if (r)
 			goto failure;
 	}
@@ -1522,10 +1522,10 @@ static int mes_v12_0_kiq_hw_fini(struct amdgpu_device *adev)
 	return 0;
 }
 
-static int mes_v12_0_hw_init(void *handle)
+static int mes_v12_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->mes.ring[0].sched.ready)
 		goto out;
@@ -1608,13 +1608,12 @@ static int mes_v12_0_suspend(struct amdgpu_ip_block *ip_block)
 static int mes_v12_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = mes_v12_0_hw_init(adev);
+	r = mes_v12_0_hw_init(ip_block);
 	if (r)
 		return r;
 
-	return amdgpu_mes_resume(adev);
+	return amdgpu_mes_resume(ip_block->adev);
 }
 
 static int mes_v12_0_early_init(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 7d919e65c076..0d744b3d4bb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -602,9 +602,9 @@ static int navi10_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int navi10_ih_hw_init(void *handle)
+static int navi10_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return navi10_ih_irq_init(adev);
 }
@@ -627,9 +627,7 @@ static int navi10_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int navi10_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return navi10_ih_hw_init(adev);
+	return navi10_ih_hw_init(ip_block);
 }
 
 static bool navi10_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index a8f5a951486d..4b1085e2bfdd 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -988,9 +988,9 @@ static int nv_common_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int nv_common_hw_init(void *handle)
+static int nv_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->nbio.funcs->apply_lc_spc_mode_wa)
 		adev->nbio.funcs->apply_lc_spc_mode_wa(adev);
@@ -1038,9 +1038,7 @@ static int nv_common_suspend(struct amdgpu_ip_block *ip_block)
 
 static int nv_common_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return nv_common_hw_init(adev);
+	return nv_common_hw_init(ip_block);
 }
 
 static bool nv_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index e3aa09ab3eac..2d41c74c73bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -878,10 +878,10 @@ static int sdma_v2_4_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v2_4_hw_init(void *handle)
+static int sdma_v2_4_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	sdma_v2_4_init_golden_registers(adev);
 
@@ -910,9 +910,7 @@ static int sdma_v2_4_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v2_4_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v2_4_hw_init(adev);
+	return sdma_v2_4_hw_init(ip_block);
 }
 
 static bool sdma_v2_4_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 232fb36854e8..03333107c2e9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1164,10 +1164,10 @@ static int sdma_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v3_0_hw_init(void *handle)
+static int sdma_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	sdma_v3_0_init_golden_registers(adev);
 
@@ -1197,9 +1197,7 @@ static int sdma_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v3_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v3_0_hw_init(adev);
+	return sdma_v3_0_hw_init(ip_block);
 }
 
 static bool sdma_v3_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index de6ff5643665..7f5ca95b5fcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -1951,9 +1951,9 @@ static int sdma_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v4_0_hw_init(void *handle)
+static int sdma_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->flags & AMD_IS_APU)
 		amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_SDMA, false);
@@ -2012,7 +2012,7 @@ static int sdma_v4_0_resume(struct amdgpu_ip_block *ip_block)
 		return 0;
 	}
 
-	return sdma_v4_0_hw_init(adev);
+	return sdma_v4_0_hw_init(ip_block);
 }
 
 static bool sdma_v4_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 551b4bb976b0..f4ab26998a51 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1467,10 +1467,10 @@ static int sdma_v4_4_2_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v4_4_2_hw_init(void *handle)
+static int sdma_v4_4_2_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	uint32_t inst_mask;
 
 	inst_mask = GENMASK(adev->sdma.num_instances - 1, 0);
@@ -1520,9 +1520,7 @@ static int sdma_v4_4_2_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v4_4_2_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v4_4_2_hw_init(adev);
+	return sdma_v4_4_2_hw_init(ip_block);
 }
 
 static bool sdma_v4_4_2_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index b93745202c60..68eb1fd986dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1477,10 +1477,10 @@ static int sdma_v5_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v5_0_hw_init(void *handle)
+static int sdma_v5_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	sdma_v5_0_init_golden_registers(adev);
 
@@ -1511,9 +1511,7 @@ static int sdma_v5_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v5_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v5_0_hw_init(adev);
+	return sdma_v5_0_hw_init(ip_block);
 }
 
 static bool sdma_v5_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 4b76247c6a23..1272c3cdc132 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1377,9 +1377,9 @@ static int sdma_v5_2_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v5_2_hw_init(void *handle)
+static int sdma_v5_2_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return sdma_v5_2_start(adev);
 }
@@ -1406,9 +1406,7 @@ static int sdma_v5_2_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v5_2_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v5_2_hw_init(adev);
+	return sdma_v5_2_hw_init(ip_block);
 }
 
 static bool sdma_v5_2_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 9884deaadc94..9ab045552109 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1380,9 +1380,9 @@ static int sdma_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v6_0_hw_init(void *handle)
+static int sdma_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return sdma_v6_0_start(adev);
 }
@@ -1409,9 +1409,7 @@ static int sdma_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v6_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v6_0_hw_init(adev);
+	return sdma_v6_0_hw_init(ip_block);
 }
 
 static bool sdma_v6_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 57b7b166aad6..4e2919bd15df 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1338,9 +1338,9 @@ static int sdma_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int sdma_v7_0_hw_init(void *handle)
+static int sdma_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return sdma_v7_0_start(adev);
 }
@@ -1367,9 +1367,7 @@ static int sdma_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 
 static int sdma_v7_0_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v7_0_hw_init(adev);
+	return sdma_v7_0_hw_init(ip_block);
 }
 
 static bool sdma_v7_0_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 0fc303843493..8b0cad1dfad6 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2633,9 +2633,9 @@ static void si_fix_pci_max_read_req_size(struct amdgpu_device *adev)
 		pcie_set_readrq(adev->pdev, 512);
 }
 
-static int si_common_hw_init(void *handle)
+static int si_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	si_fix_pci_max_read_req_size(adev);
 	si_init_golden_registers(adev);
@@ -2659,9 +2659,7 @@ static int si_common_suspend(struct amdgpu_ip_block *ip_block)
 
 static int si_common_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return si_common_hw_init(adev);
+	return si_common_hw_init(ip_block);
 }
 
 static bool si_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 77722ea6fc21..68e7572b4a90 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -517,9 +517,9 @@ static int si_dma_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int si_dma_hw_init(void *handle)
+static int si_dma_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return si_dma_start(adev);
 }
@@ -542,9 +542,7 @@ static int si_dma_suspend(struct amdgpu_ip_block *ip_block)
 
 static int si_dma_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return si_dma_hw_init(adev);
+	return si_dma_hw_init(ip_block);
 }
 
 static bool si_dma_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 7976702f500e..413a4cd35fe4 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -186,9 +186,9 @@ static int si_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int si_ih_hw_init(void *handle)
+static int si_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return si_ih_irq_init(adev);
 }
@@ -211,9 +211,7 @@ static int si_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int si_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return si_ih_hw_init(adev);
+	return si_ih_hw_init(ip_block);
 }
 
 static bool si_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index b17f70b85e77..d2a74da44a3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1255,9 +1255,9 @@ static void soc15_sdma_doorbell_range_init(struct amdgpu_device *adev)
 	}
 }
 
-static int soc15_common_hw_init(void *handle)
+static int soc15_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* enable aspm */
 	soc15_program_aspm(adev);
@@ -1333,7 +1333,7 @@ static int soc15_common_resume(struct amdgpu_ip_block *ip_block)
 		dev_info(adev->dev, "S3 suspend abort case, let's reset ASIC.\n");
 		soc15_asic_reset(adev);
 	}
-	return soc15_common_hw_init(adev);
+	return soc15_common_hw_init(ip_block);
 }
 
 static bool soc15_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 269857b7e7c8..4ce702c168c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -847,9 +847,9 @@ static int soc21_common_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc21_common_hw_init(void *handle)
+static int soc21_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* enable aspm */
 	soc21_program_aspm(adev);
@@ -926,7 +926,7 @@ static int soc21_common_resume(struct amdgpu_ip_block *ip_block)
 		soc21_asic_reset(adev);
 	}
 
-	return soc21_common_hw_init(adev);
+	return soc21_common_hw_init(ip_block);
 }
 
 static bool soc21_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index 82d8473a9120..8fa1fb4f9245 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -470,9 +470,9 @@ static int soc24_common_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc24_common_hw_init(void *handle)
+static int soc24_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* enable aspm */
 	soc24_program_aspm(adev);
@@ -521,9 +521,7 @@ static int soc24_common_suspend(struct amdgpu_ip_block *ip_block)
 
 static int soc24_common_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return soc24_common_hw_init(adev);
+	return soc24_common_hw_init(ip_block);
 }
 
 static bool soc24_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index c63044187954..b4fa3c74cb43 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -324,10 +324,10 @@ static int tonga_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int tonga_ih_hw_init(void *handle)
+static int tonga_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = tonga_ih_irq_init(adev);
 	if (r)
@@ -354,9 +354,7 @@ static int tonga_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int tonga_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return tonga_ih_hw_init(adev);
+	return tonga_ih_hw_init(ip_block);
 }
 
 static bool tonga_ih_is_idle(void *handle)
@@ -422,7 +420,7 @@ static int tonga_ih_post_soft_reset(struct amdgpu_ip_block *ip_block)
 	if (!adev->irq.srbm_soft_reset)
 		return 0;
 
-	return tonga_ih_hw_init(adev);
+	return tonga_ih_hw_init(ip_block);
 }
 
 static int tonga_ih_soft_reset(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 79b2fbb0509e..23d1464baa58 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -625,9 +625,9 @@ static void uvd_v3_1_enable_mgcg(struct amdgpu_device *adev,
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int uvd_v3_1_hw_init(void *handle)
+static int uvd_v3_1_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = &adev->uvd.inst->ring;
 	uint32_t tmp;
 	int r;
@@ -750,13 +750,12 @@ static int uvd_v3_1_suspend(struct amdgpu_ip_block *ip_block)
 static int uvd_v3_1_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_uvd_resume(adev);
+	r = amdgpu_uvd_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return uvd_v3_1_hw_init(adev);
+	return uvd_v3_1_hw_init(ip_block);
 }
 
 static bool uvd_v3_1_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index b03abfc0c275..d7f5a481cf1b 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -151,9 +151,9 @@ static void uvd_v4_2_enable_mgcg(struct amdgpu_device *adev,
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int uvd_v4_2_hw_init(void *handle)
+static int uvd_v4_2_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = &adev->uvd.inst->ring;
 	uint32_t tmp;
 	int r;
@@ -264,13 +264,12 @@ static int uvd_v4_2_suspend(struct amdgpu_ip_block *ip_block)
 static int uvd_v4_2_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_uvd_resume(adev);
+	r = amdgpu_uvd_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return uvd_v4_2_hw_init(adev);
+	return uvd_v4_2_hw_init(ip_block);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index 9b3ea63b9276..60e06ae17eca 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -147,9 +147,9 @@ static int uvd_v5_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int uvd_v5_0_hw_init(void *handle)
+static int uvd_v5_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = &adev->uvd.inst->ring;
 	uint32_t tmp;
 	int r;
@@ -262,13 +262,12 @@ static int uvd_v5_0_suspend(struct amdgpu_ip_block *ip_block)
 static int uvd_v5_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_uvd_resume(adev);
+	r = amdgpu_uvd_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return uvd_v5_0_hw_init(adev);
+	return uvd_v5_0_hw_init(ip_block);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index a99ad9295ca9..953855b56c39 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -459,9 +459,9 @@ static int uvd_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int uvd_v6_0_hw_init(void *handle)
+static int uvd_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = &adev->uvd.inst->ring;
 	uint32_t tmp;
 	int i, r;
@@ -586,13 +586,12 @@ static int uvd_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 static int uvd_v6_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_uvd_resume(adev);
+	r = amdgpu_uvd_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return uvd_v6_0_hw_init(adev);
+	return uvd_v6_0_hw_init(ip_block);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 7c36d50f4d56..5ec9245e14c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -514,9 +514,9 @@ static int uvd_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int uvd_v7_0_hw_init(void *handle)
+static int uvd_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	uint32_t tmp;
 	int i, j, r;
@@ -654,13 +654,12 @@ static int uvd_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 static int uvd_v7_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_uvd_resume(adev);
+	r = amdgpu_uvd_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return uvd_v7_0_hw_init(adev);
+	return uvd_v7_0_hw_init(ip_block);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index 022cfb6dd6a8..0d014146c35d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -456,10 +456,10 @@ static int vce_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return amdgpu_vce_sw_fini(adev);
 }
 
-static int vce_v2_0_hw_init(void *handle)
+static int vce_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r, i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_asic_set_vce_clocks(adev, 10000, 10000);
 	vce_v2_0_enable_mgcg(adev, true, false);
@@ -523,13 +523,12 @@ static int vce_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vce_v2_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vce_resume(adev);
+	r = amdgpu_vce_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return vce_v2_0_hw_init(adev);
+	return vce_v2_0_hw_init(ip_block);
 }
 
 static int vce_v2_0_soft_reset(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 9601d915bec9..19829f7fbd9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -465,10 +465,10 @@ static int vce_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return amdgpu_vce_sw_fini(adev);
 }
 
-static int vce_v3_0_hw_init(void *handle)
+static int vce_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r, i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	vce_v3_0_override_vce_clock_gating(adev, true);
 
@@ -538,13 +538,12 @@ static int vce_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vce_v3_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vce_resume(adev);
+	r = amdgpu_vce_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	return vce_v3_0_hw_init(adev);
+	return vce_v3_0_hw_init(ip_block);
 }
 
 static void vce_v3_0_mc_resume(struct amdgpu_device *adev, int idx)
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index 4789e60555a9..a6546747b599 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -513,10 +513,10 @@ static int vce_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 	return amdgpu_vce_sw_fini(adev);
 }
 
-static int vce_v4_0_hw_init(void *handle)
+static int vce_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r, i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev))
 		r = vce_v4_0_sriov_start(adev);
@@ -624,7 +624,7 @@ static int vce_v4_0_resume(struct amdgpu_ip_block *ip_block)
 			return r;
 	}
 
-	return vce_v4_0_hw_init(adev);
+	return vce_v4_0_hw_init(ip_block);
 }
 
 static void vce_v4_0_mc_resume(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 40ebf9c3f574..d5da383897da 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -242,9 +242,9 @@ static int vcn_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v1_0_hw_init(void *handle)
+static int vcn_v1_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = &adev->vcn.inst->ring_dec;
 	int i, r;
 
@@ -325,13 +325,12 @@ static int vcn_v1_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v1_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v1_0_hw_init(adev);
+	r = vcn_v1_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 817b4dbec3d4..5f5b3350672e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -272,9 +272,9 @@ static int vcn_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v2_0_hw_init(void *handle)
+static int vcn_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring = &adev->vcn.inst->ring_dec;
 	int i, r;
 
@@ -354,13 +354,12 @@ static int vcn_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v2_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v2_0_hw_init(adev);
+	r = vcn_v2_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index f12011db9372..a86d62f6aea6 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -337,9 +337,9 @@ static int vcn_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v2_5_hw_init(void *handle)
+static int vcn_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, j, r = 0;
 
@@ -439,13 +439,12 @@ static int vcn_v2_5_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v2_5_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v2_5_hw_init(adev);
+	r = vcn_v2_5_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index c2b3ba9c6c90..7c11f3f77756 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -342,9 +342,9 @@ static int vcn_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v3_0_hw_init(void *handle)
+static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, j, r;
 
@@ -471,13 +471,12 @@ static int vcn_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v3_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v3_0_hw_init(adev);
+	r = vcn_v3_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 18761ad8c25d..8f0f56e21606 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -298,9 +298,9 @@ static int vcn_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v4_0_hw_init(void *handle)
+static int vcn_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, r;
 
@@ -400,13 +400,12 @@ static int vcn_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v4_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v4_0_hw_init(adev);
+	r = vcn_v4_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index c3d96bdc8356..0ace2ed73a0d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -253,9 +253,9 @@ static int vcn_v4_0_3_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v4_0_3_hw_init(void *handle)
+static int vcn_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, r, vcn_inst;
 
@@ -354,14 +354,13 @@ static int vcn_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int vcn_v4_0_3_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v4_0_3_hw_init(adev);
+	r = vcn_v4_0_3_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index b98e1533a830..45341dce246c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -265,9 +265,9 @@ static int vcn_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v4_0_5_hw_init(void *handle)
+static int vcn_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, r;
 
@@ -348,13 +348,12 @@ static int vcn_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v4_0_5_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v4_0_5_hw_init(adev);
+	r = vcn_v4_0_5_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index ed1c2b379460..a348eb2c3054 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -229,9 +229,9 @@ static int vcn_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
  *
  * Initialize the hardware, boot up the VCPU and do some testing
  */
-static int vcn_v5_0_0_hw_init(void *handle)
+static int vcn_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
 	int i, r;
 
@@ -312,13 +312,12 @@ static int vcn_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
 static int vcn_v5_0_0_resume(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_vcn_resume(adev);
+	r = amdgpu_vcn_resume(ip_block->adev);
 	if (r)
 		return r;
 
-	r = vcn_v5_0_0_hw_init(adev);
+	r = vcn_v5_0_0_hw_init(ip_block);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 2076c09f0488..20d896b6d4fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -534,11 +534,9 @@ static int vega10_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vega10_ih_hw_init(void *handle)
+static int vega10_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	return vega10_ih_irq_init(adev);
+	return vega10_ih_irq_init(ip_block->adev);
 }
 
 static int vega10_ih_hw_fini(void *handle)
@@ -559,9 +557,7 @@ static int vega10_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int vega10_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return vega10_ih_hw_init(adev);
+	return vega10_ih_hw_init(ip_block);
 }
 
 static bool vega10_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index fc02941cefd6..513a7abce8e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -595,10 +595,10 @@ static int vega20_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vega20_ih_hw_init(void *handle)
+static int vega20_ih_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = vega20_ih_irq_init(adev);
 	if (r)
@@ -625,9 +625,7 @@ static int vega20_ih_suspend(struct amdgpu_ip_block *ip_block)
 
 static int vega20_ih_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return vega20_ih_hw_init(adev);
+	return vega20_ih_hw_init(ip_block);
 }
 
 static bool vega20_ih_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 5e18ba72a03e..eb4de59b8b93 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -1704,9 +1704,9 @@ static int vi_common_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vi_common_hw_init(void *handle)
+static int vi_common_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* move the golden regs per IP block */
 	vi_init_golden_registers(adev);
@@ -1740,9 +1740,7 @@ static int vi_common_suspend(struct amdgpu_ip_block *ip_block)
 
 static int vi_common_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return vi_common_hw_init(adev);
+	return vi_common_hw_init(ip_block);
 }
 
 static bool vi_common_is_idle(void *handle)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 52188a07d6a4..08fd062723a1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2808,9 +2808,9 @@ static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
  * - Vblank support
  * - Debug FS entries, if enabled
  */
-static int dm_hw_init(void *handle)
+static int dm_hw_init(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	/* Create DAL display manager */
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 000adb83941f..ecf60a8d7be5 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -384,7 +384,7 @@ struct amd_ip_funcs {
 	int (*sw_init)(struct amdgpu_ip_block *ip_block);
 	int (*sw_fini)(struct amdgpu_ip_block *ip_block);
 	int (*early_fini)(struct amdgpu_ip_block *ip_block);
-	int (*hw_init)(void *handle);
+	int (*hw_init)(struct amdgpu_ip_block *ip_block);
 	int (*hw_fini)(void *handle);
 	void (*late_fini)(struct amdgpu_ip_block *ip_block);
 	int (*prepare_suspend)(struct amdgpu_ip_block *ip_block);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 01043e954f85..59803eaed0c2 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3034,10 +3034,10 @@ static int kv_dpm_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int kv_dpm_hw_init(void *handle)
+static int kv_dpm_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int ret;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (!amdgpu_dpm)
 		return 0;
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index e23bac6c0c08..a3915ef274f9 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7776,11 +7776,11 @@ static int si_dpm_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int si_dpm_hw_init(void *handle)
+static int si_dpm_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int ret;
 
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (!amdgpu_dpm)
 		return 0;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index cd70941edec5..77aba184a8d2 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -159,10 +159,10 @@ static int pp_sw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int pp_hw_init(void *handle)
+static int pp_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int ret = 0;
-	struct amdgpu_device *adev = handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
 
 	ret = hwmgr_hw_init(hwmgr);
@@ -273,8 +273,7 @@ static int pp_suspend(struct amdgpu_ip_block *ip_block)
 
 static int pp_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
+	struct pp_hwmgr *hwmgr = ip_block->adev->powerplay.pp_handle;
 
 	return hwmgr_resume(hwmgr);
 }
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 7bae464f1bf8..466b47a2f1bf 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1787,10 +1787,10 @@ static int smu_start_smc_engine(struct smu_context *smu)
 	return ret;
 }
 
-static int smu_hw_init(void *handle)
+static int smu_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	int ret;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct smu_context *smu = adev->powerplay.pp_handle;
 
 	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev)) {
@@ -2059,7 +2059,7 @@ static int smu_reset(struct smu_context *smu)
 	if (ret)
 		return ret;
 
-	ret = smu_hw_init(adev);
+	ret = smu_hw_init(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_SMC]);
 	if (ret)
 		return ret;
 
-- 
2.34.1


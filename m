Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D298A719
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2024 16:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107FB10E520;
	Mon, 30 Sep 2024 14:32:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E8210E51C
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2024 14:32:20 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48UEWFH22682377; Mon, 30 Sep 2024 20:02:15 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 48UEWFVd2682376;
 Mon, 30 Sep 2024 20:02:15 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 12/12] drm/amdgpu: update the handle ptr in hw_fini
Date: Mon, 30 Sep 2024 20:00:19 +0530
Message-Id: <20240930143019.2682202-13-sunil.khatri@amd.com>
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
functions pointers of hw_fini.

Also update the ip_block ptr where ever needed as
there were cyclic dependency of hw_fini on suspend
and some followed clean up.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c          |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c          |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c     |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c          |  6 +++---
 drivers/gpu/drm/amd/amdgpu/cik.c                 |  6 ++----
 drivers/gpu/drm/amd/amdgpu/cik_ih.c              | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/cz_ih.c               | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           | 10 ++++------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c          |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c          | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c             | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c             | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c             | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c           |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c           | 10 ++++------
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c           |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c           |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c         |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c         |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c         |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c           | 15 +++++++--------
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c           | 13 ++++++-------
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c           | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/nv.c                  |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c           | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c         |  6 +++---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/si.c                  |  6 ++----
 drivers/gpu/drm/amd/amdgpu/si_dma.c              | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/si_ih.c               | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/soc15.c               |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/soc21.c               |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/soc24.c               |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c            | 16 +++++-----------
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c            |  8 ++++----
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c            |  6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c            |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c          |  9 ++++-----
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c           | 10 +++-------
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c           |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/vi.c                  |  8 +++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  4 ++--
 drivers/gpu/drm/amd/include/amd_shared.h         |  2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c       |  4 ++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c       |  4 ++--
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c |  5 ++---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        |  6 +++---
 85 files changed, 267 insertions(+), 398 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 37d431a40184..cf2d55c2fd98 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -500,11 +500,11 @@ static int acp_hw_init(struct amdgpu_ip_block *ip_block)
  * @handle: handle used to pass amdgpu_device pointer
  *
  */
-static int acp_hw_fini(void *handle)
+static int acp_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	u32 val = 0;
 	u32 count = 0;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* return early if no ACP */
 	if (!adev->acp.acp_genpd) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4b03029a6ea4..38a7423101f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3285,7 +3285,7 @@ static void amdgpu_device_smu_fini_early(struct amdgpu_device *adev)
 		if (!adev->ip_blocks[i].status.hw)
 			continue;
 		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_SMC) {
-			r = adev->ip_blocks[i].version->funcs->hw_fini((void *)adev);
+			r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
 			/* XXX handle errors */
 			if (r) {
 				DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
@@ -3324,7 +3324,7 @@ static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 		if (!adev->ip_blocks[i].status.hw)
 			continue;
 
-		r = adev->ip_blocks[i].version->funcs->hw_fini((void *)adev);
+		r = adev->ip_blocks[i].version->funcs->hw_fini(&adev->ip_blocks[i]);
 		/* XXX handle errors */
 		if (r) {
 			DRM_DEBUG("hw_fini of IP block <%s> failed %d\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index a12b0725f0b0..5a919dae8d8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -72,10 +72,9 @@ static int isp_hw_init(struct amdgpu_ip_block *ip_block)
  * @handle: handle for amdgpu_device pointer
  *
  */
-static int isp_hw_fini(void *handle)
+static int isp_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	struct amdgpu_isp *isp = &adev->isp;
+	struct amdgpu_isp *isp = &ip_block->adev->isp;
 
 	if (isp->funcs->hw_fini != NULL)
 		return isp->funcs->hw_fini(isp);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 02d0022236d1..73406ce9babd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -3002,9 +3002,9 @@ static int psp_hw_init(struct amdgpu_ip_block *ip_block)
 	return -EINVAL;
 }
 
-static int psp_hw_fini(void *handle)
+static int psp_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct psp_context *psp = &adev->psp;
 
 	if (psp->ta_fw) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index aee4c1d4a53b..3ef75f1a47f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -857,9 +857,9 @@ static int umsch_mm_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int umsch_mm_hw_fini(void *handle)
+static int umsch_mm_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	umsch_mm_ring_stop(&adev->umsch_mm);
 
@@ -875,9 +875,7 @@ static int umsch_mm_hw_fini(void *handle)
 
 static int umsch_mm_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return umsch_mm_hw_fini(adev);
+	return umsch_mm_hw_fini(ip_block);
 }
 
 static int umsch_mm_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 2c810750f7d5..fd31e2e9feb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -600,7 +600,7 @@ static int amdgpu_vkms_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int amdgpu_vkms_hw_fini(void *handle)
+static int amdgpu_vkms_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
@@ -613,7 +613,7 @@ static int amdgpu_vkms_suspend(struct amdgpu_ip_block *ip_block)
 	r = drm_mode_config_helper_suspend(adev_to_drm(adev));
 	if (r)
 		return r;
-	return amdgpu_vkms_hw_fini(adev);
+	return amdgpu_vkms_hw_fini(ip_block);
 }
 
 static int amdgpu_vkms_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 2234c06b7d76..6d96e1f21e20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -421,9 +421,9 @@ static int vpe_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vpe_hw_fini(void *handle)
+static int vpe_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_vpe *vpe = &adev->vpe;
 
 	vpe_ring_stop(vpe);
@@ -440,7 +440,7 @@ static int vpe_suspend(struct amdgpu_ip_block *ip_block)
 
 	cancel_delayed_work_sync(&adev->vpe.idle_work);
 
-	return vpe_hw_fini(adev);
+	return vpe_hw_fini(ip_block);
 }
 
 static int vpe_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 1f8d941d26e7..6c18ab35cf69 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2148,16 +2148,14 @@ static int cik_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cik_common_hw_fini(void *handle)
+static int cik_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
 
 static int cik_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cik_common_hw_fini(adev);
+	return cik_common_hw_fini(ip_block);
 }
 
 static int cik_common_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index dfeac11f852e..9e9a58fd86ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -328,20 +328,16 @@ static int cik_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return cik_ih_irq_init(adev);
 }
 
-static int cik_ih_hw_fini(void *handle)
+static int cik_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	cik_ih_irq_disable(adev);
+	cik_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int cik_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cik_ih_hw_fini(adev);
+	return cik_ih_hw_fini(ip_block);
 }
 
 static int cik_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 96744060b51e..df3f429e003e 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1001,9 +1001,9 @@ static int cik_sdma_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int cik_sdma_hw_fini(void *handle)
+static int cik_sdma_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cik_ctx_switch_enable(adev, false);
 	cik_sdma_enable(adev, false);
@@ -1013,9 +1013,7 @@ static int cik_sdma_hw_fini(void *handle)
 
 static int cik_sdma_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cik_sdma_hw_fini(adev);
+	return cik_sdma_hw_fini(ip_block);
 }
 
 static int cik_sdma_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index d14af4538ef1..cadd69a243af 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -324,20 +324,16 @@ static int cz_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cz_ih_hw_fini(void *handle)
+static int cz_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	cz_ih_irq_disable(adev);
+	cz_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int cz_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return cz_ih_hw_fini(adev);
+	return cz_ih_hw_fini(ip_block);
 }
 
 static int cz_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 111c03f07155..2d0a24a343f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2887,10 +2887,10 @@ static int dce_v10_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v10_0_hw_fini(void *handle)
+static int dce_v10_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	dce_v10_0_hpd_fini(adev);
 
@@ -2917,7 +2917,7 @@ static int dce_v10_0_suspend(struct amdgpu_ip_block *ip_block)
 	adev->mode_info.bl_level =
 		amdgpu_atombios_encoder_get_backlight_level_from_reg(adev);
 
-	return dce_v10_0_hw_fini(adev);
+	return dce_v10_0_hw_fini(ip_block);
 }
 
 static int dce_v10_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 4d030716eb00..386ece7bc389 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3025,10 +3025,10 @@ static int dce_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v11_0_hw_fini(void *handle)
+static int dce_v11_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	dce_v11_0_hpd_fini(adev);
 
@@ -3055,7 +3055,7 @@ static int dce_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 	adev->mode_info.bl_level =
 		amdgpu_atombios_encoder_get_backlight_level_from_reg(adev);
 
-	return dce_v11_0_hw_fini(adev);
+	return dce_v11_0_hw_fini(ip_block);
 }
 
 static int dce_v11_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index d333e4f834d1..cd3e0118988d 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2783,10 +2783,10 @@ static int dce_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v6_0_hw_fini(void *handle)
+static int dce_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	dce_v6_0_hpd_fini(adev);
 
@@ -2812,7 +2812,7 @@ static int dce_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 	adev->mode_info.bl_level =
 		amdgpu_atombios_encoder_get_backlight_level_from_reg(adev);
 
-	return dce_v6_0_hw_fini(adev);
+	return dce_v6_0_hw_fini(ip_block);
 }
 
 static int dce_v6_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 166fd991bfba..295bc1d47095 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2805,10 +2805,10 @@ static int dce_v8_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v8_0_hw_fini(void *handle)
+static int dce_v8_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	dce_v8_0_hpd_fini(adev);
 
@@ -2835,7 +2835,7 @@ static int dce_v8_0_suspend(struct amdgpu_ip_block *ip_block)
 	adev->mode_info.bl_level =
 		amdgpu_atombios_encoder_get_backlight_level_from_reg(adev);
 
-	return dce_v8_0_hw_fini(adev);
+	return dce_v8_0_hw_fini(ip_block);
 }
 
 static int dce_v8_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index e00ff7b62403..e8c55c36f85a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7418,9 +7418,9 @@ static int gfx_v10_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v10_0_hw_fini(void *handle)
+static int gfx_v10_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
@@ -7431,7 +7431,7 @@ static int gfx_v10_0_hw_fini(void *handle)
 	 * otherwise the gfxoff disallowing will be failed to set.
 	 */
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 3, 1))
-		gfx_v10_0_set_powergating_state(handle, AMD_PG_STATE_UNGATE);
+		gfx_v10_0_set_powergating_state(ip_block->adev, AMD_PG_STATE_UNGATE);
 
 	if (!adev->no_hw_access) {
 		if (amdgpu_async_gfx_ring) {
@@ -7458,9 +7458,7 @@ static int gfx_v10_0_hw_fini(void *handle)
 
 static int gfx_v10_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v10_0_hw_fini(adev);
+	return gfx_v10_0_hw_fini(ip_block);
 }
 
 static int gfx_v10_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 601e3a3e31e6..6b22128ab004 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -4667,9 +4667,9 @@ static int gfx_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v11_0_hw_fini(void *handle)
+static int gfx_v11_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
@@ -4707,9 +4707,7 @@ static int gfx_v11_0_hw_fini(void *handle)
 
 static int gfx_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v11_0_hw_fini(adev);
+	return gfx_v11_0_hw_fini(ip_block);
 }
 
 static int gfx_v11_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 68f90aab45d9..dc25fcb89b13 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -3603,9 +3603,9 @@ static int gfx_v12_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v12_0_hw_fini(void *handle)
+static int gfx_v12_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	uint32_t tmp;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
@@ -3645,9 +3645,7 @@ static int gfx_v12_0_hw_fini(void *handle)
 
 static int gfx_v12_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v12_0_hw_fini(adev);
+	return gfx_v12_0_hw_fini(ip_block);
 }
 
 static int gfx_v12_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index bf3efe6bc4bf..6ac6d4dfa49f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3142,9 +3142,9 @@ static int gfx_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v6_0_hw_fini(void *handle)
+static int gfx_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gfx_v6_0_cp_enable(adev, false);
 	adev->gfx.rlc.funcs->stop(adev);
@@ -3155,9 +3155,7 @@ static int gfx_v6_0_hw_fini(void *handle)
 
 static int gfx_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v6_0_hw_fini(adev);
+	return gfx_v6_0_hw_fini(ip_block);
 }
 
 static int gfx_v6_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 71a98a538b37..77150c9f1e18 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4486,9 +4486,9 @@ static int gfx_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v7_0_hw_fini(void *handle)
+static int gfx_v7_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
@@ -4501,9 +4501,7 @@ static int gfx_v7_0_hw_fini(void *handle)
 
 static int gfx_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v7_0_hw_fini(adev);
+	return gfx_v7_0_hw_fini(ip_block);
 }
 
 static int gfx_v7_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 3d06b32074b8..39441dd766c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4879,9 +4879,9 @@ static int gfx_v8_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	return -ETIMEDOUT;
 }
 
-static int gfx_v8_0_hw_fini(void *handle)
+static int gfx_v8_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
@@ -4913,9 +4913,7 @@ static int gfx_v8_0_hw_fini(void *handle)
 
 static int gfx_v8_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v8_0_hw_fini(adev);
+	return gfx_v8_0_hw_fini(ip_block);
 }
 
 static int gfx_v8_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 9cef43d1edaa..fcab8148d0a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -4020,9 +4020,9 @@ static int gfx_v9_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v9_0_hw_fini(void *handle)
+static int gfx_v9_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
 		amdgpu_irq_put(adev, &adev->gfx.cp_ecc_error_irq, 0);
@@ -4074,9 +4074,7 @@ static int gfx_v9_0_hw_fini(void *handle)
 
 static int gfx_v9_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v9_0_hw_fini(adev);
+	return gfx_v9_0_hw_fini(ip_block);
 }
 
 static int gfx_v9_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index fe6df1723013..7d425d2e7ab0 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2369,9 +2369,9 @@ static int gfx_v9_4_3_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v9_4_3_hw_fini(void *handle)
+static int gfx_v9_4_3_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, num_xcc;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
@@ -2388,9 +2388,7 @@ static int gfx_v9_4_3_hw_fini(void *handle)
 
 static int gfx_v9_4_3_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gfx_v9_4_3_hw_fini(adev);
+	return gfx_v9_4_3_hw_fini(ip_block);
 }
 
 static int gfx_v9_4_3_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 80e724397d5b..5cf2002fcba8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1032,9 +1032,9 @@ static void gmc_v10_0_gart_disable(struct amdgpu_device *adev)
 	adev->mmhub.funcs->gart_disable(adev);
 }
 
-static int gmc_v10_0_hw_fini(void *handle)
+static int gmc_v10_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gmc_v10_0_gart_disable(adev);
 
@@ -1055,9 +1055,7 @@ static int gmc_v10_0_hw_fini(void *handle)
 
 static int gmc_v10_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	gmc_v10_0_hw_fini(adev);
+	gmc_v10_0_hw_fini(ip_block);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index c8e7e0162505..4df4d73038f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -940,9 +940,9 @@ static void gmc_v11_0_gart_disable(struct amdgpu_device *adev)
 	adev->mmhub.funcs->gart_disable(adev);
 }
 
-static int gmc_v11_0_hw_fini(void *handle)
+static int gmc_v11_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev)) {
 		/* full access mode, so don't touch any GMC register */
@@ -963,9 +963,7 @@ static int gmc_v11_0_hw_fini(void *handle)
 
 static int gmc_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	gmc_v11_0_hw_fini(adev);
+	gmc_v11_0_hw_fini(ip_block);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index 7e3366253d31..e33f9e9058cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -924,9 +924,9 @@ static void gmc_v12_0_gart_disable(struct amdgpu_device *adev)
 	adev->mmhub.funcs->gart_disable(adev);
 }
 
-static int gmc_v12_0_hw_fini(void *handle)
+static int gmc_v12_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev)) {
 		/* full access mode, so don't touch any GMC register */
@@ -947,9 +947,7 @@ static int gmc_v12_0_hw_fini(void *handle)
 
 static int gmc_v12_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	gmc_v12_0_hw_fini(adev);
+	gmc_v12_0_hw_fini(ip_block);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 5f163d160c6b..5953c37c9c63 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -914,9 +914,9 @@ static int gmc_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v6_0_hw_fini(void *handle)
+static int gmc_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
 	gmc_v6_0_gart_disable(adev);
@@ -926,9 +926,7 @@ static int gmc_v6_0_hw_fini(void *handle)
 
 static int gmc_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	gmc_v6_0_hw_fini(adev);
+	gmc_v6_0_hw_fini(ip_block);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 82959be636d0..54a48662f3b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1101,9 +1101,9 @@ static int gmc_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v7_0_hw_fini(void *handle)
+static int gmc_v7_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
 	gmc_v7_0_gart_disable(adev);
@@ -1113,9 +1113,7 @@ static int gmc_v7_0_hw_fini(void *handle)
 
 static int gmc_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	gmc_v7_0_hw_fini(adev);
+	gmc_v7_0_hw_fini(ip_block);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 720a60689fe2..bb442ac2f520 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1222,9 +1222,9 @@ static int gmc_v8_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v8_0_hw_fini(void *handle)
+static int gmc_v8_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_put(adev, &adev->gmc.vm_fault, 0);
 	gmc_v8_0_gart_disable(adev);
@@ -1234,9 +1234,7 @@ static int gmc_v8_0_hw_fini(void *handle)
 
 static int gmc_v8_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	gmc_v8_0_hw_fini(adev);
+	gmc_v8_0_hw_fini(ip_block);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 507952da94a5..94600e5c8ea3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2393,9 +2393,9 @@ static void gmc_v9_0_gart_disable(struct amdgpu_device *adev)
 	adev->mmhub.funcs->gart_disable(adev);
 }
 
-static int gmc_v9_0_hw_fini(void *handle)
+static int gmc_v9_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	gmc_v9_0_gart_disable(adev);
 
@@ -2430,9 +2430,7 @@ static int gmc_v9_0_hw_fini(void *handle)
 
 static int gmc_v9_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return gmc_v9_0_hw_fini(adev);
+	return gmc_v9_0_hw_fini(ip_block);
 }
 
 static int gmc_v9_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index 9d37b93c8fd8..a3fb01f905d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -318,20 +318,16 @@ static int iceland_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return iceland_ih_irq_init(adev);
 }
 
-static int iceland_ih_hw_fini(void *handle)
+static int iceland_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	iceland_ih_irq_disable(adev);
+	iceland_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int iceland_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return iceland_ih_hw_fini(adev);
+	return iceland_ih_hw_fini(ip_block);
 }
 
 static int iceland_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 0c0b7764cd8e..09403eac483b 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -635,20 +635,16 @@ static int ih_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int ih_v6_0_hw_fini(void *handle)
+static int ih_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	ih_v6_0_irq_disable(adev);
+	ih_v6_0_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int ih_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return ih_v6_0_hw_fini(adev);
+	return ih_v6_0_hw_fini(ip_block);
 }
 
 static int ih_v6_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 0b2db6e493fd..9706d7593d26 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -614,20 +614,16 @@ static int ih_v6_1_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int ih_v6_1_hw_fini(void *handle)
+static int ih_v6_1_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	ih_v6_1_irq_disable(adev);
+	ih_v6_1_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int ih_v6_1_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return ih_v6_1_hw_fini(adev);
+	return ih_v6_1_hw_fini(ip_block);
 }
 
 static int ih_v6_1_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index da708cdecbbe..9657145d7cce 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -604,20 +604,16 @@ static int ih_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int ih_v7_0_hw_fini(void *handle)
+static int ih_v7_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	ih_v7_0_irq_disable(adev);
+	ih_v7_0_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int ih_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return ih_v7_0_hw_fini(adev);
+	return ih_v7_0_hw_fini(ip_block);
 }
 
 static int ih_v7_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 2829616894e7..ec3d341fef61 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -146,9 +146,9 @@ static int jpeg_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v2_0_hw_fini(void *handle)
+static int jpeg_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -168,14 +168,13 @@ static int jpeg_v2_0_hw_fini(void *handle)
  */
 static int jpeg_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v2_0_hw_fini(adev);
+	r = jpeg_v2_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 558d3e097681..37cf415b6b41 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -206,9 +206,9 @@ static int jpeg_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v2_5_hw_fini(void *handle)
+static int jpeg_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -237,14 +237,13 @@ static int jpeg_v2_5_hw_fini(void *handle)
  */
 static int jpeg_v2_5_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v2_5_hw_fini(adev);
+	r = jpeg_v2_5_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
@@ -258,7 +257,6 @@ static int jpeg_v2_5_suspend(struct amdgpu_ip_block *ip_block)
  */
 static int jpeg_v2_5_resume(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = amdgpu_jpeg_resume(ip_block->adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index ccd1093d5bb2..2fa866a3e39d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -160,9 +160,9 @@ static int jpeg_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v3_0_hw_fini(void *handle)
+static int jpeg_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -182,14 +182,13 @@ static int jpeg_v3_0_hw_fini(void *handle)
  */
 static int jpeg_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v3_0_hw_fini(adev);
+	r = jpeg_v3_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 2dfdefb4db40..3cef4124b171 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -191,9 +191,9 @@ static int jpeg_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v4_0_hw_fini(void *handle)
+static int jpeg_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 	if (!amdgpu_sriov_vf(adev)) {
@@ -216,14 +216,13 @@ static int jpeg_v4_0_hw_fini(void *handle)
  */
 static int jpeg_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v4_0_hw_fini(adev);
+	r = jpeg_v4_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index abb9f8953c7c..cf6efe6db8b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -362,9 +362,9 @@ static int jpeg_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v4_0_3_hw_fini(void *handle)
+static int jpeg_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 0;
 
 	cancel_delayed_work_sync(&adev->jpeg.idle_work);
@@ -386,14 +386,13 @@ static int jpeg_v4_0_3_hw_fini(void *handle)
  */
 static int jpeg_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v4_0_3_hw_fini(adev);
+	r = jpeg_v4_0_3_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index 7412d2d43bd4..2f9749b00eaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -214,9 +214,9 @@ static int jpeg_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v4_0_5_hw_fini(void *handle)
+static int jpeg_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -243,14 +243,13 @@ static int jpeg_v4_0_5_hw_fini(void *handle)
  */
 static int jpeg_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v4_0_5_hw_fini(adev);
+	r = jpeg_v4_0_5_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index 0c1749f6c4a3..a9a0b3f250de 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -157,9 +157,9 @@ static int jpeg_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the JPEG block, mark ring as not ready any more
  */
-static int jpeg_v5_0_0_hw_fini(void *handle)
+static int jpeg_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -179,14 +179,13 @@ static int jpeg_v5_0_0_hw_fini(void *handle)
  */
 static int jpeg_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = jpeg_v5_0_0_hw_fini(adev);
+	r = jpeg_v5_0_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_jpeg_suspend(adev);
+	r = amdgpu_jpeg_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 4af5e9c13551..36d3a79c0055 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -56,7 +56,7 @@ MODULE_FIRMWARE("amdgpu/gc_11_5_2_mes_2.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_5_2_mes1.bin");
 
 static int mes_v11_0_hw_init(struct amdgpu_ip_block *ip_block);
-static int mes_v11_0_hw_fini(void *handle);
+static int mes_v11_0_hw_fini(struct amdgpu_ip_block *ip_block);
 static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev);
 static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev);
 
@@ -1539,7 +1539,7 @@ static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev)
 	return r;
 
 failure:
-	mes_v11_0_hw_fini(adev);
+	mes_v11_0_hw_fini(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_MES]);
 	return r;
 }
 
@@ -1615,13 +1615,13 @@ static int mes_v11_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 
 failure:
-	mes_v11_0_hw_fini(adev);
+	mes_v11_0_hw_fini(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_MES]);
 	return r;
 }
 
-static int mes_v11_0_hw_fini(void *handle)
+static int mes_v11_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	if (amdgpu_sriov_is_mes_info_enable(adev)) {
 		amdgpu_bo_free_kernel(&adev->mes.resource_1, &adev->mes.resource_1_gpu_addr,
 					&adev->mes.resource_1_addr);
@@ -1632,13 +1632,12 @@ static int mes_v11_0_hw_fini(void *handle)
 static int mes_v11_0_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_mes_suspend(adev);
+	r = amdgpu_mes_suspend(ip_block->adev);
 	if (r)
 		return r;
 
-	return mes_v11_0_hw_fini(adev);
+	return mes_v11_0_hw_fini(ip_block);
 }
 
 static int mes_v11_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
index e7e6d00b16fc..b0ca46694c7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -40,7 +40,7 @@ MODULE_FIRMWARE("amdgpu/gc_12_0_1_mes1.bin");
 MODULE_FIRMWARE("amdgpu/gc_12_0_1_uni_mes.bin");
 
 static int mes_v12_0_hw_init(struct amdgpu_ip_block *ip_block);
-static int mes_v12_0_hw_fini(void *handle);
+static int mes_v12_0_hw_fini(struct amdgpu_ip_block *ip_block);
 static int mes_v12_0_kiq_hw_init(struct amdgpu_device *adev);
 static int mes_v12_0_kiq_hw_fini(struct amdgpu_device *adev);
 
@@ -1500,7 +1500,7 @@ static int mes_v12_0_kiq_hw_init(struct amdgpu_device *adev)
 	return r;
 
 failure:
-	mes_v12_0_hw_fini(adev);
+	mes_v12_0_hw_fini(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_MES]);
 	return r;
 }
 
@@ -1584,11 +1584,11 @@ static int mes_v12_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 
 failure:
-	mes_v12_0_hw_fini(adev);
+	mes_v12_0_hw_fini(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_MES]);
 	return r;
 }
 
-static int mes_v12_0_hw_fini(void *handle)
+static int mes_v12_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
@@ -1596,13 +1596,12 @@ static int mes_v12_0_hw_fini(void *handle)
 static int mes_v12_0_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = amdgpu_mes_suspend(adev);
+	r = amdgpu_mes_suspend(ip_block->adev);
 	if (r)
 		return r;
 
-	return mes_v12_0_hw_fini(adev);
+	return mes_v12_0_hw_fini(ip_block);
 }
 
 static int mes_v12_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 0d744b3d4bb4..93da900b7ee2 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -609,20 +609,16 @@ static int navi10_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return navi10_ih_irq_init(adev);
 }
 
-static int navi10_ih_hw_fini(void *handle)
+static int navi10_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	navi10_ih_irq_disable(adev);
+	navi10_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int navi10_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return navi10_ih_hw_fini(adev);
+	return navi10_ih_hw_fini(ip_block);
 }
 
 static int navi10_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 4b1085e2bfdd..4e8f9af1e2be 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1014,9 +1014,9 @@ static int nv_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int nv_common_hw_fini(void *handle)
+static int nv_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* Disable the doorbell aperture and selfring doorbell aperture
 	 * separately in hw_fini because nv_enable_doorbell_aperture
@@ -1031,9 +1031,7 @@ static int nv_common_hw_fini(void *handle)
 
 static int nv_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return nv_common_hw_fini(adev);
+	return nv_common_hw_fini(ip_block);
 }
 
 static int nv_common_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 2d41c74c73bd..10fd772cb80f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -892,20 +892,16 @@ static int sdma_v2_4_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v2_4_hw_fini(void *handle)
+static int sdma_v2_4_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	sdma_v2_4_enable(adev, false);
+	sdma_v2_4_enable(ip_block->adev, false);
 
 	return 0;
 }
 
 static int sdma_v2_4_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v2_4_hw_fini(adev);
+	return sdma_v2_4_hw_fini(ip_block);
 }
 
 static int sdma_v2_4_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 03333107c2e9..69fba087e09c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1178,9 +1178,9 @@ static int sdma_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v3_0_hw_fini(void *handle)
+static int sdma_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	sdma_v3_0_ctx_switch_enable(adev, false);
 	sdma_v3_0_enable(adev, false);
@@ -1190,9 +1190,7 @@ static int sdma_v3_0_hw_fini(void *handle)
 
 static int sdma_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v3_0_hw_fini(adev);
+	return sdma_v3_0_hw_fini(ip_block);
 }
 
 static int sdma_v3_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 7f5ca95b5fcf..c1f98f6cf20d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -1964,9 +1964,9 @@ static int sdma_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return sdma_v4_0_start(adev);
 }
 
-static int sdma_v4_0_hw_fini(void *handle)
+static int sdma_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	if (amdgpu_sriov_vf(adev))
@@ -1998,7 +1998,7 @@ static int sdma_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 		return 0;
 	}
 
-	return sdma_v4_0_hw_fini(adev);
+	return sdma_v4_0_hw_fini(ip_block);
 }
 
 static int sdma_v4_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index f4ab26998a51..9c7cea0890c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1482,9 +1482,9 @@ static int sdma_v4_4_2_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v4_4_2_hw_fini(void *handle)
+static int sdma_v4_4_2_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	uint32_t inst_mask;
 	int i;
 
@@ -1515,7 +1515,7 @@ static int sdma_v4_4_2_suspend(struct amdgpu_ip_block *ip_block)
 	if (amdgpu_in_reset(adev))
 		sdma_v4_4_2_set_clockgating_state(adev, AMD_CG_STATE_UNGATE);
 
-	return sdma_v4_4_2_hw_fini(adev);
+	return sdma_v4_4_2_hw_fini(ip_block);
 }
 
 static int sdma_v4_4_2_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 68eb1fd986dd..6a675daf5620 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1489,9 +1489,9 @@ static int sdma_v5_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v5_0_hw_fini(void *handle)
+static int sdma_v5_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev))
 		return 0;
@@ -1504,9 +1504,7 @@ static int sdma_v5_0_hw_fini(void *handle)
 
 static int sdma_v5_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v5_0_hw_fini(adev);
+	return sdma_v5_0_hw_fini(ip_block);
 }
 
 static int sdma_v5_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 1272c3cdc132..b36931864674 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1384,9 +1384,9 @@ static int sdma_v5_2_hw_init(struct amdgpu_ip_block *ip_block)
 	return sdma_v5_2_start(adev);
 }
 
-static int sdma_v5_2_hw_fini(void *handle)
+static int sdma_v5_2_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev))
 		return 0;
@@ -1399,9 +1399,7 @@ static int sdma_v5_2_hw_fini(void *handle)
 
 static int sdma_v5_2_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v5_2_hw_fini(adev);
+	return sdma_v5_2_hw_fini(ip_block);
 }
 
 static int sdma_v5_2_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 9ab045552109..4b33bd6b776d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1387,9 +1387,9 @@ static int sdma_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return sdma_v6_0_start(adev);
 }
 
-static int sdma_v6_0_hw_fini(void *handle)
+static int sdma_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev))
 		return 0;
@@ -1402,9 +1402,7 @@ static int sdma_v6_0_hw_fini(void *handle)
 
 static int sdma_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v6_0_hw_fini(adev);
+	return sdma_v6_0_hw_fini(ip_block);
 }
 
 static int sdma_v6_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 4e2919bd15df..24f24974ac1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1345,9 +1345,9 @@ static int sdma_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return sdma_v7_0_start(adev);
 }
 
-static int sdma_v7_0_hw_fini(void *handle)
+static int sdma_v7_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_sriov_vf(adev))
 		return 0;
@@ -1360,9 +1360,7 @@ static int sdma_v7_0_hw_fini(void *handle)
 
 static int sdma_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return sdma_v7_0_hw_fini(adev);
+	return sdma_v7_0_hw_fini(ip_block);
 }
 
 static int sdma_v7_0_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 8b0cad1dfad6..b9934661a92e 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2645,16 +2645,14 @@ static int si_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int si_common_hw_fini(void *handle)
+static int si_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
 
 static int si_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return si_common_hw_fini(adev);
+	return si_common_hw_fini(ip_block);
 }
 
 static int si_common_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 68e7572b4a90..d44483ed3363 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -524,20 +524,16 @@ static int si_dma_hw_init(struct amdgpu_ip_block *ip_block)
 	return si_dma_start(adev);
 }
 
-static int si_dma_hw_fini(void *handle)
+static int si_dma_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	si_dma_stop(adev);
+	si_dma_stop(ip_block->adev);
 
 	return 0;
 }
 
 static int si_dma_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return si_dma_hw_fini(adev);
+	return si_dma_hw_fini(ip_block);
 }
 
 static int si_dma_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 413a4cd35fe4..b018a3b90401 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -193,20 +193,16 @@ static int si_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return si_ih_irq_init(adev);
 }
 
-static int si_ih_hw_fini(void *handle)
+static int si_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	si_ih_irq_disable(adev);
+	si_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int si_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return si_ih_hw_fini(adev);
+	return si_ih_hw_fini(ip_block);
 }
 
 static int si_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index d2a74da44a3b..6ab34c526c86 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1284,9 +1284,9 @@ static int soc15_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc15_common_hw_fini(void *handle)
+static int soc15_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* Disable the doorbell aperture and selfring doorbell aperture
 	 * separately in hw_fini because soc15_enable_doorbell_aperture
@@ -1320,9 +1320,7 @@ static int soc15_common_hw_fini(void *handle)
 
 static int soc15_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return soc15_common_hw_fini(adev);
+	return soc15_common_hw_fini(ip_block);
 }
 
 static int soc15_common_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 4ce702c168c0..c4b950e75133 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -867,9 +867,9 @@ static int soc21_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc21_common_hw_fini(void *handle)
+static int soc21_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* Disable the doorbell aperture and selfring doorbell aperture
 	 * separately in hw_fini because soc21_enable_doorbell_aperture
@@ -892,9 +892,7 @@ static int soc21_common_hw_fini(void *handle)
 
 static int soc21_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return soc21_common_hw_fini(adev);
+	return soc21_common_hw_fini(ip_block);
 }
 
 static bool soc21_need_reset_on_resume(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index 8fa1fb4f9245..b20dc81dc257 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -494,9 +494,9 @@ static int soc24_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc24_common_hw_fini(void *handle)
+static int soc24_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* Disable the doorbell aperture and selfring doorbell aperture
 	 * separately in hw_fini because soc21_enable_doorbell_aperture
@@ -514,9 +514,7 @@ static int soc24_common_hw_fini(void *handle)
 
 static int soc24_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return soc24_common_hw_fini(adev);
+	return soc24_common_hw_fini(ip_block);
 }
 
 static int soc24_common_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index b4fa3c74cb43..45fb5140c8b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -336,20 +336,16 @@ static int tonga_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int tonga_ih_hw_fini(void *handle)
+static int tonga_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	tonga_ih_irq_disable(adev);
+	tonga_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int tonga_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return tonga_ih_hw_fini(adev);
+	return tonga_ih_hw_fini(ip_block);
 }
 
 static int tonga_ih_resume(struct amdgpu_ip_block *ip_block)
@@ -405,12 +401,10 @@ static bool tonga_ih_check_soft_reset(struct amdgpu_ip_block *ip_block)
 
 static int tonga_ih_pre_soft_reset(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	if (!adev->irq.srbm_soft_reset)
+	if (!ip_block->adev->irq.srbm_soft_reset)
 		return 0;
 
-	return tonga_ih_hw_fini(adev);
+	return tonga_ih_hw_fini(ip_block);
 }
 
 static int tonga_ih_post_soft_reset(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 23d1464baa58..c5540c30d1bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -692,9 +692,9 @@ static int uvd_v3_1_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the UVD block, mark ring as not ready any more
  */
-static int uvd_v3_1_hw_fini(void *handle)
+static int uvd_v3_1_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->uvd.idle_work);
 
@@ -740,7 +740,7 @@ static int uvd_v3_1_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = uvd_v3_1_hw_fini(adev);
+	r = uvd_v3_1_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index d7f5a481cf1b..02e2dda63828 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -206,9 +206,9 @@ static int uvd_v4_2_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the UVD block, mark ring as not ready any more
  */
-static int uvd_v4_2_hw_fini(void *handle)
+static int uvd_v4_2_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->uvd.idle_work);
 
@@ -254,7 +254,7 @@ static int uvd_v4_2_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = uvd_v4_2_hw_fini(adev);
+	r = uvd_v4_2_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index 60e06ae17eca..e5b0b7ecfd12 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -204,9 +204,9 @@ static int uvd_v5_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the UVD block, mark ring as not ready any more
  */
-static int uvd_v5_0_hw_fini(void *handle)
+static int uvd_v5_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->uvd.idle_work);
 
@@ -252,7 +252,7 @@ static int uvd_v5_0_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = uvd_v5_0_hw_fini(adev);
+	r = uvd_v5_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 953855b56c39..e866f6bf366b 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -528,9 +528,9 @@ static int uvd_v6_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the UVD block, mark ring as not ready any more
  */
-static int uvd_v6_0_hw_fini(void *handle)
+static int uvd_v6_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->uvd.idle_work);
 
@@ -576,7 +576,7 @@ static int uvd_v6_0_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = uvd_v6_0_hw_fini(adev);
+	r = uvd_v6_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 5ec9245e14c2..0ec192ecdbf3 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -592,9 +592,9 @@ static int uvd_v7_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the UVD block, mark ring as not ready any more
  */
-static int uvd_v7_0_hw_fini(void *handle)
+static int uvd_v7_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->uvd.idle_work);
 
@@ -644,7 +644,7 @@ static int uvd_v7_0_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = uvd_v7_0_hw_fini(adev);
+	r = uvd_v7_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index 0d014146c35d..af8814eeb333 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -475,11 +475,9 @@ static int vce_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vce_v2_0_hw_fini(void *handle)
+static int vce_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	cancel_delayed_work_sync(&adev->vce.idle_work);
+	cancel_delayed_work_sync(&ip_block->adev->vce.idle_work);
 
 	return 0;
 }
@@ -513,7 +511,7 @@ static int vce_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = vce_v2_0_hw_fini(adev);
+	r = vce_v2_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 19829f7fbd9c..9f9a9d89bcdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -485,14 +485,14 @@ static int vce_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vce_v3_0_hw_fini(void *handle)
+static int vce_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vce.idle_work);
 
-	r = vce_v3_0_wait_for_idle(handle);
+	r = vce_v3_0_wait_for_idle(ip_block);
 	if (r)
 		return r;
 
@@ -528,7 +528,7 @@ static int vce_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = vce_v3_0_hw_fini(adev);
+	r = vce_v3_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index a6546747b599..bf36b9cc6de4 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -536,9 +536,9 @@ static int vce_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vce_v4_0_hw_fini(void *handle)
+static int vce_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vce.idle_work);
 
@@ -594,7 +594,7 @@ static int vce_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 						       AMD_CG_STATE_GATE);
 	}
 
-	r = vce_v4_0_hw_fini(adev);
+	r = vce_v4_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index d5da383897da..c069c6d89e38 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -272,9 +272,9 @@ static int vcn_v1_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v1_0_hw_fini(void *handle)
+static int vcn_v1_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -306,7 +306,7 @@ static int vcn_v1_0_suspend(struct amdgpu_ip_block *ip_block)
 			amdgpu_dpm_enable_uvd(adev, false);
 	}
 
-	r = vcn_v1_0_hw_fini(adev);
+	r = vcn_v1_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 5f5b3350672e..c104c47301c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -309,9 +309,9 @@ static int vcn_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v2_0_hw_fini(void *handle)
+static int vcn_v2_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -333,13 +333,12 @@ static int vcn_v2_0_hw_fini(void *handle)
 static int vcn_v2_0_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = vcn_v2_0_hw_fini(adev);
+	r = vcn_v2_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index a86d62f6aea6..e76e1168d6f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -385,9 +385,9 @@ static int vcn_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v2_5_hw_fini(void *handle)
+static int vcn_v2_5_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -418,13 +418,12 @@ static int vcn_v2_5_hw_fini(void *handle)
 static int vcn_v2_5_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = vcn_v2_5_hw_fini(adev);
+	r = vcn_v2_5_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 7c11f3f77756..51ea9a83204f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -417,9 +417,9 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v3_0_hw_fini(void *handle)
+static int vcn_v3_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -450,13 +450,12 @@ static int vcn_v3_0_hw_fini(void *handle)
 static int vcn_v3_0_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = vcn_v3_0_hw_fini(adev);
+	r = vcn_v3_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 8f0f56e21606..e33cc611f215 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -345,9 +345,9 @@ static int vcn_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v4_0_hw_fini(void *handle)
+static int vcn_v4_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -379,13 +379,12 @@ static int vcn_v4_0_hw_fini(void *handle)
 static int vcn_v4_0_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = vcn_v4_0_hw_fini(adev);
+	r = vcn_v4_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 0ace2ed73a0d..f02699a92e50 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -312,9 +312,9 @@ static int vcn_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v4_0_3_hw_fini(void *handle)
+static int vcn_v4_0_3_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
 
@@ -333,14 +333,13 @@ static int vcn_v4_0_3_hw_fini(void *handle)
  */
 static int vcn_v4_0_3_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
-	r = vcn_v4_0_3_hw_fini(adev);
+	r = vcn_v4_0_3_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 45341dce246c..6d277ee27f46 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -295,9 +295,9 @@ static int vcn_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v4_0_5_hw_fini(void *handle)
+static int vcn_v4_0_5_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -327,13 +327,12 @@ static int vcn_v4_0_5_hw_fini(void *handle)
 static int vcn_v4_0_5_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = vcn_v4_0_5_hw_fini(adev);
+	r = vcn_v4_0_5_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index a348eb2c3054..89e813b7ba5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -259,9 +259,9 @@ static int vcn_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
  *
  * Stop the VCN block, mark ring as not ready any more
  */
-static int vcn_v5_0_0_hw_fini(void *handle)
+static int vcn_v5_0_0_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	cancel_delayed_work_sync(&adev->vcn.idle_work);
@@ -291,13 +291,12 @@ static int vcn_v5_0_0_hw_fini(void *handle)
 static int vcn_v5_0_0_suspend(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = ip_block->adev;
 
-	r = vcn_v5_0_0_hw_fini(adev);
+	r = vcn_v5_0_0_hw_fini(ip_block);
 	if (r)
 		return r;
 
-	r = amdgpu_vcn_suspend(adev);
+	r = amdgpu_vcn_suspend(ip_block->adev);
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 20d896b6d4fe..73de5909f655 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -539,20 +539,16 @@ static int vega10_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return vega10_ih_irq_init(ip_block->adev);
 }
 
-static int vega10_ih_hw_fini(void *handle)
+static int vega10_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	vega10_ih_irq_disable(adev);
+	vega10_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
 
 static int vega10_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return vega10_ih_hw_fini(adev);
+	return vega10_ih_hw_fini(ip_block);
 }
 
 static int vega10_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 513a7abce8e2..84bf9711adfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -607,11 +607,9 @@ static int vega20_ih_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vega20_ih_hw_fini(void *handle)
+static int vega20_ih_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	vega20_ih_irq_disable(adev);
+	vega20_ih_irq_disable(ip_block->adev);
 
 	return 0;
 }
@@ -620,7 +618,7 @@ static int vega20_ih_suspend(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 
-	return vega20_ih_hw_fini(adev);
+	return vega20_ih_hw_fini(ip_block);
 }
 
 static int vega20_ih_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index eb4de59b8b93..4996049dc199 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -1718,9 +1718,9 @@ static int vi_common_hw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vi_common_hw_fini(void *handle)
+static int vi_common_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* enable the doorbell aperture */
 	vi_enable_doorbell_aperture(adev, false);
@@ -1733,9 +1733,7 @@ static int vi_common_hw_fini(void *handle)
 
 static int vi_common_suspend(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = ip_block->adev;
-
-	return vi_common_hw_fini(adev);
+	return vi_common_hw_fini(ip_block);
 }
 
 static int vi_common_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 08fd062723a1..576a7404cf10 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2830,9 +2830,9 @@ static int dm_hw_init(struct amdgpu_ip_block *ip_block)
  * cleanup. This involves cleaning up the DRM device, DC, and any modules that
  * were loaded. Also flush IRQ workqueues and disable them.
  */
-static int dm_hw_fini(void *handle)
+static int dm_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_dm_hpd_fini(adev);
 
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index ecf60a8d7be5..d892273fdb10 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -385,7 +385,7 @@ struct amd_ip_funcs {
 	int (*sw_fini)(struct amdgpu_ip_block *ip_block);
 	int (*early_fini)(struct amdgpu_ip_block *ip_block);
 	int (*hw_init)(struct amdgpu_ip_block *ip_block);
-	int (*hw_fini)(void *handle);
+	int (*hw_fini)(struct amdgpu_ip_block *ip_block);
 	void (*late_fini)(struct amdgpu_ip_block *ip_block);
 	int (*prepare_suspend)(struct amdgpu_ip_block *ip_block);
 	int (*suspend)(struct amdgpu_ip_block *ip_block);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 59803eaed0c2..2cd6cb991f29 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3052,9 +3052,9 @@ static int kv_dpm_hw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int kv_dpm_hw_fini(void *handle)
+static int kv_dpm_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->pm.dpm_enabled)
 		kv_dpm_disable(adev);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index a3915ef274f9..a4908f0402f1 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7795,9 +7795,9 @@ static int si_dpm_hw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int si_dpm_hw_fini(void *handle)
+static int si_dpm_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->pm.dpm_enabled)
 		si_dpm_disable(adev);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 77aba184a8d2..f193c77cc141 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -173,10 +173,9 @@ static int pp_hw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int pp_hw_fini(void *handle)
+static int pp_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = handle;
-	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
+	struct pp_hwmgr *hwmgr = ip_block->adev->powerplay.pp_handle;
 
 	cancel_delayed_work_sync(&hwmgr->swctf_delayed_work);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 466b47a2f1bf..03de35995850 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2009,9 +2009,9 @@ static int smu_reset_mp1_state(struct smu_context *smu)
 	return ret;
 }
 
-static int smu_hw_fini(void *handle)
+static int smu_hw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct smu_context *smu = adev->powerplay.pp_handle;
 	int ret;
 
@@ -2055,7 +2055,7 @@ static int smu_reset(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	int ret;
 
-	ret = smu_hw_fini(adev);
+	ret = smu_hw_fini(&adev->ip_blocks[AMD_IP_BLOCK_TYPE_SMC]);
 	if (ret)
 		return ret;
 
-- 
2.34.1


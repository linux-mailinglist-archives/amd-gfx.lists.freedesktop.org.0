Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EADA3C724
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Feb 2025 19:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5041C10E876;
	Wed, 19 Feb 2025 18:15:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE56B10E877
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2025 18:15:25 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 51JIFJGH208410; Wed, 19 Feb 2025 23:45:19 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 51JIFJqp208403;
 Wed, 19 Feb 2025 23:45:19 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu: update the handle ptr in is_idle
Date: Wed, 19 Feb 2025 23:45:17 +0530
Message-Id: <20250219181517.208384-1-sunil.khatri@amd.com>
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

Update the *handle to amdgpu_ip_block ptr for all
functions pointers of is_idle.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 2 +-
 drivers/gpu/drm/amd/amdgpu/cik.c                  | 2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               | 4 ++--
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                | 4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             | 2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c           | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             | 2 +-
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              | 2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              | 2 +-
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          | 6 +++---
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c          | 6 +++---
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/nv.c                   | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/si.c                   | 2 +-
 drivers/gpu/drm/amd/amdgpu/si_dma.c               | 6 +++---
 drivers/gpu/drm/amd/amdgpu/si_ih.c                | 6 +++---
 drivers/gpu/drm/amd/amdgpu/soc15.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/vi.c                   | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 drivers/gpu/drm/amd/include/amd_shared.h          | 2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        | 2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 2 +-
 78 files changed, 148 insertions(+), 148 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index deb0785350e8..4926996f94da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -579,7 +579,7 @@ static int acp_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool acp_is_idle(void *handle)
+static bool acp_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 732744488b03..43fc941dfa57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -124,7 +124,7 @@ static int isp_early_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool isp_is_idle(void *handle)
+static bool isp_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 03308261f894..fc6d02d0f047 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -627,7 +627,7 @@ static int amdgpu_vkms_resume(struct amdgpu_ip_block *ip_block)
 	return drm_mode_config_helper_resume(adev_to_drm(ip_block->adev));
 }
 
-static bool amdgpu_vkms_is_idle(void *handle)
+static bool amdgpu_vkms_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 08d6787893b3..9cd63b4177bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2148,7 +2148,7 @@ static int cik_common_resume(struct amdgpu_ip_block *ip_block)
 	return cik_common_hw_init(ip_block);
 }
 
-static bool cik_common_is_idle(void *handle)
+static bool cik_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 444563486769..41f4705bdbbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -345,9 +345,9 @@ static int cik_ih_resume(struct amdgpu_ip_block *ip_block)
 	return cik_ih_hw_init(ip_block);
 }
 
-static bool cik_ih_is_idle(void *handle)
+static bool cik_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
 	if (tmp & SRBM_STATUS__IH_BUSY_MASK)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index d9bd8f3f17e2..508cea965983 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1025,9 +1025,9 @@ static int cik_sdma_resume(struct amdgpu_ip_block *ip_block)
 	return cik_sdma_hw_init(ip_block);
 }
 
-static bool cik_sdma_is_idle(void *handle)
+static bool cik_sdma_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS2);
 
 	if (tmp & (SRBM_STATUS2__SDMA_BUSY_MASK |
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index 82586b76aeda..2f891fb846d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -341,9 +341,9 @@ static int cz_ih_resume(struct amdgpu_ip_block *ip_block)
 	return cz_ih_hw_init(ip_block);
 }
 
-static bool cz_ih_is_idle(void *handle)
+static bool cz_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
 	if (REG_GET_FIELD(tmp, SRBM_STATUS, IH_BUSY))
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index c5e3d2251b18..df401aded662 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2970,7 +2970,7 @@ static int dce_v10_0_resume(struct amdgpu_ip_block *ip_block)
 	return amdgpu_display_resume_helper(adev);
 }
 
-static bool dce_v10_0_is_idle(void *handle)
+static bool dce_v10_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index ea42a4472bf6..80f01c3989cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3108,7 +3108,7 @@ static int dce_v11_0_resume(struct amdgpu_ip_block *ip_block)
 	return amdgpu_display_resume_helper(adev);
 }
 
-static bool dce_v11_0_is_idle(void *handle)
+static bool dce_v11_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 915804a6a1d7..5c3f96630c10 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2865,7 +2865,7 @@ static int dce_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	return amdgpu_display_resume_helper(adev);
 }
 
-static bool dce_v6_0_is_idle(void *handle)
+static bool dce_v6_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index f2edc0fece5b..d7bd32bfccd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2887,7 +2887,7 @@ static int dce_v8_0_resume(struct amdgpu_ip_block *ip_block)
 	return amdgpu_display_resume_helper(adev);
 }
 
-static bool dce_v8_0_is_idle(void *handle)
+static bool dce_v8_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index f54617c6c071..6d514efb0a6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7583,9 +7583,9 @@ static int gfx_v10_0_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v10_0_hw_init(ip_block);
 }
 
-static bool gfx_v10_0_is_idle(void *handle)
+static bool gfx_v10_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (REG_GET_FIELD(RREG32_SOC15(GC, 0, mmGRBM_STATUS),
 				GRBM_STATUS, GUI_ACTIVE))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 2087d53b4990..2c7f0bb242ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -4818,9 +4818,9 @@ static int gfx_v11_0_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v11_0_hw_init(ip_block);
 }
 
-static bool gfx_v11_0_is_idle(void *handle)
+static bool gfx_v11_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (REG_GET_FIELD(RREG32_SOC15(GC, 0, regGRBM_STATUS),
 				GRBM_STATUS, GUI_ACTIVE))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 9ab6a850cefd..667c8013b773 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -3742,9 +3742,9 @@ static int gfx_v12_0_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v12_0_hw_init(ip_block);
 }
 
-static bool gfx_v12_0_is_idle(void *handle)
+static bool gfx_v12_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (REG_GET_FIELD(RREG32_SOC15(GC, 0, regGRBM_STATUS),
 				GRBM_STATUS, GUI_ACTIVE))
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index f26e2cdec07a..2f5cf87ede88 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3167,9 +3167,9 @@ static int gfx_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v6_0_hw_init(ip_block);
 }
 
-static bool gfx_v6_0_is_idle(void *handle)
+static bool gfx_v6_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (RREG32(mmGRBM_STATUS) & GRBM_STATUS__GUI_ACTIVE_MASK)
 		return false;
@@ -3183,7 +3183,7 @@ static int gfx_v6_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (gfx_v6_0_is_idle(adev))
+		if (gfx_v6_0_is_idle(ip_block))
 			return 0;
 		udelay(1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 84745b2453ab..8181bd0e4f18 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4515,9 +4515,9 @@ static int gfx_v7_0_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v7_0_hw_init(ip_block);
 }
 
-static bool gfx_v7_0_is_idle(void *handle)
+static bool gfx_v7_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (RREG32(mmGRBM_STATUS) & GRBM_STATUS__GUI_ACTIVE_MASK)
 		return false;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 6add76ef75e8..d116a2e2f469 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4851,9 +4851,9 @@ static int gfx_v8_0_kcq_disable(struct amdgpu_device *adev)
 	return r;
 }
 
-static bool gfx_v8_0_is_idle(void *handle)
+static bool gfx_v8_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (REG_GET_FIELD(RREG32(mmGRBM_STATUS), GRBM_STATUS, GUI_ACTIVE)
 		|| RREG32(mmGRBM_STATUS2) != 0x8)
@@ -4892,7 +4892,7 @@ static int gfx_v8_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (gfx_v8_0_is_idle(adev))
+		if (gfx_v8_0_is_idle(ip_block))
 			return 0;
 
 		udelay(1);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index e144bce938d5..f7938d318f26 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -4110,9 +4110,9 @@ static int gfx_v9_0_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v9_0_hw_init(ip_block);
 }
 
-static bool gfx_v9_0_is_idle(void *handle)
+static bool gfx_v9_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (REG_GET_FIELD(RREG32_SOC15(GC, 0, mmGRBM_STATUS),
 				GRBM_STATUS, GUI_ACTIVE))
@@ -4127,7 +4127,7 @@ static int gfx_v9_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (gfx_v9_0_is_idle(adev))
+		if (gfx_v9_0_is_idle(ip_block))
 			return 0;
 		udelay(1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index c88564de50cd..91c1b2f9fe88 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -2408,9 +2408,9 @@ static int gfx_v9_4_3_resume(struct amdgpu_ip_block *ip_block)
 	return gfx_v9_4_3_hw_init(ip_block);
 }
 
-static bool gfx_v9_4_3_is_idle(void *handle)
+static bool gfx_v9_4_3_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, num_xcc;
 
 	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
@@ -2428,7 +2428,7 @@ static int gfx_v9_4_3_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (gfx_v9_4_3_is_idle(adev))
+		if (gfx_v9_4_3_is_idle(ip_block))
 			return 0;
 		udelay(1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index edf6cf42f141..95d894a231fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -1076,7 +1076,7 @@ static int gmc_v10_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v10_0_is_idle(void *handle)
+static bool gmc_v10_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* MC is always ready in GMC v10.*/
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index f86d0650a05e..ad099f136f84 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -987,7 +987,7 @@ static int gmc_v11_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v11_0_is_idle(void *handle)
+static bool gmc_v11_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* MC is always ready in GMC v11.*/
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index c6d45d0fb9d1..ea7c32d8380b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -984,7 +984,7 @@ static int gmc_v12_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v12_0_is_idle(void *handle)
+static bool gmc_v12_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* MC is always ready in GMC v11.*/
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 2245dda92021..a992e79d9581 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -957,9 +957,9 @@ static int gmc_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v6_0_is_idle(void *handle)
+static bool gmc_v6_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
@@ -976,7 +976,7 @@ static int gmc_v6_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (gmc_v6_0_is_idle(adev))
+		if (gmc_v6_0_is_idle(ip_block))
 			return 0;
 		udelay(1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 9aac4b1101e3..83e39f16044a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1142,9 +1142,9 @@ static int gmc_v7_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v7_0_is_idle(void *handle)
+static bool gmc_v7_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
 	if (tmp & (SRBM_STATUS__MCB_BUSY_MASK | SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK |
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 744081652d42..99ca08e9bdb5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1263,9 +1263,9 @@ static int gmc_v8_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v8_0_is_idle(void *handle)
+static bool gmc_v8_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
 	if (tmp & (SRBM_STATUS__MCB_BUSY_MASK | SRBM_STATUS__MCB_NON_DISPLAY_BUSY_MASK |
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index a80f3e2bcba8..ccb31e724b55 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2543,7 +2543,7 @@ static int gmc_v9_0_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool gmc_v9_0_is_idle(void *handle)
+static bool gmc_v9_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* MC is always ready in GMC v9.*/
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index 8ac3d3282268..1317ede131b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -335,9 +335,9 @@ static int iceland_ih_resume(struct amdgpu_ip_block *ip_block)
 	return iceland_ih_hw_init(ip_block);
 }
 
-static bool iceland_ih_is_idle(void *handle)
+static bool iceland_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
 	if (REG_GET_FIELD(tmp, SRBM_STATUS, IH_BUSY))
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 7198ddfaa8f4..eb4185dcbd1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -652,7 +652,7 @@ static int ih_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	return ih_v6_0_hw_init(ip_block);
 }
 
-static bool ih_v6_0_is_idle(void *handle)
+static bool ih_v6_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 342b166c136d..068ed849dbad 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -631,7 +631,7 @@ static int ih_v6_1_resume(struct amdgpu_ip_block *ip_block)
 	return ih_v6_1_hw_init(ip_block);
 }
 
-static bool ih_v6_1_is_idle(void *handle)
+static bool ih_v6_1_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 71c1c77035e0..40a3530e0453 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -621,7 +621,7 @@ static int ih_v7_0_resume(struct amdgpu_ip_block *ip_block)
 	return ih_v7_0_hw_init(ip_block);
 }
 
-static bool ih_v7_0_is_idle(void *handle)
+static bool ih_v7_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 75843a0e3bfb..4cde8a8bcc83 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -680,9 +680,9 @@ void jpeg_v2_0_dec_ring_nop(struct amdgpu_ring *ring, uint32_t count)
 	}
 }
 
-static bool jpeg_v2_0_is_idle(void *handle)
+static bool jpeg_v2_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return ((RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS) &
 		UVD_JRBC_STATUS__RB_JOB_DONE_MASK) ==
@@ -707,7 +707,7 @@ static int jpeg_v2_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 	bool enable = (state == AMD_CG_STATE_GATE);
 
 	if (enable) {
-		if (!jpeg_v2_0_is_idle(adev))
+		if (!jpeg_v2_0_is_idle(ip_block))
 			return -EBUSY;
 		jpeg_v2_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 0a2c1dee2430..8b39e114f3be 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -515,9 +515,9 @@ static void jpeg_v2_6_dec_ring_insert_end(struct amdgpu_ring *ring)
 	amdgpu_ring_write(ring, (1 << (ring->me * 2 + 14)));
 }
 
-static bool jpeg_v2_5_is_idle(void *handle)
+static bool jpeg_v2_5_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
@@ -563,7 +563,7 @@ static int jpeg_v2_5_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 			continue;
 
 		if (enable) {
-			if (!jpeg_v2_5_is_idle(adev))
+			if (!jpeg_v2_5_is_idle(ip_block))
 				return -EBUSY;
 			jpeg_v2_5_enable_clock_gating(adev, i);
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 9faa9c6809df..2f8510c2986b 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -470,9 +470,9 @@ static void jpeg_v3_0_dec_ring_set_wptr(struct amdgpu_ring *ring)
 	}
 }
 
-static bool jpeg_v3_0_is_idle(void *handle)
+static bool jpeg_v3_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 1;
 
 	ret &= (((RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS) &
@@ -498,7 +498,7 @@ static int jpeg_v3_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 	bool enable = state == AMD_CG_STATE_GATE;
 
 	if (enable) {
-		if (!jpeg_v3_0_is_idle(adev))
+		if (!jpeg_v3_0_is_idle(ip_block))
 			return -EBUSY;
 		jpeg_v3_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 292d4a234ea6..f17ec5414fd6 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -630,9 +630,9 @@ static void jpeg_v4_0_dec_ring_set_wptr(struct amdgpu_ring *ring)
 	}
 }
 
-static bool jpeg_v4_0_is_idle(void *handle)
+static bool jpeg_v4_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 1;
 
 	ret &= (((RREG32_SOC15(JPEG, 0, regUVD_JRBC_STATUS) &
@@ -658,7 +658,7 @@ static int jpeg_v4_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 	bool enable = state == AMD_CG_STATE_GATE;
 
 	if (enable) {
-		if (!jpeg_v4_0_is_idle(adev))
+		if (!jpeg_v4_0_is_idle(ip_block))
 			return -EBUSY;
 		jpeg_v4_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 0588bb80f41e..1a365bfc78bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -960,9 +960,9 @@ void jpeg_v4_0_3_dec_ring_nop(struct amdgpu_ring *ring, uint32_t count)
 	}
 }
 
-static bool jpeg_v4_0_3_is_idle(void *handle)
+static bool jpeg_v4_0_3_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool ret = false;
 	int i, j;
 
@@ -1004,7 +1004,7 @@ static int jpeg_v4_0_3_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
 		if (enable) {
-			if (!jpeg_v4_0_3_is_idle(adev))
+			if (!jpeg_v4_0_3_is_idle(ip_block))
 				return -EBUSY;
 			jpeg_v4_0_3_enable_clock_gating(adev, i);
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index cbba1d9e8367..974030a5c03c 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -648,9 +648,9 @@ static void jpeg_v4_0_5_dec_ring_set_wptr(struct amdgpu_ring *ring)
 	}
 }
 
-static bool jpeg_v4_0_5_is_idle(void *handle)
+static bool jpeg_v4_0_5_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
@@ -693,7 +693,7 @@ static int jpeg_v4_0_5_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 			continue;
 
 		if (enable) {
-			if (!jpeg_v4_0_5_is_idle(adev))
+			if (!jpeg_v4_0_5_is_idle(ip_block))
 				return -EBUSY;
 
 			jpeg_v4_0_5_enable_clock_gating(adev, i);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index 4a55e0cf39e4..31d213ccbe0a 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -559,9 +559,9 @@ static void jpeg_v5_0_0_dec_ring_set_wptr(struct amdgpu_ring *ring)
 	}
 }
 
-static bool jpeg_v5_0_0_is_idle(void *handle)
+static bool jpeg_v5_0_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int ret = 1;
 
 	ret &= (((RREG32_SOC15(JPEG, 0, regUVD_JRBC_STATUS) &
@@ -587,7 +587,7 @@ static int jpeg_v5_0_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 	bool enable = (state == AMD_CG_STATE_GATE) ? true : false;
 
 	if (enable) {
-		if (!jpeg_v5_0_0_is_idle(adev))
+		if (!jpeg_v5_0_0_is_idle(ip_block))
 			return -EBUSY;
 		jpeg_v5_0_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
index 6e3f522e9133..5d4e2a09acca 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
@@ -516,9 +516,9 @@ static void jpeg_v5_0_1_dec_ring_set_wptr(struct amdgpu_ring *ring)
 	}
 }
 
-static bool jpeg_v5_0_1_is_idle(void *handle)
+static bool jpeg_v5_0_1_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	bool ret = false;
 	int i, j;
 
@@ -567,7 +567,7 @@ static int jpeg_v5_0_1_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 		return 0;
 
 	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (!jpeg_v5_0_1_is_idle(adev))
+		if (!jpeg_v5_0_1_is_idle(ip_block))
 			return -EBUSY;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 1c727ccd03b1..4cd325149b63 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -625,7 +625,7 @@ static int navi10_ih_resume(struct amdgpu_ip_block *ip_block)
 	return navi10_ih_hw_init(ip_block);
 }
 
-static bool navi10_ih_is_idle(void *handle)
+static bool navi10_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 5d4a4e7fd97f..8068f384f56c 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1035,7 +1035,7 @@ static int nv_common_resume(struct amdgpu_ip_block *ip_block)
 	return nv_common_hw_init(ip_block);
 }
 
-static bool nv_common_is_idle(void *handle)
+static bool nv_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 135c5099bfb8..92ce580647cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -911,9 +911,9 @@ static int sdma_v2_4_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v2_4_hw_init(ip_block);
 }
 
-static bool sdma_v2_4_is_idle(void *handle)
+static bool sdma_v2_4_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS2);
 
 	if (tmp & (SRBM_STATUS2__SDMA_BUSY_MASK |
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 6e75a4a85f74..1c076bd1cf73 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1200,9 +1200,9 @@ static int sdma_v3_0_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v3_0_hw_init(ip_block);
 }
 
-static bool sdma_v3_0_is_idle(void *handle)
+static bool sdma_v3_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS2);
 
 	if (tmp & (SRBM_STATUS2__SDMA_BUSY_MASK |
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index d31ee01383df..33ed2b158fcd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2015,9 +2015,9 @@ static int sdma_v4_0_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v4_0_hw_init(ip_block);
 }
 
-static bool sdma_v4_0_is_idle(void *handle)
+static bool sdma_v4_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 23a6bb16a0b1..9925b183c07f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1561,9 +1561,9 @@ static int sdma_v4_4_2_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v4_4_2_hw_init(ip_block);
 }
 
-static bool sdma_v4_4_2_is_idle(void *handle)
+static bool sdma_v4_4_2_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 377efb2b8d0e..0dce59f4f6e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1530,9 +1530,9 @@ static int sdma_v5_0_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v5_0_hw_init(ip_block);
 }
 
-static bool sdma_v5_0_is_idle(void *handle)
+static bool sdma_v5_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index ce05d895f977..2b39a03ff0c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1435,9 +1435,9 @@ static int sdma_v5_2_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v5_2_hw_init(ip_block);
 }
 
-static bool sdma_v5_2_is_idle(void *handle)
+static bool sdma_v5_2_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 60a1dff73cbe..9bc3c7a35d18 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1436,9 +1436,9 @@ static int sdma_v6_0_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v6_0_hw_init(ip_block);
 }
 
-static bool sdma_v6_0_is_idle(void *handle)
+static bool sdma_v6_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index b71dba041a48..101e09a3068d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1438,9 +1438,9 @@ static int sdma_v7_0_resume(struct amdgpu_ip_block *ip_block)
 	return sdma_v7_0_hw_init(ip_block);
 }
 
-static bool sdma_v7_0_is_idle(void *handle)
+static bool sdma_v7_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 77ef7da2e4fe..026e8376e2c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2644,7 +2644,7 @@ static int si_common_resume(struct amdgpu_ip_block *ip_block)
 	return si_common_hw_init(ip_block);
 }
 
-static bool si_common_is_idle(void *handle)
+static bool si_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index dbd78d5345a4..e2089c8da71b 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -541,9 +541,9 @@ static int si_dma_resume(struct amdgpu_ip_block *ip_block)
 	return si_dma_hw_init(ip_block);
 }
 
-static bool si_dma_is_idle(void *handle)
+static bool si_dma_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	u32 tmp = RREG32(SRBM_STATUS2);
 
@@ -559,7 +559,7 @@ static int si_dma_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (si_dma_is_idle(adev))
+		if (si_dma_is_idle(ip_block))
 			return 0;
 		udelay(1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index a32b6243c1f8..5c38e1fb1dca 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -210,9 +210,9 @@ static int si_ih_resume(struct amdgpu_ip_block *ip_block)
 	return si_ih_hw_init(ip_block);
 }
 
-static bool si_ih_is_idle(void *handle)
+static bool si_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(SRBM_STATUS);
 
 	if (tmp & SRBM_STATUS__IH_BUSY_MASK)
@@ -227,7 +227,7 @@ static int si_ih_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (si_ih_is_idle(adev))
+		if (si_ih_is_idle(ip_block))
 			return 0;
 		udelay(1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 2c6d2099e215..8732f766947e 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1360,7 +1360,7 @@ static int soc15_common_resume(struct amdgpu_ip_block *ip_block)
 	return soc15_common_hw_init(ip_block);
 }
 
-static bool soc15_common_is_idle(void *handle)
+static bool soc15_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 7925cbb61d0d..dd5d04c068f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -952,7 +952,7 @@ static int soc21_common_resume(struct amdgpu_ip_block *ip_block)
 	return soc21_common_hw_init(ip_block);
 }
 
-static bool soc21_common_is_idle(void *handle)
+static bool soc21_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index 4e506c91e978..972b449ab89f 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -531,7 +531,7 @@ static int soc24_common_resume(struct amdgpu_ip_block *ip_block)
 	return soc24_common_hw_init(ip_block);
 }
 
-static bool soc24_common_is_idle(void *handle)
+static bool soc24_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 0968e551f7b5..7d17ae56f901 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -353,9 +353,9 @@ static int tonga_ih_resume(struct amdgpu_ip_block *ip_block)
 	return tonga_ih_hw_init(ip_block);
 }
 
-static bool tonga_ih_is_idle(void *handle)
+static bool tonga_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 tmp = RREG32(mmSRBM_STATUS);
 
 	if (REG_GET_FIELD(tmp, SRBM_STATUS, IH_BUSY))
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 5830e799c0a3..6954848d34d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -758,9 +758,9 @@ static int uvd_v3_1_resume(struct amdgpu_ip_block *ip_block)
 	return uvd_v3_1_hw_init(ip_block);
 }
 
-static bool uvd_v3_1_is_idle(void *handle)
+static bool uvd_v3_1_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return !(RREG32(mmSRBM_STATUS) & SRBM_STATUS__UVD_BUSY_MASK);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index f93079e09215..db6644e3907c 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -658,9 +658,9 @@ static void uvd_v4_2_set_dcm(struct amdgpu_device *adev,
 	WREG32_UVD_CTX(ixUVD_CGC_CTRL2, tmp2);
 }
 
-static bool uvd_v4_2_is_idle(void *handle)
+static bool uvd_v4_2_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return !(RREG32(mmSRBM_STATUS) & SRBM_STATUS__UVD_BUSY_MASK);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index 2295c8713d61..71409ad8b7ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -580,9 +580,9 @@ static void uvd_v5_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 	}
 }
 
-static bool uvd_v5_0_is_idle(void *handle)
+static bool uvd_v5_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return !(RREG32(mmSRBM_STATUS) & SRBM_STATUS__UVD_BUSY_MASK);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 070a0624c2c5..1c07b701d0e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -1143,9 +1143,9 @@ static void uvd_v6_0_enc_ring_emit_vm_flush(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, vmid);
 }
 
-static bool uvd_v6_0_is_idle(void *handle)
+static bool uvd_v6_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return !(RREG32(mmSRBM_STATUS) & SRBM_STATUS__UVD_BUSY_MASK);
 }
@@ -1156,7 +1156,7 @@ static int uvd_v6_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (uvd_v6_0_is_idle(adev))
+		if (uvd_v6_0_is_idle(ip_block))
 			return 0;
 	}
 	return -ETIMEDOUT;
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index c633b7ff2943..a68fef65219d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -201,9 +201,9 @@ static void vce_v2_0_mc_resume(struct amdgpu_device *adev)
 	WREG32_FIELD(VCE_SYS_INT_EN, VCE_SYS_INT_TRAP_INTERRUPT_EN, 1);
 }
 
-static bool vce_v2_0_is_idle(void *handle)
+static bool vce_v2_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return !(RREG32(mmSRBM_STATUS2) & SRBM_STATUS2__VCE_BUSY_MASK);
 }
@@ -214,7 +214,7 @@ static int vce_v2_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	unsigned i;
 
 	for (i = 0; i < adev->usec_timeout; i++) {
-		if (vce_v2_0_is_idle(adev))
+		if (vce_v2_0_is_idle(ip_block))
 			return 0;
 	}
 	return -ETIMEDOUT;
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 01248a3982ba..708123899c41 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -597,9 +597,9 @@ static void vce_v3_0_mc_resume(struct amdgpu_device *adev, int idx)
 	WREG32_FIELD(VCE_SYS_INT_EN, VCE_SYS_INT_TRAP_INTERRUPT_EN, 1);
 }
 
-static bool vce_v3_0_is_idle(void *handle)
+static bool vce_v3_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	u32 mask = 0;
 
 	mask |= (adev->vce.harvest_config & AMDGPU_VCE_HARVEST_VCE0) ? 0 : SRBM_STATUS2__VCE0_BUSY_MASK;
@@ -614,7 +614,7 @@ static int vce_v3_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->usec_timeout; i++)
-		if (vce_v3_0_is_idle(adev))
+		if (vce_v3_0_is_idle(ip_block))
 			return 0;
 
 	return -ETIMEDOUT;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 5ea96c983517..06e1bbcf1a52 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1377,9 +1377,9 @@ static int vcn_v1_0_pause_dpg_mode(struct amdgpu_device *adev,
 	return 0;
 }
 
-static bool vcn_v1_0_is_idle(void *handle)
+static bool vcn_v1_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return (RREG32_SOC15(VCN, 0, mmUVD_STATUS) == UVD_STATUS__IDLE);
 }
@@ -1403,7 +1403,7 @@ static int vcn_v1_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 
 	if (enable) {
 		/* wait for STATUS to clear */
-		if (!vcn_v1_0_is_idle(adev))
+		if (!vcn_v1_0_is_idle(ip_block))
 			return -EBUSY;
 		vcn_v1_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index e42cfc731ad8..1e1c8f57d4cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -1317,9 +1317,9 @@ static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
 	return 0;
 }
 
-static bool vcn_v2_0_is_idle(void *handle)
+static bool vcn_v2_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	return (RREG32_SOC15(VCN, 0, mmUVD_STATUS) == UVD_STATUS__IDLE);
 }
@@ -1346,7 +1346,7 @@ static int vcn_v2_0_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 
 	if (enable) {
 		/* wait for STATUS to clear */
-		if (!vcn_v2_0_is_idle(adev))
+		if (!vcn_v2_0_is_idle(ip_block))
 			return -EBUSY;
 		vcn_v2_0_enable_clock_gating(adev);
 	} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 105e59f6132b..a6726afcf89c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1750,9 +1750,9 @@ static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev)
 	}
 }
 
-static bool vcn_v2_5_is_idle(void *handle)
+static bool vcn_v2_5_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
@@ -1794,7 +1794,7 @@ static int vcn_v2_5_set_clockgating_state(struct amdgpu_ip_block *ip_block,
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
 		if (enable) {
-			if (!vcn_v2_5_is_idle(adev))
+			if (!vcn_v2_5_is_idle(ip_block))
 				return -EBUSY;
 			vcn_v2_5_enable_clock_gating(adev, i);
 		} else {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 63ddd4cca910..f75f996d929e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -2103,9 +2103,9 @@ static void vcn_v3_0_set_enc_ring_funcs(struct amdgpu_device *adev)
 	}
 }
 
-static bool vcn_v3_0_is_idle(void *handle)
+static bool vcn_v3_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 00551d6f0370..fe539f7957f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1968,9 +1968,9 @@ static void vcn_v4_0_set_unified_ring_funcs(struct amdgpu_device *adev)
  *
  * Check whether VCN block is idle
  */
-static bool vcn_v4_0_is_idle(void *handle)
+static bool vcn_v4_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 75211366f8f6..dda5ee187948 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -1579,9 +1579,9 @@ static void vcn_v4_0_3_set_unified_ring_funcs(struct amdgpu_device *adev)
  *
  * Check whether VCN block is idle
  */
-static bool vcn_v4_0_3_is_idle(void *handle)
+static bool vcn_v4_0_3_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 5d757e7de9db..a482658cbf86 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -1456,9 +1456,9 @@ static void vcn_v4_0_5_set_unified_ring_funcs(struct amdgpu_device *adev)
  *
  * Check whether VCN block is idle
  */
-static bool vcn_v4_0_5_is_idle(void *handle)
+static bool vcn_v4_0_5_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index b6d78381ebfb..e937ed682abd 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -1196,9 +1196,9 @@ static void vcn_v5_0_0_set_unified_ring_funcs(struct amdgpu_device *adev)
  *
  * Check whether VCN block is idle
  */
-static bool vcn_v5_0_0_is_idle(void *handle)
+static bool vcn_v5_0_0_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index 288a77179036..721c29f52451 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -931,9 +931,9 @@ static void vcn_v5_0_1_set_unified_ring_funcs(struct amdgpu_device *adev)
  *
  * Check whether VCN block is idle
  */
-static bool vcn_v5_0_1_is_idle(void *handle)
+static bool vcn_v5_0_1_is_idle(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, ret = 1;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 98fc6941159e..eb16916c6473 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -555,7 +555,7 @@ static int vega10_ih_resume(struct amdgpu_ip_block *ip_block)
 	return vega10_ih_hw_init(ip_block);
 }
 
-static bool vega10_ih_is_idle(void *handle)
+static bool vega10_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index e9e3b2ed4b7b..faa0dd75dd6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -651,7 +651,7 @@ static int vega20_ih_resume(struct amdgpu_ip_block *ip_block)
 	return vega20_ih_hw_init(ip_block);
 }
 
-static bool vega20_ih_is_idle(void *handle)
+static bool vega20_ih_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 12fe571787f4..3bbbb75242d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -1736,7 +1736,7 @@ static int vi_common_resume(struct amdgpu_ip_block *ip_block)
 	return vi_common_hw_init(ip_block);
 }
 
-static bool vi_common_is_idle(void *handle)
+static bool vi_common_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4ae54b3573ba..0d21448ea700 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -320,7 +320,7 @@ static int dm_crtc_get_scanoutpos(struct amdgpu_device *adev, int crtc,
 	return 0;
 }
 
-static bool dm_is_idle(void *handle)
+static bool dm_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* XXX todo */
 	return true;
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 3e86865563dc..c0538763ec1a 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -405,7 +405,7 @@ struct amd_ip_funcs {
 	int (*prepare_suspend)(struct amdgpu_ip_block *ip_block);
 	int (*suspend)(struct amdgpu_ip_block *ip_block);
 	int (*resume)(struct amdgpu_ip_block *ip_block);
-	bool (*is_idle)(void *handle);
+	bool (*is_idle)(struct amdgpu_ip_block *ip_block);
 	int (*wait_for_idle)(struct amdgpu_ip_block *ip_block);
 	bool (*check_soft_reset)(struct amdgpu_ip_block *ip_block);
 	int (*pre_soft_reset)(struct amdgpu_ip_block *ip_block);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 67a8e22b1126..68bee21dd665 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3094,7 +3094,7 @@ static int kv_dpm_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool kv_dpm_is_idle(void *handle)
+static bool kv_dpm_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index a87dcf0974bc..c934fc90f925 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7838,7 +7838,7 @@ static int si_dpm_resume(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static bool si_dpm_is_idle(void *handle)
+static bool si_dpm_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	/* XXX */
 	return true;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 686345f75f26..be22ed30a3c1 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -239,7 +239,7 @@ static void pp_late_fini(struct amdgpu_ip_block *ip_block)
 }
 
 
-static bool pp_is_idle(void *handle)
+static bool pp_is_idle(struct amdgpu_ip_block *ip_block)
 {
 	return false;
 }
-- 
2.34.1


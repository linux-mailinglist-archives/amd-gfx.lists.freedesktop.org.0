Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B289887CB
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2024 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E3E10ECC6;
	Fri, 27 Sep 2024 15:01:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE1F10ECBC
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2024 15:01:06 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 48RF11jo2232741; Fri, 27 Sep 2024 20:31:01 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 48RF11oJ2232740;
 Fri, 27 Sep 2024 20:31:01 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 4/5] drm/amdgpu: update the handle ptr in sw_fini
Date: Fri, 27 Sep 2024 20:30:58 +0530
Message-Id: <20240927150059.2232708-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927150059.2232708-1-sunil.khatri@amd.com>
References: <20240927150059.2232708-1-sunil.khatri@amd.com>
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

update the *handle to amdgpu_ip_block ptr for all
functions pointers of sw_fini.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c      | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/cik.c                  | 2 +-
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               | 4 ++--
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                | 4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              | 4 ++--
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              | 4 ++--
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h            | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            | 4 ++--
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
 drivers/gpu/drm/amd/amdgpu/si_dma.c               | 4 ++--
 drivers/gpu/drm/amd/amdgpu/si_ih.c                | 4 ++--
 drivers/gpu/drm/amd/amdgpu/soc15.c                | 4 ++--
 drivers/gpu/drm/amd/amdgpu/soc21.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c                | 2 +-
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             | 6 +++---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c            | 4 ++--
 drivers/gpu/drm/amd/amdgpu/vi.c                   | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 drivers/gpu/drm/amd/include/amd_shared.h          | 2 +-
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        | 4 ++--
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        | 4 ++--
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         | 4 ++--
 87 files changed, 165 insertions(+), 165 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 1680453e21c9..08f5a8614356 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -112,9 +112,9 @@ static int acp_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int acp_sw_fini(void *handle)
+static int acp_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->acp.cgs_device)
 		amdgpu_cgs_destroy_device(adev->acp.cgs_device);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7c96d7ba8aed..1c69776b98de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3378,7 +3378,7 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 			amdgpu_seq64_fini(adev);
 		}
 
-		r = adev->ip_blocks[i].version->funcs->sw_fini((void *)adev);
+		r = adev->ip_blocks[i].version->funcs->sw_fini(&adev->ip_blocks[i]);
 		/* XXX handle errors */
 		if (r) {
 			DRM_DEBUG("sw_fini of IP block <%s> failed %d\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 02675728823d..f2198ac27967 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -38,7 +38,7 @@ static int isp_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int isp_sw_fini(void *handle)
+static int isp_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index b61abc4ee0af..f3f191dc8728 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -527,9 +527,9 @@ static int psp_sw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int psp_sw_fini(void *handle)
+static int psp_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct psp_context *psp = &adev->psp;
 	struct psp_gfx_cmd_resp *cmd = psp->cmd;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index d53dcee94652..c95c6eabb07b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -815,9 +815,9 @@ static int umsch_mm_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int umsch_mm_sw_fini(void *handle)
+static int umsch_mm_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	release_firmware(adev->umsch_mm.fw);
 	adev->umsch_mm.fw = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index b7857bf25b5c..d2eafca7d320 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -536,9 +536,9 @@ static int amdgpu_vkms_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int amdgpu_vkms_sw_fini(void *handle)
+static int amdgpu_vkms_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i = 0;
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 73f2ada42826..1b4c60231596 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -381,9 +381,9 @@ static int vpe_sw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int vpe_sw_fini(void *handle)
+static int vpe_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_vpe *vpe = &adev->vpe;
 
 	release_firmware(vpe->fw);
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 7753932de1a3..8e8e266b44ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2129,7 +2129,7 @@ static int cik_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cik_common_sw_fini(void *handle)
+static int cik_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index e52d378489d0..2ce7a6075a98 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -311,9 +311,9 @@ static int cik_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int cik_ih_sw_fini(void *handle)
+static int cik_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_irq_remove_domain(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index ce5a52eb6877..6e7e78079630 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -977,9 +977,9 @@ static int cik_sdma_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int cik_sdma_sw_fini(void *handle)
+static int cik_sdma_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index dd3e04e7bea4..71fe21313635 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -302,9 +302,9 @@ static int cz_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int cz_ih_sw_fini(void *handle)
+static int cz_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_irq_remove_domain(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 75d92de74d22..cac0850c6610 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2844,9 +2844,9 @@ static int dce_v10_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v10_0_sw_fini(void *handle)
+static int dce_v10_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 12b0c1499d1e..9929b5bc6095 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -2971,9 +2971,9 @@ static int dce_v11_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v11_0_sw_fini(void *handle)
+static int dce_v11_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 8367f35279d4..7c464fc50dd6 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2743,9 +2743,9 @@ static int dce_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int dce_v6_0_sw_fini(void *handle)
+static int dce_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index aa463daf6834..3fbc275a9c42 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2764,9 +2764,9 @@ static int dce_v8_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int dce_v8_0_sw_fini(void *handle)
+static int dce_v8_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	drm_edid_free(adev->mode_info.bios_hardcoded_edid);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index e7a251044208..123da87a3142 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4866,10 +4866,10 @@ static void gfx_v10_0_me_fini(struct amdgpu_device *adev)
 			      (void **)&adev->gfx.me.me_fw_ptr);
 }
 
-static int gfx_v10_0_sw_fini(void *handle)
+static int gfx_v10_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->gfx.num_gfx_rings; i++)
 		amdgpu_ring_fini(&adev->gfx.gfx_ring[i]);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index c92f47704b0b..a190c0b53c57 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1732,10 +1732,10 @@ static void gfx_v11_0_rlc_autoload_buffer_fini(struct amdgpu_device *adev)
 			(void **)&adev->gfx.rlc.rlc_autoload_ptr);
 }
 
-static int gfx_v11_0_sw_fini(void *handle)
+static int gfx_v11_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->gfx.num_gfx_rings; i++)
 		amdgpu_ring_fini(&adev->gfx.gfx_ring[i]);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 8a1a615c7011..63e1a2803503 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -1492,10 +1492,10 @@ static void gfx_v12_0_rlc_autoload_buffer_fini(struct amdgpu_device *adev)
 			(void **)&adev->gfx.rlc.rlc_autoload_ptr);
 }
 
-static int gfx_v12_0_sw_fini(void *handle)
+static int gfx_v12_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->gfx.num_gfx_rings; i++)
 		amdgpu_ring_fini(&adev->gfx.gfx_ring[i]);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index ecb53c6c488c..1fef47735da4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3107,10 +3107,10 @@ static int gfx_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v6_0_sw_fini(void *handle)
+static int gfx_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	for (i = 0; i < adev->gfx.num_gfx_rings; i++)
 		amdgpu_ring_fini(&adev->gfx.gfx_ring[i]);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 286ee8b5a51e..6fa6114e094d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4439,9 +4439,9 @@ static int gfx_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int gfx_v7_0_sw_fini(void *handle)
+static int gfx_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->gfx.num_gfx_rings; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index ff5124947cbe..a6a38719a333 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -2037,9 +2037,9 @@ static int gfx_v8_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gfx_v8_0_sw_fini(void *handle)
+static int gfx_v8_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->gfx.num_gfx_rings; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index d8dac3145fc6..d7ef05cdb72e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2398,10 +2398,10 @@ static int gfx_v9_0_sw_init(struct amdgpu_ip_block *ip_block)
 }
 
 
-static int gfx_v9_0_sw_fini(void *handle)
+static int gfx_v9_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->gfx.mcbp && adev->gfx.num_gfx_rings) {
 		for (i = 0; i < GFX9_NUM_SW_GFX_RINGS; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index e103d68a0c10..27f331e2cdd9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -1181,10 +1181,10 @@ static int gfx_v9_4_3_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gfx_v9_4_3_sw_fini(void *handle)
+static int gfx_v9_4_3_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i, num_xcc;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
 	for (i = 0; i < adev->gfx.num_compute_rings * num_xcc; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index f10b9eae860e..ff7596b5b306 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -920,9 +920,9 @@ static void gmc_v10_0_gart_fini(struct amdgpu_device *adev)
 	amdgpu_gart_table_vram_free(adev);
 }
 
-static int gmc_v10_0_sw_fini(void *handle)
+static int gmc_v10_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_vm_manager_fini(adev);
 	gmc_v10_0_gart_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 55eed13f717c..3241effb67fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -849,9 +849,9 @@ static void gmc_v11_0_gart_fini(struct amdgpu_device *adev)
 	amdgpu_gart_table_vram_free(adev);
 }
 
-static int gmc_v11_0_sw_fini(void *handle)
+static int gmc_v11_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_vm_manager_fini(adev);
 	gmc_v11_0_gart_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index 6a0bd663909d..745010a24a2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -841,9 +841,9 @@ static void gmc_v12_0_gart_fini(struct amdgpu_device *adev)
 	amdgpu_gart_table_vram_free(adev);
 }
 
-static int gmc_v12_0_sw_fini(void *handle)
+static int gmc_v12_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_vm_manager_fini(adev);
 	gmc_v12_0_gart_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index a3561b20c9e4..e8566a53838a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -876,9 +876,9 @@ static int gmc_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v6_0_sw_fini(void *handle)
+static int gmc_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_gem_force_release(adev);
 	amdgpu_vm_manager_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 2621dc45c799..77e09503e2b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1060,9 +1060,9 @@ static int gmc_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v7_0_sw_fini(void *handle)
+static int gmc_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_gem_force_release(adev);
 	amdgpu_vm_manager_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index b4ab1f23e245..23547561e97f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1173,9 +1173,9 @@ static int gmc_v8_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v8_0_sw_fini(void *handle)
+static int gmc_v8_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_gem_force_release(adev);
 	amdgpu_vm_manager_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index e39fe297daf1..24a269c2e493 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -2198,9 +2198,9 @@ static int gmc_v9_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int gmc_v9_0_sw_fini(void *handle)
+static int gmc_v9_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3) ||
 	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 4))
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index a893b37067e5..6e611aedf519 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -301,9 +301,9 @@ static int iceland_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int iceland_ih_sw_fini(void *handle)
+static int iceland_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_irq_remove_domain(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 0422dbf8b8be..e2bf3b58fe07 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -614,9 +614,9 @@ static int ih_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int ih_v6_0_sw_fini(void *handle)
+static int ih_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 6dddc8c7d623..a401324d8da0 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -593,9 +593,9 @@ static int ih_v6_1_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int ih_v6_1_sw_fini(void *handle)
+static int ih_v6_1_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 727b40822226..646e007ccc2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -583,9 +583,9 @@ static int ih_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int ih_v7_0_sw_fini(void *handle)
+static int ih_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
index 24ac589f200a..33da094f1a7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
@@ -513,9 +513,9 @@ int jpeg_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG free up sw allocation
  */
-void jpeg_v1_0_sw_fini(void *handle)
+void jpeg_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_ring_fini(adev->jpeg.inst->ring_dec);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h
index d978422ddbd7..097328635083 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.h
@@ -26,7 +26,7 @@
 
 int jpeg_v1_0_early_init(struct amdgpu_ip_block *ip_block);
 int jpeg_v1_0_sw_init(struct amdgpu_ip_block *ip_block);
-void jpeg_v1_0_sw_fini(void *handle);
+void jpeg_v1_0_sw_fini(struct amdgpu_ip_block *ip_block);
 void jpeg_v1_0_start(struct amdgpu_device *adev, int mode);
 
 #define JPEG_V1_REG_RANGE_START	0x8000
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 9975f9332ee6..b7aa37b3a717 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -108,10 +108,10 @@ static int jpeg_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v2_0_sw_fini(void *handle)
+static int jpeg_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_jpeg_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 6af7193eabad..a0cddb37a541 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -157,10 +157,10 @@ static int jpeg_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v2_5_sw_fini(void *handle)
+static int jpeg_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_jpeg_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 4d9e432e11d9..45ffea1c759b 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -122,9 +122,9 @@ static int jpeg_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v3_0_sw_fini(void *handle)
+static int jpeg_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = amdgpu_jpeg_suspend(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 555953774ee8..3f91d79c07f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -134,9 +134,9 @@ static int jpeg_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v4_0_sw_fini(void *handle)
+static int jpeg_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = amdgpu_jpeg_suspend(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 3155b54ac84d..74b3700052ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -169,9 +169,9 @@ static int jpeg_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v4_0_3_sw_fini(void *handle)
+static int jpeg_v4_0_3_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = amdgpu_jpeg_suspend(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index 59fa78136122..ad4030ccd917 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -163,9 +163,9 @@ static int jpeg_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v4_0_5_sw_fini(void *handle)
+static int jpeg_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = amdgpu_jpeg_suspend(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index ce4cf8f32ea2..85fb1a5265a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -110,9 +110,9 @@ static int jpeg_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * JPEG suspend and free up sw allocation
  */
-static int jpeg_v5_0_0_sw_fini(void *handle)
+static int jpeg_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int r;
 
 	r = amdgpu_jpeg_suspend(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 81d9443b443c..e62a41dffd98 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1402,9 +1402,9 @@ static int mes_v11_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int mes_v11_0_sw_fini(void *handle)
+static int mes_v11_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int pipe;
 
 	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
index da7cfa1c5da2..471adfbb9a10 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -1362,9 +1362,9 @@ static int mes_v12_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int mes_v12_0_sw_fini(void *handle)
+static int mes_v12_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int pipe;
 
 	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index f9452e65730e..93bf5e58cb49 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -593,9 +593,9 @@ static int navi10_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int navi10_ih_sw_fini(void *handle)
+static int navi10_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 99e462d06401..8966a8b7c4ee 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -983,7 +983,7 @@ static int nv_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int nv_common_sw_fini(void *handle)
+static int nv_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 01d8d1ec83e7..12add2483250 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -866,9 +866,9 @@ static int sdma_v2_4_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v2_4_sw_fini(void *handle)
+static int sdma_v2_4_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index ffffe9faa5c8..1b73bbb1ba3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1152,9 +1152,9 @@ static int sdma_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v3_0_sw_fini(void *handle)
+static int sdma_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 8f0d2f1b7cc0..ae5abb9bfcb4 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -1929,9 +1929,9 @@ static int sdma_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v4_0_sw_fini(void *handle)
+static int sdma_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 4f2a7cdda2bb..5d5b8d539085 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -1445,9 +1445,9 @@ static int sdma_v4_4_2_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v4_4_2_sw_fini(void *handle)
+static int sdma_v4_4_2_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 91b477d7af6e..d6161d36a96d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1462,9 +1462,9 @@ static int sdma_v5_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v5_0_sw_fini(void *handle)
+static int sdma_v5_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index ca11f694dcef..57f181851600 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1316,9 +1316,9 @@ static int sdma_v5_2_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v5_2_sw_fini(void *handle)
+static int sdma_v5_2_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index ee09478e21e2..d4eb1cb4594a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1365,9 +1365,9 @@ static int sdma_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v6_0_sw_fini(void *handle)
+static int sdma_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 13b055f6f835..3c017db5800c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1320,9 +1320,9 @@ static int sdma_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int sdma_v7_0_sw_fini(void *handle)
+static int sdma_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 65571a8606ab..b312c4cbcd98 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2153,7 +2153,7 @@ static int si_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int si_common_sw_fini(void *handle)
+static int si_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 2ed3e3538d64..1e9669a7c7dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -506,9 +506,9 @@ static int si_dma_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int si_dma_sw_fini(void *handle)
+static int si_dma_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i;
 
 	for (i = 0; i < adev->sdma.num_instances; i++)
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index c9d1565e1466..c8e664f27df1 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -177,9 +177,9 @@ static int si_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return amdgpu_irq_init(adev);
 }
 
-static int si_ih_sw_fini(void *handle)
+static int si_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 57e40ab5edcd..62b7c1aa1f66 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1231,9 +1231,9 @@ static int soc15_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc15_common_sw_fini(void *handle)
+static int soc15_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	if (adev->df.funcs &&
 	    adev->df.funcs->sw_fini)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 600b375883af..4ed3b821bf79 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -842,7 +842,7 @@ static int soc21_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc21_common_sw_fini(void *handle)
+static int soc21_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index 14370fda5a29..83714f409373 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -465,7 +465,7 @@ static int soc24_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int soc24_common_sw_fini(void *handle)
+static int soc24_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 873a5b20ffe2..bfcf672b527b 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -314,9 +314,9 @@ static int tonga_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int tonga_ih_sw_fini(void *handle)
+static int tonga_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_irq_remove_domain(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 5258a9aa96a0..f5804cdfca45 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -580,10 +580,10 @@ static int uvd_v3_1_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int uvd_v3_1_sw_fini(void *handle)
+static int uvd_v3_1_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_uvd_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 5fb5870efe86..522aec5f8e26 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -130,10 +130,10 @@ static int uvd_v4_2_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int uvd_v4_2_sw_fini(void *handle)
+static int uvd_v4_2_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_uvd_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index c5e740afeb71..407014149eaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -128,10 +128,10 @@ static int uvd_v5_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int uvd_v5_0_sw_fini(void *handle)
+static int uvd_v5_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_uvd_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 350853a29586..68601bb4ce44 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -435,10 +435,10 @@ static int uvd_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int uvd_v6_0_sw_fini(void *handle)
+static int uvd_v6_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i, r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_uvd_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 842e6a77866a..93d37cfdd805 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -487,10 +487,10 @@ static int uvd_v7_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int uvd_v7_0_sw_fini(void *handle)
+static int uvd_v7_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i, j, r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_virt_free_mm_table(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index 50bc883a325c..cb77a9c12693 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -444,10 +444,10 @@ static int vce_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int vce_v2_0_sw_fini(void *handle)
+static int vce_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_vce_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index de3946953fda..3edd33978d67 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -453,10 +453,10 @@ static int vce_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int vce_v3_0_sw_fini(void *handle)
+static int vce_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_vce_suspend(adev);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index 8a85cd2bab2c..8ba0e3af018d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -493,10 +493,10 @@ static int vce_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int vce_v4_0_sw_fini(void *handle)
+static int vce_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	/* free MM table */
 	amdgpu_virt_free_mm_table(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 785371d2017b..6717ff692d8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -217,16 +217,16 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v1_0_sw_fini(void *handle)
+static int vcn_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	r = amdgpu_vcn_suspend(adev);
 	if (r)
 		return r;
 
-	jpeg_v1_0_sw_fini(handle);
+	jpeg_v1_0_sw_fini(ip_block);
 
 	r = amdgpu_vcn_sw_fini(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 6b5a83d6a696..be6998ed56bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -241,10 +241,10 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v2_0_sw_fini(void *handle)
+static int vcn_v2_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int r, idx;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	volatile struct amdgpu_fw_shared *fw_shared = adev->vcn.inst->fw_shared.cpu_addr;
 
 	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index cebc000e6e1f..7ab0314b27ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -299,10 +299,10 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v2_5_sw_fini(void *handle)
+static int vcn_v2_5_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	int i, r, idx;
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	volatile struct amdgpu_fw_shared *fw_shared;
 
 	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 361acbb23556..38452446fcb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -303,9 +303,9 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v3_0_sw_fini(void *handle)
+static int vcn_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, r, idx;
 
 	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 41d86957ee65..078bb30497e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -257,9 +257,9 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v4_0_sw_fini(void *handle)
+static int vcn_v4_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, r, idx;
 
 	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index fa4eaed28a71..be7b0bfba27a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -216,9 +216,9 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v4_0_3_sw_fini(void *handle)
+static int vcn_v4_0_3_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, r, idx;
 
 	if (drm_dev_enter(&adev->ddev, &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index c7ec93e00c18..0e70df04ceb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -224,9 +224,9 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v4_0_5_sw_fini(void *handle)
+static int vcn_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, r, idx;
 
 	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 3807e8ff1426..6b38927024d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -191,9 +191,9 @@ static int vcn_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
  *
  * VCN suspend and free up sw allocation
  */
-static int vcn_v5_0_0_sw_fini(void *handle)
+static int vcn_v5_0_0_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	int i, r, idx;
 
 	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index ef21a0915290..07c229d2c4e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -525,9 +525,9 @@ static int vega10_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int vega10_ih_sw_fini(void *handle)
+static int vega10_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index b9e97820af35..89880d915fe4 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -586,9 +586,9 @@ static int vega20_ih_sw_init(struct amdgpu_ip_block *ip_block)
 	return r;
 }
 
-static int vega20_ih_sw_fini(void *handle)
+static int vega20_ih_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	amdgpu_irq_fini_sw(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 91b17bcba41c..a13f8edfd001 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -1699,7 +1699,7 @@ static int vi_common_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int vi_common_sw_fini(void *handle)
+static int vi_common_sw_fini(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 96416c15bc88..3f44227b7d4b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2524,9 +2524,9 @@ static int dm_sw_init(struct amdgpu_ip_block *ip_block)
 	return load_dmcu_fw(adev);
 }
 
-static int dm_sw_fini(void *handle)
+static int dm_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct dal_allocation *da;
 
 	list_for_each_entry(da, &adev->dm.da_list, list) {
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 2f956a09465d..4a10a804f130 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -382,7 +382,7 @@ struct amd_ip_funcs {
 	int (*early_init)(struct amdgpu_ip_block *ip_block);
 	int (*late_init)(struct amdgpu_ip_block *ip_block);
 	int (*sw_init)(struct amdgpu_ip_block *ip_block);
-	int (*sw_fini)(void *handle);
+	int (*sw_fini)(struct amdgpu_ip_block *ip_block);
 	int (*early_fini)(void *handle);
 	int (*hw_init)(void *handle);
 	int (*hw_fini)(void *handle);
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 6147d319b7ce..69aa62460a8d 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3023,9 +3023,9 @@ static int kv_dpm_sw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int kv_dpm_sw_fini(void *handle)
+static int kv_dpm_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	flush_work(&adev->pm.dpm.thermal.work);
 
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 00efed4b117d..415c65148b46 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7765,9 +7765,9 @@ static int si_dpm_sw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int si_dpm_sw_fini(void *handle)
+static int si_dpm_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 
 	flush_work(&adev->pm.dpm.thermal.work);
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index deec428a5d81..194cf4f922a3 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -147,9 +147,9 @@ static int pp_sw_init(struct amdgpu_ip_block *ip_block)
 	return ret;
 }
 
-static int pp_sw_fini(void *handle)
+static int pp_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct pp_hwmgr *hwmgr = adev->powerplay.pp_handle;
 
 	hwmgr_sw_fini(hwmgr);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index def59fbcbd55..3a92eac86f4b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1314,9 +1314,9 @@ static int smu_sw_init(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int smu_sw_fini(void *handle)
+static int smu_sw_fini(struct amdgpu_ip_block *ip_block)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	struct amdgpu_device *adev = ip_block->adev;
 	struct smu_context *smu = adev->powerplay.pp_handle;
 	int ret;
 
-- 
2.34.1


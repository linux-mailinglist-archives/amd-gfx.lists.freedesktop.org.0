Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477D9A3F7A
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2024 15:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80C10E91C;
	Fri, 18 Oct 2024 13:23:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD40310E915
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2024 13:23:44 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49IDNeVH1638328; Fri, 18 Oct 2024 18:53:40 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49IDNe0L1638327;
 Fri, 18 Oct 2024 18:53:40 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 11/12] drm/amdgpu: Clean the functions pointer set as NULL
Date: Fri, 18 Oct 2024 18:53:26 +0530
Message-Id: <20241018132327.1638247-12-sunil.khatri@amd.com>
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

We dont need to set the functions to NULL which arent
needed as global structure members are by default
set to zero or NULL for pointers.

Cc: Leo Liu <leo.liu@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c           |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  5 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c      |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c           |  2 --
 drivers/gpu/drm/amd/amdgpu/cik.c                  |  3 ---
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               |  3 ---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                |  3 ---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  3 ---
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  3 ---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             |  2 --
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             |  2 --
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             |  2 --
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             |  2 --
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             |  2 --
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |  3 ---
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              |  3 ---
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              |  3 ---
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              |  3 ---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            |  7 -------
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            | 14 --------------
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            |  7 -------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            |  7 -------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          |  7 -------
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          |  7 -------
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          |  7 -------
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c            |  2 --
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |  3 ---
 drivers/gpu/drm/amd/amdgpu/nv.c                   |  2 --
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c            |  3 ---
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c            |  3 ---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/si.c                   |  3 ---
 drivers/gpu/drm/amd/amdgpu/si_dma.c               |  3 ---
 drivers/gpu/drm/amd/amdgpu/si_ih.c                |  3 ---
 drivers/gpu/drm/amd/amdgpu/soc15.c                |  2 --
 drivers/gpu/drm/amd/amdgpu/soc21.c                |  2 --
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             |  3 ---
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             |  1 -
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             |  5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             | 10 ----------
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             |  5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             |  5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           |  5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           |  5 -----
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           |  5 -----
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c            |  1 -
 drivers/gpu/drm/amd/amdgpu/vi.c                   |  2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 --
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        |  2 --
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        |  2 --
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  |  2 --
 68 files changed, 228 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 8b7e056a7355..ec5e0dcf8613 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -603,8 +603,6 @@ static int acp_set_powergating_state(void *handle,
 
 static const struct amd_ip_funcs acp_ip_funcs = {
 	.name = "acp_ip",
-	.early_init = NULL,
-	.late_init = NULL,
 	.sw_init = acp_sw_init,
 	.sw_fini = acp_sw_fini,
 	.hw_init = acp_hw_init,
@@ -614,8 +612,6 @@ static const struct amd_ip_funcs acp_ip_funcs = {
 	.is_idle = acp_is_idle,
 	.set_clockgating_state = acp_set_clockgating_state,
 	.set_powergating_state = acp_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version acp_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 05ea7d9cb7d7..263ce1811cc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -143,7 +143,6 @@ static int isp_set_powergating_state(void *handle,
 static const struct amd_ip_funcs isp_ip_funcs = {
 	.name = "isp_ip",
 	.early_init = isp_early_init,
-	.late_init = NULL,
 	.hw_init = isp_hw_init,
 	.hw_fini = isp_hw_fini,
 	.is_idle = isp_is_idle,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index cad153e333d8..abd5e980c9c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -4095,17 +4095,12 @@ const struct attribute_group amdgpu_flash_attr_group = {
 const struct amd_ip_funcs psp_ip_funcs = {
 	.name = "psp",
 	.early_init = psp_early_init,
-	.late_init = NULL,
 	.sw_init = psp_sw_init,
 	.sw_fini = psp_sw_fini,
 	.hw_init = psp_hw_init,
 	.hw_fini = psp_hw_fini,
 	.suspend = psp_suspend,
 	.resume = psp_resume,
-	.is_idle = NULL,
-	.check_soft_reset = NULL,
-	.wait_for_idle = NULL,
-	.soft_reset = NULL,
 	.set_clockgating_state = psp_set_clockgating_state,
 	.set_powergating_state = psp_set_powergating_state,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index 3ef75f1a47f6..bd2d3863c3ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -993,8 +993,6 @@ static const struct amd_ip_funcs umsch_mm_v4_0_ip_funcs = {
 	.hw_fini = umsch_mm_hw_fini,
 	.suspend = umsch_mm_suspend,
 	.resume = umsch_mm_resume,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version umsch_mm_v4_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index f9fc08952aa4..8bf28d336807 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -646,8 +646,6 @@ static int amdgpu_vkms_set_powergating_state(void *handle,
 
 static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
 	.name = "amdgpu_vkms",
-	.early_init = NULL,
-	.late_init = NULL,
 	.sw_init = amdgpu_vkms_sw_init,
 	.sw_fini = amdgpu_vkms_sw_fini,
 	.hw_init = amdgpu_vkms_hw_init,
@@ -657,8 +655,6 @@ static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
 	.is_idle = amdgpu_vkms_is_idle,
 	.set_clockgating_state = amdgpu_vkms_set_clockgating_state,
 	.set_powergating_state = amdgpu_vkms_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version amdgpu_vkms_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 6d96e1f21e20..46713a158d90 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -906,14 +906,12 @@ static void vpe_set_ring_funcs(struct amdgpu_device *adev)
 const struct amd_ip_funcs vpe_ip_funcs = {
 	.name = "vpe_v6_1",
 	.early_init = vpe_early_init,
-	.late_init = NULL,
 	.sw_init = vpe_sw_init,
 	.sw_fini = vpe_sw_fini,
 	.hw_init = vpe_hw_init,
 	.hw_fini = vpe_hw_fini,
 	.suspend = vpe_suspend,
 	.resume = vpe_resume,
-	.soft_reset = NULL,
 	.set_clockgating_state = vpe_set_clockgating_state,
 	.set_powergating_state = vpe_set_powergating_state,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 52d177007287..e2cb1f080e88 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2176,7 +2176,6 @@ static int cik_common_set_powergating_state(void *handle,
 static const struct amd_ip_funcs cik_common_ip_funcs = {
 	.name = "cik_common",
 	.early_init = cik_common_early_init,
-	.late_init = NULL,
 	.hw_init = cik_common_hw_init,
 	.hw_fini = cik_common_hw_fini,
 	.resume = cik_common_resume,
@@ -2184,8 +2183,6 @@ static const struct amd_ip_funcs cik_common_ip_funcs = {
 	.soft_reset = cik_common_soft_reset,
 	.set_clockgating_state = cik_common_set_clockgating_state,
 	.set_powergating_state = cik_common_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ip_block_version cik_common_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 9e9a58fd86ce..1da17755ad53 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -417,7 +417,6 @@ static int cik_ih_set_powergating_state(void *handle,
 static const struct amd_ip_funcs cik_ih_ip_funcs = {
 	.name = "cik_ih",
 	.early_init = cik_ih_early_init,
-	.late_init = NULL,
 	.sw_init = cik_ih_sw_init,
 	.sw_fini = cik_ih_sw_fini,
 	.hw_init = cik_ih_hw_init,
@@ -429,8 +428,6 @@ static const struct amd_ip_funcs cik_ih_ip_funcs = {
 	.soft_reset = cik_ih_soft_reset,
 	.set_clockgating_state = cik_ih_set_clockgating_state,
 	.set_powergating_state = cik_ih_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs cik_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index df3f429e003e..ede1a028d48d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1213,7 +1213,6 @@ static int cik_sdma_set_powergating_state(void *handle,
 static const struct amd_ip_funcs cik_sdma_ip_funcs = {
 	.name = "cik_sdma",
 	.early_init = cik_sdma_early_init,
-	.late_init = NULL,
 	.sw_init = cik_sdma_sw_init,
 	.sw_fini = cik_sdma_sw_fini,
 	.hw_init = cik_sdma_hw_init,
@@ -1225,8 +1224,6 @@ static const struct amd_ip_funcs cik_sdma_ip_funcs = {
 	.soft_reset = cik_sdma_soft_reset,
 	.set_clockgating_state = cik_sdma_set_clockgating_state,
 	.set_powergating_state = cik_sdma_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs cik_sdma_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index cadd69a243af..d72973bd570d 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -415,7 +415,6 @@ static int cz_ih_set_powergating_state(void *handle,
 static const struct amd_ip_funcs cz_ih_ip_funcs = {
 	.name = "cz_ih",
 	.early_init = cz_ih_early_init,
-	.late_init = NULL,
 	.sw_init = cz_ih_sw_init,
 	.sw_fini = cz_ih_sw_fini,
 	.hw_init = cz_ih_hw_init,
@@ -427,8 +426,6 @@ static const struct amd_ip_funcs cz_ih_ip_funcs = {
 	.soft_reset = cz_ih_soft_reset,
 	.set_clockgating_state = cz_ih_set_clockgating_state,
 	.set_powergating_state = cz_ih_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs cz_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index a5985663a867..5098c50d54c8 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -3317,7 +3317,6 @@ static int dce_v10_0_set_powergating_state(void *handle,
 static const struct amd_ip_funcs dce_v10_0_ip_funcs = {
 	.name = "dce_v10_0",
 	.early_init = dce_v10_0_early_init,
-	.late_init = NULL,
 	.sw_init = dce_v10_0_sw_init,
 	.sw_fini = dce_v10_0_sw_fini,
 	.hw_init = dce_v10_0_hw_init,
@@ -3329,8 +3328,6 @@ static const struct amd_ip_funcs dce_v10_0_ip_funcs = {
 	.soft_reset = dce_v10_0_soft_reset,
 	.set_clockgating_state = dce_v10_0_set_clockgating_state,
 	.set_powergating_state = dce_v10_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 5c907a1a4778..c5680ff4ab9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3449,7 +3449,6 @@ static int dce_v11_0_set_powergating_state(void *handle,
 static const struct amd_ip_funcs dce_v11_0_ip_funcs = {
 	.name = "dce_v11_0",
 	.early_init = dce_v11_0_early_init,
-	.late_init = NULL,
 	.sw_init = dce_v11_0_sw_init,
 	.sw_fini = dce_v11_0_sw_fini,
 	.hw_init = dce_v11_0_hw_init,
@@ -3460,8 +3459,6 @@ static const struct amd_ip_funcs dce_v11_0_ip_funcs = {
 	.soft_reset = dce_v11_0_soft_reset,
 	.set_clockgating_state = dce_v11_0_set_clockgating_state,
 	.set_powergating_state = dce_v11_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index a53e4fac89dc..eb7de9122d99 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -3139,7 +3139,6 @@ static int dce_v6_0_set_powergating_state(void *handle,
 static const struct amd_ip_funcs dce_v6_0_ip_funcs = {
 	.name = "dce_v6_0",
 	.early_init = dce_v6_0_early_init,
-	.late_init = NULL,
 	.sw_init = dce_v6_0_sw_init,
 	.sw_fini = dce_v6_0_sw_fini,
 	.hw_init = dce_v6_0_hw_init,
@@ -3150,8 +3149,6 @@ static const struct amd_ip_funcs dce_v6_0_ip_funcs = {
 	.soft_reset = dce_v6_0_soft_reset,
 	.set_clockgating_state = dce_v6_0_set_clockgating_state,
 	.set_powergating_state = dce_v6_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 9278e0d8d00c..04b79ff87f75 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -3227,7 +3227,6 @@ static int dce_v8_0_set_powergating_state(void *handle,
 static const struct amd_ip_funcs dce_v8_0_ip_funcs = {
 	.name = "dce_v8_0",
 	.early_init = dce_v8_0_early_init,
-	.late_init = NULL,
 	.sw_init = dce_v8_0_sw_init,
 	.sw_fini = dce_v8_0_sw_fini,
 	.hw_init = dce_v8_0_hw_init,
@@ -3238,8 +3237,6 @@ static const struct amd_ip_funcs dce_v8_0_ip_funcs = {
 	.soft_reset = dce_v8_0_soft_reset,
 	.set_clockgating_state = dce_v8_0_set_clockgating_state,
 	.set_powergating_state = dce_v8_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 5769055909bc..41f50bf380c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3435,7 +3435,6 @@ static void gfx_v6_0_emit_mem_sync(struct amdgpu_ring *ring)
 static const struct amd_ip_funcs gfx_v6_0_ip_funcs = {
 	.name = "gfx_v6_0",
 	.early_init = gfx_v6_0_early_init,
-	.late_init = NULL,
 	.sw_init = gfx_v6_0_sw_init,
 	.sw_fini = gfx_v6_0_sw_fini,
 	.hw_init = gfx_v6_0_hw_init,
@@ -3446,8 +3445,6 @@ static const struct amd_ip_funcs gfx_v6_0_ip_funcs = {
 	.wait_for_idle = gfx_v6_0_wait_for_idle,
 	.set_clockgating_state = gfx_v6_0_set_clockgating_state,
 	.set_powergating_state = gfx_v6_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v6_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index a683d2bfb8de..824d5913103b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -5005,8 +5005,6 @@ static const struct amd_ip_funcs gfx_v7_0_ip_funcs = {
 	.soft_reset = gfx_v7_0_soft_reset,
 	.set_clockgating_state = gfx_v7_0_set_clockgating_state,
 	.set_powergating_state = gfx_v7_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v7_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 8b72463fd5c0..480c41ee947e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -6948,8 +6948,6 @@ static const struct amd_ip_funcs gfx_v8_0_ip_funcs = {
 	.set_clockgating_state = gfx_v8_0_set_clockgating_state,
 	.set_powergating_state = gfx_v8_0_set_powergating_state,
 	.get_clockgating_state = gfx_v8_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index c1e2f1d79e74..ca000b3d1afc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -1121,8 +1121,6 @@ static const struct amd_ip_funcs gmc_v6_0_ip_funcs = {
 	.soft_reset = gmc_v6_0_soft_reset,
 	.set_clockgating_state = gmc_v6_0_set_clockgating_state,
 	.set_powergating_state = gmc_v6_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_gmc_funcs gmc_v6_0_gmc_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 54a48662f3b5..07f45f1a503a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1348,8 +1348,6 @@ static const struct amd_ip_funcs gmc_v7_0_ip_funcs = {
 	.soft_reset = gmc_v7_0_soft_reset,
 	.set_clockgating_state = gmc_v7_0_set_clockgating_state,
 	.set_powergating_state = gmc_v7_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_gmc_funcs gmc_v7_0_gmc_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index c4f2ad32c078..12d5967ecd45 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1722,8 +1722,6 @@ static const struct amd_ip_funcs gmc_v8_0_ip_funcs = {
 	.set_clockgating_state = gmc_v8_0_set_clockgating_state,
 	.set_powergating_state = gmc_v8_0_set_powergating_state,
 	.get_clockgating_state = gmc_v8_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_gmc_funcs gmc_v8_0_gmc_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index a3fb01f905d4..7f45e93c0397 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -407,7 +407,6 @@ static int iceland_ih_set_powergating_state(void *handle,
 static const struct amd_ip_funcs iceland_ih_ip_funcs = {
 	.name = "iceland_ih",
 	.early_init = iceland_ih_early_init,
-	.late_init = NULL,
 	.sw_init = iceland_ih_sw_init,
 	.sw_fini = iceland_ih_sw_fini,
 	.hw_init = iceland_ih_hw_init,
@@ -419,8 +418,6 @@ static const struct amd_ip_funcs iceland_ih_ip_funcs = {
 	.soft_reset = iceland_ih_soft_reset,
 	.set_clockgating_state = iceland_ih_set_clockgating_state,
 	.set_powergating_state = iceland_ih_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs iceland_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 09403eac483b..38f953fd65d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -779,7 +779,6 @@ static void ih_v6_0_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs ih_v6_0_ip_funcs = {
 	.name = "ih_v6_0",
 	.early_init = ih_v6_0_early_init,
-	.late_init = NULL,
 	.sw_init = ih_v6_0_sw_init,
 	.sw_fini = ih_v6_0_sw_fini,
 	.hw_init = ih_v6_0_hw_init,
@@ -792,8 +791,6 @@ static const struct amd_ip_funcs ih_v6_0_ip_funcs = {
 	.set_clockgating_state = ih_v6_0_set_clockgating_state,
 	.set_powergating_state = ih_v6_0_set_powergating_state,
 	.get_clockgating_state = ih_v6_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs ih_v6_0_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 9706d7593d26..61381e0c3795 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -762,7 +762,6 @@ static void ih_v6_1_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs ih_v6_1_ip_funcs = {
 	.name = "ih_v6_1",
 	.early_init = ih_v6_1_early_init,
-	.late_init = NULL,
 	.sw_init = ih_v6_1_sw_init,
 	.sw_fini = ih_v6_1_sw_fini,
 	.hw_init = ih_v6_1_hw_init,
@@ -775,8 +774,6 @@ static const struct amd_ip_funcs ih_v6_1_ip_funcs = {
 	.set_clockgating_state = ih_v6_1_set_clockgating_state,
 	.set_powergating_state = ih_v6_1_set_powergating_state,
 	.get_clockgating_state = ih_v6_1_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs ih_v6_1_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 9657145d7cce..d2428cf5d385 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -752,7 +752,6 @@ static void ih_v7_0_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs ih_v7_0_ip_funcs = {
 	.name = "ih_v7_0",
 	.early_init = ih_v7_0_early_init,
-	.late_init = NULL,
 	.sw_init = ih_v7_0_sw_init,
 	.sw_fini = ih_v7_0_sw_fini,
 	.hw_init = ih_v7_0_hw_init,
@@ -765,8 +764,6 @@ static const struct amd_ip_funcs ih_v7_0_ip_funcs = {
 	.set_clockgating_state = ih_v7_0_set_clockgating_state,
 	.set_powergating_state = ih_v7_0_set_powergating_state,
 	.get_clockgating_state = ih_v7_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs ih_v7_0_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 6762b5c64ccb..d6823fb45d32 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -742,7 +742,6 @@ static int jpeg_v2_0_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v2_0_ip_funcs = {
 	.name = "jpeg_v2_0",
 	.early_init = jpeg_v2_0_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v2_0_sw_init,
 	.sw_fini = jpeg_v2_0_sw_fini,
 	.hw_init = jpeg_v2_0_hw_init,
@@ -751,14 +750,8 @@ static const struct amd_ip_funcs jpeg_v2_0_ip_funcs = {
 	.resume = jpeg_v2_0_resume,
 	.is_idle = jpeg_v2_0_is_idle,
 	.wait_for_idle = jpeg_v2_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v2_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v2_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v2_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 4b8c801f204d..5063a38801d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -613,7 +613,6 @@ static int jpeg_v2_5_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v2_5_ip_funcs = {
 	.name = "jpeg_v2_5",
 	.early_init = jpeg_v2_5_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v2_5_sw_init,
 	.sw_fini = jpeg_v2_5_sw_fini,
 	.hw_init = jpeg_v2_5_hw_init,
@@ -622,20 +621,13 @@ static const struct amd_ip_funcs jpeg_v2_5_ip_funcs = {
 	.resume = jpeg_v2_5_resume,
 	.is_idle = jpeg_v2_5_is_idle,
 	.wait_for_idle = jpeg_v2_5_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v2_5_set_clockgating_state,
 	.set_powergating_state = jpeg_v2_5_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amd_ip_funcs jpeg_v2_6_ip_funcs = {
 	.name = "jpeg_v2_6",
 	.early_init = jpeg_v2_5_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v2_5_sw_init,
 	.sw_fini = jpeg_v2_5_sw_fini,
 	.hw_init = jpeg_v2_5_hw_init,
@@ -644,14 +636,8 @@ static const struct amd_ip_funcs jpeg_v2_6_ip_funcs = {
 	.resume = jpeg_v2_5_resume,
 	.is_idle = jpeg_v2_5_is_idle,
 	.wait_for_idle = jpeg_v2_5_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v2_5_set_clockgating_state,
 	.set_powergating_state = jpeg_v2_5_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v2_5_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index 7996209818b6..10adbb7cbf53 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -533,7 +533,6 @@ static int jpeg_v3_0_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v3_0_ip_funcs = {
 	.name = "jpeg_v3_0",
 	.early_init = jpeg_v3_0_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v3_0_sw_init,
 	.sw_fini = jpeg_v3_0_sw_fini,
 	.hw_init = jpeg_v3_0_hw_init,
@@ -542,14 +541,8 @@ static const struct amd_ip_funcs jpeg_v3_0_ip_funcs = {
 	.resume = jpeg_v3_0_resume,
 	.is_idle = jpeg_v3_0_is_idle,
 	.wait_for_idle = jpeg_v3_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v3_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v3_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v3_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index 20e1fe89c463..89953c0f5f1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -700,7 +700,6 @@ static int jpeg_v4_0_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v4_0_ip_funcs = {
 	.name = "jpeg_v4_0",
 	.early_init = jpeg_v4_0_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v4_0_sw_init,
 	.sw_fini = jpeg_v4_0_sw_fini,
 	.hw_init = jpeg_v4_0_hw_init,
@@ -709,14 +708,8 @@ static const struct amd_ip_funcs jpeg_v4_0_ip_funcs = {
 	.resume = jpeg_v4_0_resume,
 	.is_idle = jpeg_v4_0_is_idle,
 	.wait_for_idle = jpeg_v4_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v4_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v4_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v4_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 2a53537db135..6917e4a8e96a 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -1050,7 +1050,6 @@ static int jpeg_v4_0_3_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v4_0_3_ip_funcs = {
 	.name = "jpeg_v4_0_3",
 	.early_init = jpeg_v4_0_3_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v4_0_3_sw_init,
 	.sw_fini = jpeg_v4_0_3_sw_fini,
 	.hw_init = jpeg_v4_0_3_hw_init,
@@ -1059,14 +1058,8 @@ static const struct amd_ip_funcs jpeg_v4_0_3_ip_funcs = {
 	.resume = jpeg_v4_0_3_resume,
 	.is_idle = jpeg_v4_0_3_is_idle,
 	.wait_for_idle = jpeg_v4_0_3_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v4_0_3_set_clockgating_state,
 	.set_powergating_state = jpeg_v4_0_3_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v4_0_3_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index ef2d4237925b..f3cce523f3cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -741,7 +741,6 @@ static int jpeg_v4_0_5_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v4_0_5_ip_funcs = {
 	.name = "jpeg_v4_0_5",
 	.early_init = jpeg_v4_0_5_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v4_0_5_sw_init,
 	.sw_fini = jpeg_v4_0_5_sw_fini,
 	.hw_init = jpeg_v4_0_5_hw_init,
@@ -750,14 +749,8 @@ static const struct amd_ip_funcs jpeg_v4_0_5_ip_funcs = {
 	.resume = jpeg_v4_0_5_resume,
 	.is_idle = jpeg_v4_0_5_is_idle,
 	.wait_for_idle = jpeg_v4_0_5_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v4_0_5_set_clockgating_state,
 	.set_powergating_state = jpeg_v4_0_5_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v4_0_5_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index 7954a6fae464..06840d1dae79 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -620,7 +620,6 @@ static int jpeg_v5_0_0_process_interrupt(struct amdgpu_device *adev,
 static const struct amd_ip_funcs jpeg_v5_0_0_ip_funcs = {
 	.name = "jpeg_v5_0_0",
 	.early_init = jpeg_v5_0_0_early_init,
-	.late_init = NULL,
 	.sw_init = jpeg_v5_0_0_sw_init,
 	.sw_fini = jpeg_v5_0_0_sw_fini,
 	.hw_init = jpeg_v5_0_0_hw_init,
@@ -629,14 +628,8 @@ static const struct amd_ip_funcs jpeg_v5_0_0_ip_funcs = {
 	.resume = jpeg_v5_0_0_resume,
 	.is_idle = jpeg_v5_0_0_is_idle,
 	.wait_for_idle = jpeg_v5_0_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = jpeg_v5_0_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v5_0_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v5_0_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 2edfe86a866b..8ca137313961 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1707,8 +1707,6 @@ static const struct amd_ip_funcs mes_v11_0_ip_funcs = {
 	.hw_fini = mes_v11_0_hw_fini,
 	.suspend = mes_v11_0_suspend,
 	.resume = mes_v11_0_resume,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version mes_v11_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 93da900b7ee2..0820ed62e2e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -694,7 +694,6 @@ static void navi10_ih_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs navi10_ih_ip_funcs = {
 	.name = "navi10_ih",
 	.early_init = navi10_ih_early_init,
-	.late_init = NULL,
 	.sw_init = navi10_ih_sw_init,
 	.sw_fini = navi10_ih_sw_fini,
 	.hw_init = navi10_ih_hw_init,
@@ -707,8 +706,6 @@ static const struct amd_ip_funcs navi10_ih_ip_funcs = {
 	.set_clockgating_state = navi10_ih_set_clockgating_state,
 	.set_powergating_state = navi10_ih_set_powergating_state,
 	.get_clockgating_state = navi10_ih_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs navi10_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index c16f724384cd..6b72169be8f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1104,6 +1104,4 @@ static const struct amd_ip_funcs nv_common_ip_funcs = {
 	.set_clockgating_state = nv_common_set_clockgating_state,
 	.set_powergating_state = nv_common_set_powergating_state,
 	.get_clockgating_state = nv_common_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 10fd772cb80f..7948d74f8722 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1096,7 +1096,6 @@ static int sdma_v2_4_set_powergating_state(void *handle,
 static const struct amd_ip_funcs sdma_v2_4_ip_funcs = {
 	.name = "sdma_v2_4",
 	.early_init = sdma_v2_4_early_init,
-	.late_init = NULL,
 	.sw_init = sdma_v2_4_sw_init,
 	.sw_fini = sdma_v2_4_sw_fini,
 	.hw_init = sdma_v2_4_hw_init,
@@ -1108,8 +1107,6 @@ static const struct amd_ip_funcs sdma_v2_4_ip_funcs = {
 	.soft_reset = sdma_v2_4_soft_reset,
 	.set_clockgating_state = sdma_v2_4_set_clockgating_state,
 	.set_powergating_state = sdma_v2_4_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs sdma_v2_4_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 69fba087e09c..9a3d729545a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1534,7 +1534,6 @@ static void sdma_v3_0_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs sdma_v3_0_ip_funcs = {
 	.name = "sdma_v3_0",
 	.early_init = sdma_v3_0_early_init,
-	.late_init = NULL,
 	.sw_init = sdma_v3_0_sw_init,
 	.sw_fini = sdma_v3_0_sw_fini,
 	.hw_init = sdma_v3_0_hw_init,
@@ -1550,8 +1549,6 @@ static const struct amd_ip_funcs sdma_v3_0_ip_funcs = {
 	.set_clockgating_state = sdma_v3_0_set_clockgating_state,
 	.set_powergating_state = sdma_v3_0_set_powergating_state,
 	.get_clockgating_state = sdma_v3_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs sdma_v3_0_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 6a675daf5620..d31c4860933f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -1929,7 +1929,6 @@ static void sdma_v5_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs sdma_v5_0_ip_funcs = {
 	.name = "sdma_v5_0",
 	.early_init = sdma_v5_0_early_init,
-	.late_init = NULL,
 	.sw_init = sdma_v5_0_sw_init,
 	.sw_fini = sdma_v5_0_sw_fini,
 	.hw_init = sdma_v5_0_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index e1413ccaf7e4..ffa8c62ac101 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1918,7 +1918,6 @@ static void sdma_v5_2_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs sdma_v5_2_ip_funcs = {
 	.name = "sdma_v5_2",
 	.early_init = sdma_v5_2_early_init,
-	.late_init = NULL,
 	.sw_init = sdma_v5_2_sw_init,
 	.sw_fini = sdma_v5_2_sw_fini,
 	.hw_init = sdma_v5_2_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 4856a093e23f..449d515e6b67 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1649,7 +1649,6 @@ static void sdma_v6_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 const struct amd_ip_funcs sdma_v6_0_ip_funcs = {
 	.name = "sdma_v6_0",
 	.early_init = sdma_v6_0_early_init,
-	.late_init = NULL,
 	.sw_init = sdma_v6_0_sw_init,
 	.sw_fini = sdma_v6_0_sw_fini,
 	.hw_init = sdma_v6_0_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index adedbf4bff78..00f63d3fbea7 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2664,15 +2664,12 @@ static int si_common_set_powergating_state(void *handle,
 static const struct amd_ip_funcs si_common_ip_funcs = {
 	.name = "si_common",
 	.early_init = si_common_early_init,
-	.late_init = NULL,
 	.hw_init = si_common_hw_init,
 	.hw_fini = si_common_hw_fini,
 	.resume = si_common_resume,
 	.is_idle = si_common_is_idle,
 	.set_clockgating_state = si_common_set_clockgating_state,
 	.set_powergating_state = si_common_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ip_block_version si_common_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index d44483ed3363..47647a6083e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -691,7 +691,6 @@ static int si_dma_set_powergating_state(void *handle,
 static const struct amd_ip_funcs si_dma_ip_funcs = {
 	.name = "si_dma",
 	.early_init = si_dma_early_init,
-	.late_init = NULL,
 	.sw_init = si_dma_sw_init,
 	.sw_fini = si_dma_sw_fini,
 	.hw_init = si_dma_hw_init,
@@ -703,8 +702,6 @@ static const struct amd_ip_funcs si_dma_ip_funcs = {
 	.soft_reset = si_dma_soft_reset,
 	.set_clockgating_state = si_dma_set_clockgating_state,
 	.set_powergating_state = si_dma_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs si_dma_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index b018a3b90401..2ec1ebe4db11 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -278,7 +278,6 @@ static int si_ih_set_powergating_state(void *handle,
 static const struct amd_ip_funcs si_ih_ip_funcs = {
 	.name = "si_ih",
 	.early_init = si_ih_early_init,
-	.late_init = NULL,
 	.sw_init = si_ih_sw_init,
 	.sw_fini = si_ih_sw_fini,
 	.hw_init = si_ih_hw_init,
@@ -290,8 +289,6 @@ static const struct amd_ip_funcs si_ih_ip_funcs = {
 	.soft_reset = si_ih_soft_reset,
 	.set_clockgating_state = si_ih_set_clockgating_state,
 	.set_powergating_state = si_ih_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs si_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 19391cbc1474..93e44e7ee3fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1494,6 +1494,4 @@ static const struct amd_ip_funcs soc15_common_ip_funcs = {
 	.set_clockgating_state = soc15_common_set_clockgating_state,
 	.set_powergating_state = soc15_common_set_powergating_state,
 	.get_clockgating_state= soc15_common_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 078f25b5f09b..1c07ebdc0d1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -993,6 +993,4 @@ static const struct amd_ip_funcs soc21_common_ip_funcs = {
 	.set_clockgating_state = soc21_common_set_clockgating_state,
 	.set_powergating_state = soc21_common_set_powergating_state,
 	.get_clockgating_state = soc21_common_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 45fb5140c8b7..5a04a6770138 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -463,7 +463,6 @@ static int tonga_ih_set_powergating_state(void *handle,
 static const struct amd_ip_funcs tonga_ih_ip_funcs = {
 	.name = "tonga_ih",
 	.early_init = tonga_ih_early_init,
-	.late_init = NULL,
 	.sw_init = tonga_ih_sw_init,
 	.sw_fini = tonga_ih_sw_fini,
 	.hw_init = tonga_ih_hw_init,
@@ -478,8 +477,6 @@ static const struct amd_ip_funcs tonga_ih_ip_funcs = {
 	.post_soft_reset = tonga_ih_post_soft_reset,
 	.set_clockgating_state = tonga_ih_set_clockgating_state,
 	.set_powergating_state = tonga_ih_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs tonga_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 3011b5853fb4..bdbca25d80c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -805,7 +805,6 @@ static int uvd_v3_1_set_powergating_state(void *handle,
 static const struct amd_ip_funcs uvd_v3_1_ip_funcs = {
 	.name = "uvd_v3_1",
 	.early_init = uvd_v3_1_early_init,
-	.late_init = NULL,
 	.sw_init = uvd_v3_1_sw_init,
 	.sw_fini = uvd_v3_1_sw_fini,
 	.hw_init = uvd_v3_1_hw_init,
@@ -818,8 +817,6 @@ static const struct amd_ip_funcs uvd_v3_1_ip_funcs = {
 	.soft_reset = uvd_v3_1_soft_reset,
 	.set_clockgating_state = uvd_v3_1_set_clockgating_state,
 	.set_powergating_state = uvd_v3_1_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version uvd_v3_1_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 4852a2ab128f..a836dc9cfcad 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -755,7 +755,6 @@ static int uvd_v4_2_set_powergating_state(void *handle,
 static const struct amd_ip_funcs uvd_v4_2_ip_funcs = {
 	.name = "uvd_v4_2",
 	.early_init = uvd_v4_2_early_init,
-	.late_init = NULL,
 	.sw_init = uvd_v4_2_sw_init,
 	.sw_fini = uvd_v4_2_sw_fini,
 	.hw_init = uvd_v4_2_hw_init,
@@ -768,8 +767,6 @@ static const struct amd_ip_funcs uvd_v4_2_ip_funcs = {
 	.soft_reset = uvd_v4_2_soft_reset,
 	.set_clockgating_state = uvd_v4_2_set_clockgating_state,
 	.set_powergating_state = uvd_v4_2_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs uvd_v4_2_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index a24b210c79ac..ab55fae3569e 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -867,7 +867,6 @@ static void uvd_v5_0_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs uvd_v5_0_ip_funcs = {
 	.name = "uvd_v5_0",
 	.early_init = uvd_v5_0_early_init,
-	.late_init = NULL,
 	.sw_init = uvd_v5_0_sw_init,
 	.sw_fini = uvd_v5_0_sw_fini,
 	.hw_init = uvd_v5_0_hw_init,
@@ -881,8 +880,6 @@ static const struct amd_ip_funcs uvd_v5_0_ip_funcs = {
 	.set_clockgating_state = uvd_v5_0_set_clockgating_state,
 	.set_powergating_state = uvd_v5_0_set_powergating_state,
 	.get_clockgating_state = uvd_v5_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs uvd_v5_0_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index b4eeeebfe095..39f8c3d3a135 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -1532,7 +1532,6 @@ static void uvd_v6_0_get_clockgating_state(void *handle, u64 *flags)
 static const struct amd_ip_funcs uvd_v6_0_ip_funcs = {
 	.name = "uvd_v6_0",
 	.early_init = uvd_v6_0_early_init,
-	.late_init = NULL,
 	.sw_init = uvd_v6_0_sw_init,
 	.sw_fini = uvd_v6_0_sw_fini,
 	.hw_init = uvd_v6_0_hw_init,
@@ -1549,8 +1548,6 @@ static const struct amd_ip_funcs uvd_v6_0_ip_funcs = {
 	.set_clockgating_state = uvd_v6_0_set_clockgating_state,
 	.set_powergating_state = uvd_v6_0_set_powergating_state,
 	.get_clockgating_state = uvd_v6_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs uvd_v6_0_ring_phys_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index 55fa858328f6..c15f82f3c617 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -1789,7 +1789,6 @@ static int uvd_v7_0_set_clockgating_state(void *handle,
 const struct amd_ip_funcs uvd_v7_0_ip_funcs = {
 	.name = "uvd_v7_0",
 	.early_init = uvd_v7_0_early_init,
-	.late_init = NULL,
 	.sw_init = uvd_v7_0_sw_init,
 	.sw_fini = uvd_v7_0_sw_fini,
 	.hw_init = uvd_v7_0_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index a4531000ec0b..c1ed91b39415 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -617,7 +617,6 @@ static int vce_v2_0_set_powergating_state(void *handle,
 static const struct amd_ip_funcs vce_v2_0_ip_funcs = {
 	.name = "vce_v2_0",
 	.early_init = vce_v2_0_early_init,
-	.late_init = NULL,
 	.sw_init = vce_v2_0_sw_init,
 	.sw_fini = vce_v2_0_sw_fini,
 	.hw_init = vce_v2_0_hw_init,
@@ -629,8 +628,6 @@ static const struct amd_ip_funcs vce_v2_0_ip_funcs = {
 	.soft_reset = vce_v2_0_soft_reset,
 	.set_clockgating_state = vce_v2_0_set_clockgating_state,
 	.set_powergating_state = vce_v2_0_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs vce_v2_0_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 9f9a9d89bcdc..6bb318a06f19 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -896,7 +896,6 @@ static void vce_v3_0_emit_pipeline_sync(struct amdgpu_ring *ring)
 static const struct amd_ip_funcs vce_v3_0_ip_funcs = {
 	.name = "vce_v3_0",
 	.early_init = vce_v3_0_early_init,
-	.late_init = NULL,
 	.sw_init = vce_v3_0_sw_init,
 	.sw_fini = vce_v3_0_sw_fini,
 	.hw_init = vce_v3_0_hw_init,
@@ -912,8 +911,6 @@ static const struct amd_ip_funcs vce_v3_0_ip_funcs = {
 	.set_clockgating_state = vce_v3_0_set_clockgating_state,
 	.set_powergating_state = vce_v3_0_set_powergating_state,
 	.get_clockgating_state = vce_v3_0_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs vce_v3_0_ring_phys_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index f4d2650e6b7a..4a860afc4da3 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -1076,7 +1076,6 @@ static int vce_v4_0_process_interrupt(struct amdgpu_device *adev,
 const struct amd_ip_funcs vce_v4_0_ip_funcs = {
 	.name = "vce_v4_0",
 	.early_init = vce_v4_0_early_init,
-	.late_init = NULL,
 	.sw_init = vce_v4_0_sw_init,
 	.sw_fini = vce_v4_0_sw_fini,
 	.hw_init = vce_v4_0_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 129c759772c2..497b5d93a58b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1987,7 +1987,6 @@ static void vcn_v1_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
 	.name = "vcn_v1_0",
 	.early_init = vcn_v1_0_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v1_0_sw_init,
 	.sw_fini = vcn_v1_0_sw_fini,
 	.hw_init = vcn_v1_0_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 19bbd49f760e..e0322cbca3ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -2095,7 +2095,6 @@ static void vcn_v2_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v2_0_ip_funcs = {
 	.name = "vcn_v2_0",
 	.early_init = vcn_v2_0_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v2_0_sw_init,
 	.sw_fini = vcn_v2_0_sw_fini,
 	.hw_init = vcn_v2_0_hw_init,
@@ -2104,10 +2103,6 @@ static const struct amd_ip_funcs vcn_v2_0_ip_funcs = {
 	.resume = vcn_v2_0_resume,
 	.is_idle = vcn_v2_0_is_idle,
 	.wait_for_idle = vcn_v2_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v2_0_set_clockgating_state,
 	.set_powergating_state = vcn_v2_0_set_powergating_state,
 	.dump_ip_state = vcn_v2_0_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 30420ead7fc4..6aa08281d094 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1987,7 +1987,6 @@ static void vcn_v2_5_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 	.name = "vcn_v2_5",
 	.early_init = vcn_v2_5_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v2_5_sw_init,
 	.sw_fini = vcn_v2_5_sw_fini,
 	.hw_init = vcn_v2_5_hw_init,
@@ -1996,10 +1995,6 @@ static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 	.resume = vcn_v2_5_resume,
 	.is_idle = vcn_v2_5_is_idle,
 	.wait_for_idle = vcn_v2_5_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v2_5_set_clockgating_state,
 	.set_powergating_state = vcn_v2_5_set_powergating_state,
 	.dump_ip_state = vcn_v2_5_dump_ip_state,
@@ -2009,7 +2004,6 @@ static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 static const struct amd_ip_funcs vcn_v2_6_ip_funcs = {
         .name = "vcn_v2_6",
         .early_init = vcn_v2_5_early_init,
-        .late_init = NULL,
         .sw_init = vcn_v2_5_sw_init,
         .sw_fini = vcn_v2_5_sw_fini,
         .hw_init = vcn_v2_5_hw_init,
@@ -2018,10 +2012,6 @@ static const struct amd_ip_funcs vcn_v2_6_ip_funcs = {
         .resume = vcn_v2_5_resume,
         .is_idle = vcn_v2_5_is_idle,
         .wait_for_idle = vcn_v2_5_wait_for_idle,
-        .check_soft_reset = NULL,
-        .pre_soft_reset = NULL,
-        .soft_reset = NULL,
-        .post_soft_reset = NULL,
         .set_clockgating_state = vcn_v2_5_set_clockgating_state,
         .set_powergating_state = vcn_v2_5_set_powergating_state,
 	.dump_ip_state = vcn_v2_5_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 13632c22d2f9..6732ad7f16f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -2313,7 +2313,6 @@ static void vcn_v3_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v3_0_ip_funcs = {
 	.name = "vcn_v3_0",
 	.early_init = vcn_v3_0_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v3_0_sw_init,
 	.sw_fini = vcn_v3_0_sw_fini,
 	.hw_init = vcn_v3_0_hw_init,
@@ -2322,10 +2321,6 @@ static const struct amd_ip_funcs vcn_v3_0_ip_funcs = {
 	.resume = vcn_v3_0_resume,
 	.is_idle = vcn_v3_0_is_idle,
 	.wait_for_idle = vcn_v3_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v3_0_set_clockgating_state,
 	.set_powergating_state = vcn_v3_0_set_powergating_state,
 	.dump_ip_state = vcn_v3_0_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index e7b7a8150ea7..5512259cac79 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -2220,7 +2220,6 @@ static void vcn_v4_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v4_0_ip_funcs = {
 	.name = "vcn_v4_0",
 	.early_init = vcn_v4_0_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v4_0_sw_init,
 	.sw_fini = vcn_v4_0_sw_fini,
 	.hw_init = vcn_v4_0_hw_init,
@@ -2229,10 +2228,6 @@ static const struct amd_ip_funcs vcn_v4_0_ip_funcs = {
 	.resume = vcn_v4_0_resume,
 	.is_idle = vcn_v4_0_is_idle,
 	.wait_for_idle = vcn_v4_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v4_0_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_set_powergating_state,
 	.dump_ip_state = vcn_v4_0_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 6dcae398b2dc..0d5c94bfc0ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -1796,7 +1796,6 @@ static void vcn_v4_0_3_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v4_0_3_ip_funcs = {
 	.name = "vcn_v4_0_3",
 	.early_init = vcn_v4_0_3_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v4_0_3_sw_init,
 	.sw_fini = vcn_v4_0_3_sw_fini,
 	.hw_init = vcn_v4_0_3_hw_init,
@@ -1805,10 +1804,6 @@ static const struct amd_ip_funcs vcn_v4_0_3_ip_funcs = {
 	.resume = vcn_v4_0_3_resume,
 	.is_idle = vcn_v4_0_3_is_idle,
 	.wait_for_idle = vcn_v4_0_3_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v4_0_3_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_3_set_powergating_state,
 	.dump_ip_state = vcn_v4_0_3_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index edb9cd8390b6..71961fb3f7ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -1678,7 +1678,6 @@ static void vcn_v4_0_5_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
 	.name = "vcn_v4_0_5",
 	.early_init = vcn_v4_0_5_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v4_0_5_sw_init,
 	.sw_fini = vcn_v4_0_5_sw_fini,
 	.hw_init = vcn_v4_0_5_hw_init,
@@ -1687,10 +1686,6 @@ static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
 	.resume = vcn_v4_0_5_resume,
 	.is_idle = vcn_v4_0_5_is_idle,
 	.wait_for_idle = vcn_v4_0_5_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v4_0_5_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_5_set_powergating_state,
 	.dump_ip_state = vcn_v4_0_5_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 89bf29fa6f8d..fe2cc1a80c13 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -1404,7 +1404,6 @@ static void vcn_v5_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 static const struct amd_ip_funcs vcn_v5_0_0_ip_funcs = {
 	.name = "vcn_v5_0_0",
 	.early_init = vcn_v5_0_0_early_init,
-	.late_init = NULL,
 	.sw_init = vcn_v5_0_0_sw_init,
 	.sw_fini = vcn_v5_0_0_sw_fini,
 	.hw_init = vcn_v5_0_0_hw_init,
@@ -1413,10 +1412,6 @@ static const struct amd_ip_funcs vcn_v5_0_0_ip_funcs = {
 	.resume = vcn_v5_0_0_resume,
 	.is_idle = vcn_v5_0_0_is_idle,
 	.wait_for_idle = vcn_v5_0_0_wait_for_idle,
-	.check_soft_reset = NULL,
-	.pre_soft_reset = NULL,
-	.soft_reset = NULL,
-	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v5_0_0_set_clockgating_state,
 	.set_powergating_state = vcn_v5_0_0_set_powergating_state,
 	.dump_ip_state = vcn_v5_0_dump_ip_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index 73de5909f655..0fedadd0a6a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -625,7 +625,6 @@ static int vega10_ih_set_powergating_state(void *handle,
 const struct amd_ip_funcs vega10_ih_ip_funcs = {
 	.name = "vega10_ih",
 	.early_init = vega10_ih_early_init,
-	.late_init = NULL,
 	.sw_init = vega10_ih_sw_init,
 	.sw_fini = vega10_ih_sw_fini,
 	.hw_init = vega10_ih_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index a42404a58015..b7e3fb4628b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -690,7 +690,6 @@ static int vega20_ih_set_powergating_state(void *handle,
 const struct amd_ip_funcs vega20_ih_ip_funcs = {
 	.name = "vega20_ih",
 	.early_init = vega20_ih_early_init,
-	.late_init = NULL,
 	.sw_init = vega20_ih_sw_init,
 	.sw_fini = vega20_ih_sw_fini,
 	.hw_init = vega20_ih_hw_init,
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 607b48a2d5eb..b3fa54c0514e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -2036,8 +2036,6 @@ static const struct amd_ip_funcs vi_common_ip_funcs = {
 	.set_clockgating_state = vi_common_set_clockgating_state,
 	.set_powergating_state = vi_common_set_powergating_state,
 	.get_clockgating_state = vi_common_get_clockgating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ip_block_version vi_common_ip_block =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6ea54eb5d68d..98f0b142f497 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3407,8 +3407,6 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
 	.soft_reset = dm_soft_reset,
 	.set_clockgating_state = dm_set_clockgating_state,
 	.set_powergating_state = dm_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version dm_ip_block = {
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 785cb20e64b6..8908646ad620 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3304,8 +3304,6 @@ static const struct amd_ip_funcs kv_dpm_ip_funcs = {
 	.is_idle = kv_dpm_is_idle,
 	.set_clockgating_state = kv_dpm_set_clockgating_state,
 	.set_powergating_state = kv_dpm_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version kv_smu_ip_block = {
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 7b0ded50251a..ee23a0f897c5 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -8046,8 +8046,6 @@ static const struct amd_ip_funcs si_dpm_ip_funcs = {
 	.wait_for_idle = si_dpm_wait_for_idle,
 	.set_clockgating_state = si_dpm_set_clockgating_state,
 	.set_powergating_state = si_dpm_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version si_smu_ip_block =
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index 5aadb6061c22..26624a716fc6 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -287,8 +287,6 @@ static const struct amd_ip_funcs pp_ip_funcs = {
 	.is_idle = pp_is_idle,
 	.set_clockgating_state = pp_set_clockgating_state,
 	.set_powergating_state = pp_set_powergating_state,
-	.dump_ip_state = NULL,
-	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version pp_smu_ip_block =
-- 
2.34.1


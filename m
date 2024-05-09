Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509D58C0ECC
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2024 13:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABD910E2DE;
	Thu,  9 May 2024 11:19:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182710E18F
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2024 11:19:32 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 449BJRHr4058390; Thu, 9 May 2024 16:49:27 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 449BJRC84058389;
 Thu, 9 May 2024 16:49:27 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/4] drm/amdgpu: Add support to dump gfx10 cp registers
Date: Thu,  9 May 2024 16:49:02 +0530
Message-Id: <20240509111904.4058197-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509111904.4058197-1-sunil.khatri@amd.com>
References: <20240509111904.4058197-1-sunil.khatri@amd.com>
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

add support to dump registers of all instances of
cp registers in gfx10

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h |   1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c  | 117 +++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
index 36f67fe9234d..d6e341b389fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
@@ -436,6 +436,7 @@ struct amdgpu_gfx {
 
 	/* IP reg dump */
 	uint32_t			*ipdump_core;
+	uint32_t			*ipdump_cp;
 };
 
 struct amdgpu_gfx_ras_reg_entry {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index f6d6a4b9802d..daf9a3571183 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -381,6 +381,49 @@ static const struct amdgpu_hwip_reg_entry gc_reg_list_10_1[] = {
 	SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS_SE3)
 };
 
+static const struct amdgpu_hwip_reg_entry gc_cp_reg_list_10[] = {
+	/* compute registers */
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_VMID),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PERSISTENT_STATE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PIPE_PRIORITY),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_QUEUE_PRIORITY),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_QUANTUM),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_BASE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_BASE_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_CONTROL),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_IB_BASE_ADDR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_IB_BASE_ADDR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_IB_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_IB_CONTROL),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_DEQUEUE_REQUEST),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_BASE_ADDR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_BASE_ADDR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_CONTROL),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_WPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_EVENTS),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_CTX_SAVE_BASE_ADDR_LO),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_CTX_SAVE_BASE_ADDR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_CTX_SAVE_CONTROL),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_CNTL_STACK_OFFSET),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_CNTL_STACK_SIZE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_WG_STATE_OFFSET),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_CTX_SAVE_SIZE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_GDS_RESOURCE_STATE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_ERROR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_EOP_WPTR_MEM),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_WPTR_LO),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_PQ_WPTR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_SUSPEND_CNTL_STACK_OFFSET),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_SUSPEND_CNTL_STACK_DW_CNT),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_SUSPEND_WG_STATE_OFFSET),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_DEQUEUE_STATUS)
+};
+
 static const struct soc15_reg_golden golden_settings_gc_10_1[] = {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00400014),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_CPF_CLK_CTRL, 0xfcff8fff, 0xf8000100),
@@ -4595,10 +4638,11 @@ static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 			     hw_prio, NULL);
 }
 
-static void gfx_v10_0_alloc_dump_mem(struct amdgpu_device *adev)
+static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 {
 	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_10_1);
 	uint32_t *ptr;
+	uint32_t inst;
 
 	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
 	if (ptr == NULL) {
@@ -4607,6 +4651,19 @@ static void gfx_v10_0_alloc_dump_mem(struct amdgpu_device *adev)
 	} else {
 		adev->gfx.ipdump_core = ptr;
 	}
+
+	/* Allocate memory for gfx cp registers for all the instances */
+	reg_count = ARRAY_SIZE(gc_cp_reg_list_10);
+	inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
+		adev->gfx.mec.num_queue_per_pipe;
+
+	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	if (ptr == NULL) {
+		DRM_ERROR("Failed to allocate memory for GFX CP IP Dump\n");
+		adev->gfx.ipdump_cp = NULL;
+	} else {
+		adev->gfx.ipdump_cp = ptr;
+	}
 }
 
 static int gfx_v10_0_sw_init(void *handle)
@@ -4761,7 +4818,7 @@ static int gfx_v10_0_sw_init(void *handle)
 
 	gfx_v10_0_gpu_early_init(adev);
 
-	gfx_v10_0_alloc_dump_mem(adev);
+	gfx_v10_0_alloc_ip_dump(adev);
 
 	return 0;
 }
@@ -4816,6 +4873,7 @@ static int gfx_v10_0_sw_fini(void *handle)
 	gfx_v10_0_free_microcode(adev);
 
 	kfree(adev->gfx.ipdump_core);
+	kfree(adev->gfx.ipdump_cp);
 
 	return 0;
 }
@@ -9280,7 +9338,7 @@ static void gfx_v10_0_emit_mem_sync(struct amdgpu_ring *ring)
 static void gfx_v10_ip_print(void *handle, struct drm_printer *p)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	uint32_t i;
+	uint32_t i, j, k, reg, index = 0;
 	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_10_1);
 
 	if (!adev->gfx.ipdump_core)
@@ -9290,12 +9348,32 @@ static void gfx_v10_ip_print(void *handle, struct drm_printer *p)
 		drm_printf(p, "%-50s \t 0x%08x\n",
 			   gc_reg_list_10_1[i].reg_name,
 			   adev->gfx.ipdump_core[i]);
+
+	/* print cp registers for all instances */
+	if (!adev->gfx.ipdump_cp)
+		return;
+
+	reg_count = ARRAY_SIZE(gc_cp_reg_list_10);
+
+	for (i = 0; i < adev->gfx.mec.num_mec; i++) {
+		for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
+			for (k = 0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
+				drm_printf(p, "mec %d, pipe %d, queue %d\n", i, j, k);
+				for (reg = 0; reg < reg_count; reg++) {
+					drm_printf(p, "%-50s \t 0x%08x\n",
+						   gc_cp_reg_list_10[reg].reg_name,
+						   adev->gfx.ipdump_cp[index + reg]);
+				}
+				index += reg_count;
+			}
+		}
+	}
 }
 
 static void gfx_v10_ip_dump(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	uint32_t i;
+	uint32_t i, j, k, reg, index = 0;
 	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_10_1);
 
 	if (!adev->gfx.ipdump_core)
@@ -9305,6 +9383,37 @@ static void gfx_v10_ip_dump(void *handle)
 	for (i = 0; i < reg_count; i++)
 		adev->gfx.ipdump_core[i] = RREG32(SOC15_REG_ENTRY_OFFSET(gc_reg_list_10_1[i]));
 	amdgpu_gfx_off_ctrl(adev, true);
+
+	/* dump cp registers for all instances */
+	if (!adev->gfx.ipdump_cp)
+		return;
+
+	reg_count = ARRAY_SIZE(gc_cp_reg_list_10);
+	amdgpu_gfx_off_ctrl(adev, false);
+	mutex_lock(&adev->srbm_mutex);
+	for (i = 0; i < adev->gfx.mec.num_mec; i++) {
+		for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
+			for (k = 0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
+				nv_grbm_select(adev, i, j, k, 0);
+
+				for (reg = 0; reg < reg_count; reg++) {
+					adev->gfx.ipdump_cp[index + reg] =
+						RREG32(SOC15_REG_ENTRY_OFFSET(
+							gc_cp_reg_list_10[reg]));
+				}
+				index += reg_count;
+				/*
+				 * Reading all registers take long and causes watchdog timeout,
+				 * releasing core for every set of registers read helps in cpu
+				 * core not being locked.
+				 */
+				msleep(1);
+			}
+		}
+	}
+	nv_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+	amdgpu_gfx_off_ctrl(adev, true);
 }
 
 static const struct amd_ip_funcs gfx_v10_0_ip_funcs = {
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8D8CBC09
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2024 09:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F23410F3EA;
	Wed, 22 May 2024 07:30:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894AC10EA87
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2024 07:30:24 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 44M7UJb1009424; Wed, 22 May 2024 13:00:19 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 44M7UJaa009423;
 Wed, 22 May 2024 13:00:19 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 07/10] drm/amdgpu: add gfx11 registers support in ipdump
Date: Wed, 22 May 2024 12:59:47 +0530
Message-Id: <20240522072950.9162-8-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522072950.9162-1-sunil.khatri@amd.com>
References: <20240522072950.9162-1-sunil.khatri@amd.com>
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

Add general registers of gfx11 in ipdump for
devcoredump support.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 107 ++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index e5882da8332a..6046e3b1b626 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -94,6 +94,78 @@ MODULE_FIRMWARE("amdgpu/gc_11_5_1_me.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_5_1_mec.bin");
 MODULE_FIRMWARE("amdgpu/gc_11_5_1_rlc.bin");
 
+static const struct amdgpu_hwip_reg_entry gc_reg_list_11_0[] = {
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS2),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS3),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_STALLED_STAT1),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_STALLED_STAT2),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_STALLED_STAT3),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPC_STALLED_STAT1),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPF_STALLED_STAT1),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_BUSY_STAT),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPC_BUSY_STAT),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPF_BUSY_STAT),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPC_BUSY_STAT2),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPF_BUSY_STAT2),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPF_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_GFX_ERROR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_GFX_HPD_STATUS0),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB_BASE),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB_WPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB0_BASE),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB0_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB0_WPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB1_BASE),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB1_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_RB1_WPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB1_CMD_BUFSZ),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB2_CMD_BUFSZ),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB1_BASE_LO),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB1_BASE_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB1_BUFSZ),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB2_BASE_LO),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB2_BASE_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_IB2_BUFSZ),
+	SOC15_REG_ENTRY_STR(GC, 0, regCPF_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regCPC_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regCPG_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regGDS_PROTECTION_FAULT),
+	SOC15_REG_ENTRY_STR(GC, 0, regGDS_VM_PROTECTION_FAULT),
+	SOC15_REG_ENTRY_STR(GC, 0, regIA_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regIA_UTCL1_STATUS_2),
+	SOC15_REG_ENTRY_STR(GC, 0, regPA_CL_CNTL_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regRLC_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regRMI_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regSQC_CACHES),
+	SOC15_REG_ENTRY_STR(GC, 0, regSQG_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regWD_UTCL1_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regGCVM_L2_PROTECTION_FAULT_CNTL),
+	SOC15_REG_ENTRY_STR(GC, 0, regGCVM_L2_PROTECTION_FAULT_STATUS),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_DEBUG),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MEC_CNTL),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MES_CNTL),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MEC1_INSTR_PNTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MES_DEBUG_INTERRUPT_INSTR_PNTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MES_INSTR_PNTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_ME_INSTR_PNTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_PFP_INSTR_PNTR),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_CPC_STATUS),
+	/* cp header registers */
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MEC_ME1_HEADER_DUMP),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_PFP_HEADER_DUMP),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_ME_HEADER_DUMP),
+	SOC15_REG_ENTRY_STR(GC, 0, regCP_MES_HEADER_DUMP),
+	/* SE status registers */
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS_SE0),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS_SE1),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS_SE2),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS_SE3),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS_SE4),
+	SOC15_REG_ENTRY_STR(GC, 0, regGRBM_STATUS_SE5)
+};
+
 static const struct soc15_reg_golden golden_settings_gc_11_0[] = {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, regTCP_CNTL, 0x20000000, 0x20000000)
 };
@@ -1331,6 +1403,20 @@ static int gfx_v11_0_rlc_backdoor_autoload_enable(struct amdgpu_device *adev)
 	return 0;
 }
 
+static void gfx_v11_0_alloc_ip_dump(struct amdgpu_device *adev)
+{
+	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_11_0);
+	uint32_t *ptr;
+
+	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
+	if (ptr == NULL) {
+		DRM_ERROR("Failed to allocate memory for IP Dump\n");
+		adev->gfx.ip_dump_core = NULL;
+	} else {
+		adev->gfx.ip_dump_core = ptr;
+	}
+}
+
 static int gfx_v11_0_sw_init(void *handle)
 {
 	int i, j, k, r, ring_id = 0;
@@ -1485,6 +1571,8 @@ static int gfx_v11_0_sw_init(void *handle)
 		return -EINVAL;
 	}
 
+	gfx_v11_0_alloc_ip_dump(adev);
+
 	return 0;
 }
 
@@ -1544,6 +1632,8 @@ static int gfx_v11_0_sw_fini(void *handle)
 
 	gfx_v11_0_free_microcode(adev);
 
+	kfree(adev->gfx.ip_dump_core);
+
 	return 0;
 }
 
@@ -6158,6 +6248,21 @@ static void gfx_v11_0_emit_mem_sync(struct amdgpu_ring *ring)
 	amdgpu_ring_write(ring, gcr_cntl); /* GCR_CNTL */
 }
 
+static void gfx_v11_ip_dump(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	uint32_t i;
+	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_11_0);
+
+	if (!adev->gfx.ip_dump_core)
+		return;
+
+	amdgpu_gfx_off_ctrl(adev, false);
+	for (i = 0; i < reg_count; i++)
+		adev->gfx.ip_dump_core[i] = RREG32(SOC15_REG_ENTRY_OFFSET(gc_reg_list_11_0[i]));
+	amdgpu_gfx_off_ctrl(adev, true);
+}
+
 static const struct amd_ip_funcs gfx_v11_0_ip_funcs = {
 	.name = "gfx_v11_0",
 	.early_init = gfx_v11_0_early_init,
@@ -6176,7 +6281,7 @@ static const struct amd_ip_funcs gfx_v11_0_ip_funcs = {
 	.set_clockgating_state = gfx_v11_0_set_clockgating_state,
 	.set_powergating_state = gfx_v11_0_set_powergating_state,
 	.get_clockgating_state = gfx_v11_0_get_clockgating_state,
-	.dump_ip_state = NULL,
+	.dump_ip_state = gfx_v11_ip_dump,
 	.print_ip_state = NULL,
 };
 
-- 
2.34.1


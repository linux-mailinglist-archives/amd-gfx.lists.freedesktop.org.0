Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402458CBC05
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2024 09:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF30610E775;
	Wed, 22 May 2024 07:30:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699F910E775
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2024 07:30:24 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 44M7UJm4009404; Wed, 22 May 2024 13:00:19 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 44M7UJDC009403;
 Wed, 22 May 2024 13:00:19 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 03/10] drm/amdgpu: add gfx queue support of gfx10 in ipdump
Date: Wed, 22 May 2024 12:59:43 +0530
Message-Id: <20240522072950.9162-4-sunil.khatri@amd.com>
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

Add gfx queue register for all instances in devcoredump
for gfx10.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c  | 90 +++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
index 77ab5d0fd592..a9d9f372a7c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
@@ -437,6 +437,7 @@ struct amdgpu_gfx {
 	/* IP reg dump */
 	uint32_t			*ip_dump_core;
 	uint32_t			*ip_dump_cp_queues;
+	uint32_t			*ip_dump_gfx_queues;
 };
 
 struct amdgpu_gfx_ras_reg_entry {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index ab378d9a74c8..a4bbbf6d5d1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -424,6 +424,33 @@ static const struct amdgpu_hwip_reg_entry gc_cp_reg_list_10[] = {
 	SOC15_REG_ENTRY_STR(GC, 0, mmCP_HQD_DEQUEUE_STATUS)
 };
 
+static const struct amdgpu_hwip_reg_entry gc_gfx_queue_reg_list_10[] = {
+	/* gfx queue registers */
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_ACTIVE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_QUEUE_PRIORITY),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_BASE),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_BASE_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_OFFSET),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CSMD_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_WPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_WPTR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_DEQUEUE_REQUEST),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_MAPPED),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_QUE_MGR_CONTROL),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_HQ_CONTROL0),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_HQ_STATUS0),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CE_WPTR_POLL_ADDR_LO),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CE_WPTR_POLL_ADDR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CE_OFFSET),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CE_CSMD_RPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CE_WPTR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HQD_CE_WPTR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_MQD_BASE_ADDR),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_MQD_BASE_ADDR_HI),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB_WPTR_POLL_ADDR_LO),
+	SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB_WPTR_POLL_ADDR_HI)
+};
+
 static const struct soc15_reg_golden golden_settings_gc_10_1[] = {
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00400014),
 	SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_CPF_CLK_CTRL, 0xfcff8fff, 0xf8000100),
@@ -4664,6 +4691,19 @@ static void gfx_v10_0_alloc_ip_dump(struct amdgpu_device *adev)
 	} else {
 		adev->gfx.ip_dump_cp_queues = ptr;
 	}
+
+	/* Allocate memory for gfx queue registers for all the instances */
+	reg_count = ARRAY_SIZE(gc_gfx_queue_reg_list_10);
+	inst = adev->gfx.me.num_me * adev->gfx.me.num_pipe_per_me *
+		adev->gfx.me.num_queue_per_pipe;
+
+	ptr = kcalloc(reg_count * inst, sizeof(uint32_t), GFP_KERNEL);
+	if (ptr == NULL) {
+		DRM_ERROR("Failed to allocate memory for GFX CP IP Dump\n");
+		adev->gfx.ip_dump_gfx_queues = NULL;
+	} else {
+		adev->gfx.ip_dump_gfx_queues = ptr;
+	}
 }
 
 static int gfx_v10_0_sw_init(void *handle)
@@ -4874,6 +4914,7 @@ static int gfx_v10_0_sw_fini(void *handle)
 
 	kfree(adev->gfx.ip_dump_core);
 	kfree(adev->gfx.ip_dump_cp_queues);
+	kfree(adev->gfx.ip_dump_gfx_queues);
 
 	return 0;
 }
@@ -9381,6 +9422,30 @@ static void gfx_v10_ip_print(void *handle, struct drm_printer *p)
 			}
 		}
 	}
+
+	/* print gfx queue registers for all instances */
+	if (!adev->gfx.ip_dump_gfx_queues)
+		return;
+
+	reg_count = ARRAY_SIZE(gc_gfx_queue_reg_list_10);
+	drm_printf(p, "\nnum_me: %d num_pipe: %d num_queue: %d\n",
+		   adev->gfx.me.num_me,
+		   adev->gfx.me.num_pipe_per_me,
+		   adev->gfx.me.num_queue_per_pipe);
+
+	for (i = 0; i < adev->gfx.me.num_me; i++) {
+		for (j = 0; j < adev->gfx.me.num_pipe_per_me; j++) {
+			for (k = 0; k < adev->gfx.me.num_queue_per_pipe; k++) {
+				drm_printf(p, "\nme %d, pipe %d, queue %d\n", i, j, k);
+				for (reg = 0; reg < reg_count; reg++) {
+					drm_printf(p, "%-50s \t 0x%08x\n",
+						   gc_gfx_queue_reg_list_10[reg].reg_name,
+						   adev->gfx.ip_dump_gfx_queues[index + reg]);
+				}
+				index += reg_count;
+			}
+		}
+	}
 }
 
 static void gfx_v10_ip_dump(void *handle)
@@ -9422,6 +9487,31 @@ static void gfx_v10_ip_dump(void *handle)
 	nv_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
 	amdgpu_gfx_off_ctrl(adev, true);
+
+	/* dump gfx queue registers for all instances */
+	if (!adev->gfx.ip_dump_gfx_queues)
+		return;
+
+	reg_count = ARRAY_SIZE(gc_gfx_queue_reg_list_10);
+	amdgpu_gfx_off_ctrl(adev, false);
+	mutex_lock(&adev->srbm_mutex);
+	for (i = 0; i < adev->gfx.me.num_me; i++) {
+		for (j = 0; j < adev->gfx.me.num_pipe_per_me; j++) {
+			for (k = 0; k < adev->gfx.me.num_queue_per_pipe; k++) {
+				nv_grbm_select(adev, i, j, k, 0);
+
+				for (reg = 0; reg < reg_count; reg++) {
+					adev->gfx.ip_dump_gfx_queues[index + reg] =
+						RREG32(SOC15_REG_ENTRY_OFFSET(
+							gc_gfx_queue_reg_list_10[reg]));
+				}
+				index += reg_count;
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


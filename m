Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C81EABA3
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7885A6E317;
	Mon,  1 Jun 2020 18:21:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97156E314
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:40 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id w3so9992721qkb.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/pNXx7mQs7MItYBwC7v35putmsVB3IEO3x/Gi4hvIqE=;
 b=eIb4u7f328eeuP2zO61Pq1D8ehREDguUATQEBJhURSNgEu8UDXIOenINf4du2QukdE
 Yf3/HvoOQgsHCyXumNz0uPcGbfcfY8WgpS5kfqEUvvGjdNYttOQDUI+IdqJOD97QHWwh
 haWKdVjYeqEkGMUtzGJMsSh2e2IYLFcxHh7Q5nGrqZcXskK3QZbO7wHjxUI+kLHtrUKk
 nH4QMT0+8JweBDH7Eo6ObvnOhap0mk9KG5a1IQ8/PscOhJ8nbhwMItOLTSKq3Mr6CLty
 FjwilLZ2wo0iVmmT7KckOHMTja9Q8mVvWdY3Ecz2+EXb5WCljlgKUrAKDtf1e9f/XEaX
 XsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/pNXx7mQs7MItYBwC7v35putmsVB3IEO3x/Gi4hvIqE=;
 b=NgWhjM4Hz1trdQUGdGz/UtcEdKXsEAt8bTyYYpzUzm9x78O4HmBt2rlpRiiLpFsjDH
 SjBRuuVu1RIC8/4OOLHARKT528SwIitnWu5IQKtT2hiEEg6Z5Ea4wVBcctdF4IymZ/Zq
 oazQsjxYkrylmvofWnZNkUjDsNZtaun/0aNLVbtvfJMiQ4wEKCxMjPj/zAn/LvtbhSjO
 hp1vr0XRC8JBJXk4+8XDr1F0DG9b7Ulq4T12/cUZbavuwdw0MhUgeOBuYCEWaxiUBOZn
 8NyZK2URm1OM9RyNkFaw8HU0yYNO1httlYRvL++DapvvogYatnKffuVFNcM0BD8w1Xf+
 DB7g==
X-Gm-Message-State: AOAM530XC/a6EXxL7CwCXEfGOYhX4i2lp72LT1mMIT+W+hcO4ZrEuXDH
 8GOmxV+e414NfGEibKn63XR/UnzG
X-Google-Smtp-Source: ABdhPJxucExeUcMaixqDrSW0d6zFldAYAOiolv8XFy07HKYLnVisthNhzK/+aXDB8h75IGZfd00PZA==
X-Received: by 2002:ae9:c10d:: with SMTP id z13mr19839175qki.3.1591035698559; 
 Mon, 01 Jun 2020 11:21:38 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 116/207] drm/amdkfd: Support Sienna_Cichlid KFD v4
Date: Mon,  1 Jun 2020 14:19:23 -0400
Message-Id: <20200601182054.1267858-27-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Yong Zhao <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Yong Zhao <Yong.Zhao@amd.com>

v4: drop get_tile_config, comment out other callbacks

Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |  13 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  | 834 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c         |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  21 +
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c  |   1 +
 .../gpu/drm/amd/amdkfd/kfd_packet_manager.c   |   1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |   1 +
 8 files changed, 867 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 179070b12cde..bfcfb034aed5 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -176,12 +176,13 @@ AMDKFD_PATH := ../amdkfd
 include $(FULL_AMD_PATH)/amdkfd/Makefile
 amdgpu-y += $(AMDKFD_FILES)
 amdgpu-y += \
-	 amdgpu_amdkfd_fence.o \
-	 amdgpu_amdkfd_gpuvm.o \
-	 amdgpu_amdkfd_gfx_v8.o \
-	 amdgpu_amdkfd_gfx_v9.o \
-	 amdgpu_amdkfd_arcturus.o \
-	 amdgpu_amdkfd_gfx_v10.o
+	amdgpu_amdkfd_fence.o \
+	amdgpu_amdkfd_gpuvm.o \
+	amdgpu_amdkfd_gfx_v8.o \
+	amdgpu_amdkfd_gfx_v9.o \
+	amdgpu_amdkfd_arcturus.o \
+	amdgpu_amdkfd_gfx_v10.o \
+	amdgpu_amdkfd_gfx_v10_3.o
 
 ifneq ($(CONFIG_DRM_AMDGPU_CIK),)
 amdgpu-y += amdgpu_amdkfd_gfx_v7.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
new file mode 100644
index 000000000000..7e59e473a190
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
@@ -0,0 +1,834 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include <linux/mmu_context.h>
+#include "amdgpu.h"
+#include "amdgpu_amdkfd.h"
+#include "gc/gc_10_3_0_offset.h"
+#include "gc/gc_10_3_0_sh_mask.h"
+#include "navi10_enum.h"
+#include "oss/osssys_5_0_0_offset.h"
+#include "oss/osssys_5_0_0_sh_mask.h"
+#include "soc15_common.h"
+#include "v10_structs.h"
+#include "nv.h"
+#include "nvd.h"
+#include "gfxhub_v2_1.h"
+
+enum hqd_dequeue_request_type {
+	NO_ACTION = 0,
+	DRAIN_PIPE,
+	RESET_WAVES,
+	SAVE_WAVES
+};
+
+static inline struct amdgpu_device *get_amdgpu_device(struct kgd_dev *kgd)
+{
+	return (struct amdgpu_device *)kgd;
+}
+
+static void lock_srbm(struct kgd_dev *kgd, uint32_t mec, uint32_t pipe,
+			uint32_t queue, uint32_t vmid)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	mutex_lock(&adev->srbm_mutex);
+	nv_grbm_select(adev, mec, pipe, queue, vmid);
+}
+
+static void unlock_srbm(struct kgd_dev *kgd)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	nv_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+}
+
+static void acquire_queue(struct kgd_dev *kgd, uint32_t pipe_id,
+				uint32_t queue_id)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	uint32_t mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+	uint32_t pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+	lock_srbm(kgd, mec, pipe, queue_id, 0);
+}
+
+static uint64_t get_queue_mask(struct amdgpu_device *adev,
+			       uint32_t pipe_id, uint32_t queue_id)
+{
+	unsigned int bit = pipe_id * adev->gfx.mec.num_queue_per_pipe +
+			queue_id;
+
+	return 1ull << bit;
+}
+
+static void release_queue(struct kgd_dev *kgd)
+{
+	unlock_srbm(kgd);
+}
+
+static void program_sh_mem_settings_v10_3(struct kgd_dev *kgd, uint32_t vmid,
+					uint32_t sh_mem_config,
+					uint32_t sh_mem_ape1_base,
+					uint32_t sh_mem_ape1_limit,
+					uint32_t sh_mem_bases)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	lock_srbm(kgd, 0, 0, 0, vmid);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSH_MEM_CONFIG), sh_mem_config);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSH_MEM_BASES), sh_mem_bases);
+	/* APE1 no longer exists on GFX9 */
+
+	unlock_srbm(kgd);
+}
+
+/* ATC is defeatured on Sienna_Cichlid */
+static int set_pasid_vmid_mapping_v10_3(struct kgd_dev *kgd, unsigned int pasid,
+					unsigned int vmid)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	uint32_t value = pasid << IH_VMID_0_LUT__PASID__SHIFT;
+
+	/* Mapping vmid to pasid also for IH block */
+	pr_debug("mapping vmid %d -> pasid %d in IH block for GFX client\n",
+			vmid, pasid);
+	WREG32(SOC15_REG_OFFSET(OSSSYS, 0, mmIH_VMID_0_LUT) + vmid, value);
+
+	return 0;
+}
+
+static int init_interrupts_v10_3(struct kgd_dev *kgd, uint32_t pipe_id)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t mec;
+	uint32_t pipe;
+
+	mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+	pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+	lock_srbm(kgd, mec, pipe, 0, 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmCPC_INT_CNTL),
+		CP_INT_CNTL_RING0__TIME_STAMP_INT_ENABLE_MASK |
+		CP_INT_CNTL_RING0__OPCODE_ERROR_INT_ENABLE_MASK);
+
+	unlock_srbm(kgd);
+
+	return 0;
+}
+
+static uint32_t get_sdma_rlc_reg_offset(struct amdgpu_device *adev,
+				unsigned int engine_id,
+				unsigned int queue_id)
+{
+	uint32_t sdma_engine_reg_base = 0;
+	uint32_t sdma_rlc_reg_offset;
+
+	switch (engine_id) {
+	default:
+		dev_warn(adev->dev,
+			 "Invalid sdma engine id (%d), using engine id 0\n",
+			 engine_id);
+		/* fall through */
+	case 0:
+		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA0, 0,
+				mmSDMA0_RLC0_RB_CNTL) - mmSDMA0_RLC0_RB_CNTL;
+		break;
+	case 1:
+		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA1, 0,
+				mmSDMA1_RLC0_RB_CNTL) - mmSDMA0_RLC0_RB_CNTL;
+		break;
+	case 2:
+		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA2, 0,
+				mmSDMA2_RLC0_RB_CNTL) - mmSDMA2_RLC0_RB_CNTL;
+		break;
+	case 3:
+		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA3, 0,
+				mmSDMA3_RLC0_RB_CNTL) - mmSDMA2_RLC0_RB_CNTL;
+		break;
+	}
+
+	sdma_rlc_reg_offset = sdma_engine_reg_base
+		+ queue_id * (mmSDMA0_RLC1_RB_CNTL - mmSDMA0_RLC0_RB_CNTL);
+
+	pr_debug("RLC register offset for SDMA%d RLC%d: 0x%x\n", engine_id,
+			queue_id, sdma_rlc_reg_offset);
+
+	return sdma_rlc_reg_offset;
+}
+
+static inline struct v10_compute_mqd *get_mqd(void *mqd)
+{
+	return (struct v10_compute_mqd *)mqd;
+}
+
+static inline struct v10_sdma_mqd *get_sdma_mqd(void *mqd)
+{
+	return (struct v10_sdma_mqd *)mqd;
+}
+
+static int hqd_load_v10_3(struct kgd_dev *kgd, void *mqd, uint32_t pipe_id,
+			uint32_t queue_id, uint32_t __user *wptr,
+			uint32_t wptr_shift, uint32_t wptr_mask,
+			struct mm_struct *mm)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	struct v10_compute_mqd *m;
+	uint32_t *mqd_hqd;
+	uint32_t reg, hqd_base, data;
+
+	m = get_mqd(mqd);
+
+	pr_debug("Load hqd of pipe %d queue %d\n", pipe_id, queue_id);
+	acquire_queue(kgd, pipe_id, queue_id);
+
+	/* HIQ is set during driver init period with vmid set to 0*/
+	if (m->cp_hqd_vmid == 0) {
+		uint32_t value, mec, pipe;
+
+		mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+		pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+		pr_debug("kfd: set HIQ, mec:%d, pipe:%d, queue:%d.\n",
+			mec, pipe, queue_id);
+		value = RREG32(SOC15_REG_OFFSET(GC, 0, mmRLC_CP_SCHEDULERS));
+		value = REG_SET_FIELD(value, RLC_CP_SCHEDULERS, scheduler1,
+			((mec << 5) | (pipe << 3) | queue_id | 0x80));
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmRLC_CP_SCHEDULERS), value);
+	}
+
+	/* HQD registers extend from CP_MQD_BASE_ADDR to CP_HQD_EOP_WPTR_MEM. */
+	mqd_hqd = &m->cp_mqd_base_addr_lo;
+	hqd_base = SOC15_REG_OFFSET(GC, 0, mmCP_MQD_BASE_ADDR);
+
+	for (reg = hqd_base;
+	     reg <= SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_WPTR_HI); reg++)
+		WREG32(reg, mqd_hqd[reg - hqd_base]);
+
+
+	/* Activate doorbell logic before triggering WPTR poll. */
+	data = REG_SET_FIELD(m->cp_hqd_pq_doorbell_control,
+			     CP_HQD_PQ_DOORBELL_CONTROL, DOORBELL_EN, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL), data);
+
+	if (wptr) {
+		/* Don't read wptr with get_user because the user
+		 * context may not be accessible (if this function
+		 * runs in a work queue). Instead trigger a one-shot
+		 * polling read from memory in the CP. This assumes
+		 * that wptr is GPU-accessible in the queue's VMID via
+		 * ATC or SVM. WPTR==RPTR before starting the poll so
+		 * the CP starts fetching new commands from the right
+		 * place.
+		 *
+		 * Guessing a 64-bit WPTR from a 32-bit RPTR is a bit
+		 * tricky. Assume that the queue didn't overflow. The
+		 * number of valid bits in the 32-bit RPTR depends on
+		 * the queue size. The remaining bits are taken from
+		 * the saved 64-bit WPTR. If the WPTR wrapped, add the
+		 * queue size.
+		 */
+		uint32_t queue_size =
+			2 << REG_GET_FIELD(m->cp_hqd_pq_control,
+					   CP_HQD_PQ_CONTROL, QUEUE_SIZE);
+		uint64_t guessed_wptr = m->cp_hqd_pq_rptr & (queue_size - 1);
+
+		if ((m->cp_hqd_pq_wptr_lo & (queue_size - 1)) < guessed_wptr)
+			guessed_wptr += queue_size;
+		guessed_wptr += m->cp_hqd_pq_wptr_lo & ~(queue_size - 1);
+		guessed_wptr += (uint64_t)m->cp_hqd_pq_wptr_hi << 32;
+
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_WPTR_LO),
+		       lower_32_bits(guessed_wptr));
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_WPTR_HI),
+		       upper_32_bits(guessed_wptr));
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR),
+		       lower_32_bits((uint64_t)wptr));
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR_HI),
+		       upper_32_bits((uint64_t)wptr));
+		pr_debug("%s setting CP_PQ_WPTR_POLL_CNTL1 to %x\n", __func__,
+			 (uint32_t)get_queue_mask(adev, pipe_id, queue_id));
+		WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_PQ_WPTR_POLL_CNTL1),
+		       (uint32_t)get_queue_mask(adev, pipe_id, queue_id));
+	}
+
+	/* Start the EOP fetcher */
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_EOP_RPTR),
+	       REG_SET_FIELD(m->cp_hqd_eop_rptr,
+			     CP_HQD_EOP_RPTR, INIT_FETCHER, 1));
+
+	data = REG_SET_FIELD(m->cp_hqd_active, CP_HQD_ACTIVE, ACTIVE, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_ACTIVE), data);
+
+	release_queue(kgd);
+
+	return 0;
+}
+
+static int hiq_mqd_load_v10_3(struct kgd_dev *kgd, void *mqd,
+			    uint32_t pipe_id, uint32_t queue_id,
+			    uint32_t doorbell_off)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq.ring;
+	struct v10_compute_mqd *m;
+	uint32_t mec, pipe;
+	int r;
+
+	m = get_mqd(mqd);
+
+	acquire_queue(kgd, pipe_id, queue_id);
+
+	mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+	pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+	pr_debug("kfd: set HIQ, mec:%d, pipe:%d, queue:%d.\n",
+		 mec, pipe, queue_id);
+
+	spin_lock(&adev->gfx.kiq.ring_lock);
+	r = amdgpu_ring_alloc(kiq_ring, 7);
+	if (r) {
+		pr_err("Failed to alloc KIQ (%d).\n", r);
+		goto out_unlock;
+	}
+
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_MAP_QUEUES, 5));
+	amdgpu_ring_write(kiq_ring,
+			  PACKET3_MAP_QUEUES_QUEUE_SEL(0) | /* Queue_Sel */
+			  PACKET3_MAP_QUEUES_VMID(m->cp_hqd_vmid) | /* VMID */
+			  PACKET3_MAP_QUEUES_QUEUE(queue_id) |
+			  PACKET3_MAP_QUEUES_PIPE(pipe) |
+			  PACKET3_MAP_QUEUES_ME((mec - 1)) |
+			  PACKET3_MAP_QUEUES_QUEUE_TYPE(0) | /*queue_type: normal compute queue */
+			  PACKET3_MAP_QUEUES_ALLOC_FORMAT(0) | /* alloc format: all_on_one_pipe */
+			  PACKET3_MAP_QUEUES_ENGINE_SEL(1) | /* engine_sel: hiq */
+			  PACKET3_MAP_QUEUES_NUM_QUEUES(1)); /* num_queues: must be 1 */
+	amdgpu_ring_write(kiq_ring,
+			  PACKET3_MAP_QUEUES_DOORBELL_OFFSET(doorbell_off));
+	amdgpu_ring_write(kiq_ring, m->cp_mqd_base_addr_lo);
+	amdgpu_ring_write(kiq_ring, m->cp_mqd_base_addr_hi);
+	amdgpu_ring_write(kiq_ring, m->cp_hqd_pq_wptr_poll_addr_lo);
+	amdgpu_ring_write(kiq_ring, m->cp_hqd_pq_wptr_poll_addr_hi);
+	amdgpu_ring_commit(kiq_ring);
+
+out_unlock:
+	spin_unlock(&adev->gfx.kiq.ring_lock);
+	release_queue(kgd);
+
+	return r;
+}
+
+static int hqd_dump_v10_3(struct kgd_dev *kgd,
+			uint32_t pipe_id, uint32_t queue_id,
+			uint32_t (**dump)[2], uint32_t *n_regs)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t i = 0, reg;
+#define HQD_N_REGS 56
+#define DUMP_REG(addr) do {				\
+		if (WARN_ON_ONCE(i >= HQD_N_REGS))	\
+			break;				\
+		(*dump)[i][0] = (addr) << 2;		\
+		(*dump)[i++][1] = RREG32(addr);		\
+	} while (0)
+
+	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	if (*dump == NULL)
+		return -ENOMEM;
+
+	acquire_queue(kgd, pipe_id, queue_id);
+
+	for (reg = SOC15_REG_OFFSET(GC, 0, mmCP_MQD_BASE_ADDR);
+	     reg <= SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_WPTR_HI); reg++)
+		DUMP_REG(reg);
+
+	release_queue(kgd);
+
+	WARN_ON_ONCE(i != HQD_N_REGS);
+	*n_regs = i;
+
+	return 0;
+}
+
+static int hqd_sdma_load_v10_3(struct kgd_dev *kgd, void *mqd,
+			     uint32_t __user *wptr, struct mm_struct *mm)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	struct v10_sdma_mqd *m;
+	uint32_t sdma_rlc_reg_offset;
+	unsigned long end_jiffies;
+	uint32_t data;
+	uint64_t data64;
+	uint64_t __user *wptr64 = (uint64_t __user *)wptr;
+
+	m = get_sdma_mqd(mqd);
+	sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev, m->sdma_engine_id,
+					    m->sdma_queue_id);
+
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL,
+		m->sdmax_rlcx_rb_cntl & (~SDMA0_RLC0_RB_CNTL__RB_ENABLE_MASK));
+
+	end_jiffies = msecs_to_jiffies(2000) + jiffies;
+	while (true) {
+		data = RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_CONTEXT_STATUS);
+		if (data & SDMA0_RLC0_CONTEXT_STATUS__IDLE_MASK)
+			break;
+		if (time_after(jiffies, end_jiffies)) {
+			pr_err("SDMA RLC not idle in %s\n", __func__);
+			return -ETIME;
+		}
+		usleep_range(500, 1000);
+	}
+
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_DOORBELL_OFFSET,
+	       m->sdmax_rlcx_doorbell_offset);
+
+	data = REG_SET_FIELD(m->sdmax_rlcx_doorbell, SDMA0_RLC0_DOORBELL,
+			     ENABLE, 1);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_DOORBELL, data);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_RPTR,
+				m->sdmax_rlcx_rb_rptr);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_RPTR_HI,
+				m->sdmax_rlcx_rb_rptr_hi);
+
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_MINOR_PTR_UPDATE, 1);
+	if (read_user_wptr(mm, wptr64, data64)) {
+		WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_WPTR,
+		       lower_32_bits(data64));
+		WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_WPTR_HI,
+		       upper_32_bits(data64));
+	} else {
+		WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_WPTR,
+		       m->sdmax_rlcx_rb_rptr);
+		WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_WPTR_HI,
+		       m->sdmax_rlcx_rb_rptr_hi);
+	}
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_MINOR_PTR_UPDATE, 0);
+
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_BASE, m->sdmax_rlcx_rb_base);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_BASE_HI,
+			m->sdmax_rlcx_rb_base_hi);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_RPTR_ADDR_LO,
+			m->sdmax_rlcx_rb_rptr_addr_lo);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_RPTR_ADDR_HI,
+			m->sdmax_rlcx_rb_rptr_addr_hi);
+
+	data = REG_SET_FIELD(m->sdmax_rlcx_rb_cntl, SDMA0_RLC0_RB_CNTL,
+			     RB_ENABLE, 1);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL, data);
+
+	return 0;
+}
+
+static int hqd_sdma_dump_v10_3(struct kgd_dev *kgd,
+			     uint32_t engine_id, uint32_t queue_id,
+			     uint32_t (**dump)[2], uint32_t *n_regs)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev,
+			engine_id, queue_id);
+	uint32_t i = 0, reg;
+#undef HQD_N_REGS
+#define HQD_N_REGS (19+6+7+10)
+
+	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	if (*dump == NULL)
+		return -ENOMEM;
+
+	for (reg = mmSDMA0_RLC0_RB_CNTL; reg <= mmSDMA0_RLC0_DOORBELL; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = mmSDMA0_RLC0_STATUS; reg <= mmSDMA0_RLC0_CSA_ADDR_HI; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = mmSDMA0_RLC0_IB_SUB_REMAIN;
+	     reg <= mmSDMA0_RLC0_MINOR_PTR_UPDATE; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = mmSDMA0_RLC0_MIDCMD_DATA0;
+	     reg <= mmSDMA0_RLC0_MIDCMD_CNTL; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+
+	WARN_ON_ONCE(i != HQD_N_REGS);
+	*n_regs = i;
+
+	return 0;
+}
+
+static bool hqd_is_occupied_v10_3(struct kgd_dev *kgd, uint64_t queue_address,
+				uint32_t pipe_id, uint32_t queue_id)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t act;
+	bool retval = false;
+	uint32_t low, high;
+
+	acquire_queue(kgd, pipe_id, queue_id);
+	act = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_ACTIVE));
+	if (act) {
+		low = lower_32_bits(queue_address >> 8);
+		high = upper_32_bits(queue_address >> 8);
+
+		if (low == RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_BASE)) &&
+		   high == RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_PQ_BASE_HI)))
+			retval = true;
+	}
+	release_queue(kgd);
+	return retval;
+}
+
+static bool hqd_sdma_is_occupied_v10_3(struct kgd_dev *kgd, void *mqd)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	struct v10_sdma_mqd *m;
+	uint32_t sdma_rlc_reg_offset;
+	uint32_t sdma_rlc_rb_cntl;
+
+	m = get_sdma_mqd(mqd);
+	sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev, m->sdma_engine_id,
+					    m->sdma_queue_id);
+
+	sdma_rlc_rb_cntl = RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL);
+
+	if (sdma_rlc_rb_cntl & SDMA0_RLC0_RB_CNTL__RB_ENABLE_MASK)
+		return true;
+
+	return false;
+}
+
+static int hqd_destroy_v10_3(struct kgd_dev *kgd, void *mqd,
+				enum kfd_preempt_type reset_type,
+				unsigned int utimeout, uint32_t pipe_id,
+				uint32_t queue_id)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	enum hqd_dequeue_request_type type;
+	unsigned long end_jiffies;
+	uint32_t temp;
+	struct v10_compute_mqd *m = get_mqd(mqd);
+
+	acquire_queue(kgd, pipe_id, queue_id);
+
+	if (m->cp_hqd_vmid == 0)
+		WREG32_FIELD15(GC, 0, RLC_CP_SCHEDULERS, scheduler1, 0);
+
+	switch (reset_type) {
+	case KFD_PREEMPT_TYPE_WAVEFRONT_DRAIN:
+		type = DRAIN_PIPE;
+		break;
+	case KFD_PREEMPT_TYPE_WAVEFRONT_RESET:
+		type = RESET_WAVES;
+		break;
+	default:
+		type = DRAIN_PIPE;
+		break;
+	}
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_DEQUEUE_REQUEST), type);
+
+	end_jiffies = (utimeout * HZ / 1000) + jiffies;
+	while (true) {
+		temp = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_HQD_ACTIVE));
+		if (!(temp & CP_HQD_ACTIVE__ACTIVE_MASK))
+			break;
+		if (time_after(jiffies, end_jiffies)) {
+			pr_err("cp queue pipe %d queue %d preemption failed\n",
+					pipe_id, queue_id);
+			release_queue(kgd);
+			return -ETIME;
+		}
+		usleep_range(500, 1000);
+	}
+
+	release_queue(kgd);
+	return 0;
+}
+
+static int hqd_sdma_destroy_v10_3(struct kgd_dev *kgd, void *mqd,
+				unsigned int utimeout)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	struct v10_sdma_mqd *m;
+	uint32_t sdma_rlc_reg_offset;
+	uint32_t temp;
+	unsigned long end_jiffies = (utimeout * HZ / 1000) + jiffies;
+
+	m = get_sdma_mqd(mqd);
+	sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev, m->sdma_engine_id,
+					    m->sdma_queue_id);
+
+	temp = RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL);
+	temp = temp & ~SDMA0_RLC0_RB_CNTL__RB_ENABLE_MASK;
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL, temp);
+
+	while (true) {
+		temp = RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_CONTEXT_STATUS);
+		if (temp & SDMA0_RLC0_CONTEXT_STATUS__IDLE_MASK)
+			break;
+		if (time_after(jiffies, end_jiffies)) {
+			pr_err("SDMA RLC not idle in %s\n", __func__);
+			return -ETIME;
+		}
+		usleep_range(500, 1000);
+	}
+
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_DOORBELL, 0);
+	WREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL,
+		RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_CNTL) |
+		SDMA0_RLC0_RB_CNTL__RB_ENABLE_MASK);
+
+	m->sdmax_rlcx_rb_rptr = RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_RPTR);
+	m->sdmax_rlcx_rb_rptr_hi =
+		RREG32(sdma_rlc_reg_offset + mmSDMA0_RLC0_RB_RPTR_HI);
+
+	return 0;
+}
+
+
+static int address_watch_disable_v10_3(struct kgd_dev *kgd)
+{
+	return 0;
+}
+
+static int address_watch_execute_v10_3(struct kgd_dev *kgd,
+					unsigned int watch_point_id,
+					uint32_t cntl_val,
+					uint32_t addr_hi,
+					uint32_t addr_lo)
+{
+	return 0;
+}
+
+static int wave_control_execute_v10_3(struct kgd_dev *kgd,
+					uint32_t gfx_index_val,
+					uint32_t sq_cmd)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t data = 0;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmGRBM_GFX_INDEX), gfx_index_val);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CMD), sq_cmd);
+
+	data = REG_SET_FIELD(data, GRBM_GFX_INDEX,
+		INSTANCE_BROADCAST_WRITES, 1);
+	data = REG_SET_FIELD(data, GRBM_GFX_INDEX,
+		SA_BROADCAST_WRITES, 1);
+	data = REG_SET_FIELD(data, GRBM_GFX_INDEX,
+		SE_BROADCAST_WRITES, 1);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmGRBM_GFX_INDEX), data);
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+static uint32_t address_watch_get_offset_v10_3(struct kgd_dev *kgd,
+					unsigned int watch_point_id,
+					unsigned int reg_offset)
+{
+	return 0;
+}
+
+static void set_vm_context_page_table_base_v10_3(struct kgd_dev *kgd, uint32_t vmid,
+		uint64_t page_table_base)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	/* SDMA is on gfxhub as well for Navi1* series */
+	gfxhub_v2_1_setup_vm_pt_regs(adev, vmid, page_table_base);
+}
+
+#if 0
+uint32_t enable_debug_trap_v10_3(struct kgd_dev *kgd,
+				uint32_t trap_debug_wave_launch_mode,
+				uint32_t vmid)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t data = 0;
+	uint32_t orig_wave_cntl_value;
+	uint32_t orig_stall_vmid;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	orig_wave_cntl_value = RREG32(SOC15_REG_OFFSET(GC,
+				0,
+				mmSPI_GDBG_WAVE_CNTL));
+	orig_stall_vmid = REG_GET_FIELD(orig_wave_cntl_value,
+			SPI_GDBG_WAVE_CNTL,
+			STALL_VMID);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
+
+	data = 0;
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), orig_stall_vmid);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+uint32_t disable_debug_trap_v10_3(struct kgd_dev *kgd)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+uint32_t set_wave_launch_trap_override_v10_3(struct kgd_dev *kgd,
+						uint32_t trap_override,
+						uint32_t trap_mask)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t data = 0;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
+
+	data = 0;
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK,
+			EXCP_EN, trap_mask);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_MASK,
+			REPLACE, trap_override);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), data);
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL, STALL_RA, 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+uint32_t set_wave_launch_mode_v10_3(struct kgd_dev *kgd,
+					uint8_t wave_launch_mode,
+					uint32_t vmid)
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+	uint32_t data = 0;
+	bool is_stall_mode;
+	bool is_mode_set;
+
+	is_stall_mode = (wave_launch_mode == 4);
+	is_mode_set = (wave_launch_mode != 0 && wave_launch_mode != 4);
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+			VMID_MASK, is_mode_set ? 1 << vmid : 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL2,
+			MODE, is_mode_set ? wave_launch_mode : 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL2), data);
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL));
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL,
+			STALL_VMID, is_stall_mode ? 1 << vmid : 0);
+	data = REG_SET_FIELD(data, SPI_GDBG_WAVE_CNTL,
+			STALL_RA, is_stall_mode ? 1 : 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_WAVE_CNTL), data);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+/* kgd_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2 values
+ * The values read are:
+ *	ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloads.
+ *	atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics Offloads.
+ *	wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
+ *	gws_wait_time            -- Wait Count for Global Wave Syncs.
+ *	que_sleep_wait_time      -- Wait Count for Dequeue Retry.
+ *	sch_wave_wait_time       -- Wait Count for Scheduling Wave Message.
+ *	sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
+ *	deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
+ */
+void get_iq_wait_times_v10_3(struct kgd_dev *kgd,
+					uint32_t *wait_times)
+
+{
+	struct amdgpu_device *adev = get_amdgpu_device(kgd);
+
+	*wait_times = RREG32(SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2));
+}
+
+void build_grace_period_packet_info_v10_3(struct kgd_dev *kgd,
+						uint32_t wait_times,
+						uint32_t grace_period,
+						uint32_t *reg_offset,
+						uint32_t *reg_data)
+{
+	*reg_data = wait_times;
+
+	*reg_data = REG_SET_FIELD(*reg_data,
+			CP_IQ_WAIT_TIME2,
+			SCH_WAVE,
+			grace_period);
+
+	*reg_offset = mmCP_IQ_WAIT_TIME2;
+}
+#endif
+
+const struct kfd2kgd_calls gfx_v10_3_kfd2kgd = {
+	.program_sh_mem_settings = program_sh_mem_settings_v10_3,
+	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v10_3,
+	.init_interrupts = init_interrupts_v10_3,
+	.hqd_load = hqd_load_v10_3,
+	.hiq_mqd_load = hiq_mqd_load_v10_3,
+	.hqd_sdma_load = hqd_sdma_load_v10_3,
+	.hqd_dump = hqd_dump_v10_3,
+	.hqd_sdma_dump = hqd_sdma_dump_v10_3,
+	.hqd_is_occupied = hqd_is_occupied_v10_3,
+	.hqd_sdma_is_occupied = hqd_sdma_is_occupied_v10_3,
+	.hqd_destroy = hqd_destroy_v10_3,
+	.hqd_sdma_destroy = hqd_sdma_destroy_v10_3,
+	.address_watch_disable = address_watch_disable_v10_3,
+	.address_watch_execute = address_watch_execute_v10_3,
+	.wave_control_execute = wave_control_execute_v10_3,
+	.address_watch_get_offset = address_watch_get_offset_v10_3,
+	.get_atc_vmid_pasid_mapping_info = NULL,
+	.set_vm_context_page_table_base = set_vm_context_page_table_base_v10_3,
+	.get_hive_id = amdgpu_amdkfd_get_hive_id,
+#if 0
+	.enable_debug_trap = enable_debug_trap_v10_3,
+	.disable_debug_trap = disable_debug_trap_v10_3,
+	.set_wave_launch_trap_override = set_wave_launch_trap_override_v10_3,
+	.set_wave_launch_mode = set_wave_launch_mode_v10_3,
+	.get_iq_wait_times = get_iq_wait_times_v10_3,
+	.build_grace_period_packet_info = build_grace_period_packet_info_v10_3,
+#endif
+};
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 1009a3b8dcc2..9deadfd8f929 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -678,6 +678,7 @@ static int kfd_fill_gpu_cache_info(struct kfd_dev *kdev,
 	case CHIP_NAVI10:
 	case CHIP_NAVI12:
 	case CHIP_NAVI14:
+	case CHIP_SIENNA_CICHLID:
 		pcache_info = navi10_cache_info;
 		num_of_cache_types = ARRAY_SIZE(navi10_cache_info);
 		break;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 2c030c2b5b8d..25a2703621a7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -46,6 +46,7 @@ extern const struct kfd2kgd_calls gfx_v8_kfd2kgd;
 extern const struct kfd2kgd_calls gfx_v9_kfd2kgd;
 extern const struct kfd2kgd_calls arcturus_kfd2kgd;
 extern const struct kfd2kgd_calls gfx_v10_kfd2kgd;
+extern const struct kfd2kgd_calls gfx_v10_3_kfd2kgd;
 
 static const struct kfd2kgd_calls *kfd2kgd_funcs[] = {
 #ifdef KFD_SUPPORT_IOMMU_V2
@@ -72,6 +73,7 @@ static const struct kfd2kgd_calls *kfd2kgd_funcs[] = {
 	[CHIP_NAVI10] = &gfx_v10_kfd2kgd,
 	[CHIP_NAVI12] = &gfx_v10_kfd2kgd,
 	[CHIP_NAVI14] = &gfx_v10_kfd2kgd,
+	[CHIP_SIENNA_CICHLID] = &gfx_v10_3_kfd2kgd,
 };
 
 #ifdef KFD_SUPPORT_IOMMU_V2
@@ -458,6 +460,24 @@ static const struct kfd_device_info navi14_device_info = {
 	.num_sdma_queues_per_engine = 8,
 };
 
+static const struct kfd_device_info sienna_cichlid_device_info = {
+	.asic_family = CHIP_SIENNA_CICHLID,
+	.asic_name = "sienna_cichlid",
+	.max_pasid_bits = 16,
+	.max_no_of_hqd  = 24,
+	.doorbell_size  = 8,
+	.ih_ring_entry_size = 8 * sizeof(uint32_t),
+	.event_interrupt_class = &event_interrupt_class_v9,
+	.num_of_watch_points = 4,
+	.mqd_size_aligned = MQD_SIZE_ALIGNED,
+	.needs_iommu_device = false,
+	.supports_cwsr = true,
+	.needs_pci_atomics = false,
+	.num_sdma_engines = 4,
+	.num_xgmi_sdma_engines = 0,
+	.num_sdma_queues_per_engine = 8,
+};
+
 /* For each entry, [0] is regular and [1] is virtualisation device. */
 static const struct kfd_device_info *kfd_supported_devices[][2] = {
 #ifdef KFD_SUPPORT_IOMMU_V2
@@ -480,6 +500,7 @@ static const struct kfd_device_info *kfd_supported_devices[][2] = {
 	[CHIP_NAVI10] = {&navi10_device_info, NULL},
 	[CHIP_NAVI12] = {&navi12_device_info, &navi12_device_info},
 	[CHIP_NAVI14] = {&navi14_device_info, NULL},
+	[CHIP_SIENNA_CICHLID] = {&sienna_cichlid_device_info, NULL},
 };
 
 static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 6293017bd5bf..fcc927c2f887 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -1943,6 +1943,7 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 	case CHIP_NAVI10:
 	case CHIP_NAVI12:
 	case CHIP_NAVI14:
+	case CHIP_SIENNA_CICHLID:
 		device_queue_manager_init_v10_navi10(&dqm->asic_ops);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
index 78714f9a8b11..b4674cf73132 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -415,6 +415,7 @@ int kfd_init_apertures(struct kfd_process *process)
 			case CHIP_NAVI10:
 			case CHIP_NAVI12:
 			case CHIP_NAVI14:
+			case CHIP_SIENNA_CICHLID:
 				kfd_init_apertures_v9(pdd, id);
 				break;
 			default:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
index 685ca82d42fe..89d7f08d749f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
@@ -245,6 +245,7 @@ int pm_init(struct packet_manager *pm, struct device_queue_manager *dqm)
 	case CHIP_NAVI10:
 	case CHIP_NAVI12:
 	case CHIP_NAVI14:
+	case CHIP_SIENNA_CICHLID:
 		pm->pmf = &kfd_v9_pm_funcs;
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index d5e2585d6f34..4025efc619c7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1363,6 +1363,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	case CHIP_NAVI10:
 	case CHIP_NAVI12:
 	case CHIP_NAVI14:
+	case CHIP_SIENNA_CICHLID:
 		dev->node_props.capability |= ((HSA_CAP_DOORBELL_TYPE_2_0 <<
 			HSA_CAP_DOORBELL_TYPE_TOTALBITS_SHIFT) &
 			HSA_CAP_DOORBELL_TYPE_TOTALBITS_MASK);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

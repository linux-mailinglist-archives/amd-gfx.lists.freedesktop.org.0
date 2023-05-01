Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01EB6F2C58
	for <lists+amd-gfx@lfdr.de>; Mon,  1 May 2023 04:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507110E224;
	Mon,  1 May 2023 02:59:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1138110E209;
 Mon,  1 May 2023 02:59:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F76160E98;
 Mon,  1 May 2023 02:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472F9C4339B;
 Mon,  1 May 2023 02:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682909978;
 bh=dk5EWtuiM8lVJnrKszvOT7TER6QdEt3BdEy7DXqdyZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S5FOGm/Bs6+jm/aX1R7pVYNIJkZ8Y7Cv+/ILXO2omC6wc7u4EsLjinSqiMqqIflzn
 YTDa2yDpjcDwZW3pW/BZ5gzfJ+R7B62ujSjdq9mLpgvEi5OeVEDYQwoUKW6l4dx/ku
 britw5SNGLbmxinSg+fWEAOi2VmaDsl0K2WxUKrO5gWM6GoBq34MUgHHfXrT2pZKUA
 Dy8jTMpzswc+oo3j5qETEvLwtPvqBLcKk5sq+xlhKfv7YOCKon6fqQDvzR0P3+4hGI
 c70AmGnz0zqGoH/WWmSKWYOQUyK4QqAVnBcqjbzAg76p7hqgjVYDL6lKkFOB6yE6fd
 6x2Q8mYqfVx4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 41/44] drm/amdgpu: Enable IH retry CAM on GFX9
Date: Sun, 30 Apr 2023 22:56:29 -0400
Message-Id: <20230501025632.3253067-41-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501025632.3253067-1-sashal@kernel.org>
References: <20230501025632.3253067-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Mukul Joshi <mukul.joshi@amd.com>,
 tao.zhou1@amd.com, dri-devel@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, lijo.lazar@amd.com, le.ma@amd.com,
 kent.russell@amd.com, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit 318e431b306e966d2ee99e900a11bdc9a701ee83 ]

This patch enables the IH retry CAM on GFX9 series cards. This
retry filter is used to prevent sending lots of retry interrupts
in a short span of time and overflowing the IH ring buffer. This
will also help reduce CPU interrupt workload.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h       |  2 +
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         | 51 +++++++++++------
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/vega20_ih.c        | 55 +++++++++----------
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 10 +++-
 .../asic_reg/oss/osssys_4_2_0_offset.h        |  6 ++
 .../asic_reg/oss/osssys_4_2_0_sh_mask.h       | 11 ++++
 7 files changed, 88 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
index e9f2c11ea416c..be243adf3e657 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
@@ -98,6 +98,8 @@ struct amdgpu_irq {
 	struct irq_domain		*domain; /* GPU irq controller domain */
 	unsigned			virq[AMDGPU_MAX_IRQ_SRC_ID];
 	uint32_t                        srbm_soft_reset;
+	u32                             retry_cam_doorbell_index;
+	bool                            retry_cam_enabled;
 };
 
 void amdgpu_irq_disable_all(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index b06170c00dfca..6573903876fd8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -553,32 +553,49 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 	const char *mmhub_cid;
 	const char *hub_name;
 	u64 addr;
+	uint32_t cam_index = 0;
+	int ret;
 
 	addr = (u64)entry->src_data[0] << 12;
 	addr |= ((u64)entry->src_data[1] & 0xf) << 44;
 
 	if (retry_fault) {
-		/* Returning 1 here also prevents sending the IV to the KFD */
+		if (adev->irq.retry_cam_enabled) {
+			/* Delegate it to a different ring if the hardware hasn't
+			 * already done it.
+			 */
+			if (entry->ih == &adev->irq.ih) {
+				amdgpu_irq_delegate(adev, entry, 8);
+				return 1;
+			}
+
+			cam_index = entry->src_data[2] & 0x3ff;
 
-		/* Process it onyl if it's the first fault for this address */
-		if (entry->ih != &adev->irq.ih_soft &&
-		    amdgpu_gmc_filter_faults(adev, entry->ih, addr, entry->pasid,
+			ret = amdgpu_vm_handle_fault(adev, entry->pasid, addr, write_fault);
+			WDOORBELL32(adev->irq.retry_cam_doorbell_index, cam_index);
+			if (ret)
+				return 1;
+		} else {
+			/* Process it onyl if it's the first fault for this address */
+			if (entry->ih != &adev->irq.ih_soft &&
+			    amdgpu_gmc_filter_faults(adev, entry->ih, addr, entry->pasid,
 					     entry->timestamp))
-			return 1;
+				return 1;
 
-		/* Delegate it to a different ring if the hardware hasn't
-		 * already done it.
-		 */
-		if (entry->ih == &adev->irq.ih) {
-			amdgpu_irq_delegate(adev, entry, 8);
-			return 1;
-		}
+			/* Delegate it to a different ring if the hardware hasn't
+			 * already done it.
+			 */
+			if (entry->ih == &adev->irq.ih) {
+				amdgpu_irq_delegate(adev, entry, 8);
+				return 1;
+			}
 
-		/* Try to handle the recoverable page faults by filling page
-		 * tables
-		 */
-		if (amdgpu_vm_handle_fault(adev, entry->pasid, addr, write_fault))
-			return 1;
+			/* Try to handle the recoverable page faults by filling page
+			 * tables
+			 */
+			if (amdgpu_vm_handle_fault(adev, entry->pasid, addr, write_fault))
+				return 1;
+		}
 	}
 
 	if (!printk_ratelimit())
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
index 19455a7259391..685abf57ffddc 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -238,7 +238,7 @@ static void nbio_v7_4_ih_doorbell_range(struct amdgpu_device *adev,
 
 	if (use_doorbell) {
 		ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, OFFSET, doorbell_index);
-		ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, SIZE, 4);
+		ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, SIZE, 8);
 	} else
 		ih_doorbell_range = REG_SET_FIELD(ih_doorbell_range, BIF_IH_DOORBELL_RANGE, SIZE, 0);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
index 1706081d054dd..6a8fb1fb48a3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
@@ -38,6 +38,11 @@
 #define mmIH_CHICKEN_ALDEBARAN			0x18d
 #define mmIH_CHICKEN_ALDEBARAN_BASE_IDX		0
 
+#define mmIH_RETRY_INT_CAM_CNTL_ALDEBARAN		0x00ea
+#define mmIH_RETRY_INT_CAM_CNTL_ALDEBARAN_BASE_IDX	0
+#define IH_RETRY_INT_CAM_CNTL_ALDEBARAN__ENABLE__SHIFT	0x10
+#define IH_RETRY_INT_CAM_CNTL_ALDEBARAN__ENABLE_MASK	0x00010000L
+
 static void vega20_ih_set_interrupt_funcs(struct amdgpu_device *adev);
 
 /**
@@ -251,36 +256,14 @@ static int vega20_ih_enable_ring(struct amdgpu_device *adev,
 	return 0;
 }
 
-/**
- * vega20_ih_reroute_ih - reroute VMC/UTCL2 ih to an ih ring
- *
- * @adev: amdgpu_device pointer
- *
- * Reroute VMC and UMC interrupts on primary ih ring to
- * ih ring 1 so they won't lose when bunches of page faults
- * interrupts overwhelms the interrupt handler(VEGA20)
- */
-static void vega20_ih_reroute_ih(struct amdgpu_device *adev)
+static uint32_t vega20_setup_retry_doorbell(u32 doorbell_index)
 {
-	uint32_t tmp;
+	u32 val = 0;
 
-	/* vega20 ih reroute will go through psp this
-	 * function is used for newer asics starting arcturus
-	 */
-	if (adev->ip_versions[OSSSYS_HWIP][0] >= IP_VERSION(4, 2, 1)) {
-		/* Reroute to IH ring 1 for VMC */
-		WREG32_SOC15(OSSSYS, 0, mmIH_CLIENT_CFG_INDEX, 0x12);
-		tmp = RREG32_SOC15(OSSSYS, 0, mmIH_CLIENT_CFG_DATA);
-		tmp = REG_SET_FIELD(tmp, IH_CLIENT_CFG_DATA, CLIENT_TYPE, 1);
-		tmp = REG_SET_FIELD(tmp, IH_CLIENT_CFG_DATA, RING_ID, 1);
-		WREG32_SOC15(OSSSYS, 0, mmIH_CLIENT_CFG_DATA, tmp);
-
-		/* Reroute IH ring 1 for UTCL2 */
-		WREG32_SOC15(OSSSYS, 0, mmIH_CLIENT_CFG_INDEX, 0x1B);
-		tmp = RREG32_SOC15(OSSSYS, 0, mmIH_CLIENT_CFG_DATA);
-		tmp = REG_SET_FIELD(tmp, IH_CLIENT_CFG_DATA, RING_ID, 1);
-		WREG32_SOC15(OSSSYS, 0, mmIH_CLIENT_CFG_DATA, tmp);
-	}
+	val = REG_SET_FIELD(val, IH_DOORBELL_RPTR, OFFSET, doorbell_index);
+	val = REG_SET_FIELD(val, IH_DOORBELL_RPTR, ENABLE, 1);
+
+	return val;
 }
 
 /**
@@ -332,8 +315,6 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 
 	for (i = 0; i < ARRAY_SIZE(ih); i++) {
 		if (ih[i]->ring_size) {
-			if (i == 1)
-				vega20_ih_reroute_ih(adev);
 			ret = vega20_ih_enable_ring(adev, ih[i]);
 			if (ret)
 				return ret;
@@ -346,6 +327,20 @@ static int vega20_ih_irq_init(struct amdgpu_device *adev)
 
 	pci_set_master(adev->pdev);
 
+	/* Allocate the doorbell for IH Retry CAM */
+	adev->irq.retry_cam_doorbell_index = (adev->doorbell_index.ih + 3) << 1;
+	WREG32_SOC15(OSSSYS, 0, mmIH_DOORBELL_RETRY_CAM,
+		vega20_setup_retry_doorbell(adev->irq.retry_cam_doorbell_index));
+
+	/* Enable IH Retry CAM */
+	if (adev->ip_versions[OSSSYS_HWIP][0] == IP_VERSION(4, 4, 0))
+		WREG32_FIELD15(OSSSYS, 0, IH_RETRY_INT_CAM_CNTL_ALDEBARAN,
+			       ENABLE, 1);
+	else
+		WREG32_FIELD15(OSSSYS, 0, IH_RETRY_INT_CAM_CNTL, ENABLE, 1);
+
+	adev->irq.retry_cam_enabled = true;
+
 	/* enable interrupts */
 	ret = vega20_ih_toggle_interrupts(adev, true);
 	if (ret)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index dc6fd69670509..96a138a395150 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2172,7 +2172,15 @@ static void svm_range_drain_retry_fault(struct svm_range_list *svms)
 		pr_debug("drain retry fault gpu %d svms %p\n", i, svms);
 
 		amdgpu_ih_wait_on_checkpoint_process_ts(pdd->dev->adev,
-						     &pdd->dev->adev->irq.ih1);
+				pdd->dev->adev->irq.retry_cam_enabled ?
+				&pdd->dev->adev->irq.ih :
+				&pdd->dev->adev->irq.ih1);
+
+		if (pdd->dev->adev->irq.retry_cam_enabled)
+			amdgpu_ih_wait_on_checkpoint_process_ts(pdd->dev->adev,
+				&pdd->dev->adev->irq.ih_soft);
+
+
 		pr_debug("drain retry fault gpu %d svms 0x%p done\n", i, svms);
 	}
 	if (atomic_cmpxchg(&svms->drain_pagefaults, drain, 0) != drain)
diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_offset.h
index bd129266ebfd1..a84a7cfaf71e5 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_offset.h
@@ -135,6 +135,8 @@
 #define mmIH_RB_WPTR_ADDR_LO_BASE_IDX                                                                  0
 #define mmIH_DOORBELL_RPTR                                                                             0x0087
 #define mmIH_DOORBELL_RPTR_BASE_IDX                                                                    0
+#define mmIH_DOORBELL_RETRY_CAM                                                                        0x0088
+#define mmIH_DOORBELL_RETRY_CAM_BASE_IDX                                                               0
 #define mmIH_RB_CNTL_RING1                                                                             0x008c
 #define mmIH_RB_CNTL_RING1_BASE_IDX                                                                    0
 #define mmIH_RB_BASE_RING1                                                                             0x008d
@@ -159,6 +161,8 @@
 #define mmIH_RB_WPTR_RING2_BASE_IDX                                                                    0
 #define mmIH_DOORBELL_RPTR_RING2                                                                       0x009f
 #define mmIH_DOORBELL_RPTR_RING2_BASE_IDX                                                              0
+#define mmIH_RETRY_CAM_ACK                                                                             0x00a4
+#define mmIH_RETRY_CAM_ACK_BASE_IDX                                                                    0
 #define mmIH_VERSION                                                                                   0x00a5
 #define mmIH_VERSION_BASE_IDX                                                                          0
 #define mmIH_CNTL                                                                                      0x00c0
@@ -235,6 +239,8 @@
 #define mmIH_MMHUB_ERROR_BASE_IDX                                                                      0
 #define mmIH_MEM_POWER_CTRL                                                                            0x00e8
 #define mmIH_MEM_POWER_CTRL_BASE_IDX                                                                   0
+#define mmIH_RETRY_INT_CAM_CNTL                                                                        0x00e9
+#define mmIH_RETRY_INT_CAM_CNTL_BASE_IDX                                                               0
 #define mmIH_REGISTER_LAST_PART2                                                                       0x00ff
 #define mmIH_REGISTER_LAST_PART2_BASE_IDX                                                              0
 #define mmSEM_CLK_CTRL                                                                                 0x0100
diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_sh_mask.h
index 3ea83ea9ce3a4..75c04fc275a0c 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_4_2_0_sh_mask.h
@@ -349,6 +349,17 @@
 #define IH_DOORBELL_RPTR_RING2__ENABLE__SHIFT                                                                 0x1c
 #define IH_DOORBELL_RPTR_RING2__OFFSET_MASK                                                                   0x03FFFFFFL
 #define IH_DOORBELL_RPTR_RING2__ENABLE_MASK                                                                   0x10000000L
+//IH_RETRY_INT_CAM_CNTL
+#define IH_RETRY_INT_CAM_CNTL__CAM_SIZE__SHIFT                                                                0x0
+#define IH_RETRY_INT_CAM_CNTL__BACK_PRESSURE_SKID_VALUE__SHIFT                                                0x8
+#define IH_RETRY_INT_CAM_CNTL__ENABLE__SHIFT                                                                  0x10
+#define IH_RETRY_INT_CAM_CNTL__BACK_PRESSURE_ENABLE__SHIFT                                                    0x11
+#define IH_RETRY_INT_CAM_CNTL__PER_VF_ENTRY_SIZE__SHIFT                                                       0x14
+#define IH_RETRY_INT_CAM_CNTL__CAM_SIZE_MASK                                                                  0x0000001FL
+#define IH_RETRY_INT_CAM_CNTL__BACK_PRESSURE_SKID_VALUE_MASK                                                  0x00003F00L
+#define IH_RETRY_INT_CAM_CNTL__ENABLE_MASK                                                                    0x00010000L
+#define IH_RETRY_INT_CAM_CNTL__BACK_PRESSURE_ENABLE_MASK                                                      0x00020000L
+#define IH_RETRY_INT_CAM_CNTL__PER_VF_ENTRY_SIZE_MASK                                                         0x00300000L
 //IH_VERSION
 #define IH_VERSION__MINVER__SHIFT                                                                             0x0
 #define IH_VERSION__MAJVER__SHIFT                                                                             0x8
-- 
2.39.2


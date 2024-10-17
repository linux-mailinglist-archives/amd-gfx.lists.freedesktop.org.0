Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0119A28A6
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2024 18:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DE910E86E;
	Thu, 17 Oct 2024 16:26:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B029210E883
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2024 16:25:56 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49HGPojF1551550; Thu, 17 Oct 2024 21:55:50 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49HGPo3u1551549;
 Thu, 17 Oct 2024 21:55:50 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v5 12/12] drm/amdgpu: clean unused functions of uvd/vcn/vce
Date: Thu, 17 Oct 2024 21:55:31 +0530
Message-Id: <20241017162531.1551442-13-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017162531.1551442-1-sunil.khatri@amd.com>
References: <20241017162531.1551442-1-sunil.khatri@amd.com>
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

Some of the functions pointers of amdgpu_ip_funcs
are not used and are left commented out. Hence this
cleans those up which arent used.

Cc: Leo Liu <leo.liu@amd.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 274 --------------------------
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c | 273 -------------------------
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c |   4 -
 3 files changed, 551 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index c15f82f3c617..079131aeb2f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -1462,104 +1462,6 @@ static void uvd_v7_0_enc_ring_emit_wreg(struct amdgpu_ring *ring,
 	amdgpu_ring_write(ring, val);
 }
 
-#if 0
-static bool uvd_v7_0_is_idle(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	return !(RREG32(mmSRBM_STATUS) & SRBM_STATUS__UVD_BUSY_MASK);
-}
-
-static int uvd_v7_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	unsigned i;
-	struct amdgpu_device *adev = ip_block->adev;
-
-	for (i = 0; i < adev->usec_timeout; i++) {
-		if (uvd_v7_0_is_idle(handle))
-			return 0;
-	}
-	return -ETIMEDOUT;
-}
-
-#define AMDGPU_UVD_STATUS_BUSY_MASK    0xfd
-static bool uvd_v7_0_check_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-	u32 srbm_soft_reset = 0;
-	u32 tmp = RREG32(mmSRBM_STATUS);
-
-	if (REG_GET_FIELD(tmp, SRBM_STATUS, UVD_RQ_PENDING) ||
-	    REG_GET_FIELD(tmp, SRBM_STATUS, UVD_BUSY) ||
-	    (RREG32_SOC15(UVD, ring->me, mmUVD_STATUS) &
-		    AMDGPU_UVD_STATUS_BUSY_MASK))
-		srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset,
-				SRBM_SOFT_RESET, SOFT_RESET_UVD, 1);
-
-	if (srbm_soft_reset) {
-		adev->uvd.inst[ring->me].srbm_soft_reset = srbm_soft_reset;
-		return true;
-	} else {
-		adev->uvd.inst[ring->me].srbm_soft_reset = 0;
-		return false;
-	}
-}
-
-static int uvd_v7_0_pre_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-
-	if (!adev->uvd.inst[ring->me].srbm_soft_reset)
-		return 0;
-
-	uvd_v7_0_stop(adev);
-	return 0;
-}
-
-static int uvd_v7_0_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-	u32 srbm_soft_reset;
-
-	if (!adev->uvd.inst[ring->me].srbm_soft_reset)
-		return 0;
-	srbm_soft_reset = adev->uvd.inst[ring->me].srbm_soft_reset;
-
-	if (srbm_soft_reset) {
-		u32 tmp;
-
-		tmp = RREG32(mmSRBM_SOFT_RESET);
-		tmp |= srbm_soft_reset;
-		dev_info(adev->dev, "SRBM_SOFT_RESET=0x%08X\n", tmp);
-		WREG32(mmSRBM_SOFT_RESET, tmp);
-		tmp = RREG32(mmSRBM_SOFT_RESET);
-
-		udelay(50);
-
-		tmp &= ~srbm_soft_reset;
-		WREG32(mmSRBM_SOFT_RESET, tmp);
-		tmp = RREG32(mmSRBM_SOFT_RESET);
-
-		/* Wait a little for things to settle down */
-		udelay(50);
-	}
-
-	return 0;
-}
-
-static int uvd_v7_0_post_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-
-	if (!adev->uvd.inst[ring->me].srbm_soft_reset)
-		return 0;
-
-	mdelay(5);
-
-	return uvd_v7_0_start(adev);
-}
-#endif
-
 static int uvd_v7_0_set_interrupt_state(struct amdgpu_device *adev,
 					struct amdgpu_irq_src *source,
 					unsigned type,
@@ -1609,176 +1511,6 @@ static int uvd_v7_0_process_interrupt(struct amdgpu_device *adev,
 	return 0;
 }
 
-#if 0
-static void uvd_v7_0_set_sw_clock_gating(struct amdgpu_device *adev)
-{
-	uint32_t data, data1, data2, suvd_flags;
-
-	data = RREG32_SOC15(UVD, ring->me, mmUVD_CGC_CTRL);
-	data1 = RREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE);
-	data2 = RREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_CTRL);
-
-	data &= ~(UVD_CGC_CTRL__CLK_OFF_DELAY_MASK |
-		  UVD_CGC_CTRL__CLK_GATE_DLY_TIMER_MASK);
-
-	suvd_flags = UVD_SUVD_CGC_GATE__SRE_MASK |
-		     UVD_SUVD_CGC_GATE__SIT_MASK |
-		     UVD_SUVD_CGC_GATE__SMP_MASK |
-		     UVD_SUVD_CGC_GATE__SCM_MASK |
-		     UVD_SUVD_CGC_GATE__SDB_MASK;
-
-	data |= UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK |
-		(1 << REG_FIELD_SHIFT(UVD_CGC_CTRL, CLK_GATE_DLY_TIMER)) |
-		(4 << REG_FIELD_SHIFT(UVD_CGC_CTRL, CLK_OFF_DELAY));
-
-	data &= ~(UVD_CGC_CTRL__UDEC_RE_MODE_MASK |
-			UVD_CGC_CTRL__UDEC_CM_MODE_MASK |
-			UVD_CGC_CTRL__UDEC_IT_MODE_MASK |
-			UVD_CGC_CTRL__UDEC_DB_MODE_MASK |
-			UVD_CGC_CTRL__UDEC_MP_MODE_MASK |
-			UVD_CGC_CTRL__SYS_MODE_MASK |
-			UVD_CGC_CTRL__UDEC_MODE_MASK |
-			UVD_CGC_CTRL__MPEG2_MODE_MASK |
-			UVD_CGC_CTRL__REGS_MODE_MASK |
-			UVD_CGC_CTRL__RBC_MODE_MASK |
-			UVD_CGC_CTRL__LMI_MC_MODE_MASK |
-			UVD_CGC_CTRL__LMI_UMC_MODE_MASK |
-			UVD_CGC_CTRL__IDCT_MODE_MASK |
-			UVD_CGC_CTRL__MPRD_MODE_MASK |
-			UVD_CGC_CTRL__MPC_MODE_MASK |
-			UVD_CGC_CTRL__LBSI_MODE_MASK |
-			UVD_CGC_CTRL__LRBBM_MODE_MASK |
-			UVD_CGC_CTRL__WCB_MODE_MASK |
-			UVD_CGC_CTRL__VCPU_MODE_MASK |
-			UVD_CGC_CTRL__JPEG_MODE_MASK |
-			UVD_CGC_CTRL__JPEG2_MODE_MASK |
-			UVD_CGC_CTRL__SCPU_MODE_MASK);
-	data2 &= ~(UVD_SUVD_CGC_CTRL__SRE_MODE_MASK |
-			UVD_SUVD_CGC_CTRL__SIT_MODE_MASK |
-			UVD_SUVD_CGC_CTRL__SMP_MODE_MASK |
-			UVD_SUVD_CGC_CTRL__SCM_MODE_MASK |
-			UVD_SUVD_CGC_CTRL__SDB_MODE_MASK);
-	data1 |= suvd_flags;
-
-	WREG32_SOC15(UVD, ring->me, mmUVD_CGC_CTRL, data);
-	WREG32_SOC15(UVD, ring->me, mmUVD_CGC_GATE, 0);
-	WREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE, data1);
-	WREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_CTRL, data2);
-}
-
-static void uvd_v7_0_set_hw_clock_gating(struct amdgpu_device *adev)
-{
-	uint32_t data, data1, cgc_flags, suvd_flags;
-
-	data = RREG32_SOC15(UVD, ring->me, mmUVD_CGC_GATE);
-	data1 = RREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE);
-
-	cgc_flags = UVD_CGC_GATE__SYS_MASK |
-		UVD_CGC_GATE__UDEC_MASK |
-		UVD_CGC_GATE__MPEG2_MASK |
-		UVD_CGC_GATE__RBC_MASK |
-		UVD_CGC_GATE__LMI_MC_MASK |
-		UVD_CGC_GATE__IDCT_MASK |
-		UVD_CGC_GATE__MPRD_MASK |
-		UVD_CGC_GATE__MPC_MASK |
-		UVD_CGC_GATE__LBSI_MASK |
-		UVD_CGC_GATE__LRBBM_MASK |
-		UVD_CGC_GATE__UDEC_RE_MASK |
-		UVD_CGC_GATE__UDEC_CM_MASK |
-		UVD_CGC_GATE__UDEC_IT_MASK |
-		UVD_CGC_GATE__UDEC_DB_MASK |
-		UVD_CGC_GATE__UDEC_MP_MASK |
-		UVD_CGC_GATE__WCB_MASK |
-		UVD_CGC_GATE__VCPU_MASK |
-		UVD_CGC_GATE__SCPU_MASK |
-		UVD_CGC_GATE__JPEG_MASK |
-		UVD_CGC_GATE__JPEG2_MASK;
-
-	suvd_flags = UVD_SUVD_CGC_GATE__SRE_MASK |
-				UVD_SUVD_CGC_GATE__SIT_MASK |
-				UVD_SUVD_CGC_GATE__SMP_MASK |
-				UVD_SUVD_CGC_GATE__SCM_MASK |
-				UVD_SUVD_CGC_GATE__SDB_MASK;
-
-	data |= cgc_flags;
-	data1 |= suvd_flags;
-
-	WREG32_SOC15(UVD, ring->me, mmUVD_CGC_GATE, data);
-	WREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE, data1);
-}
-
-static void uvd_v7_0_set_bypass_mode(struct amdgpu_device *adev, bool enable)
-{
-	u32 tmp = RREG32_SMC(ixGCK_DFS_BYPASS_CNTL);
-
-	if (enable)
-		tmp |= (GCK_DFS_BYPASS_CNTL__BYPASSDCLK_MASK |
-			GCK_DFS_BYPASS_CNTL__BYPASSVCLK_MASK);
-	else
-		tmp &= ~(GCK_DFS_BYPASS_CNTL__BYPASSDCLK_MASK |
-			 GCK_DFS_BYPASS_CNTL__BYPASSVCLK_MASK);
-
-	WREG32_SMC(ixGCK_DFS_BYPASS_CNTL, tmp);
-}
-
-
-static int uvd_v7_0_set_clockgating_state(void *handle,
-					  enum amd_clockgating_state state)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE);
-	struct amdgpu_ip_block *ip_block;
-
-	ip_block = amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_UVD);
-	if (!ip_block)
-		return -EINVAL;
-
-	uvd_v7_0_set_bypass_mode(adev, enable);
-
-	if (!(adev->cg_flags & AMD_CG_SUPPORT_UVD_MGCG))
-		return 0;
-
-	if (enable) {
-		/* disable HW gating and enable Sw gating */
-		uvd_v7_0_set_sw_clock_gating(adev);
-	} else {
-		/* wait for STATUS to clear */
-		if (uvd_v7_0_wait_for_idle(ip_block))
-			return -EBUSY;
-
-		/* enable HW gates because UVD is idle */
-		/* uvd_v7_0_set_hw_clock_gating(adev); */
-	}
-
-	return 0;
-}
-
-static int uvd_v7_0_set_powergating_state(void *handle,
-					  enum amd_powergating_state state)
-{
-	/* This doesn't actually powergate the UVD block.
-	 * That's done in the dpm code via the SMC.  This
-	 * just re-inits the block as necessary.  The actual
-	 * gating still happens in the dpm code.  We should
-	 * revisit this when there is a cleaner line between
-	 * the smc and the hw blocks
-	 */
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-
-	if (!(adev->pg_flags & AMD_PG_SUPPORT_UVD))
-		return 0;
-
-	WREG32_SOC15(UVD, ring->me, mmUVD_POWER_STATUS, UVD_POWER_STATUS__UVD_PG_EN_MASK);
-
-	if (state == AMD_PG_STATE_GATE) {
-		uvd_v7_0_stop(adev);
-		return 0;
-	} else {
-		return uvd_v7_0_start(adev);
-	}
-}
-#endif
-
 static int uvd_v7_0_set_clockgating_state(void *handle,
 					  enum amd_clockgating_state state)
 {
@@ -1796,12 +1528,6 @@ const struct amd_ip_funcs uvd_v7_0_ip_funcs = {
 	.prepare_suspend = uvd_v7_0_prepare_suspend,
 	.suspend = uvd_v7_0_suspend,
 	.resume = uvd_v7_0_resume,
-	.is_idle = NULL /* uvd_v7_0_is_idle */,
-	.wait_for_idle = NULL /* uvd_v7_0_wait_for_idle */,
-	.check_soft_reset = NULL /* uvd_v7_0_check_soft_reset */,
-	.pre_soft_reset = NULL /* uvd_v7_0_pre_soft_reset */,
-	.soft_reset = NULL /* uvd_v7_0_soft_reset */,
-	.post_soft_reset = NULL /* uvd_v7_0_post_soft_reset */,
 	.set_clockgating_state = uvd_v7_0_set_clockgating_state,
 	.set_powergating_state = NULL /* uvd_v7_0_set_powergating_state */,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
index 4a860afc4da3..79ee555768a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -691,273 +691,6 @@ static int vce_v4_0_set_clockgating_state(void *handle,
 	return 0;
 }
 
-#if 0
-static bool vce_v4_0_is_idle(void *handle)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	u32 mask = 0;
-
-	mask |= (adev->vce.harvest_config & AMDGPU_VCE_HARVEST_VCE0) ? 0 : SRBM_STATUS2__VCE0_BUSY_MASK;
-	mask |= (adev->vce.harvest_config & AMDGPU_VCE_HARVEST_VCE1) ? 0 : SRBM_STATUS2__VCE1_BUSY_MASK;
-
-	return !(RREG32(mmSRBM_STATUS2) & mask);
-}
-
-static int vce_v4_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	unsigned i;
-	struct amdgpu_device *adev = ip_block->adev;
-
-	for (i = 0; i < adev->usec_timeout; i++)
-		if (vce_v4_0_is_idle(handle))
-			return 0;
-
-	return -ETIMEDOUT;
-}
-
-#define  VCE_STATUS_VCPU_REPORT_AUTO_BUSY_MASK  0x00000008L   /* AUTO_BUSY */
-#define  VCE_STATUS_VCPU_REPORT_RB0_BUSY_MASK   0x00000010L   /* RB0_BUSY */
-#define  VCE_STATUS_VCPU_REPORT_RB1_BUSY_MASK   0x00000020L   /* RB1_BUSY */
-#define  AMDGPU_VCE_STATUS_BUSY_MASK (VCE_STATUS_VCPU_REPORT_AUTO_BUSY_MASK | \
-				      VCE_STATUS_VCPU_REPORT_RB0_BUSY_MASK)
-
-static bool vce_v4_0_check_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-	u32 srbm_soft_reset = 0;
-
-	/* According to VCE team , we should use VCE_STATUS instead
-	 * SRBM_STATUS.VCE_BUSY bit for busy status checking.
-	 * GRBM_GFX_INDEX.INSTANCE_INDEX is used to specify which VCE
-	 * instance's registers are accessed
-	 * (0 for 1st instance, 10 for 2nd instance).
-	 *
-	 *VCE_STATUS
-	 *|UENC|ACPI|AUTO ACTIVE|RB1 |RB0 |RB2 |          |FW_LOADED|JOB |
-	 *|----+----+-----------+----+----+----+----------+---------+----|
-	 *|bit8|bit7|    bit6   |bit5|bit4|bit3|   bit2   |  bit1   |bit0|
-	 *
-	 * VCE team suggest use bit 3--bit 6 for busy status check
-	 */
-	mutex_lock(&adev->grbm_idx_mutex);
-	WREG32_FIELD(GRBM_GFX_INDEX, INSTANCE_INDEX, 0);
-	if (RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_STATUS) & AMDGPU_VCE_STATUS_BUSY_MASK) {
-		srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, SRBM_SOFT_RESET, SOFT_RESET_VCE0, 1);
-		srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, SRBM_SOFT_RESET, SOFT_RESET_VCE1, 1);
-	}
-	WREG32_FIELD(GRBM_GFX_INDEX, INSTANCE_INDEX, 0x10);
-	if (RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_STATUS) & AMDGPU_VCE_STATUS_BUSY_MASK) {
-		srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, SRBM_SOFT_RESET, SOFT_RESET_VCE0, 1);
-		srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, SRBM_SOFT_RESET, SOFT_RESET_VCE1, 1);
-	}
-	WREG32_FIELD(GRBM_GFX_INDEX, INSTANCE_INDEX, 0);
-	mutex_unlock(&adev->grbm_idx_mutex);
-
-	if (srbm_soft_reset) {
-		adev->vce.srbm_soft_reset = srbm_soft_reset;
-		return true;
-	} else {
-		adev->vce.srbm_soft_reset = 0;
-		return false;
-	}
-}
-
-static int vce_v4_0_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-	u32 srbm_soft_reset;
-
-	if (!adev->vce.srbm_soft_reset)
-		return 0;
-	srbm_soft_reset = adev->vce.srbm_soft_reset;
-
-	if (srbm_soft_reset) {
-		u32 tmp;
-
-		tmp = RREG32(mmSRBM_SOFT_RESET);
-		tmp |= srbm_soft_reset;
-		dev_info(adev->dev, "SRBM_SOFT_RESET=0x%08X\n", tmp);
-		WREG32(mmSRBM_SOFT_RESET, tmp);
-		tmp = RREG32(mmSRBM_SOFT_RESET);
-
-		udelay(50);
-
-		tmp &= ~srbm_soft_reset;
-		WREG32(mmSRBM_SOFT_RESET, tmp);
-		tmp = RREG32(mmSRBM_SOFT_RESET);
-
-		/* Wait a little for things to settle down */
-		udelay(50);
-	}
-
-	return 0;
-}
-
-static int vce_v4_0_pre_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-
-	if (!adev->vce.srbm_soft_reset)
-		return 0;
-
-	mdelay(5);
-
-	return vce_v4_0_suspend(adev);
-}
-
-
-static int vce_v4_0_post_soft_reset(struct amdgpu_ip_block *ip_block)
-{
-	struct amdgpu_device *adev = ip_block->adev;
-
-	if (!adev->vce.srbm_soft_reset)
-		return 0;
-
-	mdelay(5);
-
-	return vce_v4_0_resume(adev);
-}
-
-static void vce_v4_0_override_vce_clock_gating(struct amdgpu_device *adev, bool override)
-{
-	u32 tmp, data;
-
-	tmp = data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_RB_ARB_CTRL));
-	if (override)
-		data |= VCE_RB_ARB_CTRL__VCE_CGTT_OVERRIDE_MASK;
-	else
-		data &= ~VCE_RB_ARB_CTRL__VCE_CGTT_OVERRIDE_MASK;
-
-	if (tmp != data)
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_RB_ARB_CTRL), data);
-}
-
-static void vce_v4_0_set_vce_sw_clock_gating(struct amdgpu_device *adev,
-					     bool gated)
-{
-	u32 data;
-
-	/* Set Override to disable Clock Gating */
-	vce_v4_0_override_vce_clock_gating(adev, true);
-
-	/* This function enables MGCG which is controlled by firmware.
-	   With the clocks in the gated state the core is still
-	   accessible but the firmware will throttle the clocks on the
-	   fly as necessary.
-	*/
-	if (gated) {
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B));
-		data |= 0x1ff;
-		data &= ~0xef0000;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING));
-		data |= 0x3ff000;
-		data &= ~0xffc00000;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING_2));
-		data |= 0x2;
-		data &= ~0x00010000;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING_2), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_REG_CLOCK_GATING));
-		data |= 0x37f;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_REG_CLOCK_GATING), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_DMA_DCLK_CTRL));
-		data |= VCE_UENC_DMA_DCLK_CTRL__WRDMCLK_FORCEON_MASK |
-			VCE_UENC_DMA_DCLK_CTRL__RDDMCLK_FORCEON_MASK |
-			VCE_UENC_DMA_DCLK_CTRL__REGCLK_FORCEON_MASK  |
-			0x8;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_DMA_DCLK_CTRL), data);
-	} else {
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B));
-		data &= ~0x80010;
-		data |= 0xe70008;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING));
-		data |= 0xffc00000;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING_2));
-		data |= 0x10000;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING_2), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_REG_CLOCK_GATING));
-		data &= ~0xffc00000;
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_REG_CLOCK_GATING), data);
-
-		data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_DMA_DCLK_CTRL));
-		data &= ~(VCE_UENC_DMA_DCLK_CTRL__WRDMCLK_FORCEON_MASK |
-			  VCE_UENC_DMA_DCLK_CTRL__RDDMCLK_FORCEON_MASK |
-			  VCE_UENC_DMA_DCLK_CTRL__REGCLK_FORCEON_MASK  |
-			  0x8);
-		WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_DMA_DCLK_CTRL), data);
-	}
-	vce_v4_0_override_vce_clock_gating(adev, false);
-}
-
-static void vce_v4_0_set_bypass_mode(struct amdgpu_device *adev, bool enable)
-{
-	u32 tmp = RREG32_SMC(ixGCK_DFS_BYPASS_CNTL);
-
-	if (enable)
-		tmp |= GCK_DFS_BYPASS_CNTL__BYPASSECLK_MASK;
-	else
-		tmp &= ~GCK_DFS_BYPASS_CNTL__BYPASSECLK_MASK;
-
-	WREG32_SMC(ixGCK_DFS_BYPASS_CNTL, tmp);
-}
-
-static int vce_v4_0_set_clockgating_state(void *handle,
-					  enum amd_clockgating_state state)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	bool enable = (state == AMD_CG_STATE_GATE);
-	int i;
-
-	if ((adev->asic_type == CHIP_POLARIS10) ||
-		(adev->asic_type == CHIP_TONGA) ||
-		(adev->asic_type == CHIP_FIJI))
-		vce_v4_0_set_bypass_mode(adev, enable);
-
-	if (!(adev->cg_flags & AMD_CG_SUPPORT_VCE_MGCG))
-		return 0;
-
-	mutex_lock(&adev->grbm_idx_mutex);
-	for (i = 0; i < 2; i++) {
-		/* Program VCE Instance 0 or 1 if not harvested */
-		if (adev->vce.harvest_config & (1 << i))
-			continue;
-
-		WREG32_FIELD(GRBM_GFX_INDEX, VCE_INSTANCE, i);
-
-		if (enable) {
-			/* initialize VCE_CLOCK_GATING_A: Clock ON/OFF delay */
-			uint32_t data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_A);
-			data &= ~(0xf | 0xff0);
-			data |= ((0x0 << 0) | (0x04 << 4));
-			WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_A, data);
-
-			/* initialize VCE_UENC_CLOCK_GATING: Clock ON/OFF delay */
-			data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING);
-			data &= ~(0xf | 0xff0);
-			data |= ((0x0 << 0) | (0x04 << 4));
-			WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING, data);
-		}
-
-		vce_v4_0_set_vce_sw_clock_gating(adev, enable);
-	}
-
-	WREG32_FIELD(GRBM_GFX_INDEX, VCE_INSTANCE, 0);
-	mutex_unlock(&adev->grbm_idx_mutex);
-
-	return 0;
-}
-#endif
-
 static int vce_v4_0_set_powergating_state(void *handle,
 					  enum amd_powergating_state state)
 {
@@ -1082,12 +815,6 @@ const struct amd_ip_funcs vce_v4_0_ip_funcs = {
 	.hw_fini = vce_v4_0_hw_fini,
 	.suspend = vce_v4_0_suspend,
 	.resume = vce_v4_0_resume,
-	.is_idle = NULL /* vce_v4_0_is_idle */,
-	.wait_for_idle = NULL /* vce_v4_0_wait_for_idle */,
-	.check_soft_reset = NULL /* vce_v4_0_check_soft_reset */,
-	.pre_soft_reset = NULL /* vce_v4_0_pre_soft_reset */,
-	.soft_reset = NULL /* vce_v4_0_soft_reset */,
-	.post_soft_reset = NULL /* vce_v4_0_post_soft_reset */,
 	.set_clockgating_state = vce_v4_0_set_clockgating_state,
 	.set_powergating_state = vce_v4_0_set_powergating_state,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 497b5d93a58b..10e99c926fb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1995,10 +1995,6 @@ static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
 	.resume = vcn_v1_0_resume,
 	.is_idle = vcn_v1_0_is_idle,
 	.wait_for_idle = vcn_v1_0_wait_for_idle,
-	.check_soft_reset = NULL /* vcn_v1_0_check_soft_reset */,
-	.pre_soft_reset = NULL /* vcn_v1_0_pre_soft_reset */,
-	.soft_reset = NULL /* vcn_v1_0_soft_reset */,
-	.post_soft_reset = NULL /* vcn_v1_0_post_soft_reset */,
 	.set_clockgating_state = vcn_v1_0_set_clockgating_state,
 	.set_powergating_state = vcn_v1_0_set_powergating_state,
 	.dump_ip_state = vcn_v1_0_dump_ip_state,
-- 
2.34.1


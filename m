Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD66148B2
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Nov 2022 12:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 339E710E38D;
	Tue,  1 Nov 2022 11:29:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0CF10E386;
 Tue,  1 Nov 2022 11:29:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4748B81CC1;
 Tue,  1 Nov 2022 11:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D347C433C1;
 Tue,  1 Nov 2022 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667302143;
 bh=3odNfFTxhlSI2oqPWmgqSTu/8N7j/fMmlaKxX+8l4aY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KF6Z6nM/23H2jYDtStELISuRuY1dtFKcvPMUYiZuHZFHyfbYoNJf+/OC0en8r9GlW
 CKiwp11Vt3zS5ORj4ffbpmGrXxHnqlglSo7PGyCDQvs+ANTGur/WGozAvjy74XhyNI
 1+d+3eiUnSf9CS1HcZgw2SjPPMbcvc/F8XWL/CnMYcLcxNcP/IFMHCTYYOCS8Ra1EU
 VIeE1m4+keFZS/eAh1tLAepb3HQcBUXCgFn6Ycn6ys6/kmg4OOul8QEByGlLtBYb/m
 ByfHm/gJoUZlZG2PoWFmyyxE54VgTN8En2lAXszDQpGMRhkjF9jL0xr97ACXDzpY2s
 cazKOJgPU1Ufw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 29/34] drm/amdgpu: Program GC registers through
 RLCG interface in gfx_v11/gmc_v11
Date: Tue,  1 Nov 2022 07:27:21 -0400
Message-Id: <20221101112726.799368-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, Jack.Xiao@amd.com,
 tao.zhou1@amd.com, YiPeng.Chai@amd.com, yifan1.zhang@amd.com, Lang.Yu@amd.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Likun.Gao@amd.com, Prike.Liang@amd.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Yifan Zha <Yifan.Zha@amd.com>,
 evan.quan@amd.com, airlied@gmail.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Yifan Zha <Yifan.Zha@amd.com>

[ Upstream commit 97a3d6090f5c2a165dc88bda05c1dcf9f08bf886 ]

[Why]
L1 blocks most of GC registers accessing by MMIO.

[How]
Use RLCG interface to program GC registers under SRIOV VF in full access time.

Signed-off-by: Yifan Zha <Yifan.Zha@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c         | 18 +++++++++++-------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
index 0b0a72ca5695..7e80caa05060 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -111,7 +111,7 @@ static int init_interrupts_v11(struct amdgpu_device *adev, uint32_t pipe_id)
 
 	lock_srbm(adev, mec, pipe, 0, 0);
 
-	WREG32(SOC15_REG_OFFSET(GC, 0, regCPC_INT_CNTL),
+	WREG32_SOC15(GC, 0, regCPC_INT_CNTL,
 		CP_INT_CNTL_RING0__TIME_STAMP_INT_ENABLE_MASK |
 		CP_INT_CNTL_RING0__OPCODE_ERROR_INT_ENABLE_MASK);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index daf8ba8235cd..03775e0a8100 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1729,7 +1729,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
 		WREG32_SOC15(GC, 0, regSH_MEM_BASES, sh_mem_bases);
 
 		/* Enable trap for each kfd vmid. */
-		data = RREG32(SOC15_REG_OFFSET(GC, 0, regSPI_GDBG_PER_VMID_CNTL));
+		data = RREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL);
 		data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
 	}
 	soc21_grbm_select(adev, 0, 0, 0, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 1471bfb9ae38..2475fdbe8010 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -185,6 +185,10 @@ static void gmc_v11_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 	/* Use register 17 for GART */
 	const unsigned eng = 17;
 	unsigned int i;
+	unsigned char hub_ip = 0;
+
+	hub_ip = (vmhub == AMDGPU_GFXHUB_0) ?
+		   GC_HWIP : MMHUB_HWIP;
 
 	spin_lock(&adev->gmc.invalidate_lock);
 	/*
@@ -198,8 +202,8 @@ static void gmc_v11_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 	if (use_semaphore) {
 		for (i = 0; i < adev->usec_timeout; i++) {
 			/* a read return value of 1 means semaphore acuqire */
-			tmp = RREG32_NO_KIQ(hub->vm_inv_eng0_sem +
-					    hub->eng_distance * eng);
+			tmp = RREG32_RLC_NO_KIQ(hub->vm_inv_eng0_sem +
+					    hub->eng_distance * eng, hub_ip);
 			if (tmp & 0x1)
 				break;
 			udelay(1);
@@ -209,12 +213,12 @@ static void gmc_v11_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 			DRM_ERROR("Timeout waiting for sem acquire in VM flush!\n");
 	}
 
-	WREG32_NO_KIQ(hub->vm_inv_eng0_req + hub->eng_distance * eng, inv_req);
+	WREG32_RLC_NO_KIQ(hub->vm_inv_eng0_req + hub->eng_distance * eng, inv_req, hub_ip);
 
 	/* Wait for ACK with a delay.*/
 	for (i = 0; i < adev->usec_timeout; i++) {
-		tmp = RREG32_NO_KIQ(hub->vm_inv_eng0_ack +
-				    hub->eng_distance * eng);
+		tmp = RREG32_RLC_NO_KIQ(hub->vm_inv_eng0_ack +
+				    hub->eng_distance * eng, hub_ip);
 		tmp &= 1 << vmid;
 		if (tmp)
 			break;
@@ -228,8 +232,8 @@ static void gmc_v11_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
 		 * add semaphore release after invalidation,
 		 * write with 0 means semaphore release
 		 */
-		WREG32_NO_KIQ(hub->vm_inv_eng0_sem +
-			      hub->eng_distance * eng, 0);
+		WREG32_RLC_NO_KIQ(hub->vm_inv_eng0_sem +
+			      hub->eng_distance * eng, 0, hub_ip);
 
 	/* Issue additional private vm invalidation to MMHUB */
 	if ((vmhub != AMDGPU_GFXHUB_0) &&
-- 
2.35.1


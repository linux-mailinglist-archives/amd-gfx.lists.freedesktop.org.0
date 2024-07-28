Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5593E670
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Jul 2024 17:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6082B10E271;
	Sun, 28 Jul 2024 15:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H+KvkAAu";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8F810E272;
 Sun, 28 Jul 2024 15:48:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9DD6611EF;
 Sun, 28 Jul 2024 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62578C4AF0E;
 Sun, 28 Jul 2024 15:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181693;
 bh=JkaxF1m42hKaCYNt+wvv/CFDHHF5IK/4NiM8C7bcxR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H+KvkAAu6bH+/9uNiZO1+eN4T/E8Lkjf9wdKB5xmOMbbsv6bMaQ014ScHl7ejXuma
 N8szYJIBNHGG0Wm8S+p2QnUVbaDKjem1Eqn0lJ2X7OMBxz+ce8H5JspSA/T56LhFkY
 JE7EI0xa+mjRvSWbB1zLWqcFokELOWJkEEgLA2vYBKrJB4fbIiafVuOlQIn3UxBgPJ
 h05n1Fnka3qklPOCV340T+aqWHjCgDpogUXThzkoR8+GdEz9s/89jhhHmGNnQUxQ6j
 LrqAzWZ/W2zRliMIPHep78CGs7rOPHyQPvQFcfeS6IIPHHJpmDDuiWtCWyJG655/wA
 ww5jMFYOCTLKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ma Jun <Jun.Ma2@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 evan.quan@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, mario.limonciello@amd.com,
 lijo.lazar@amd.com, sunran001@208suo.com, alexious@zju.edu.cn,
 ruanjinjie@huawei.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 02/17] drm/amdgpu/pm: Fix the null pointer
 dereference for smu7
Date: Sun, 28 Jul 2024 11:47:12 -0400
Message-ID: <20240728154805.2049226-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154805.2049226-1-sashal@kernel.org>
References: <20240728154805.2049226-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
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

From: Ma Jun <Jun.Ma2@amd.com>

[ Upstream commit c02c1960c93eede587576625a1221205a68a904f ]

optimize the code to avoid pass a null pointer (hwmgr->backend)
to function smu7_update_edc_leakage_table.

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
Reviewed-by: Yang Wang <kevinyang.wang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 50 +++++++++----------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index 5e9410117712c..9f2f3f6a79adb 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -2970,6 +2970,7 @@ static int smu7_update_edc_leakage_table(struct pp_hwmgr *hwmgr)
 
 static int smu7_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 {
+	struct amdgpu_device *adev = hwmgr->adev;
 	struct smu7_hwmgr *data;
 	int result = 0;
 
@@ -3006,40 +3007,37 @@ static int smu7_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 	/* Initalize Dynamic State Adjustment Rule Settings */
 	result = phm_initializa_dynamic_state_adjustment_rule_settings(hwmgr);
 
-	if (0 == result) {
-		struct amdgpu_device *adev = hwmgr->adev;
+	if (result)
+		goto fail;
 
-		data->is_tlu_enabled = false;
+	data->is_tlu_enabled = false;
 
-		hwmgr->platform_descriptor.hardwareActivityPerformanceLevels =
+	hwmgr->platform_descriptor.hardwareActivityPerformanceLevels =
 							SMU7_MAX_HARDWARE_POWERLEVELS;
-		hwmgr->platform_descriptor.hardwarePerformanceLevels = 2;
-		hwmgr->platform_descriptor.minimumClocksReductionPercentage = 50;
+	hwmgr->platform_descriptor.hardwarePerformanceLevels = 2;
+	hwmgr->platform_descriptor.minimumClocksReductionPercentage = 50;
 
-		data->pcie_gen_cap = adev->pm.pcie_gen_mask;
-		if (data->pcie_gen_cap & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
-			data->pcie_spc_cap = 20;
-		else
-			data->pcie_spc_cap = 16;
-		data->pcie_lane_cap = adev->pm.pcie_mlw_mask;
-
-		hwmgr->platform_descriptor.vbiosInterruptId = 0x20000400; /* IRQ_SOURCE1_SW_INT */
-/* The true clock step depends on the frequency, typically 4.5 or 9 MHz. Here we use 5. */
-		hwmgr->platform_descriptor.clockStep.engineClock = 500;
-		hwmgr->platform_descriptor.clockStep.memoryClock = 500;
-		smu7_thermal_parameter_init(hwmgr);
-	} else {
-		/* Ignore return value in here, we are cleaning up a mess. */
-		smu7_hwmgr_backend_fini(hwmgr);
-	}
+	data->pcie_gen_cap = adev->pm.pcie_gen_mask;
+	if (data->pcie_gen_cap & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)
+		data->pcie_spc_cap = 20;
+	else
+		data->pcie_spc_cap = 16;
+	data->pcie_lane_cap = adev->pm.pcie_mlw_mask;
+
+	hwmgr->platform_descriptor.vbiosInterruptId = 0x20000400; /* IRQ_SOURCE1_SW_INT */
+	/* The true clock step depends on the frequency, typically 4.5 or 9 MHz. Here we use 5. */
+	hwmgr->platform_descriptor.clockStep.engineClock = 500;
+	hwmgr->platform_descriptor.clockStep.memoryClock = 500;
+	smu7_thermal_parameter_init(hwmgr);
 
 	result = smu7_update_edc_leakage_table(hwmgr);
-	if (result) {
-		smu7_hwmgr_backend_fini(hwmgr);
-		return result;
-	}
+	if (result)
+		goto fail;
 
 	return 0;
+fail:
+	smu7_hwmgr_backend_fini(hwmgr);
+	return result;
 }
 
 static int smu7_force_dpm_highest(struct pp_hwmgr *hwmgr)
-- 
2.43.0


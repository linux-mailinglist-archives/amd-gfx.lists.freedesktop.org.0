Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6747C9B4B4D
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2024 14:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D82510E663;
	Tue, 29 Oct 2024 13:50:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0D410E664
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Oct 2024 13:50:33 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49TDoMZc2494544; Tue, 29 Oct 2024 19:20:22 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49TDoMFB2494543;
 Tue, 29 Oct 2024 19:20:22 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 6/9] drm/amdgpu: update vcn_v4.0.5 devcoredump on per
 instance basis
Date: Tue, 29 Oct 2024 19:20:17 +0530
Message-Id: <20241029135020.2494491-7-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029135020.2494491-1-sunil.khatri@amd.com>
References: <20241029135020.2494491-1-sunil.khatri@amd.com>
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

vcn code is restructured for per instance basis. Each
vcn instance is represented by an ip_block and hence a
need to update the dump and print functions for each
instance as an IP.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c | 80 ++++++++++++-------------
 1 file changed, 38 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index c901255a05ee..3854e248a619 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -207,12 +207,12 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
 		adev->vcn.pause_dpg_mode = vcn_v4_0_5_pause_dpg_mode;
 
 	/* Allocate memory for VCN IP Dump buffer */
-	ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	ptr = kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
 	if (!ptr) {
 		DRM_ERROR("Failed to allocate memory for VCN IP Dump\n");
-		adev->vcn.ip_dump = NULL;
+		ip_block->ip_dump = NULL;
 	} else {
-		adev->vcn.ip_dump = ptr;
+		ip_block->ip_dump = ptr;
 	}
 	return 0;
 }
@@ -252,7 +252,7 @@ static int vcn_v4_0_5_sw_fini(struct amdgpu_ip_block *ip_block)
 
 	r = amdgpu_vcn_sw_fini(adev, inst);
 
-	kfree(adev->vcn.ip_dump);
+	kfree(ip_block->ip_dump);
 
 	return r;
 }
@@ -1602,62 +1602,58 @@ static void vcn_v4_0_5_set_irq_funcs(struct amdgpu_device *adev, int inst)
 static void vcn_v4_0_5_print_ip_state(struct amdgpu_ip_block *ip_block, struct drm_printer *p)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i, j;
+	int i;
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0_5);
-	uint32_t inst_off, is_powered;
+	uint32_t is_powered;
+	int inst = ip_block->instance;
 
-	if (!adev->vcn.ip_dump)
+	if (!ip_block->ip_dump)
 		return;
 
-	drm_printf(p, "num_instances:%d\n", adev->vcn.num_vcn_inst);
-	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-		if (adev->vcn.harvest_config & (1 << i)) {
-			drm_printf(p, "\nHarvested Instance:VCN%d Skipping dump\n", i);
-			continue;
-		}
+	drm_printf(p, "Instances no:VCN%d\n", inst);
+
+	if (adev->vcn.harvest_config & (1 << inst)) {
+		drm_printf(p, "\nHarvested Instance:VCN%d Skipping dump\n", inst);
+		return;
+	}
 
-		inst_off = i * reg_count;
-		is_powered = (adev->vcn.ip_dump[inst_off] &
-				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+	is_powered = (ip_block->ip_dump[0] &
+		      UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
 
-		if (is_powered) {
-			drm_printf(p, "\nActive Instance:VCN%d\n", i);
-			for (j = 0; j < reg_count; j++)
-				drm_printf(p, "%-50s \t 0x%08x\n", vcn_reg_list_4_0_5[j].reg_name,
-					   adev->vcn.ip_dump[inst_off + j]);
-		} else {
-			drm_printf(p, "\nInactive Instance:VCN%d\n", i);
-		}
+	if (is_powered) {
+		drm_printf(p, "\nActive Instance:VCN%d\n", inst);
+		for (i = 0; i < reg_count; i++)
+			drm_printf(p, "%-50s \t 0x%08x\n",
+				   vcn_reg_list_4_0_5[i].reg_name,
+				   ip_block->ip_dump[i]);
+	} else {
+		drm_printf(p, "\nInactive Instance:VCN%d\n", inst);
 	}
 }
 
 static void vcn_v4_0_5_dump_ip_state(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i, j;
+	int i;
 	bool is_powered;
-	uint32_t inst_off;
+	uint32_t inst = GET_INST(VCN, ip_block->instance);
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0_5);
 
-	if (!adev->vcn.ip_dump)
+	if (!ip_block->ip_dump)
 		return;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
+	if (adev->vcn.harvest_config & (1 << inst))
+		return;
 
-		inst_off = i * reg_count;
-		/* mmUVD_POWER_STATUS is always readable and is first element of the array */
-		adev->vcn.ip_dump[inst_off] = RREG32_SOC15(VCN, i, regUVD_POWER_STATUS);
-		is_powered = (adev->vcn.ip_dump[inst_off] &
-				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
-
-		if (is_powered)
-			for (j = 1; j < reg_count; j++)
-				adev->vcn.ip_dump[inst_off + j] =
-					RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_4_0_5[j],
-									   i));
-	}
+	/* mmUVD_POWER_STATUS is always readable and is first element of the array */
+	ip_block->ip_dump[0] = RREG32_SOC15(VCN, inst, regUVD_POWER_STATUS);
+	is_powered = (ip_block->ip_dump[0] &
+		      UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+
+	if (is_powered)
+		for (i = 1; i < reg_count; i++)
+			ip_block->ip_dump[i] =
+				RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_4_0_5[i], inst));
 }
 
 static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
-- 
2.34.1


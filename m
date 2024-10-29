Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685A9B4B44
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2024 14:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C409710E65F;
	Tue, 29 Oct 2024 13:50:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CF310E660
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Oct 2024 13:50:32 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49TDoMmL2494519; Tue, 29 Oct 2024 19:20:22 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49TDoMEo2494518;
 Tue, 29 Oct 2024 19:20:22 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>, Boyuan Zhang <boyuan.zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 1/9] drm/amdgpu: update vcn_v1 devcoredump on per instance
 basis
Date: Tue, 29 Oct 2024 19:20:12 +0530
Message-Id: <20241029135020.2494491-2-sunil.khatri@amd.com>
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

Existing way was to capture the ip dump for each instance
in a same memory dump but now each ip_block of vcn is an
independent one and its memory is independent and handled
within the ip_block now.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h   |  2 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 77 +++++++++++++--------------
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d4c8cc3c1730..ef564ddcfcbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -392,6 +392,8 @@ struct amdgpu_ip_block {
 	const struct amdgpu_ip_block_version *version;
 	struct amdgpu_device *adev;
 	unsigned int instance;
+	/* IP reg dump */
+	uint32_t *ip_dump;
 };
 
 int amdgpu_device_ip_block_version_cmp(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 7638ddeccec7..f31fdd620c86 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -203,12 +203,12 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
 	r = jpeg_v1_0_sw_init(ip_block);
 
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
 	return r;
 }
@@ -234,7 +234,7 @@ static int vcn_v1_0_sw_fini(struct amdgpu_ip_block *ip_block)
 
 	r = amdgpu_vcn_sw_fini(adev, inst);
 
-	kfree(adev->vcn.ip_dump);
+	kfree(ip_block->ip_dump);
 
 	return r;
 }
@@ -1933,61 +1933,58 @@ void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
 static void vcn_v1_0_print_ip_state(struct amdgpu_ip_block *ip_block, struct drm_printer *p)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i, j;
+	int i;
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_1_0);
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
+	drm_printf(p, "Instance no:VCN%d\n", inst);
 
-		inst_off = i * reg_count;
-		is_powered = (adev->vcn.ip_dump[inst_off] &
-				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+	if (adev->vcn.harvest_config & (1 << inst)) {
+		drm_printf(p, "\nHarvested Instance:VCN%d Skipping dump\n", inst);
+		return;
+	}
 
-		if (is_powered) {
-			drm_printf(p, "\nActive Instance:VCN%d\n", i);
-			for (j = 0; j < reg_count; j++)
-				drm_printf(p, "%-50s \t 0x%08x\n", vcn_reg_list_1_0[j].reg_name,
-					   adev->vcn.ip_dump[inst_off + j]);
-		} else {
-			drm_printf(p, "\nInactive Instance:VCN%d\n", i);
-		}
+	is_powered = (ip_block->ip_dump[0] &
+		      UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+
+	if (is_powered) {
+		drm_printf(p, "\nActive Instance:VCN%d\n", inst);
+		for (i = 0; i < reg_count; i++)
+			drm_printf(p, "%-50s \t 0x%08x\n",
+				   vcn_reg_list_1_0[i].reg_name,
+				   ip_block->ip_dump[i]);
+	} else {
+		drm_printf(p, "\nInactive Instance:VCN%d\n", inst);
 	}
 }
 
 static void vcn_v1_0_dump_ip_state(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
-	int i, j;
+	int i;
+	int inst = ip_block->instance;
 	bool is_powered;
-	uint32_t inst_off;
 	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_1_0);
 
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
-		adev->vcn.ip_dump[inst_off] = RREG32_SOC15(VCN, i, mmUVD_POWER_STATUS);
-		is_powered = (adev->vcn.ip_dump[inst_off] &
-				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+	/* mmUVD_POWER_STATUS is always readable and is first element of the array */
+	ip_block->ip_dump[0] = RREG32_SOC15(VCN, inst, mmUVD_POWER_STATUS);
+	is_powered = (ip_block->ip_dump[0] &
+		      UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
 
-		if (is_powered)
-			for (j = 1; j < reg_count; j++)
-				adev->vcn.ip_dump[inst_off + j] =
-					RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_1_0[j], i));
-	}
+	if (is_powered)
+		for (i = 1; i < reg_count; i++)
+			ip_block->ip_dump[i] =
+				RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_1_0[i], inst));
 }
 
 static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
-- 
2.34.1


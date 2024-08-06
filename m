Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16C948B19
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2024 10:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D673310E31C;
	Tue,  6 Aug 2024 08:18:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0C110E31B
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2024 08:18:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4768IWaO2422901; Tue, 6 Aug 2024 13:48:32 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4768IWXX2422900;
 Tue, 6 Aug 2024 13:48:32 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 13/15] drm/amdgpu: add vcn_v2_5 ip dump support
Date: Tue,  6 Aug 2024 13:48:23 +0530
Message-Id: <20240806081825.2422771-14-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240806081825.2422771-1-sunil.khatri@amd.com>
References: <20240806081825.2422771-1-sunil.khatri@amd.com>
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

Add support of vcn ip dump in the devcoredump
for vcn_v2_5.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 110 +++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 96f60c303161..724176c1c352 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -55,6 +55,73 @@
 
 #define VCN25_MAX_HW_INSTANCES_ARCTURUS			2
 
+static const struct amdgpu_hwip_reg_entry vcn_reg_list_2_5[] = {
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_POWER_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RBC_RB_RPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RBC_RB_WPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_CONTEXT_ID),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_GPCOM_VCPU_DATA0),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_GPCOM_VCPU_DATA1),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_GPCOM_VCPU_CMD),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_NC1_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_NC1_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_NC0_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_NC0_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_RBC_IB_VMID),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE_VMIDS_MULTI),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_NC_VMIDS_MULTI),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_HI),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_LO),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_HI2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_LO2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_HI3),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_LO3),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_RPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_WPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_RPTR2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_WPTR2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_RPTR3),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_WPTR3),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_SIZE),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_SIZE2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_SIZE3),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_PGFSM_CONFIG),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_PGFSM_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SOFT_RESET),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SOFT_RESET2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_CGC_GATE),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_CGC_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_CGC_CTRL),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SUVD_CGC_GATE),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SUVD_CGC_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SUVD_CGC_CTRL),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_LO4),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_BASE_HI4),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_SIZE4),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_RPTR4),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RB_WPTR4),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_VCPU_CACHE_OFFSET2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE3_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE3_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE4_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE4_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE5_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE5_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE6_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE6_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE7_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_VCPU_CACHE7_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SCRATCH1)
+};
+
 static void vcn_v2_5_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev);
@@ -122,6 +189,8 @@ static int vcn_v2_5_sw_init(void *handle)
 {
 	struct amdgpu_ring *ring;
 	int i, j, r;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_2_5);
+	uint32_t *ptr;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	for (j = 0; j < adev->vcn.num_vcn_inst; j++) {
@@ -241,6 +310,15 @@ static int vcn_v2_5_sw_init(void *handle)
 	if (r)
 		return r;
 
+	/* Allocate memory for VCN IP Dump buffer */
+	ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	if (ptr == NULL) {
+		DRM_ERROR("Failed to allocate memory for VCN IP Dump\n");
+		adev->vcn.ip_dump = NULL;
+	} else {
+		adev->vcn.ip_dump = ptr;
+	}
+
 	return 0;
 }
 
@@ -277,6 +355,8 @@ static int vcn_v2_5_sw_fini(void *handle)
 
 	r = amdgpu_vcn_sw_fini(adev);
 
+	kfree(adev->vcn.ip_dump);
+
 	return r;
 }
 
@@ -1876,6 +1956,34 @@ static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev)
 	}
 }
 
+static void vcn_v2_5_dump_ip_state(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, j;
+	bool is_powered;
+	uint32_t inst_off;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_2_5);
+
+	if (!adev->vcn.ip_dump)
+		return;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		inst_off = i * reg_count;
+		/* mmUVD_POWER_STATUS is always readable and is first element of the array */
+		adev->vcn.ip_dump[inst_off] = RREG32_SOC15(VCN, i, mmUVD_POWER_STATUS);
+		is_powered = (adev->vcn.ip_dump[inst_off] &
+				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+
+		if (is_powered)
+			for (j = 1; j < reg_count; j++)
+				adev->vcn.ip_dump[inst_off + j] =
+					RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_2_5[j], i));
+	}
+}
+
 static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 	.name = "vcn_v2_5",
 	.early_init = vcn_v2_5_early_init,
@@ -1894,7 +2002,7 @@ static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v2_5_set_clockgating_state,
 	.set_powergating_state = vcn_v2_5_set_powergating_state,
-	.dump_ip_state = NULL,
+	.dump_ip_state = vcn_v2_5_dump_ip_state,
 	.print_ip_state = NULL,
 };
 
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED51948B13
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2024 10:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2E010E313;
	Tue,  6 Aug 2024 08:18:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9802B10E313
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2024 08:18:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4768IVEj2422881; Tue, 6 Aug 2024 13:48:31 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4768IVmn2422880;
 Tue, 6 Aug 2024 13:48:31 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 09/15] drm/amdgpu: add vcn_v1_0 ip dump support
Date: Tue,  6 Aug 2024 13:48:19 +0530
Message-Id: <20240806081825.2422771-10-sunil.khatri@amd.com>
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
for vcn_v1_0.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 95 ++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index a280b9fecb77..ceaf4b3847a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -45,6 +45,59 @@
 #define mmUVD_REG_XX_MASK_1_0			0x05ac
 #define mmUVD_REG_XX_MASK_1_0_BASE_IDX		1
 
+static const struct amdgpu_hwip_reg_entry vcn_reg_list_1_0[] = {
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_POWER_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RBC_RB_RPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_RBC_RB_WPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_CONTEXT_ID),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_GPCOM_VCPU_DATA0),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_GPCOM_VCPU_DATA1),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_GPCOM_VCPU_CMD),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_RBC_IB_VMID),
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
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_DPG_VCPU_CACHE_OFFSET0),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_DPG_LMI_VCPU_CACHE_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_DPG_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SCRATCH1)
+};
+
 static int vcn_v1_0_stop(struct amdgpu_device *adev);
 static void vcn_v1_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v1_0_set_enc_ring_funcs(struct amdgpu_device *adev);
@@ -90,6 +143,8 @@ static int vcn_v1_0_sw_init(void *handle)
 {
 	struct amdgpu_ring *ring;
 	int i, r;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_1_0);
+	uint32_t *ptr;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	/* VCN DEC TRAP */
@@ -161,6 +216,14 @@ static int vcn_v1_0_sw_init(void *handle)
 
 	r = jpeg_v1_0_sw_init(handle);
 
+	/* Allocate memory for VCN IP Dump buffer */
+	ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	if (ptr == NULL) {
+		DRM_ERROR("Failed to allocate memory for VCN IP Dump\n");
+		adev->vcn.ip_dump = NULL;
+	} else {
+		adev->vcn.ip_dump = ptr;
+	}
 	return r;
 }
 
@@ -184,6 +247,8 @@ static int vcn_v1_0_sw_fini(void *handle)
 
 	r = amdgpu_vcn_sw_fini(adev);
 
+	kfree(adev->vcn.ip_dump);
+
 	return r;
 }
 
@@ -1877,6 +1942,34 @@ void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
 	mutex_unlock(&ring->adev->vcn.vcn1_jpeg1_workaround);
 }
 
+static void vcn_v1_0_dump_ip_state(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, j;
+	bool is_powered;
+	uint32_t inst_off;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_1_0);
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
+					RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_1_0[j], i));
+	}
+}
+
 static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
 	.name = "vcn_v1_0",
 	.early_init = vcn_v1_0_early_init,
@@ -1895,7 +1988,7 @@ static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
 	.post_soft_reset = NULL /* vcn_v1_0_post_soft_reset */,
 	.set_clockgating_state = vcn_v1_0_set_clockgating_state,
 	.set_powergating_state = vcn_v1_0_set_powergating_state,
-	.dump_ip_state = NULL,
+	.dump_ip_state = vcn_v1_0_dump_ip_state,
 	.print_ip_state = NULL,
 };
 
-- 
2.34.1


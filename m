Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE193B059
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2024 13:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E1710E698;
	Wed, 24 Jul 2024 11:33:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9422110E692
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jul 2024 11:33:02 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 46OBWqvJ2707732; Wed, 24 Jul 2024 17:02:52 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 46OBWq8U2707731;
 Wed, 24 Jul 2024 17:02:52 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, Liu Leo <Leo.Liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/3] drm/amdgpu: add vcn_v3_0 ip dump support
Date: Wed, 24 Jul 2024 17:02:49 +0530
Message-Id: <20240724113250.2707693-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724113250.2707693-1-sunil.khatri@amd.com>
References: <20240724113250.2707693-1-sunil.khatri@amd.com>
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
for vcn_v3_0.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 149 +++++++++++++++++++++++++-
 1 file changed, 148 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 24f947751c46..544b46ad55bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -60,6 +60,115 @@
 #define RDECODE_MSG_CREATE					0x00000000
 #define RDECODE_MESSAGE_CREATE					0x00000001
 
+static const struct amdgpu_hwip_reg_entry vcn_reg_list_3_0[] = {
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
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SUVD_CGC_STATUS2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SUVD_CGC_GATE2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_VCPU_CACHE_OFFSET2),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_GPGPU_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_GPGPU_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_CURR_LUMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_CURR_LUMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_CURR_CHROMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_CURR_CHROMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_REF_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_REF_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_DBW_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_DBW_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_CM_COLOC_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_CM_COLOC_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP0_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP0_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP1_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP1_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP2_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP2_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP3_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSP3_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD0_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD0_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD1_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD1_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD2_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD2_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD3_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD3_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD4_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_BSD4_64BIT_BAR_HIGH),
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
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_SCLR_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_SCLR_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_SCLR2_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_SCLR2_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_IMAGEPASTE_LUMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_IMAGEPASTE_LUMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_IMAGEPASTE_CHROMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_IMAGEPASTE_CHROMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_PRIVACY_LUMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_PRIVACY_LUMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_PRIVACY_CHROMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_PRIVACY_CHROMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_REF_LUMA_64BIT_BAR_LOW),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_LMI_MIF_REF_LUMA_64BIT_BAR_HIGH),
+	SOC15_REG_ENTRY_STR(VCN, 0, mmUVD_SCRATCH1)
+};
+
 static int amdgpu_ih_clientid_vcns[] = {
 	SOC15_IH_CLIENTID_VCN,
 	SOC15_IH_CLIENTID_VCN1
@@ -126,6 +235,8 @@ static int vcn_v3_0_sw_init(void *handle)
 	struct amdgpu_ring *ring;
 	int i, j, r;
 	int vcn_doorbell_index = 0;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_3_0);
+	uint32_t *ptr;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	r = amdgpu_vcn_sw_init(adev);
@@ -246,6 +357,15 @@ static int vcn_v3_0_sw_init(void *handle)
 	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
 		adev->vcn.pause_dpg_mode = vcn_v3_0_pause_dpg_mode;
 
+	/* Allocate memory for VCN IP Dump buffer */
+	ptr = kcalloc(adev->sdma.num_instances * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	if (ptr == NULL) {
+		DRM_ERROR("Failed to allocate memory for VCN IP Dump\n");
+		adev->vcn.ip_dump = NULL;
+	} else {
+		adev->vcn.ip_dump = ptr;
+	}
+
 	return 0;
 }
 
@@ -284,6 +404,7 @@ static int vcn_v3_0_sw_fini(void *handle)
 
 	r = amdgpu_vcn_sw_fini(adev);
 
+	kfree(adev->vcn.ip_dump);
 	return r;
 }
 
@@ -2203,6 +2324,32 @@ static void vcn_v3_0_set_irq_funcs(struct amdgpu_device *adev)
 	}
 }
 
+static void vcn_v3_0_dump_ip_state(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, j;
+	bool reg_safe;
+	uint32_t inst_off;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_3_0);
+
+	if (!adev->vcn.ip_dump)
+		return;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		inst_off = i * reg_count;
+		reg_safe = (RREG32_SOC15(VCN, i, mmUVD_POWER_STATUS) &
+			    UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1 ? true : false;
+
+		if (reg_safe)
+			for (j = 0; j < reg_count; j++)
+				adev->vcn.ip_dump[inst_off + j] =
+					RREG32(SOC15_REG_ENTRY_OFFSET(vcn_reg_list_3_0[j]));
+	}
+}
+
 static const struct amd_ip_funcs vcn_v3_0_ip_funcs = {
 	.name = "vcn_v3_0",
 	.early_init = vcn_v3_0_early_init,
@@ -2221,7 +2368,7 @@ static const struct amd_ip_funcs vcn_v3_0_ip_funcs = {
 	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v3_0_set_clockgating_state,
 	.set_powergating_state = vcn_v3_0_set_powergating_state,
-	.dump_ip_state = NULL,
+	.dump_ip_state = vcn_v3_0_dump_ip_state,
 	.print_ip_state = NULL,
 };
 
-- 
2.34.1


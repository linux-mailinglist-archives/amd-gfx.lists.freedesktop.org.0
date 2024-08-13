Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB519503B2
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2024 13:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954D910E314;
	Tue, 13 Aug 2024 11:30:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5850610E308
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2024 11:30:47 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 47DBUbwH768904; Tue, 13 Aug 2024 17:00:37 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 47DBUbqS768903;
 Tue, 13 Aug 2024 17:00:37 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 10/18] drm/amdgpu: add vcn_v4_0_5 ip dump support
Date: Tue, 13 Aug 2024 17:00:26 +0530
Message-Id: <20240813113034.768804-11-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240813113034.768804-1-sunil.khatri@amd.com>
References: <20240813113034.768804-1-sunil.khatri@amd.com>
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
for vcn_v4_0_5.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c | 79 ++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 8d75061f9f38..b05bfe1dad75 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -52,6 +52,42 @@
 #define RDECODE_MSG_CREATE							0x00000000
 #define RDECODE_MESSAGE_CREATE						0x00000001
 
+static const struct amdgpu_hwip_reg_entry vcn_reg_list_4_0_5[] = {
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_POWER_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_CONTEXT_ID),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_CONTEXT_ID2),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_GPCOM_VCPU_DATA0),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_GPCOM_VCPU_DATA1),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_GPCOM_VCPU_CMD),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_HI),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_LO),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_HI2),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_LO2),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_HI3),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_LO3),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_HI4),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_BASE_LO4),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_RPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_WPTR),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_RPTR2),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_WPTR2),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_RPTR3),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_WPTR3),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_RPTR4),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_WPTR4),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_SIZE),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_SIZE2),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_SIZE3),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_RB_SIZE4),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_PGFSM_CONFIG),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_PGFSM_STATUS),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_DPG_LMA_CTL),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_DPG_LMA_DATA),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_DPG_LMA_MASK),
+	SOC15_REG_ENTRY_STR(VCN, 0, regUVD_DPG_PAUSE)
+};
+
 static int amdgpu_ih_clientid_vcns[] = {
 	SOC15_IH_CLIENTID_VCN,
 	SOC15_IH_CLIENTID_VCN1
@@ -97,6 +133,8 @@ static int vcn_v4_0_5_sw_init(void *handle)
 	struct amdgpu_ring *ring;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int i, r;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0_5);
+	uint32_t *ptr;
 
 	r = amdgpu_vcn_sw_init(adev);
 	if (r)
@@ -168,6 +206,14 @@ static int vcn_v4_0_5_sw_init(void *handle)
 	if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
 		adev->vcn.pause_dpg_mode = vcn_v4_0_5_pause_dpg_mode;
 
+	/* Allocate memory for VCN IP Dump buffer */
+	ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
+	if (!ptr) {
+		DRM_ERROR("Failed to allocate memory for VCN IP Dump\n");
+		adev->vcn.ip_dump = NULL;
+	} else {
+		adev->vcn.ip_dump = ptr;
+	}
 	return 0;
 }
 
@@ -207,6 +253,8 @@ static int vcn_v4_0_5_sw_fini(void *handle)
 
 	r = amdgpu_vcn_sw_fini(adev);
 
+	kfree(adev->vcn.ip_dump);
+
 	return r;
 }
 
@@ -1733,6 +1781,35 @@ static void vcn_v4_0_5_set_irq_funcs(struct amdgpu_device *adev)
 	}
 }
 
+static void vcn_v4_0_5_dump_ip_state(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, j;
+	bool is_powered;
+	uint32_t inst_off;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_4_0_5);
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
+		adev->vcn.ip_dump[inst_off] = RREG32_SOC15(VCN, i, regUVD_POWER_STATUS);
+		is_powered = (adev->vcn.ip_dump[inst_off] &
+				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+
+		if (is_powered)
+			for (j = 1; j < reg_count; j++)
+				adev->vcn.ip_dump[inst_off + j] =
+					RREG32(SOC15_REG_ENTRY_OFFSET_INST(vcn_reg_list_4_0_5[j],
+									   i));
+	}
+}
+
 static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
 	.name = "vcn_v4_0_5",
 	.early_init = vcn_v4_0_5_early_init,
@@ -1751,7 +1828,7 @@ static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
 	.post_soft_reset = NULL,
 	.set_clockgating_state = vcn_v4_0_5_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_5_set_powergating_state,
-	.dump_ip_state = NULL,
+	.dump_ip_state = vcn_v4_0_5_dump_ip_state,
 	.print_ip_state = NULL,
 };
 
-- 
2.34.1


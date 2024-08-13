Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADF59503B1
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2024 13:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B940B10E310;
	Tue, 13 Aug 2024 11:30:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB610E302
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2024 11:30:47 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 47DBUcC7768946; Tue, 13 Aug 2024 17:00:38 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 47DBUcFZ768945;
 Tue, 13 Aug 2024 17:00:38 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 17/18] drm/amdgpu: add print support for vcn_v2_5 ip dump
Date: Tue, 13 Aug 2024 17:00:33 +0530
Message-Id: <20240813113034.768804-18-sunil.khatri@amd.com>
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

Add support for logging the registers in devcoredump
buffer for vcn_v2_5.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 34 ++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 343a9667e03a..661eef38aec9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1926,6 +1926,38 @@ static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev)
 	}
 }
 
+static void vcn_v2_5_print_ip_state(void *handle, struct drm_printer *p)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, j;
+	uint32_t reg_count = ARRAY_SIZE(vcn_reg_list_2_5);
+	uint32_t inst_off, is_powered;
+
+	if (!adev->vcn.ip_dump)
+		return;
+
+	drm_printf(p, "num_instances:%d\n", adev->vcn.num_vcn_inst);
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		if (adev->vcn.harvest_config & (1 << i)) {
+			drm_printf(p, "\nHarvested Instance:VCN%d Skipping dump\n", i);
+			continue;
+		}
+
+		inst_off = i * reg_count;
+		is_powered = (adev->vcn.ip_dump[inst_off] &
+				UVD_POWER_STATUS__UVD_POWER_STATUS_MASK) != 1;
+
+		if (is_powered) {
+			drm_printf(p, "\nActive Instance:VCN%d\n", i);
+			for (j = 0; j < reg_count; j++)
+				drm_printf(p, "%-50s \t 0x%08x\n", vcn_reg_list_2_5[j].reg_name,
+					   adev->vcn.ip_dump[inst_off + j]);
+		} else {
+			drm_printf(p, "\nInactive Instance:VCN%d\n", i);
+		}
+	}
+}
+
 static void vcn_v2_5_dump_ip_state(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -1973,7 +2005,7 @@ static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 	.set_clockgating_state = vcn_v2_5_set_clockgating_state,
 	.set_powergating_state = vcn_v2_5_set_powergating_state,
 	.dump_ip_state = vcn_v2_5_dump_ip_state,
-	.print_ip_state = NULL,
+	.print_ip_state = vcn_v2_5_print_ip_state,
 };
 
 static const struct amd_ip_funcs vcn_v2_6_ip_funcs = {
-- 
2.34.1


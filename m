Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A988F5107A2
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Apr 2022 20:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF3710E50C;
	Tue, 26 Apr 2022 18:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F33010E4E6
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Apr 2022 18:53:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGp8bK3hwh77Vczb+slvTx3mphpmFgzbfm8z8br/QuuW93ejueMDzWCMJGX9Zrm+gDEFzyN93w+ilr3KCeDAOMyouyvgtjA859M8kZgaQGrNJO7NhveAbRqJ2ga0moM/tM0218WTG7Q6f/ktEblB/lA+BG/P8ZBp5sEQm+ScgWrtYVBLLsC33wllKdfRj9VH0xNwPhTzU1K+KPCyj7UlA5zezt/0v2a+U4vxIcGM6W7biZ8EXMHcdJuhiuFi/KgN2AdQSLKw4cI9ojFmirtNA/kNXR8tdX0Co4UmvLDsOzmUbXf0B+ZXhSKEwSHSm/shNBusFfMFStqqdVM7cbqDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWcA7y3ifVK/kiUccmrNx17xmp8xPx7Bjlm4DfGdHn0=;
 b=bKTegDCLedsKKW53sokjOi0wS8Hmc+p0DqUF1dl1c5nB+RKHK8usSLqkXDFb+s+gsIpLXa9GR78uHKiqM1ymJvz/CtOpxwEY4ORxD9dR6vAdxFgnzoVY9M094UW1OMZE9QUxY7hpqCwiT1mI7SevEP9G+niQGhucC3rJBS4R6mJaVor6xra2LtEbXhhoOWetq3GNODsnDerwEj47mNi39Lq7c02dtDg+0Sdsgwb5omW8iBDS0ivbtMi0mMtjK/TdZTtMZigZdNMpYsk1fBa2haWJJEQt0GJvVW1fb6GbhUQiDXnPuXbVtDctNiB9eUGirl1e2cOo849uEkkqQX/vsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWcA7y3ifVK/kiUccmrNx17xmp8xPx7Bjlm4DfGdHn0=;
 b=jQHyrmdk9wDPPCo/pf/9Raalv2UzKv2RMZt8hbr2PCmv86gzc9ZKtKw/4luAko5KYiVCkG+yAAr7o56yLl5v6sDDrqjNejV3+37hEOpa7kPd6p80dYxWKlsvaM2BXlkjAct64CKtzBx8CIyDiB46SN1aMyOm4mAfgNmHs0o7bN8=
Received: from DM6PR03CA0052.namprd03.prod.outlook.com (2603:10b6:5:100::29)
 by BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 18:53:12 +0000
Received: from DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::8) by DM6PR03CA0052.outlook.office365.com
 (2603:10b6:5:100::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Tue, 26 Apr 2022 18:53:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT004.mail.protection.outlook.com (10.13.172.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Tue, 26 Apr 2022 18:53:12 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 13:53:10 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] drm/amdgpu: add soc21 common ip block v2
Date: Tue, 26 Apr 2022 14:52:55 -0400
Message-ID: <20220426185255.3039590-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426185255.3039590-1-alexander.deucher@amd.com>
References: <20220426185255.3039590-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a17e849c-8083-44b7-42d0-08da27b6039c
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:EE_
X-Microsoft-Antispam-PRVS: <BN7PR12MB27085A4C43AA750BFA47F435F7FB9@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9J0h/ut4w7RkKVxnqpYAifIdujgjcvuUxhaduVJb//H28DkcH2/su4i6JoqoL1VztE1QC8cboUNNAADrjsohbKBISdBq3/j3mUjjaKBghlCENnCgBk/lUeTWYtIlAvDI/oRsUsC8JDJtMM4CUN5IBswAXplrdFHsG8LfZSs+44mjQkWQFimru7aYFXWUCGXUJl+8F01H4Vdos279pDbVAdvvRSXwhn5VZpbnvMTHXWO3aEW6kwwl8Q9ChPZUziPU1cP4TSqDA73GiQ1t1i5V4wZdeEqxzkBgnDhzKh1yTp0RY5i4oZBm6rWDq8ElqNnMSZlwMPDxHWDUlYJbqPZN7d0TRYkYluB4gm39+bO+TA6DbTbtH3PD59Zj+MhqBjJTbQv6Ojq/eY1c23088Bwgqak9qbUUBEzHsWuBkQXuRCq53DZeQNYMG4b0R3EC7ZD8IwaA7CsrYiSW+Yk7Ak4Z0Ukf8Bg1MaXBRY/dEGEShMA4bcJ0ppLjeUGYv9NGbbV9W+vjrmPCYhM8DVOTkpo8OkEi2jgEzKZ0OOiVo05kvDORszSn5Eh1It5OVg5ZzLNatfHw79JWdmt+sLTt56XE/5tpgle2iNz4ezzSl4viQv1aoZXAl1y8mZIpOXe7UZGCS75GH+P0RVLM+tGtsMKPDK547riPMX3fCyy891503wK+4RAbNAO7rGvOKpYKO9A5adnnHRwzW0NtHRYSvTbT8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(30864003)(4326008)(2616005)(86362001)(26005)(7696005)(5660300002)(6666004)(2906002)(356005)(83380400001)(36860700001)(8676002)(8936002)(1076003)(40460700003)(508600001)(36756003)(82310400005)(316002)(186003)(16526019)(70206006)(426003)(336012)(70586007)(6916009)(47076005)(54906003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 18:53:12.3200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17e849c-8083-44b7-42d0-08da27b6039c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "Stanley.Yang" <Stanley.Yang@amd.com>

This adds soc21 common ip block support

Changed from v1:
Switch WREG32/RREG32_PCIE to use indirect reg access
helper for sco15 and onwards

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c  | 620 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/soc21.h  |  30 ++
 3 files changed, 651 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc21.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc21.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index b525f9be9326..2b454e7d7a76 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -74,7 +74,7 @@ amdgpu-$(CONFIG_DRM_AMDGPU_SI)+= si.o gmc_v6_0.o gfx_v6_0.o si_ih.o si_dma.o dce
 amdgpu-y += \
 	vi.o mxgpu_vi.o nbio_v6_1.o soc15.o emu_soc.o mxgpu_ai.o nbio_v7_0.o vega10_reg_init.o \
 	vega20_reg_init.o nbio_v7_4.o nbio_v2_3.o nv.o arct_reg_init.o mxgpu_nv.o \
-	nbio_v7_2.o hdp_v4_0.o hdp_v5_0.o aldebaran_reg_init.o aldebaran.o
+	nbio_v7_2.o hdp_v4_0.o hdp_v5_0.o aldebaran_reg_init.o aldebaran.o soc21.o
 
 # add DF block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
new file mode 100644
index 000000000000..a139fd1d3127
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -0,0 +1,620 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#include <linux/firmware.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "amdgpu.h"
+#include "amdgpu_atombios.h"
+#include "amdgpu_ih.h"
+#include "amdgpu_uvd.h"
+#include "amdgpu_vce.h"
+#include "amdgpu_ucode.h"
+#include "amdgpu_psp.h"
+#include "amdgpu_smu.h"
+#include "atom.h"
+#include "amd_pcie.h"
+
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
+#include "mp/mp_13_0_0_offset.h"
+
+#include "soc15.h"
+#include "soc15_common.h"
+
+static const struct amd_ip_funcs soc21_common_ip_funcs;
+
+/*
+ * Indirect registers accessor
+ */
+static u32 soc21_pcie_rreg(struct amdgpu_device *adev, u32 reg)
+{
+	unsigned long address, data;
+	address = adev->nbio.funcs->get_pcie_index_offset(adev);
+	data = adev->nbio.funcs->get_pcie_data_offset(adev);
+
+	return amdgpu_device_indirect_rreg(adev, address, data, reg);
+}
+
+static void soc21_pcie_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
+{
+	unsigned long address, data;
+
+	address = adev->nbio.funcs->get_pcie_index_offset(adev);
+	data = adev->nbio.funcs->get_pcie_data_offset(adev);
+
+	amdgpu_device_indirect_wreg(adev, address, data, reg, v);
+}
+
+static u64 soc21_pcie_rreg64(struct amdgpu_device *adev, u32 reg)
+{
+	unsigned long address, data;
+	address = adev->nbio.funcs->get_pcie_index_offset(adev);
+	data = adev->nbio.funcs->get_pcie_data_offset(adev);
+
+	return amdgpu_device_indirect_rreg64(adev, address, data, reg);
+}
+
+static void soc21_pcie_wreg64(struct amdgpu_device *adev, u32 reg, u64 v)
+{
+	unsigned long address, data;
+
+	address = adev->nbio.funcs->get_pcie_index_offset(adev);
+	data = adev->nbio.funcs->get_pcie_data_offset(adev);
+
+	amdgpu_device_indirect_wreg64(adev, address, data, reg, v);
+}
+
+static u32 soc21_didt_rreg(struct amdgpu_device *adev, u32 reg)
+{
+	unsigned long flags, address, data;
+	u32 r;
+
+	address = SOC15_REG_OFFSET(GC, 0, regDIDT_IND_INDEX);
+	data = SOC15_REG_OFFSET(GC, 0, regDIDT_IND_DATA);
+
+	spin_lock_irqsave(&adev->didt_idx_lock, flags);
+	WREG32(address, (reg));
+	r = RREG32(data);
+	spin_unlock_irqrestore(&adev->didt_idx_lock, flags);
+	return r;
+}
+
+static void soc21_didt_wreg(struct amdgpu_device *adev, u32 reg, u32 v)
+{
+	unsigned long flags, address, data;
+
+	address = SOC15_REG_OFFSET(GC, 0, regDIDT_IND_INDEX);
+	data = SOC15_REG_OFFSET(GC, 0, regDIDT_IND_DATA);
+
+	spin_lock_irqsave(&adev->didt_idx_lock, flags);
+	WREG32(address, (reg));
+	WREG32(data, (v));
+	spin_unlock_irqrestore(&adev->didt_idx_lock, flags);
+}
+
+static u32 soc21_get_config_memsize(struct amdgpu_device *adev)
+{
+	return adev->nbio.funcs->get_memsize(adev);
+}
+
+static u32 soc21_get_xclk(struct amdgpu_device *adev)
+{
+	return adev->clock.spll.reference_freq;
+}
+
+
+void soc21_grbm_select(struct amdgpu_device *adev,
+		     u32 me, u32 pipe, u32 queue, u32 vmid)
+{
+	u32 grbm_gfx_cntl = 0;
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, PIPEID, pipe);
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, MEID, me);
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, VMID, vmid);
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, QUEUEID, queue);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regGRBM_GFX_CNTL), grbm_gfx_cntl);
+}
+
+static void soc21_vga_set_state(struct amdgpu_device *adev, bool state)
+{
+	/* todo */
+}
+
+static bool soc21_read_disabled_bios(struct amdgpu_device *adev)
+{
+	/* todo */
+	return false;
+}
+
+static struct soc15_allowed_register_entry soc21_allowed_read_registers[] = {
+	{ SOC15_REG_ENTRY(GC, 0, regGRBM_STATUS)},
+	{ SOC15_REG_ENTRY(GC, 0, regGRBM_STATUS2)},
+	{ SOC15_REG_ENTRY(GC, 0, regGRBM_STATUS_SE0)},
+	{ SOC15_REG_ENTRY(GC, 0, regGRBM_STATUS_SE1)},
+	{ SOC15_REG_ENTRY(GC, 0, regGRBM_STATUS_SE2)},
+	{ SOC15_REG_ENTRY(GC, 0, regGRBM_STATUS_SE3)},
+	{ SOC15_REG_ENTRY(SDMA0, 0, regSDMA0_STATUS_REG)},
+	{ SOC15_REG_ENTRY(SDMA1, 0, regSDMA1_STATUS_REG)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_STAT)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_STALLED_STAT1)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_STALLED_STAT2)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_STALLED_STAT3)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_CPF_BUSY_STAT)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_CPF_STALLED_STAT1)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_CPF_STATUS)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_CPC_BUSY_STAT)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_CPC_STALLED_STAT1)},
+	{ SOC15_REG_ENTRY(GC, 0, regCP_CPC_STATUS)},
+	{ SOC15_REG_ENTRY(GC, 0, regGB_ADDR_CONFIG)},
+};
+
+static uint32_t soc21_read_indexed_register(struct amdgpu_device *adev, u32 se_num,
+					 u32 sh_num, u32 reg_offset)
+{
+	uint32_t val;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff);
+
+	val = RREG32(reg_offset);
+
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	mutex_unlock(&adev->grbm_idx_mutex);
+	return val;
+}
+
+static uint32_t soc21_get_register_value(struct amdgpu_device *adev,
+				      bool indexed, u32 se_num,
+				      u32 sh_num, u32 reg_offset)
+{
+	if (indexed) {
+		return soc21_read_indexed_register(adev, se_num, sh_num, reg_offset);
+	} else {
+		if (reg_offset == SOC15_REG_OFFSET(GC, 0, regGB_ADDR_CONFIG) && adev->gfx.config.gb_addr_config)
+			return adev->gfx.config.gb_addr_config;
+		return RREG32(reg_offset);
+	}
+}
+
+static int soc21_read_register(struct amdgpu_device *adev, u32 se_num,
+			    u32 sh_num, u32 reg_offset, u32 *value)
+{
+	uint32_t i;
+	struct soc15_allowed_register_entry  *en;
+
+	*value = 0;
+	for (i = 0; i < ARRAY_SIZE(soc21_allowed_read_registers); i++) {
+		en = &soc21_allowed_read_registers[i];
+		if (reg_offset !=
+		    (adev->reg_offset[en->hwip][en->inst][en->seg] + en->reg_offset))
+			continue;
+
+		*value = soc21_get_register_value(adev,
+					       soc21_allowed_read_registers[i].grbm_indexed,
+					       se_num, sh_num, reg_offset);
+		return 0;
+	}
+	return -EINVAL;
+}
+
+#if 0
+static int soc21_asic_mode1_reset(struct amdgpu_device *adev)
+{
+	u32 i;
+	int ret = 0;
+
+	amdgpu_atombios_scratch_regs_engine_hung(adev, true);
+
+	/* disable BM */
+	pci_clear_master(adev->pdev);
+
+	amdgpu_device_cache_pci_state(adev->pdev);
+
+	if (amdgpu_dpm_is_mode1_reset_supported(adev)) {
+		dev_info(adev->dev, "GPU smu mode1 reset\n");
+		ret = amdgpu_dpm_mode1_reset(adev);
+	} else {
+		dev_info(adev->dev, "GPU psp mode1 reset\n");
+		ret = psp_gpu_reset(adev);
+	}
+
+	if (ret)
+		dev_err(adev->dev, "GPU mode1 reset failed\n");
+	amdgpu_device_load_pci_state(adev->pdev);
+
+	/* wait for asic to come out of reset */
+	for (i = 0; i < adev->usec_timeout; i++) {
+		u32 memsize = adev->nbio.funcs->get_memsize(adev);
+
+		if (memsize != 0xffffffff)
+			break;
+		udelay(1);
+	}
+
+	amdgpu_atombios_scratch_regs_engine_hung(adev, false);
+
+	return ret;
+}
+#endif
+
+static enum amd_reset_method
+soc21_asic_reset_method(struct amdgpu_device *adev)
+{
+	if (amdgpu_reset_method == AMD_RESET_METHOD_MODE1 ||
+	    amdgpu_reset_method == AMD_RESET_METHOD_BACO)
+		return amdgpu_reset_method;
+
+	if (amdgpu_reset_method != -1)
+		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
+				  amdgpu_reset_method);
+
+	switch (adev->ip_versions[MP1_HWIP][0]) {
+	case IP_VERSION(13, 0, 0):
+		return AMD_RESET_METHOD_MODE1;
+	default:
+		if (amdgpu_dpm_is_baco_supported(adev))
+			return AMD_RESET_METHOD_BACO;
+		else
+			return AMD_RESET_METHOD_MODE1;
+	}
+}
+
+static int soc21_asic_reset(struct amdgpu_device *adev)
+{
+	int ret = 0;
+
+	switch (soc21_asic_reset_method(adev)) {
+	case AMD_RESET_METHOD_PCI:
+		dev_info(adev->dev, "PCI reset\n");
+		ret = amdgpu_device_pci_reset(adev);
+		break;
+	case AMD_RESET_METHOD_BACO:
+		dev_info(adev->dev, "BACO reset\n");
+		ret = amdgpu_dpm_baco_reset(adev);
+		break;
+	default:
+		dev_info(adev->dev, "MODE1 reset\n");
+		ret = amdgpu_device_mode1_reset(adev);
+		break;
+	}
+
+	return ret;
+}
+
+static int soc21_set_uvd_clocks(struct amdgpu_device *adev, u32 vclk, u32 dclk)
+{
+	/* todo */
+	return 0;
+}
+
+static int soc21_set_vce_clocks(struct amdgpu_device *adev, u32 evclk, u32 ecclk)
+{
+	/* todo */
+	return 0;
+}
+
+static void soc21_pcie_gen3_enable(struct amdgpu_device *adev)
+{
+	if (pci_is_root_bus(adev->pdev->bus))
+		return;
+
+	if (amdgpu_pcie_gen2 == 0)
+		return;
+
+	if (!(adev->pm.pcie_gen_mask & (CAIL_PCIE_LINK_SPEED_SUPPORT_GEN2 |
+					CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)))
+		return;
+
+	/* todo */
+}
+
+static void soc21_program_aspm(struct amdgpu_device *adev)
+{
+
+	if (amdgpu_aspm == 0)
+		return;
+
+	/* todo */
+}
+
+static void soc21_enable_doorbell_aperture(struct amdgpu_device *adev,
+					bool enable)
+{
+	adev->nbio.funcs->enable_doorbell_aperture(adev, enable);
+	adev->nbio.funcs->enable_doorbell_selfring_aperture(adev, enable);
+}
+
+const struct amdgpu_ip_block_version soc21_common_ip_block =
+{
+	.type = AMD_IP_BLOCK_TYPE_COMMON,
+	.major = 1,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &soc21_common_ip_funcs,
+};
+
+static uint32_t soc21_get_rev_id(struct amdgpu_device *adev)
+{
+	return adev->nbio.funcs->get_rev_id(adev);
+}
+
+static bool soc21_need_full_reset(struct amdgpu_device *adev)
+{
+	return true;
+}
+
+static bool soc21_need_reset_on_init(struct amdgpu_device *adev)
+{
+	u32 sol_reg;
+
+	if (adev->flags & AMD_IS_APU)
+		return false;
+
+	/* Check sOS sign of life register to confirm sys driver and sOS
+	 * are already been loaded.
+	 */
+	sol_reg = RREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_81);
+	if (sol_reg)
+		return true;
+
+	return false;
+}
+
+static uint64_t soc21_get_pcie_replay_count(struct amdgpu_device *adev)
+{
+
+	/* TODO
+	 * dummy implement for pcie_replay_count sysfs interface
+	 * */
+
+	return 0;
+}
+
+static void soc21_init_doorbell_index(struct amdgpu_device *adev)
+{
+	adev->doorbell_index.kiq = AMDGPU_NAVI10_DOORBELL_KIQ;
+	adev->doorbell_index.mec_ring0 = AMDGPU_NAVI10_DOORBELL_MEC_RING0;
+	adev->doorbell_index.mec_ring1 = AMDGPU_NAVI10_DOORBELL_MEC_RING1;
+	adev->doorbell_index.mec_ring2 = AMDGPU_NAVI10_DOORBELL_MEC_RING2;
+	adev->doorbell_index.mec_ring3 = AMDGPU_NAVI10_DOORBELL_MEC_RING3;
+	adev->doorbell_index.mec_ring4 = AMDGPU_NAVI10_DOORBELL_MEC_RING4;
+	adev->doorbell_index.mec_ring5 = AMDGPU_NAVI10_DOORBELL_MEC_RING5;
+	adev->doorbell_index.mec_ring6 = AMDGPU_NAVI10_DOORBELL_MEC_RING6;
+	adev->doorbell_index.mec_ring7 = AMDGPU_NAVI10_DOORBELL_MEC_RING7;
+	adev->doorbell_index.userqueue_start = AMDGPU_NAVI10_DOORBELL_USERQUEUE_START;
+	adev->doorbell_index.userqueue_end = AMDGPU_NAVI10_DOORBELL_USERQUEUE_END;
+	adev->doorbell_index.gfx_ring0 = AMDGPU_NAVI10_DOORBELL_GFX_RING0;
+	adev->doorbell_index.gfx_ring1 = AMDGPU_NAVI10_DOORBELL_GFX_RING1;
+	adev->doorbell_index.mes_ring = AMDGPU_NAVI10_DOORBELL_MES_RING;
+	adev->doorbell_index.sdma_engine[0] = AMDGPU_NAVI10_DOORBELL_sDMA_ENGINE0;
+	adev->doorbell_index.sdma_engine[1] = AMDGPU_NAVI10_DOORBELL_sDMA_ENGINE1;
+	adev->doorbell_index.ih = AMDGPU_NAVI10_DOORBELL_IH;
+	adev->doorbell_index.vcn.vcn_ring0_1 = AMDGPU_NAVI10_DOORBELL64_VCN0_1;
+	adev->doorbell_index.vcn.vcn_ring2_3 = AMDGPU_NAVI10_DOORBELL64_VCN2_3;
+	adev->doorbell_index.vcn.vcn_ring4_5 = AMDGPU_NAVI10_DOORBELL64_VCN4_5;
+	adev->doorbell_index.vcn.vcn_ring6_7 = AMDGPU_NAVI10_DOORBELL64_VCN6_7;
+	adev->doorbell_index.first_non_cp = AMDGPU_NAVI10_DOORBELL64_FIRST_NON_CP;
+	adev->doorbell_index.last_non_cp = AMDGPU_NAVI10_DOORBELL64_LAST_NON_CP;
+
+	adev->doorbell_index.max_assignment = AMDGPU_NAVI10_DOORBELL_MAX_ASSIGNMENT << 1;
+	adev->doorbell_index.sdma_doorbell_range = 20;
+}
+
+static void soc21_pre_asic_init(struct amdgpu_device *adev)
+{
+}
+
+static const struct amdgpu_asic_funcs soc21_asic_funcs =
+{
+	.read_disabled_bios = &soc21_read_disabled_bios,
+	.read_bios_from_rom = &amdgpu_soc15_read_bios_from_rom,
+	.read_register = &soc21_read_register,
+	.reset = &soc21_asic_reset,
+	.reset_method = &soc21_asic_reset_method,
+	.set_vga_state = &soc21_vga_set_state,
+	.get_xclk = &soc21_get_xclk,
+	.set_uvd_clocks = &soc21_set_uvd_clocks,
+	.set_vce_clocks = &soc21_set_vce_clocks,
+	.get_config_memsize = &soc21_get_config_memsize,
+	.init_doorbell_index = &soc21_init_doorbell_index,
+	.need_full_reset = &soc21_need_full_reset,
+	.need_reset_on_init = &soc21_need_reset_on_init,
+	.get_pcie_replay_count = &soc21_get_pcie_replay_count,
+	.supports_baco = &amdgpu_dpm_is_baco_supported,
+	.pre_asic_init = &soc21_pre_asic_init,
+};
+
+static int soc21_common_early_init(void *handle)
+{
+#define MMIO_REG_HOLE_OFFSET (0x80000 - PAGE_SIZE)
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->rmmio_remap.reg_offset = MMIO_REG_HOLE_OFFSET;
+	adev->rmmio_remap.bus_addr = adev->rmmio_base + MMIO_REG_HOLE_OFFSET;
+	adev->smc_rreg = NULL;
+	adev->smc_wreg = NULL;
+	adev->pcie_rreg = &soc21_pcie_rreg;
+	adev->pcie_wreg = &soc21_pcie_wreg;
+	adev->pcie_rreg64 = &soc21_pcie_rreg64;
+	adev->pcie_wreg64 = &soc21_pcie_wreg64;
+
+	/* TODO: will add them during VCN v2 implementation */
+	adev->uvd_ctx_rreg = NULL;
+	adev->uvd_ctx_wreg = NULL;
+
+	adev->didt_rreg = &soc21_didt_rreg;
+	adev->didt_wreg = &soc21_didt_wreg;
+
+	adev->asic_funcs = &soc21_asic_funcs;
+
+	adev->rev_id = soc21_get_rev_id(adev);
+	adev->external_rev_id = 0xff;
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(11, 0, 0):
+		adev->cg_flags = 0;
+		adev->pg_flags = 0;
+		adev->external_rev_id = adev->rev_id + 0x1; // TODO: need update
+		break;
+	default:
+		/* FIXME: not supported yet */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int soc21_common_late_init(void *handle)
+{
+	return 0;
+}
+
+static int soc21_common_sw_init(void *handle)
+{
+	return 0;
+}
+
+static int soc21_common_sw_fini(void *handle)
+{
+	return 0;
+}
+
+static int soc21_common_hw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* enable pcie gen2/3 link */
+	soc21_pcie_gen3_enable(adev);
+	/* enable aspm */
+	soc21_program_aspm(adev);
+	/* setup nbio registers */
+	adev->nbio.funcs->init_registers(adev);
+	/* remap HDP registers to a hole in mmio space,
+	 * for the purpose of expose those registers
+	 * to process space
+	 */
+	if (adev->nbio.funcs->remap_hdp_registers)
+		adev->nbio.funcs->remap_hdp_registers(adev);
+	/* enable the doorbell aperture */
+	soc21_enable_doorbell_aperture(adev, true);
+
+	return 0;
+}
+
+static int soc21_common_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* disable the doorbell aperture */
+	soc21_enable_doorbell_aperture(adev, false);
+
+	return 0;
+}
+
+static int soc21_common_suspend(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	return soc21_common_hw_fini(adev);
+}
+
+static int soc21_common_resume(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	return soc21_common_hw_init(adev);
+}
+
+static bool soc21_common_is_idle(void *handle)
+{
+	return true;
+}
+
+static int soc21_common_wait_for_idle(void *handle)
+{
+	return 0;
+}
+
+static int soc21_common_soft_reset(void *handle)
+{
+	return 0;
+}
+
+static int soc21_common_set_clockgating_state(void *handle,
+					   enum amd_clockgating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	switch (adev->ip_versions[NBIO_HWIP][0]) {
+	case IP_VERSION(4, 3, 0):
+		adev->nbio.funcs->update_medium_grain_clock_gating(adev,
+				state == AMD_CG_STATE_GATE);
+		adev->nbio.funcs->update_medium_grain_light_sleep(adev,
+				state == AMD_CG_STATE_GATE);
+		adev->hdp.funcs->update_clock_gating(adev,
+				state == AMD_CG_STATE_GATE);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int soc21_common_set_powergating_state(void *handle,
+					   enum amd_powergating_state state)
+{
+	/* TODO */
+	return 0;
+}
+
+static void soc21_common_get_clockgating_state(void *handle, u64 *flags)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->nbio.funcs->get_clockgating_state(adev, flags);
+
+	adev->hdp.funcs->get_clock_gating_state(adev, flags);
+
+	return;
+}
+
+static const struct amd_ip_funcs soc21_common_ip_funcs = {
+	.name = "soc21_common",
+	.early_init = soc21_common_early_init,
+	.late_init = soc21_common_late_init,
+	.sw_init = soc21_common_sw_init,
+	.sw_fini = soc21_common_sw_fini,
+	.hw_init = soc21_common_hw_init,
+	.hw_fini = soc21_common_hw_fini,
+	.suspend = soc21_common_suspend,
+	.resume = soc21_common_resume,
+	.is_idle = soc21_common_is_idle,
+	.wait_for_idle = soc21_common_wait_for_idle,
+	.soft_reset = soc21_common_soft_reset,
+	.set_clockgating_state = soc21_common_set_clockgating_state,
+	.set_powergating_state = soc21_common_set_powergating_state,
+	.get_clockgating_state = soc21_common_get_clockgating_state,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.h b/drivers/gpu/drm/amd/amdgpu/soc21.h
new file mode 100644
index 000000000000..4c8067af1b65
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef __SOC21_H__
+#define __SOC21_H__
+
+extern const struct amdgpu_ip_block_version soc21_common_ip_block;
+
+void soc21_grbm_select(struct amdgpu_device *adev,
+		    u32 me, u32 pipe, u32 queue, u32 vmid);
+#endif
-- 
2.35.1


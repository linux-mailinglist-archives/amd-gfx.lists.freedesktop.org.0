Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D2F5A55FC
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Aug 2022 23:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F35610EF8B;
	Mon, 29 Aug 2022 21:16:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D486310EF7D
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Aug 2022 21:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwFN76oZZ8iU/Wg8IZSFhWnacDTsBy/t+/oObF0y0UxTNwXb69MO+3hx9JCmXPyZz5v7f9k2FGmzVOwj+Jf14QDtJ7cN4/CoCXTHvIKDFWNzMc1jzf/Brf/m9wSVEP8YA1rMJRiTB3lNeHJwMpQ0qu+Bj3kKgn91netvZ3YBt7zofhft2fjKAKtYYiw+5cT1KhXy/gMnkOEnA641qFNTCL78ejSRtlRK2mIe3TxqpHzFgYHI5t6qJRX1chAEI2dCJ9RthKN3CI3+rny/laNV8b9DMVVlTNMTHSZLBnwX/TMfIKbfk3qd/Ldvd/PRB19uz6hec8F6RC8ILGleqMVXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaY9HERLQKsmOS+zNI3t84k3bHsqiPb6dbLoz5rjfT4=;
 b=ED0qa9vqMHPjBcCv1AvdGE/sswajMq78kE1928s2IAE0ZdQCVsxrSu7r3sXkE4Ncbr6IAlVpCpL2grwcChUwtmEkKgGbRg0dA/k2fj/w5B5PnMcjPYQ+F7jDZIX0Mcrx7w+cXQVxIb3yMzj+6xNWysp79DivvGm4nyMWMg5bD23p/3ebmviiafWRIDV3iIRsVpghK0gnWFTNWDD9KGd5jXTjrwGIlKgdMJXJ8H7jKkh9e4JDDSAqX6LHPS7FjxlLDrgZ2l7mFRdIAdYf/+jnDvp8Ptca4+SaMX+/KaT9iXLxgTDW1EGCPlzo7Z07xbMbpGBaGepdIc64ooM2aP8U8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaY9HERLQKsmOS+zNI3t84k3bHsqiPb6dbLoz5rjfT4=;
 b=yM+cin2xX+WKTsV2CxaR+SmC5Rcs7ZTSyRmNHRR7D4PH5Pvxvb49ajM2fTjYKfnEJz5UEXAwq8i41wiZNHfxMkH+ioMOXRnvo9+zHAOfzrjffnLHuTTh19BZEsLeRSx2fbNvd8T3yZru2gzaDcvQSHZ/b+wF1w5v1vGEqyyEWpw=
Received: from DM5PR07CA0058.namprd07.prod.outlook.com (2603:10b6:4:ad::23) by
 DM4PR12MB5890.namprd12.prod.outlook.com (2603:10b6:8:66::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.19; Mon, 29 Aug 2022 21:16:30 +0000
Received: from DS1PEPF0000B079.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::36) by DM5PR07CA0058.outlook.office365.com
 (2603:10b6:4:ad::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Mon, 29 Aug 2022 21:16:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000B079.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.7 via Frontend Transport; Mon, 29 Aug 2022 21:16:30 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 29 Aug
 2022 16:16:29 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdgpu: add gfxhub_v3_0_3 support
Date: Mon, 29 Aug 2022 17:16:13 -0400
Message-ID: <20220829211615.1152396-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220829211615.1152396-1-alexander.deucher@amd.com>
References: <20220829211615.1152396-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aded686e-83f7-4d20-614a-08da8a03be02
X-MS-TrafficTypeDiagnostic: DM4PR12MB5890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qaSrvCY+9GcC0KNHKl7sSHfjdYanSJuK5W5bdjTdTSNZAnOCsoMIpgEziLlDnHaOuKr8Mgva11m8K9vFQPksMTNTK2xzeXGXrAZvudOW1TOlHnteo2C6nOw0tUF+0tZ6IVLb1rJ+TFX0AV4cFUUPGhYKRQKPARyM5FCTya2NQWbarQEb2E9j2tClPgGqpjs85H7UXM9yg0RmExlp2Q0RWd9HW1pEHz6Ambew59BPAI+FUVDhuOaZWTrucoidPfLSgwXb3VY7NIbrqgkF+CglYTdqTVnJ/yGHQmeJAD+A/B+0FpFgSjxoWTDylz6igp0QI8Qb7JRxoeVe1qJp7w3XETJ2pzRj7P2UoKtkTCWhZce1weB95oeDtihDRtUmC3k86m+RWQ9GIuqUmzMoQGT8EReuPYc3PBa0kcD/N/J03rogALS7Dz4Ne0mZqpmRRI9+MAG1M2uzb6YjvzV/h+u6ECcUCHveqb43QfNN234D9T7pO2bxvB7hKKY+2Zdb+IhFTmVBkA5UXxSjwm04BtIAWZtyvPVGyoce6NYeL7MmQjVdUheVEVgb4jL9s5YZ3kjdE2Wx1tDICkQjVh60V9tMwoRABX4y5kYPuQNQQU9ScLssSvWyC2rIbMwKndda0rf9aphGrMPVvaxHPpq/3b/dkarC1fQLJ0iuboD7A0EHy18ZRPvFRpIx0f5btlciy5aHtnf46gq7mSNGCtstCHq0GZiQDtzL3yxf60E8dij32etgkva9ICGrZoyBujBKaueE1HPk/ZbqYyB5et24aXbDHIPW/QeaINDcBxst8HUwXdb1syuOZSrW7CHFCkfei5gydWNmBRCrJs48tjj7vGFC5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(40470700004)(41300700001)(478600001)(30864003)(36860700001)(8936002)(8676002)(4326008)(70586007)(70206006)(86362001)(40480700001)(40460700003)(5660300002)(2616005)(186003)(16526019)(336012)(1076003)(6916009)(6666004)(2906002)(47076005)(81166007)(82310400005)(356005)(54906003)(7696005)(26005)(82740400003)(83380400001)(36756003)(316002)(426003)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 21:16:30.2614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aded686e-83f7-4d20-614a-08da8a03be02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000B079.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5890
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
 Yang Wang <KevinYang.Wang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Yang Wang <KevinYang.Wang@amd.com>

add gfxhub_v3_0_3 support

Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile        |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c | 511 +++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h |  29 ++
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c     |  10 +-
 4 files changed, 550 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 4bde7ff55f8a..59f354f043fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -89,7 +89,7 @@ amdgpu-y += \
 	gfxhub_v1_0.o mmhub_v1_0.o gmc_v9_0.o gfxhub_v1_1.o mmhub_v9_4.o \
 	gfxhub_v2_0.o mmhub_v2_0.o gmc_v10_0.o gfxhub_v2_1.o mmhub_v2_3.o \
 	mmhub_v1_7.o gfxhub_v3_0.o mmhub_v3_0.o mmhub_v3_0_2.o gmc_v11_0.o \
-	mmhub_v3_0_1.o
+	mmhub_v3_0_1.o gfxhub_v3_0_3.o
 
 # add UMC block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
new file mode 100644
index 000000000000..5d3fffd4929f
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.c
@@ -0,0 +1,511 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+
+#include "amdgpu.h"
+#include "gfxhub_v3_0_3.h"
+
+#include "gc/gc_11_0_3_offset.h"
+#include "gc/gc_11_0_3_sh_mask.h"
+#include "navi10_enum.h"
+#include "soc15_common.h"
+
+#define regGCVM_L2_CNTL3_DEFAULT		0x80100007
+#define regGCVM_L2_CNTL4_DEFAULT		0x000000c1
+#define regGCVM_L2_CNTL5_DEFAULT		0x00003fe0
+
+static const char *gfxhub_client_ids[] = {
+	"CB/DB",
+	"Reserved",
+	"GE1",
+	"GE2",
+	"CPF",
+	"CPC",
+	"CPG",
+	"RLC",
+	"TCP",
+	"SQC (inst)",
+	"SQC (data)",
+	"SQG",
+	"Reserved",
+	"SDMA0",
+	"SDMA1",
+	"GCR",
+	"SDMA2",
+	"SDMA3",
+};
+
+static uint32_t gfxhub_v3_0_3_get_invalidate_req(unsigned int vmid,
+					       uint32_t flush_type)
+{
+	u32 req = 0;
+
+	/* invalidate using legacy mode on vmid*/
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ,
+			    PER_VMID_INVALIDATE_REQ, 1 << vmid);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ, FLUSH_TYPE, flush_type);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PTES, 1);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PDE0, 1);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PDE1, 1);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ, INVALIDATE_L2_PDE2, 1);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ, INVALIDATE_L1_PTES, 1);
+	req = REG_SET_FIELD(req, GCVM_INVALIDATE_ENG0_REQ,
+			    CLEAR_PROTECTION_FAULT_STATUS_ADDR,	0);
+
+	return req;
+}
+
+static void
+gfxhub_v3_0_3_print_l2_protection_fault_status(struct amdgpu_device *adev,
+					     uint32_t status)
+{
+	u32 cid = REG_GET_FIELD(status,
+				GCVM_L2_PROTECTION_FAULT_STATUS, CID);
+
+	dev_err(adev->dev,
+		"GCVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
+		status);
+	dev_err(adev->dev, "\t Faulty UTCL2 client ID: %s (0x%x)\n",
+		cid >= ARRAY_SIZE(gfxhub_client_ids) ? "unknown" : gfxhub_client_ids[cid],
+		cid);
+	dev_err(adev->dev, "\t MORE_FAULTS: 0x%lx\n",
+		REG_GET_FIELD(status,
+		GCVM_L2_PROTECTION_FAULT_STATUS, MORE_FAULTS));
+	dev_err(adev->dev, "\t WALKER_ERROR: 0x%lx\n",
+		REG_GET_FIELD(status,
+		GCVM_L2_PROTECTION_FAULT_STATUS, WALKER_ERROR));
+	dev_err(adev->dev, "\t PERMISSION_FAULTS: 0x%lx\n",
+		REG_GET_FIELD(status,
+		GCVM_L2_PROTECTION_FAULT_STATUS, PERMISSION_FAULTS));
+	dev_err(adev->dev, "\t MAPPING_ERROR: 0x%lx\n",
+		REG_GET_FIELD(status,
+		GCVM_L2_PROTECTION_FAULT_STATUS, MAPPING_ERROR));
+	dev_err(adev->dev, "\t RW: 0x%lx\n",
+		REG_GET_FIELD(status,
+		GCVM_L2_PROTECTION_FAULT_STATUS, RW));
+}
+
+static u64 gfxhub_v3_0_3_get_fb_location(struct amdgpu_device *adev)
+{
+	u64 base = RREG32_SOC15(GC, 0, regGCMC_VM_FB_LOCATION_BASE);
+
+	base &= GCMC_VM_FB_LOCATION_BASE__FB_BASE_MASK;
+	base <<= 24;
+
+	return base;
+}
+
+static u64 gfxhub_v3_0_3_get_mc_fb_offset(struct amdgpu_device *adev)
+{
+	return (u64)RREG32_SOC15(GC, 0, regGCMC_VM_FB_OFFSET) << 24;
+}
+
+static void gfxhub_v3_0_3_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t vmid,
+				uint64_t page_table_base)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
+
+	WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,
+			    hub->ctx_addr_distance * vmid,
+			    lower_32_bits(page_table_base));
+
+	WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,
+			    hub->ctx_addr_distance * vmid,
+			    upper_32_bits(page_table_base));
+}
+
+static void gfxhub_v3_0_3_init_gart_aperture_regs(struct amdgpu_device *adev)
+{
+	uint64_t pt_base = amdgpu_gmc_pd_addr(adev->gart.bo);
+
+	gfxhub_v3_0_3_setup_vm_pt_regs(adev, 0, pt_base);
+
+	WREG32_SOC15(GC, 0, regGCVM_CONTEXT0_PAGE_TABLE_START_ADDR_LO32,
+		     (u32)(adev->gmc.gart_start >> 12));
+	WREG32_SOC15(GC, 0, regGCVM_CONTEXT0_PAGE_TABLE_START_ADDR_HI32,
+		     (u32)(adev->gmc.gart_start >> 44));
+
+	WREG32_SOC15(GC, 0, regGCVM_CONTEXT0_PAGE_TABLE_END_ADDR_LO32,
+		     (u32)(adev->gmc.gart_end >> 12));
+	WREG32_SOC15(GC, 0, regGCVM_CONTEXT0_PAGE_TABLE_END_ADDR_HI32,
+		     (u32)(adev->gmc.gart_end >> 44));
+}
+
+static void gfxhub_v3_0_3_init_system_aperture_regs(struct amdgpu_device *adev)
+{
+	uint64_t value;
+
+	/* Disable AGP. */
+	WREG32_SOC15(GC, 0, regGCMC_VM_AGP_BASE, 0);
+	WREG32_SOC15(GC, 0, regGCMC_VM_AGP_TOP, 0);
+	WREG32_SOC15(GC, 0, regGCMC_VM_AGP_BOT, 0x00FFFFFF);
+
+	/* Program the system aperture low logical page number. */
+	WREG32_SOC15(GC, 0, regGCMC_VM_SYSTEM_APERTURE_LOW_ADDR,
+		     adev->gmc.vram_start >> 18);
+	WREG32_SOC15(GC, 0, regGCMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
+		     adev->gmc.vram_end >> 18);
+
+	/* Set default page address. */
+	value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start
+		+ adev->vm_manager.vram_base_offset;
+	WREG32_SOC15(GC, 0, regGCMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_LSB,
+		     (u32)(value >> 12));
+	WREG32_SOC15(GC, 0, regGCMC_VM_SYSTEM_APERTURE_DEFAULT_ADDR_MSB,
+		     (u32)(value >> 44));
+
+	/* Program "protection fault". */
+	WREG32_SOC15(GC, 0, regGCVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_LO32,
+		     (u32)(adev->dummy_page_addr >> 12));
+	WREG32_SOC15(GC, 0, regGCVM_L2_PROTECTION_FAULT_DEFAULT_ADDR_HI32,
+		     (u32)((u64)adev->dummy_page_addr >> 44));
+
+	WREG32_FIELD15_PREREG(GC, 0, GCVM_L2_PROTECTION_FAULT_CNTL2,
+		       ACTIVE_PAGE_MIGRATION_PTE_READ_RETRY, 1);
+}
+
+
+static void gfxhub_v3_0_3_init_tlb_regs(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+
+	/* Setup TLB control */
+	tmp = RREG32_SOC15(GC, 0, regGCMC_VM_MX_L1_TLB_CNTL);
+
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB, 1);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL, SYSTEM_ACCESS_MODE, 3);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL,
+			    ENABLE_ADVANCED_DRIVER_MODEL, 1);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL,
+			    SYSTEM_APERTURE_UNMAPPED_ACCESS, 0);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL, ECO_BITS, 0);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL,
+			    MTYPE, MTYPE_UC); /* UC, uncached */
+
+	WREG32_SOC15(GC, 0, regGCMC_VM_MX_L1_TLB_CNTL, tmp);
+}
+
+static void gfxhub_v3_0_3_init_cache_regs(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+
+	/* These registers are not accessible to VF-SRIOV.
+	 * The PF will program them instead.
+	 */
+	if (amdgpu_sriov_vf(adev))
+		return;
+
+	/* Setup L2 cache */
+	tmp = RREG32_SOC15(GC, 0, regGCVM_L2_CNTL);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL, ENABLE_L2_CACHE, 1);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL, ENABLE_L2_FRAGMENT_PROCESSING, 0);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL,
+			    ENABLE_DEFAULT_PAGE_OUT_TO_SYSTEM_MEMORY, 1);
+	/* XXX for emulation, Refer to closed source code.*/
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL,
+			    L2_PDE0_CACHE_TAG_GENERATION_MODE, 0);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL, PDE_FAULT_CLASSIFICATION, 0);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL, CONTEXT1_IDENTITY_ACCESS_MODE, 1);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL, IDENTITY_MODE_FRAGMENT_SIZE, 0);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CNTL, tmp);
+
+	tmp = RREG32_SOC15(GC, 0, regGCVM_L2_CNTL2);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL2, INVALIDATE_ALL_L1_TLBS, 1);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL2, INVALIDATE_L2_CACHE, 1);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CNTL2, tmp);
+
+	tmp = regGCVM_L2_CNTL3_DEFAULT;
+	if (adev->gmc.translate_further) {
+		tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL3, BANK_SELECT, 12);
+		tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL3,
+				    L2_CACHE_BIGK_FRAGMENT_SIZE, 9);
+	} else {
+		tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL3, BANK_SELECT, 9);
+		tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL3,
+				    L2_CACHE_BIGK_FRAGMENT_SIZE, 6);
+	}
+	WREG32_SOC15(GC, 0, regGCVM_L2_CNTL3, tmp);
+
+	tmp = regGCVM_L2_CNTL4_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4, VMC_TAP_PDE_REQUEST_PHYSICAL, 0);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4, VMC_TAP_PTE_REQUEST_PHYSICAL, 0);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CNTL4, tmp);
+
+	tmp = regGCVM_L2_CNTL5_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL5, L2_CACHE_SMALLK_FRAGMENT_SIZE, 0);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CNTL5, tmp);
+}
+
+static void gfxhub_v3_0_3_enable_system_domain(struct amdgpu_device *adev)
+{
+	uint32_t tmp;
+
+	tmp = RREG32_SOC15(GC, 0, regGCVM_CONTEXT0_CNTL);
+	tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT0_CNTL, ENABLE_CONTEXT, 1);
+	tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT0_CNTL, PAGE_TABLE_DEPTH, 0);
+	tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT0_CNTL,
+			    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT, 0);
+	WREG32_SOC15(GC, 0, regGCVM_CONTEXT0_CNTL, tmp);
+}
+
+static void gfxhub_v3_0_3_disable_identity_aperture(struct amdgpu_device *adev)
+{
+	/* These registers are not accessible to VF-SRIOV.
+	 * The PF will program them instead.
+	 */
+	if (amdgpu_sriov_vf(adev))
+		return;
+
+	WREG32_SOC15(GC, 0, regGCVM_L2_CONTEXT1_IDENTITY_APERTURE_LOW_ADDR_LO32,
+		     0xFFFFFFFF);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CONTEXT1_IDENTITY_APERTURE_LOW_ADDR_HI32,
+		     0x0000000F);
+
+	WREG32_SOC15(GC, 0, regGCVM_L2_CONTEXT1_IDENTITY_APERTURE_HIGH_ADDR_LO32,
+		     0);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CONTEXT1_IDENTITY_APERTURE_HIGH_ADDR_HI32,
+		     0);
+
+	WREG32_SOC15(GC, 0, regGCVM_L2_CONTEXT_IDENTITY_PHYSICAL_OFFSET_LO32, 0);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CONTEXT_IDENTITY_PHYSICAL_OFFSET_HI32, 0);
+
+}
+
+static void gfxhub_v3_0_3_setup_vmid_config(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
+	int i;
+	uint32_t tmp;
+
+	for (i = 0; i <= 14; i++) {
+		tmp = RREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT1_CNTL, i);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL, ENABLE_CONTEXT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL, PAGE_TABLE_DEPTH,
+				    adev->vm_manager.num_level);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				RANGE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				DUMMY_PAGE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				PDE0_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				VALID_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				READ_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				WRITE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				EXECUTE_PROTECTION_FAULT_ENABLE_DEFAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				PAGE_TABLE_BLOCK_SIZE,
+				adev->vm_manager.block_size - 9);
+		/* Send no-retry XNACK on fault to suppress VM fault storm. */
+		tmp = REG_SET_FIELD(tmp, GCVM_CONTEXT1_CNTL,
+				    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
+				    !amdgpu_noretry);
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT1_CNTL,
+				    i * hub->ctx_distance, tmp);
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT1_PAGE_TABLE_START_ADDR_LO32,
+				    i * hub->ctx_addr_distance, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT1_PAGE_TABLE_START_ADDR_HI32,
+				    i * hub->ctx_addr_distance, 0);
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT1_PAGE_TABLE_END_ADDR_LO32,
+				    i * hub->ctx_addr_distance,
+				    lower_32_bits(adev->vm_manager.max_pfn - 1));
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT1_PAGE_TABLE_END_ADDR_HI32,
+				    i * hub->ctx_addr_distance,
+				    upper_32_bits(adev->vm_manager.max_pfn - 1));
+	}
+
+	hub->vm_cntx_cntl = tmp;
+}
+
+static void gfxhub_v3_0_3_program_invalidation(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
+	unsigned i;
+
+	for (i = 0 ; i < 18; ++i) {
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_INVALIDATE_ENG0_ADDR_RANGE_LO32,
+				    i * hub->eng_addr_distance, 0xffffffff);
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_INVALIDATE_ENG0_ADDR_RANGE_HI32,
+				    i * hub->eng_addr_distance, 0x1f);
+	}
+}
+
+static int gfxhub_v3_0_3_gart_enable(struct amdgpu_device *adev)
+{
+	if (amdgpu_sriov_vf(adev)) {
+		/*
+		 * GCMC_VM_FB_LOCATION_BASE/TOP is NULL for VF, becuase they are
+		 * VF copy registers so vbios post doesn't program them, for
+		 * SRIOV driver need to program them
+		 */
+		WREG32_SOC15(GC, 0, regGCMC_VM_FB_LOCATION_BASE,
+			     adev->gmc.vram_start >> 24);
+		WREG32_SOC15(GC, 0, regGCMC_VM_FB_LOCATION_TOP,
+			     adev->gmc.vram_end >> 24);
+	}
+
+	/* GART Enable. */
+	gfxhub_v3_0_3_init_gart_aperture_regs(adev);
+	gfxhub_v3_0_3_init_system_aperture_regs(adev);
+	gfxhub_v3_0_3_init_tlb_regs(adev);
+	gfxhub_v3_0_3_init_cache_regs(adev);
+
+	gfxhub_v3_0_3_enable_system_domain(adev);
+	gfxhub_v3_0_3_disable_identity_aperture(adev);
+	gfxhub_v3_0_3_setup_vmid_config(adev);
+	gfxhub_v3_0_3_program_invalidation(adev);
+
+	return 0;
+}
+
+static void gfxhub_v3_0_3_gart_disable(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
+	u32 tmp;
+	u32 i;
+
+	/* Disable all tables */
+	for (i = 0; i < 16; i++)
+		WREG32_SOC15_OFFSET(GC, 0, regGCVM_CONTEXT0_CNTL,
+				    i * hub->ctx_distance, 0);
+
+	/* Setup TLB control */
+	tmp = RREG32_SOC15(GC, 0, regGCMC_VM_MX_L1_TLB_CNTL);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL, ENABLE_L1_TLB, 0);
+	tmp = REG_SET_FIELD(tmp, GCMC_VM_MX_L1_TLB_CNTL,
+			    ENABLE_ADVANCED_DRIVER_MODEL, 0);
+	WREG32_SOC15(GC, 0, regGCMC_VM_MX_L1_TLB_CNTL, tmp);
+
+	/* Setup L2 cache */
+	WREG32_FIELD15_PREREG(GC, 0, GCVM_L2_CNTL, ENABLE_L2_CACHE, 0);
+	WREG32_SOC15(GC, 0, regGCVM_L2_CNTL3, 0);
+}
+
+/**
+ * gfxhub_v3_0_3_set_fault_enable_default - update GART/VM fault handling
+ *
+ * @adev: amdgpu_device pointer
+ * @value: true redirects VM faults to the default page
+ */
+static void gfxhub_v3_0_3_set_fault_enable_default(struct amdgpu_device *adev,
+					  bool value)
+{
+	u32 tmp;
+
+	/* These registers are not accessible to VF-SRIOV.
+	 * The PF will program them instead.
+	 */
+	if (amdgpu_sriov_vf(adev))
+		return;
+
+	tmp = RREG32_SOC15(GC, 0, regGCVM_L2_PROTECTION_FAULT_CNTL);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    RANGE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    PDE0_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    PDE1_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    PDE2_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    TRANSLATE_FURTHER_PROTECTION_FAULT_ENABLE_DEFAULT,
+			    value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    NACK_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    DUMMY_PAGE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    VALID_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    READ_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    WRITE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+			    EXECUTE_PROTECTION_FAULT_ENABLE_DEFAULT, value);
+	if (!value) {
+		tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+				CRASH_ON_NO_RETRY_FAULT, 1);
+		tmp = REG_SET_FIELD(tmp, GCVM_L2_PROTECTION_FAULT_CNTL,
+				CRASH_ON_RETRY_FAULT, 1);
+	}
+	WREG32_SOC15(GC, 0, regGCVM_L2_PROTECTION_FAULT_CNTL, tmp);
+}
+
+static const struct amdgpu_vmhub_funcs gfxhub_v3_0_3_vmhub_funcs = {
+	.print_l2_protection_fault_status = gfxhub_v3_0_3_print_l2_protection_fault_status,
+	.get_invalidate_req = gfxhub_v3_0_3_get_invalidate_req,
+};
+
+static void gfxhub_v3_0_3_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
+
+	hub->ctx0_ptb_addr_lo32 =
+		SOC15_REG_OFFSET(GC, 0,
+				 regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32);
+	hub->ctx0_ptb_addr_hi32 =
+		SOC15_REG_OFFSET(GC, 0,
+				 regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32);
+	hub->vm_inv_eng0_sem =
+		SOC15_REG_OFFSET(GC, 0, regGCVM_INVALIDATE_ENG0_SEM);
+	hub->vm_inv_eng0_req =
+		SOC15_REG_OFFSET(GC, 0, regGCVM_INVALIDATE_ENG0_REQ);
+	hub->vm_inv_eng0_ack =
+		SOC15_REG_OFFSET(GC, 0, regGCVM_INVALIDATE_ENG0_ACK);
+	hub->vm_context0_cntl =
+		SOC15_REG_OFFSET(GC, 0, regGCVM_CONTEXT0_CNTL);
+	hub->vm_l2_pro_fault_status =
+		SOC15_REG_OFFSET(GC, 0, regGCVM_L2_PROTECTION_FAULT_STATUS);
+	hub->vm_l2_pro_fault_cntl =
+		SOC15_REG_OFFSET(GC, 0, regGCVM_L2_PROTECTION_FAULT_CNTL);
+
+	hub->ctx_distance = regGCVM_CONTEXT1_CNTL - regGCVM_CONTEXT0_CNTL;
+	hub->ctx_addr_distance = regGCVM_CONTEXT1_PAGE_TABLE_BASE_ADDR_LO32 -
+		regGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32;
+	hub->eng_distance = regGCVM_INVALIDATE_ENG1_REQ -
+		regGCVM_INVALIDATE_ENG0_REQ;
+	hub->eng_addr_distance = regGCVM_INVALIDATE_ENG1_ADDR_RANGE_LO32 -
+		regGCVM_INVALIDATE_ENG0_ADDR_RANGE_LO32;
+
+	hub->vm_cntx_cntl_vm_fault = GCVM_CONTEXT1_CNTL__RANGE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		GCVM_CONTEXT1_CNTL__DUMMY_PAGE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		GCVM_CONTEXT1_CNTL__PDE0_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		GCVM_CONTEXT1_CNTL__VALID_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		GCVM_CONTEXT1_CNTL__READ_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		GCVM_CONTEXT1_CNTL__WRITE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK |
+		GCVM_CONTEXT1_CNTL__EXECUTE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK;
+
+	hub->vmhub_funcs = &gfxhub_v3_0_3_vmhub_funcs;
+}
+
+const struct amdgpu_gfxhub_funcs gfxhub_v3_0_3_funcs = {
+	.get_fb_location = gfxhub_v3_0_3_get_fb_location,
+	.get_mc_fb_offset = gfxhub_v3_0_3_get_mc_fb_offset,
+	.setup_vm_pt_regs = gfxhub_v3_0_3_setup_vm_pt_regs,
+	.gart_enable = gfxhub_v3_0_3_gart_enable,
+	.gart_disable = gfxhub_v3_0_3_gart_disable,
+	.set_fault_enable_default = gfxhub_v3_0_3_set_fault_enable_default,
+	.init = gfxhub_v3_0_3_init,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h b/drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h
new file mode 100644
index 000000000000..6153bd5e3083
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v3_0_3.h
@@ -0,0 +1,29 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+
+#ifndef __GFXHUB_V3_0_3_H__
+#define __GFXHUB_V3_0_3_H__
+
+extern const struct amdgpu_gfxhub_funcs gfxhub_v3_0_3_funcs;
+
+#endif
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index 1471bfb9ae38..89710a0effd3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -39,6 +39,7 @@
 #include "soc15_common.h"
 #include "nbio_v4_3.h"
 #include "gfxhub_v3_0.h"
+#include "gfxhub_v3_0_3.h"
 #include "mmhub_v3_0.h"
 #include "mmhub_v3_0_1.h"
 #include "mmhub_v3_0_2.h"
@@ -590,7 +591,14 @@ static void gmc_v11_0_set_mmhub_funcs(struct amdgpu_device *adev)
 
 static void gmc_v11_0_set_gfxhub_funcs(struct amdgpu_device *adev)
 {
-	adev->gfxhub.funcs = &gfxhub_v3_0_funcs;
+	switch (adev->ip_versions[GC_HWIP][0]) {
+	case IP_VERSION(11, 0, 3):
+		adev->gfxhub.funcs = &gfxhub_v3_0_3_funcs;
+		break;
+	default:
+		adev->gfxhub.funcs = &gfxhub_v3_0_funcs;
+		break;
+	}
 }
 
 static int gmc_v11_0_early_init(void *handle)
-- 
2.37.1


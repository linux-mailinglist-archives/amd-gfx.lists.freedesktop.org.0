Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC78B2926
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Apr 2024 21:49:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADCC11A841;
	Thu, 25 Apr 2024 19:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M3NdBDXn";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CAE11A840
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Apr 2024 19:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwCltqPSbg27SuekG07zZX/B06WoQVCN2BmCGY55nX7zsoY6PyPcmXGpx2CrtB2wnq1FAk9Dm3GtLkWDHQH34MgcUC4CD6yN3x3fm9Zg6szEZIvJWQIPCkDCYRqQNceHhgfnfj3k2ZItdQs9HJxbZ1UN4hZjiwoReTo6Ogw4E/dvVqp4JcroZvxGSSzU0O6rEFvY+wYbjHwn+T4SNyC//aewjoOnDaH4fbKfXpWSpYZvgXq3Foxa3u2x/JgqJWtwmbFndR5c+02eShG3xNke0SViI35hGweXvtlYxzdx7C2GfzcIr37dJTm+cqcFCvrKaXbGerkzSL2HusiwzUHfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny0PU2rQGTYZLSaNUlbjlLGpTJD4h8lwuEgEKksCyGI=;
 b=fIJ+V7VjA2czf9fwyHRANCKDAnlp9/YDqlJcHW6cEW+RPdof+90rlm6W5sPLdpfVhQPPWahTestvBuh26PCel1ywMrOazB/XCGIk/gRrjEVNLKakBWgCOTpUwcggSmjjvZjxwQl2oFrGiRJJUs/ZRJ7zwi6OyyoYr2bikZSs40xasorlY7fQLnNqxnDcFnVfKxWTEuSGdlydFYzzg9fCz655OluoA9bXi70/D+3yc8fkPWm/KGVu6t+42X8i7Us6ByDwbJ9PLOE+JeK7XQoDwQEt9+Cf/JaYY5Kg1r9/6L0vYAwZK4tzUabEVus1zFz5j9zy8VLhribCQzZX9rBzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ny0PU2rQGTYZLSaNUlbjlLGpTJD4h8lwuEgEKksCyGI=;
 b=M3NdBDXnWidzcAIPFCEhy3Ted2MBfH1HKN/Q7eakrf2I4XorbL64ISgSUZ9PdcNv/XnjoyOm1qJiv2e7EWlr5lfolDiwNc4B0h5UQwECcthY5N8zp7KV0Q41Eqxh57dnKMlYN6DhPgAiGnczPpYs+alC50csgqFaNFGoVmlVUQo=
Received: from PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::14)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 19:49:37 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10a6:100:1f:cafe::c3) by PR0P264CA0194.outlook.office365.com
 (2603:10a6:100:1f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 19:49:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 19:49:35 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 14:49:26 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Hawking Zhang <Hawking.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: Add soc24 common ip block (v2)
Date: Thu, 25 Apr 2024 15:49:09 -0400
Message-ID: <20240425194910.2783289-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425194910.2783289-1-alexander.deucher@amd.com>
References: <20240425194910.2783289-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|BL1PR12MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e19aef-9cc8-47c5-af54-08dc6560d572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hcsnRotMJhr7/qZP8rwaGX9RNzl2TeY/xzYySmJEZpECTARlyrYyuAUEvOm3?=
 =?us-ascii?Q?6BNzFbBkZ+qXtRYYyNE9RQAaXsTEQ5mgBMwCI/BJhVd9DcqK6Z5gpQe7WUc6?=
 =?us-ascii?Q?MRMGF9AJLaRoHFJx3PKWsEsgyIwsMMK8Z31zE1QwYD7vgutLnshkN6Ln900z?=
 =?us-ascii?Q?Tv69zDLDLvLqTbcgz8Zpvizyp0BwmhoRir+GwH8b0Ch6Jvu69NfBZp5vjrI3?=
 =?us-ascii?Q?41+VZ0lQvi10n9fcMzAAm/eFTCfvwcQ7xIUNXhciNhmi131glSRwVH33X8vZ?=
 =?us-ascii?Q?qHdKDjWBSfsAsEPG9r6vAPPloMlqH8/XIzZs7ZcnLL7JqwnofNMbWC2iDq1U?=
 =?us-ascii?Q?hf7iWDWryKc1kYffEGQL6uroW3xN6ECeiH0Ux9yXSrn0fi0s8AQBD/vgCzkh?=
 =?us-ascii?Q?/tzQo1IPWZ87IVJQJ5QA5HjVeVQGyw1yN5aZDtO0FbUCE3SJiuBku7Qyp9s+?=
 =?us-ascii?Q?sU7Pyko8qAbbUR2noQBTpP0ODcaR9wrcHLm/tMzvzpR1GPGnQoQOt84K8vPj?=
 =?us-ascii?Q?em6ijVeg2nNNY+7Qig2dHpGAs+l6ZvPoJsq+ucq3xt5WBrfZhXBaoAuU+6k1?=
 =?us-ascii?Q?4CYvJSWsZt0zqSS3dHpAPDzrdmVb+T2IAEH5/XxcH3V9RsrgxmSonI7go4u6?=
 =?us-ascii?Q?9O1D/OPvh37NNN4DixFvWHGZ857YkC/F435Cqdkcg9asK/WaEAKQOhrMn5gf?=
 =?us-ascii?Q?sXI8oXVmtkXfgmbqalZt+osFs/MuPzVBeD5hetc+onF5j/jJInKjCqynTicj?=
 =?us-ascii?Q?cJgB9uxxaNHSpowmPBePzfxrkqT5XgBwB0mAzXVwd1OA43Lgy1ozsdJhzGm7?=
 =?us-ascii?Q?w6tRvO6MrnTRNBwCT9d8F5sYe1AdVl84y1EkxP+jrECTssW08cbxDvoYoIJu?=
 =?us-ascii?Q?det2e0rI7rtN4fMZScJzohQJkhiNBoWCjJePWbobgDVlILula1UlYE3Gw487?=
 =?us-ascii?Q?RIlzXSTx4yrNEDZamb80Y0zlLxf3HiXOpdnuvOPRl347VAhVpSpYTH80bMsy?=
 =?us-ascii?Q?JlTJyoVVIHC/t/bz6RH/RrXOvFUEcouD38ImN8LjjcZDs39C3lB+Cg7P7382?=
 =?us-ascii?Q?iGlRgGt6d0V+Z2iMnoUNfS7E/J0C7ZSL0nyil5RGthNBHIazy1UcGffgdcaM?=
 =?us-ascii?Q?/p+ksN6JeSMD9HX/iD8PgnmVaKy4+24+qXK21b0bv8JHHQiPHbCfIO0fwEE/?=
 =?us-ascii?Q?AwCdx25biuTWuYGnKCJ/phI6QdJ4YvJ0MBF81SRWUWScdFRKt0UJ6eNsP5Vs?=
 =?us-ascii?Q?5FOQKUvW3lMx8OCN1cOgavZcyHQnhs/tC7fy2J0WYSoxBBeOA+LxNxMjQlkU?=
 =?us-ascii?Q?C00XTyUwKleguootaU/jwp+CJdYORbeChIGmaEkbwtYEFG4YjximnkgN/995?=
 =?us-ascii?Q?9h5Rb0xqk+yJ/OyYCasW3ntZrwAD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 19:49:35.1471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e19aef-9cc8-47c5-af54-08dc6560d572
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969
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

From: Hawking Zhang <Hawking.Zhang@amd.com>

Add initial soc24 support.

v1: Add soc24 common ip block.
v2: Switch to new select_se_sh/enter_safe_mode
    interface.
v3: squash in correct ext rev id, etc. (Alex)

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile |   2 +-
 drivers/gpu/drm/amd/amdgpu/soc24.c  | 532 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/soc24.h  |  30 ++
 3 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc24.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/soc24.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 1f6b56ec99f6..240c86f54ce8 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -97,7 +97,7 @@ amdgpu-$(CONFIG_DRM_AMDGPU_SI)+= si.o gmc_v6_0.o gfx_v6_0.o si_ih.o si_dma.o dce
 amdgpu-y += \
 	vi.o mxgpu_vi.o nbio_v6_1.o soc15.o emu_soc.o mxgpu_ai.o nbio_v7_0.o vega10_reg_init.o \
 	vega20_reg_init.o nbio_v7_4.o nbio_v2_3.o nv.o arct_reg_init.o mxgpu_nv.o \
-	nbio_v7_2.o hdp_v4_0.o hdp_v5_0.o aldebaran_reg_init.o aldebaran.o soc21.o \
+	nbio_v7_2.o hdp_v4_0.o hdp_v5_0.o aldebaran_reg_init.o aldebaran.o soc21.o soc24.o \
 	sienna_cichlid.o smu_v13_0_10.o nbio_v4_3.o hdp_v6_0.o nbio_v7_7.o hdp_v5_2.o lsdma_v6_0.o \
 	nbio_v7_9.o aqua_vanjaram.o nbio_v7_11.o lsdma_v7_0.o hdp_v7_0.o nbif_v6_3_1.o
 
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
new file mode 100644
index 000000000000..3010dbff695d
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -0,0 +1,532 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#include "gc/gc_12_0_0_offset.h"
+#include "gc/gc_12_0_0_sh_mask.h"
+#include "mp/mp_14_0_2_offset.h"
+
+#include "soc15.h"
+#include "soc15_common.h"
+#include "soc24.h"
+#include "mxgpu_nv.h"
+
+static const struct amd_ip_funcs soc24_common_ip_funcs;
+
+static u32 soc24_get_config_memsize(struct amdgpu_device *adev)
+{
+	return adev->nbio.funcs->get_memsize(adev);
+}
+
+static u32 soc24_get_xclk(struct amdgpu_device *adev)
+{
+	return adev->clock.spll.reference_freq;
+}
+
+void soc24_grbm_select(struct amdgpu_device *adev,
+		       u32 me, u32 pipe, u32 queue, u32 vmid)
+{
+	u32 grbm_gfx_cntl = 0;
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, PIPEID, pipe);
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, MEID, me);
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, VMID, vmid);
+	grbm_gfx_cntl = REG_SET_FIELD(grbm_gfx_cntl, GRBM_GFX_CNTL, QUEUEID, queue);
+
+	WREG32_SOC15(GC, 0, regGRBM_GFX_CNTL, grbm_gfx_cntl);
+}
+
+static struct soc15_allowed_register_entry soc24_allowed_read_registers[] = {
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
+static uint32_t soc24_read_indexed_register(struct amdgpu_device *adev,
+					    u32 se_num,
+					    u32 sh_num,
+					    u32 reg_offset)
+{
+	uint32_t val;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, se_num, sh_num, 0xffffffff, 0);
+
+	val = RREG32(reg_offset);
+
+	if (se_num != 0xffffffff || sh_num != 0xffffffff)
+		amdgpu_gfx_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff, 0);
+	mutex_unlock(&adev->grbm_idx_mutex);
+	return val;
+}
+
+static uint32_t soc24_get_register_value(struct amdgpu_device *adev,
+					 bool indexed, u32 se_num,
+					 u32 sh_num, u32 reg_offset)
+{
+	if (indexed) {
+		return soc24_read_indexed_register(adev, se_num, sh_num, reg_offset);
+	} else {
+		if (reg_offset == SOC15_REG_OFFSET(GC, 0, regGB_ADDR_CONFIG) &&
+		    adev->gfx.config.gb_addr_config)
+			return adev->gfx.config.gb_addr_config;
+		return RREG32(reg_offset);
+	}
+}
+
+static int soc24_read_register(struct amdgpu_device *adev, u32 se_num,
+			       u32 sh_num, u32 reg_offset, u32 *value)
+{
+	uint32_t i;
+	struct soc15_allowed_register_entry  *en;
+
+	*value = 0;
+	for (i = 0; i < ARRAY_SIZE(soc24_allowed_read_registers); i++) {
+		en = &soc24_allowed_read_registers[i];
+		if (!adev->reg_offset[en->hwip][en->inst])
+			continue;
+		else if (reg_offset != (adev->reg_offset[en->hwip][en->inst][en->seg]
+					+ en->reg_offset))
+			continue;
+
+		*value = soc24_get_register_value(adev,
+				soc24_allowed_read_registers[i].grbm_indexed,
+				se_num, sh_num, reg_offset);
+		return 0;
+	}
+	return -EINVAL;
+}
+
+static enum amd_reset_method
+soc24_asic_reset_method(struct amdgpu_device *adev)
+{
+	if (amdgpu_reset_method == AMD_RESET_METHOD_MODE1 ||
+	    amdgpu_reset_method == AMD_RESET_METHOD_MODE2 ||
+	    amdgpu_reset_method == AMD_RESET_METHOD_BACO)
+		return amdgpu_reset_method;
+
+	if (amdgpu_reset_method != -1)
+		dev_warn(adev->dev,
+			 "Specified reset method:%d isn't supported, using AUTO instead.\n",
+			 amdgpu_reset_method);
+
+	switch (amdgpu_ip_version(adev, MP1_HWIP, 0)) {
+	case IP_VERSION(14, 0, 2):
+		return AMD_RESET_METHOD_MODE1;
+	default:
+		if (amdgpu_dpm_is_baco_supported(adev))
+			return AMD_RESET_METHOD_BACO;
+		else
+			return AMD_RESET_METHOD_MODE1;
+	}
+}
+
+static int soc24_asic_reset(struct amdgpu_device *adev)
+{
+	int ret = 0;
+
+	switch (soc24_asic_reset_method(adev)) {
+	case AMD_RESET_METHOD_PCI:
+		dev_info(adev->dev, "PCI reset\n");
+		ret = amdgpu_device_pci_reset(adev);
+		break;
+	case AMD_RESET_METHOD_BACO:
+		dev_info(adev->dev, "BACO reset\n");
+		ret = amdgpu_dpm_baco_reset(adev);
+		break;
+	case AMD_RESET_METHOD_MODE2:
+		dev_info(adev->dev, "MODE2 reset\n");
+		ret = amdgpu_dpm_mode2_reset(adev);
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
+static void soc24_program_aspm(struct amdgpu_device *adev)
+{
+	if (!amdgpu_device_should_use_aspm(adev))
+		return;
+
+	if (!(adev->flags & AMD_IS_APU) &&
+	    (adev->nbio.funcs->program_aspm))
+		adev->nbio.funcs->program_aspm(adev);
+}
+
+static void soc24_enable_doorbell_aperture(struct amdgpu_device *adev,
+					   bool enable)
+{
+	adev->nbio.funcs->enable_doorbell_aperture(adev, enable);
+	adev->nbio.funcs->enable_doorbell_selfring_aperture(adev, enable);
+}
+
+const struct amdgpu_ip_block_version soc24_common_ip_block =
+{
+	.type = AMD_IP_BLOCK_TYPE_COMMON,
+	.major = 1,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &soc24_common_ip_funcs,
+};
+
+static bool soc24_need_full_reset(struct amdgpu_device *adev)
+{
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
+	case IP_VERSION(12, 0, 0):
+	case IP_VERSION(12, 0, 1):
+	default:
+		return true;
+	}
+}
+
+static bool soc24_need_reset_on_init(struct amdgpu_device *adev)
+{
+	u32 sol_reg;
+
+	if (adev->flags & AMD_IS_APU)
+		return false;
+
+	/* Check sOS sign of life register to confirm sys driver and sOS
+	 * are already been loaded.
+	 */
+	sol_reg = RREG32_SOC15(MP0, 0, regMPASP_SMN_C2PMSG_81);
+	if (sol_reg)
+		return true;
+
+	return false;
+}
+
+static uint64_t soc24_get_pcie_replay_count(struct amdgpu_device *adev)
+{
+	/* TODO
+	 * dummy implement for pcie_replay_count sysfs interface
+	 * */
+	return 0;
+}
+
+static void soc24_init_doorbell_index(struct amdgpu_device *adev)
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
+	adev->doorbell_index.gfx_userqueue_start =
+		AMDGPU_NAVI10_DOORBELL_GFX_USERQUEUE_START;
+	adev->doorbell_index.gfx_userqueue_end =
+		AMDGPU_NAVI10_DOORBELL_GFX_USERQUEUE_END;
+	adev->doorbell_index.mes_ring0 = AMDGPU_NAVI10_DOORBELL_MES_RING0;
+	adev->doorbell_index.mes_ring1 = AMDGPU_NAVI10_DOORBELL_MES_RING1;
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
+static void soc24_pre_asic_init(struct amdgpu_device *adev)
+{
+}
+
+static int soc24_update_umd_stable_pstate(struct amdgpu_device *adev,
+					  bool enter)
+{
+	if (enter)
+		amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
+	else
+		amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
+
+	if (adev->gfx.funcs->update_perfmon_mgcg)
+		adev->gfx.funcs->update_perfmon_mgcg(adev, !enter);
+
+	return 0;
+}
+
+static const struct amdgpu_asic_funcs soc24_asic_funcs =
+{
+	.read_bios_from_rom = &amdgpu_soc15_read_bios_from_rom,
+	.read_register = &soc24_read_register,
+	.reset = &soc24_asic_reset,
+	.reset_method = &soc24_asic_reset_method,
+	.get_xclk = &soc24_get_xclk,
+	.get_config_memsize = &soc24_get_config_memsize,
+	.init_doorbell_index = &soc24_init_doorbell_index,
+	.need_full_reset = &soc24_need_full_reset,
+	.need_reset_on_init = &soc24_need_reset_on_init,
+	.get_pcie_replay_count = &soc24_get_pcie_replay_count,
+	.supports_baco = &amdgpu_dpm_is_baco_supported,
+	.pre_asic_init = &soc24_pre_asic_init,
+	.update_umd_stable_pstate = &soc24_update_umd_stable_pstate,
+};
+
+static int soc24_common_early_init(void *handle)
+{
+#define MMIO_REG_HOLE_OFFSET (0x80000 - PAGE_SIZE)
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	adev->rmmio_remap.reg_offset = MMIO_REG_HOLE_OFFSET;
+	adev->rmmio_remap.bus_addr = adev->rmmio_base + MMIO_REG_HOLE_OFFSET;
+	adev->smc_rreg = NULL;
+	adev->smc_wreg = NULL;
+	adev->pcie_rreg = &amdgpu_device_indirect_rreg;
+	adev->pcie_wreg = &amdgpu_device_indirect_wreg;
+	adev->pcie_rreg64 = &amdgpu_device_indirect_rreg64;
+	adev->pcie_wreg64 = &amdgpu_device_indirect_wreg64;
+	adev->pciep_rreg = amdgpu_device_pcie_port_rreg;
+	adev->pciep_wreg = amdgpu_device_pcie_port_wreg;
+	adev->uvd_ctx_rreg = NULL;
+	adev->uvd_ctx_wreg = NULL;
+	adev->didt_rreg = NULL;
+	adev->didt_wreg = NULL;
+
+	adev->asic_funcs = &soc24_asic_funcs;
+
+	adev->rev_id = amdgpu_device_get_rev_id(adev);
+	adev->external_rev_id = 0xff;
+
+	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
+	case IP_VERSION(12, 0, 0):
+		adev->cg_flags = 0;
+		adev->pg_flags = 0;
+		adev->external_rev_id = adev->rev_id + 0x40;
+		break;
+	case IP_VERSION(12, 0, 1):
+		adev->cg_flags = 0;
+		adev->pg_flags = 0;
+		adev->external_rev_id = adev->rev_id + 0x50;
+		break;
+	default:
+		/* FIXME: not supported yet */
+		return -EINVAL;
+	}
+
+	if (amdgpu_sriov_vf(adev)) {
+		amdgpu_virt_init_setting(adev);
+		xgpu_nv_mailbox_set_irq_funcs(adev);
+	}
+
+	return 0;
+}
+
+static int soc24_common_late_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (amdgpu_sriov_vf(adev))
+		xgpu_nv_mailbox_get_irq(adev);
+
+	return 0;
+}
+
+static int soc24_common_sw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (amdgpu_sriov_vf(adev))
+		xgpu_nv_mailbox_add_irq_id(adev);
+
+	return 0;
+}
+
+static int soc24_common_sw_fini(void *handle)
+{
+	return 0;
+}
+
+static int soc24_common_hw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* enable aspm */
+	soc24_program_aspm(adev);
+	/* setup nbio registers */
+	adev->nbio.funcs->init_registers(adev);
+	/* remap HDP registers to a hole in mmio space,
+	 * for the purpose of expose those registers
+	 * to process space
+	 */
+	if (adev->nbio.funcs->remap_hdp_registers)
+		adev->nbio.funcs->remap_hdp_registers(adev);
+	/* enable the doorbell aperture */
+	soc24_enable_doorbell_aperture(adev, true);
+
+	return 0;
+}
+
+static int soc24_common_hw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	/* disable the doorbell aperture */
+	soc24_enable_doorbell_aperture(adev, false);
+
+	if (amdgpu_sriov_vf(adev))
+		xgpu_nv_mailbox_put_irq(adev);
+
+	return 0;
+}
+
+static int soc24_common_suspend(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	return soc24_common_hw_fini(adev);
+}
+
+static int soc24_common_resume(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	return soc24_common_hw_init(adev);
+}
+
+static bool soc24_common_is_idle(void *handle)
+{
+	return true;
+}
+
+static int soc24_common_wait_for_idle(void *handle)
+{
+	return 0;
+}
+
+static int soc24_common_soft_reset(void *handle)
+{
+	return 0;
+}
+
+static int soc24_common_set_clockgating_state(void *handle,
+					      enum amd_clockgating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	switch (amdgpu_ip_version(adev, NBIO_HWIP, 0)) {
+	case IP_VERSION(6, 3, 1):
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
+static int soc24_common_set_powergating_state(void *handle,
+					      enum amd_powergating_state state)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
+	case IP_VERSION(7, 0, 0):
+	case IP_VERSION(7, 0, 1):
+		adev->lsdma.funcs->update_memory_power_gating(adev,
+				state == AMD_PG_STATE_GATE);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void soc24_common_get_clockgating_state(void *handle, u64 *flags)
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
+static const struct amd_ip_funcs soc24_common_ip_funcs = {
+	.name = "soc24_common",
+	.early_init = soc24_common_early_init,
+	.late_init = soc24_common_late_init,
+	.sw_init = soc24_common_sw_init,
+	.sw_fini = soc24_common_sw_fini,
+	.hw_init = soc24_common_hw_init,
+	.hw_fini = soc24_common_hw_fini,
+	.suspend = soc24_common_suspend,
+	.resume = soc24_common_resume,
+	.is_idle = soc24_common_is_idle,
+	.wait_for_idle = soc24_common_wait_for_idle,
+	.soft_reset = soc24_common_soft_reset,
+	.set_clockgating_state = soc24_common_set_clockgating_state,
+	.set_powergating_state = soc24_common_set_powergating_state,
+	.get_clockgating_state = soc24_common_get_clockgating_state,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.h b/drivers/gpu/drm/amd/amdgpu/soc24.h
new file mode 100644
index 000000000000..fa7e442e0b62
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef __SOC24_H__
+#define __SOC24_H__
+
+extern const struct amdgpu_ip_block_version soc24_common_ip_block;
+
+void soc24_grbm_select(struct amdgpu_device *adev,
+		       u32 me, u32 pipe, u32 queue, u32 vmid);
+#endif
-- 
2.44.0


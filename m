Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D651533C
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Apr 2022 20:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176C510F8C4;
	Fri, 29 Apr 2022 18:03:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C80F10F8A4
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Apr 2022 18:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT85IMumeXwYrNtOSEUhiWZ9MPl13r13eUN5JGgTaiVVLAZqhwpD7Fyis1W7ihta+IfNqWN9VEWO9Hxi8VI1BorvRYOm1XnE2Uy7emR9qLyTnDoK7a+rAoCWcpIuV5u/htOO10xwVHTP+nuw6ylENbu0lKVN/c9v+c5SumhJddGpyzj/ExuMGdpab9QoBn+BXe/MlOATArRmCHRO8NZCDelEeASMRlfecU+c65/ePOCysl6ZwS+bxyizRxQn/fJdC9yHMECiRHHM0qpDBogg+lT8k2QZWqbvHrWGb+Z4/pUyWBgMpbeFcp1yPJWCR4HYMEOxTuAZYyLqJWmBMjU6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wskTWHjeFDFGUCicij5Im2/0esm0gBGC++6WCFIQFo=;
 b=CZZmZl2pA/QHIheiSQg3xeFe+rjo34ulE9papcp7PcdZD+JN28r66POUQ3Ds2+7Is8JqUAsvD5XALux9xeW/mQ0X2Zi2Qi0psNStezCWagsCIY7HKNC8UQ8/kyze6GufSPz6944XHMgq+UysuVmU9XWrp/SSPW0diYFNUaecpGCh0BoB2PjdXhxxBbvtBML/OBx/y3NuwcoO/WtuiHjbAtU8azfY2S575xWy/wBVV1uFvouYwgpIY23Uh8kN+p2sIsmyjx1h+NprwQGOUDGPaMdikHe6TQ9+7g1lA2ZVyyuQSt7MnsvnfPST4yZ8I7oHNCoBxvKikAe0iX39liMTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wskTWHjeFDFGUCicij5Im2/0esm0gBGC++6WCFIQFo=;
 b=IqqXLLWxh9ApXeQyB88KoJ6h7uLla9kCAMmYEjRJGYrexfcIR1WwFcIh6y/rCriwdGDsnvkUwsE5/LLfB6GxSmFv+CCH0iUgZGEyuxb4b4eqIR3bbeP7cEXUuEBpRgksq1S6TtVTusUCnE+xFZmwBzIg//BtpZ/hwJiMPwJZ0ik=
Received: from MW2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:907::28) by
 SN6PR12MB4704.namprd12.prod.outlook.com (2603:10b6:805:e8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 29 Apr 2022 18:02:52 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::9b) by MW2PR16CA0015.outlook.office365.com
 (2603:10b6:907::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14 via Frontend
 Transport; Fri, 29 Apr 2022 18:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 18:02:52 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 13:02:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/29] drm/amdkfd: Add KFD support for soc21 v3
Date: Fri, 29 Apr 2022 14:02:19 -0400
Message-ID: <20220429180226.536084-23-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429180226.536084-1-alexander.deucher@amd.com>
References: <20220429180226.536084-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edebfc4d-d7ec-4611-4f37-08da2a0a7ac4
X-MS-TrafficTypeDiagnostic: SN6PR12MB4704:EE_
X-Microsoft-Antispam-PRVS: <SN6PR12MB4704CBE80481D4B098F76EEFF7FC9@SN6PR12MB4704.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hw/AD2nozygEjHbvozD0/vUzpJ3klEPAemDwL8ISLFdfwuCJW6fIaxbfmH47AY0ohHbfBqd8srIvFwsjz9MHTP1CGVXm2h7wW2zQonKcl4KqiEU0Tj1cL2+VL58lavAWKXsiEYhyNA51sTpopz/68fjJV9k0H4I93NbyEeeMKpXNPCZBEg6UhKIpC8VQ6V3uQ31vjv3CAw1hSYT3u97MXidQ7Qmvgpxjf+ZjQTKdflCF4FpaXdUx6eohcOetsKhClfsoDE6HiToohrfKbxbESBm2/gPJZpNFaNtffkgvfTV78urareQ9U2d5cm4c41gdVUalVwCewZkA5hVYUihGw+QiNo14GWG/rrQ4NpZtijRu6+ka3GBZolsv2uE+U8Cx6V/NPzhe6OhVSuY49k/WJrGR+I8FXIA2hckxD5u0Wq8W2YkRjIXoHWt+tWYX0mjL0YXHmPcNumILAdT2r+nfUdP5QJKDkYrE6nZ9VMUAhs59qv+E+3Wz7SNR4P/cLE52cNRw8JWPLH67VGnlYSR1KYGwZnEILYpEsTGD3BRe251LuFdOek/nGywvL7+Kk3m5NMEbF6k69n+rYkjkDY/YVwBNL3ijdcn5buk4rcq/DpKcTlVRu7QWEoceErH6sPGkGpIIIazeKP1on4a7cl2WBTxYrCqGUnK7dFNRrKQB8voj+6GKfY1cpjueU0plOc631jdvFpw8NJObuZ35+ekwbw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(40460700003)(8676002)(30864003)(5660300002)(508600001)(356005)(36860700001)(83380400001)(2906002)(7696005)(81166007)(16526019)(6666004)(86362001)(26005)(82310400005)(47076005)(4326008)(54906003)(6916009)(316002)(2616005)(336012)(1076003)(426003)(186003)(36756003)(70586007)(70206006)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 18:02:52.2196 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edebfc4d-d7ec-4611-4f37-08da2a0a7ac4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4704
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mukul Joshi <mukul.joshi@amd.com>

Add initial support for soc21 in KFD compute
driver (Mukul)
- Add new definition for soc21 device.
- Add new file for amdgpu-kfd interface for GFX11 family.
- Add new file for queue management, interrupt handling,
  mqd management for GFX11 family in KFD driver.
- Related changes/updates for soc21 device in
  KFD driver.
- Repurpose last 2 entries of SDMA MQD for driver use.

v2: Add an optional argument into update queue operation (Mukul)

v3: Switch to ip version check, replace kgd_dev with
    amdgpu_device (Hawking)

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Oak Zeng <Oak.Zeng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  15 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c    | 625 ++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/Makefile           |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c         |   8 +
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  24 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 299 +++++++--
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   5 +
 .../amd/amdkfd/kfd_device_queue_manager_v11.c |  81 +++
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c     |  56 +-
 .../gpu/drm/amd/amdkfd/kfd_int_process_v11.c  | 383 +++++++++++
 .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c   |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c  |  10 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  | 508 ++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  13 +
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  19 +
 .../amd/amdkfd/kfd_process_queue_manager.c    |  21 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |   3 +-
 drivers/gpu/drm/amd/amdkfd/soc15_int.h        |   3 +-
 .../gpu/drm/amd/include/kgd_kfd_interface.h   |   1 +
 20 files changed, 2024 insertions(+), 64 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
 create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 6caf2390a889..6a67210f282f 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -215,7 +215,8 @@ amdgpu-y += \
 	amdgpu_amdkfd_arcturus.o \
 	amdgpu_amdkfd_aldebaran.o \
 	amdgpu_amdkfd_gfx_v10.o \
-	amdgpu_amdkfd_gfx_v10_3.o
+	amdgpu_amdkfd_gfx_v10_3.o \
+	amdgpu_amdkfd_gfx_v11.o
 
 ifneq ($(CONFIG_DRM_AMDGPU_CIK),)
 amdgpu-y += amdgpu_amdkfd_gfx_v7.o
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 64c6664b34e8..1f8161cd507f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -100,7 +100,18 @@ static void amdgpu_doorbell_get_kfd_info(struct amdgpu_device *adev,
 	 * The first num_doorbells are used by amdgpu.
 	 * amdkfd takes whatever's left in the aperture.
 	 */
-	if (adev->doorbell.size > adev->doorbell.num_doorbells * sizeof(u32)) {
+	if (adev->enable_mes) {
+		/*
+		 * With MES enabled, we only need to initialize
+		 * the base address. The size and offset are
+		 * not initialized as AMDGPU manages the whole
+		 * doorbell space.
+		 */
+		*aperture_base = adev->doorbell.base;
+		*aperture_size = 0;
+		*start_offset = 0;
+	} else if (adev->doorbell.size > adev->doorbell.num_doorbells *
+						sizeof(u32)) {
 		*aperture_base = adev->doorbell.base;
 		*aperture_size = adev->doorbell.size;
 		*start_offset = adev->doorbell.num_doorbells * sizeof(u32);
@@ -128,7 +139,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 					  AMDGPU_GMC_HOLE_START),
 			.drm_render_minor = adev_to_drm(adev)->render->index,
 			.sdma_doorbell_idx = adev->doorbell_index.sdma_engine,
-
+			.enable_mes = adev->enable_mes,
 		};
 
 		/* this is going to have a few of the MSBs set that we need to
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
new file mode 100644
index 000000000000..0b0a72ca5695
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c
@@ -0,0 +1,625 @@
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
+ */
+#include <linux/mmu_context.h>
+#include "amdgpu.h"
+#include "amdgpu_amdkfd.h"
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
+#include "oss/osssys_6_0_0_offset.h"
+#include "oss/osssys_6_0_0_sh_mask.h"
+#include "soc15_common.h"
+#include "soc15d.h"
+#include "v11_structs.h"
+#include "soc21.h"
+
+enum hqd_dequeue_request_type {
+	NO_ACTION = 0,
+	DRAIN_PIPE,
+	RESET_WAVES,
+	SAVE_WAVES
+};
+
+static void lock_srbm(struct amdgpu_device *adev, uint32_t mec, uint32_t pipe,
+			uint32_t queue, uint32_t vmid)
+{
+	mutex_lock(&adev->srbm_mutex);
+	soc21_grbm_select(adev, mec, pipe, queue, vmid);
+}
+
+static void unlock_srbm(struct amdgpu_device *adev)
+{
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+}
+
+static void acquire_queue(struct amdgpu_device *adev, uint32_t pipe_id,
+				uint32_t queue_id)
+{
+	uint32_t mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+	uint32_t pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+	lock_srbm(adev, mec, pipe, queue_id, 0);
+}
+
+static uint64_t get_queue_mask(struct amdgpu_device *adev,
+			       uint32_t pipe_id, uint32_t queue_id)
+{
+	unsigned int bit = pipe_id * adev->gfx.mec.num_queue_per_pipe +
+			queue_id;
+
+	return 1ull << bit;
+}
+
+static void release_queue(struct amdgpu_device *adev)
+{
+	unlock_srbm(adev);
+}
+
+static void program_sh_mem_settings_v11(struct amdgpu_device *adev, uint32_t vmid,
+					uint32_t sh_mem_config,
+					uint32_t sh_mem_ape1_base,
+					uint32_t sh_mem_ape1_limit,
+					uint32_t sh_mem_bases)
+{
+	lock_srbm(adev, 0, 0, 0, vmid);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regSH_MEM_CONFIG), sh_mem_config);
+	WREG32(SOC15_REG_OFFSET(GC, 0, regSH_MEM_BASES), sh_mem_bases);
+
+	unlock_srbm(adev);
+}
+
+static int set_pasid_vmid_mapping_v11(struct amdgpu_device *adev, unsigned int pasid,
+					unsigned int vmid)
+{
+	uint32_t value = pasid << IH_VMID_0_LUT__PASID__SHIFT;
+
+	/* Mapping vmid to pasid also for IH block */
+	pr_debug("mapping vmid %d -> pasid %d in IH block for GFX client\n",
+			vmid, pasid);
+	WREG32(SOC15_REG_OFFSET(OSSSYS, 0, regIH_VMID_0_LUT) + vmid, value);
+
+	return 0;
+}
+
+static int init_interrupts_v11(struct amdgpu_device *adev, uint32_t pipe_id)
+{
+	uint32_t mec;
+	uint32_t pipe;
+
+	mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+	pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+	lock_srbm(adev, mec, pipe, 0, 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regCPC_INT_CNTL),
+		CP_INT_CNTL_RING0__TIME_STAMP_INT_ENABLE_MASK |
+		CP_INT_CNTL_RING0__OPCODE_ERROR_INT_ENABLE_MASK);
+
+	unlock_srbm(adev);
+
+	return 0;
+}
+
+static uint32_t get_sdma_rlc_reg_offset(struct amdgpu_device *adev,
+				unsigned int engine_id,
+				unsigned int queue_id)
+{
+	uint32_t sdma_engine_reg_base = 0;
+	uint32_t sdma_rlc_reg_offset;
+
+	switch (engine_id) {
+	case 0:
+		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA0, 0,
+				regSDMA0_QUEUE0_RB_CNTL) - regSDMA0_QUEUE0_RB_CNTL;
+		break;
+	case 1:
+		sdma_engine_reg_base = SOC15_REG_OFFSET(SDMA1, 0,
+				regSDMA1_QUEUE0_RB_CNTL) - regSDMA0_QUEUE0_RB_CNTL;
+		break;
+	default:
+		BUG();
+	}
+
+	sdma_rlc_reg_offset = sdma_engine_reg_base
+		+ queue_id * (regSDMA0_QUEUE1_RB_CNTL - regSDMA0_QUEUE0_RB_CNTL);
+
+	pr_debug("RLC register offset for SDMA%d RLC%d: 0x%x\n", engine_id,
+			queue_id, sdma_rlc_reg_offset);
+
+	return sdma_rlc_reg_offset;
+}
+
+static inline struct v11_compute_mqd *get_mqd(void *mqd)
+{
+	return (struct v11_compute_mqd *)mqd;
+}
+
+static inline struct v11_sdma_mqd *get_sdma_mqd(void *mqd)
+{
+	return (struct v11_sdma_mqd *)mqd;
+}
+
+static int hqd_load_v11(struct amdgpu_device *adev, void *mqd, uint32_t pipe_id,
+			uint32_t queue_id, uint32_t __user *wptr,
+			uint32_t wptr_shift, uint32_t wptr_mask,
+			struct mm_struct *mm)
+{
+	struct v11_compute_mqd *m;
+	uint32_t *mqd_hqd;
+	uint32_t reg, hqd_base, data;
+
+	m = get_mqd(mqd);
+
+	pr_debug("Load hqd of pipe %d queue %d\n", pipe_id, queue_id);
+	acquire_queue(adev, pipe_id, queue_id);
+
+	/* HIQ is set during driver init period with vmid set to 0*/
+	if (m->cp_hqd_vmid == 0) {
+		uint32_t value, mec, pipe;
+
+		mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+		pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+		pr_debug("kfd: set HIQ, mec:%d, pipe:%d, queue:%d.\n",
+			mec, pipe, queue_id);
+		value = RREG32(SOC15_REG_OFFSET(GC, 0, regRLC_CP_SCHEDULERS));
+		value = REG_SET_FIELD(value, RLC_CP_SCHEDULERS, scheduler1,
+			((mec << 5) | (pipe << 3) | queue_id | 0x80));
+		WREG32(SOC15_REG_OFFSET(GC, 0, regRLC_CP_SCHEDULERS), value);
+	}
+
+	/* HQD registers extend from CP_MQD_BASE_ADDR to CP_HQD_EOP_WPTR_MEM. */
+	mqd_hqd = &m->cp_mqd_base_addr_lo;
+	hqd_base = SOC15_REG_OFFSET(GC, 0, regCP_MQD_BASE_ADDR);
+
+	for (reg = hqd_base;
+	     reg <= SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_WPTR_HI); reg++)
+		WREG32(reg, mqd_hqd[reg - hqd_base]);
+
+
+	/* Activate doorbell logic before triggering WPTR poll. */
+	data = REG_SET_FIELD(m->cp_hqd_pq_doorbell_control,
+			     CP_HQD_PQ_DOORBELL_CONTROL, DOORBELL_EN, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL), data);
+
+	if (wptr) {
+		/* Don't read wptr with get_user because the user
+		 * context may not be accessible (if this function
+		 * runs in a work queue). Instead trigger a one-shot
+		 * polling read from memory in the CP. This assumes
+		 * that wptr is GPU-accessible in the queue's VMID via
+		 * ATC or SVM. WPTR==RPTR before starting the poll so
+		 * the CP starts fetching new commands from the right
+		 * place.
+		 *
+		 * Guessing a 64-bit WPTR from a 32-bit RPTR is a bit
+		 * tricky. Assume that the queue didn't overflow. The
+		 * number of valid bits in the 32-bit RPTR depends on
+		 * the queue size. The remaining bits are taken from
+		 * the saved 64-bit WPTR. If the WPTR wrapped, add the
+		 * queue size.
+		 */
+		uint32_t queue_size =
+			2 << REG_GET_FIELD(m->cp_hqd_pq_control,
+					   CP_HQD_PQ_CONTROL, QUEUE_SIZE);
+		uint64_t guessed_wptr = m->cp_hqd_pq_rptr & (queue_size - 1);
+
+		if ((m->cp_hqd_pq_wptr_lo & (queue_size - 1)) < guessed_wptr)
+			guessed_wptr += queue_size;
+		guessed_wptr += m->cp_hqd_pq_wptr_lo & ~(queue_size - 1);
+		guessed_wptr += (uint64_t)m->cp_hqd_pq_wptr_hi << 32;
+
+		WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_WPTR_LO),
+		       lower_32_bits(guessed_wptr));
+		WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_WPTR_HI),
+		       upper_32_bits(guessed_wptr));
+		WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR),
+		       lower_32_bits((uint64_t)wptr));
+		WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR_HI),
+		       upper_32_bits((uint64_t)wptr));
+		pr_debug("%s setting CP_PQ_WPTR_POLL_CNTL1 to %x\n", __func__,
+			 (uint32_t)get_queue_mask(adev, pipe_id, queue_id));
+		WREG32(SOC15_REG_OFFSET(GC, 0, regCP_PQ_WPTR_POLL_CNTL1),
+		       (uint32_t)get_queue_mask(adev, pipe_id, queue_id));
+	}
+
+	/* Start the EOP fetcher */
+	WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_EOP_RPTR),
+	       REG_SET_FIELD(m->cp_hqd_eop_rptr,
+			     CP_HQD_EOP_RPTR, INIT_FETCHER, 1));
+
+	data = REG_SET_FIELD(m->cp_hqd_active, CP_HQD_ACTIVE, ACTIVE, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_ACTIVE), data);
+
+	release_queue(adev);
+
+	return 0;
+}
+
+static int hiq_mqd_load_v11(struct amdgpu_device *adev, void *mqd,
+			      uint32_t pipe_id, uint32_t queue_id,
+			      uint32_t doorbell_off)
+{
+	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq.ring;
+	struct v11_compute_mqd *m;
+	uint32_t mec, pipe;
+	int r;
+
+	m = get_mqd(mqd);
+
+	acquire_queue(adev, pipe_id, queue_id);
+
+	mec = (pipe_id / adev->gfx.mec.num_pipe_per_mec) + 1;
+	pipe = (pipe_id % adev->gfx.mec.num_pipe_per_mec);
+
+	pr_debug("kfd: set HIQ, mec:%d, pipe:%d, queue:%d.\n",
+		 mec, pipe, queue_id);
+
+	spin_lock(&adev->gfx.kiq.ring_lock);
+	r = amdgpu_ring_alloc(kiq_ring, 7);
+	if (r) {
+		pr_err("Failed to alloc KIQ (%d).\n", r);
+		goto out_unlock;
+	}
+
+	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_MAP_QUEUES, 5));
+	amdgpu_ring_write(kiq_ring,
+			  PACKET3_MAP_QUEUES_QUEUE_SEL(0) | /* Queue_Sel */
+			  PACKET3_MAP_QUEUES_VMID(m->cp_hqd_vmid) | /* VMID */
+			  PACKET3_MAP_QUEUES_QUEUE(queue_id) |
+			  PACKET3_MAP_QUEUES_PIPE(pipe) |
+			  PACKET3_MAP_QUEUES_ME((mec - 1)) |
+			  PACKET3_MAP_QUEUES_QUEUE_TYPE(0) | /*queue_type: normal compute queue */
+			  PACKET3_MAP_QUEUES_ALLOC_FORMAT(0) | /* alloc format: all_on_one_pipe */
+			  PACKET3_MAP_QUEUES_ENGINE_SEL(1) | /* engine_sel: hiq */
+			  PACKET3_MAP_QUEUES_NUM_QUEUES(1)); /* num_queues: must be 1 */
+	amdgpu_ring_write(kiq_ring,
+			PACKET3_MAP_QUEUES_DOORBELL_OFFSET(doorbell_off));
+	amdgpu_ring_write(kiq_ring, m->cp_mqd_base_addr_lo);
+	amdgpu_ring_write(kiq_ring, m->cp_mqd_base_addr_hi);
+	amdgpu_ring_write(kiq_ring, m->cp_hqd_pq_wptr_poll_addr_lo);
+	amdgpu_ring_write(kiq_ring, m->cp_hqd_pq_wptr_poll_addr_hi);
+	amdgpu_ring_commit(kiq_ring);
+
+out_unlock:
+	spin_unlock(&adev->gfx.kiq.ring_lock);
+	release_queue(adev);
+
+	return r;
+}
+
+static int hqd_dump_v11(struct amdgpu_device *adev,
+			uint32_t pipe_id, uint32_t queue_id,
+			uint32_t (**dump)[2], uint32_t *n_regs)
+{
+	uint32_t i = 0, reg;
+#define HQD_N_REGS 56
+#define DUMP_REG(addr) do {				\
+		if (WARN_ON_ONCE(i >= HQD_N_REGS))	\
+			break;				\
+		(*dump)[i][0] = (addr) << 2;		\
+		(*dump)[i++][1] = RREG32(addr);		\
+	} while (0)
+
+	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	if (*dump == NULL)
+		return -ENOMEM;
+
+	acquire_queue(adev, pipe_id, queue_id);
+
+	for (reg = SOC15_REG_OFFSET(GC, 0, regCP_MQD_BASE_ADDR);
+	     reg <= SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_WPTR_HI); reg++)
+		DUMP_REG(reg);
+
+	release_queue(adev);
+
+	WARN_ON_ONCE(i != HQD_N_REGS);
+	*n_regs = i;
+
+	return 0;
+}
+
+static int hqd_sdma_load_v11(struct amdgpu_device *adev, void *mqd,
+			     uint32_t __user *wptr, struct mm_struct *mm)
+{
+	struct v11_sdma_mqd *m;
+	uint32_t sdma_rlc_reg_offset;
+	unsigned long end_jiffies;
+	uint32_t data;
+	uint64_t data64;
+	uint64_t __user *wptr64 = (uint64_t __user *)wptr;
+
+	m = get_sdma_mqd(mqd);
+	sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev, m->sdma_engine_id,
+					    m->sdma_queue_id);
+
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL,
+		m->sdmax_rlcx_rb_cntl & (~SDMA0_QUEUE0_RB_CNTL__RB_ENABLE_MASK));
+
+	end_jiffies = msecs_to_jiffies(2000) + jiffies;
+	while (true) {
+		data = RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_CONTEXT_STATUS);
+		if (data & SDMA0_QUEUE0_CONTEXT_STATUS__IDLE_MASK)
+			break;
+		if (time_after(jiffies, end_jiffies)) {
+			pr_err("SDMA RLC not idle in %s\n", __func__);
+			return -ETIME;
+		}
+		usleep_range(500, 1000);
+	}
+
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_DOORBELL_OFFSET,
+	       m->sdmax_rlcx_doorbell_offset);
+
+	data = REG_SET_FIELD(m->sdmax_rlcx_doorbell, SDMA0_QUEUE0_DOORBELL,
+			     ENABLE, 1);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_DOORBELL, data);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_RPTR,
+				m->sdmax_rlcx_rb_rptr);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_RPTR_HI,
+				m->sdmax_rlcx_rb_rptr_hi);
+
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_MINOR_PTR_UPDATE, 1);
+	if (read_user_wptr(mm, wptr64, data64)) {
+		WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_WPTR,
+		       lower_32_bits(data64));
+		WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_WPTR_HI,
+		       upper_32_bits(data64));
+	} else {
+		WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_WPTR,
+		       m->sdmax_rlcx_rb_rptr);
+		WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_WPTR_HI,
+		       m->sdmax_rlcx_rb_rptr_hi);
+	}
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_MINOR_PTR_UPDATE, 0);
+
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_BASE, m->sdmax_rlcx_rb_base);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_BASE_HI,
+			m->sdmax_rlcx_rb_base_hi);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_RPTR_ADDR_LO,
+			m->sdmax_rlcx_rb_rptr_addr_lo);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_RPTR_ADDR_HI,
+			m->sdmax_rlcx_rb_rptr_addr_hi);
+
+	data = REG_SET_FIELD(m->sdmax_rlcx_rb_cntl, SDMA0_QUEUE0_RB_CNTL,
+			     RB_ENABLE, 1);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL, data);
+
+	return 0;
+}
+
+static int hqd_sdma_dump_v11(struct amdgpu_device *adev,
+			     uint32_t engine_id, uint32_t queue_id,
+			     uint32_t (**dump)[2], uint32_t *n_regs)
+{
+	uint32_t sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev,
+			engine_id, queue_id);
+	uint32_t i = 0, reg;
+#undef HQD_N_REGS
+#define HQD_N_REGS (7+11+1+12+12)
+
+	*dump = kmalloc(HQD_N_REGS*2*sizeof(uint32_t), GFP_KERNEL);
+	if (*dump == NULL)
+		return -ENOMEM;
+
+	for (reg = regSDMA0_QUEUE0_RB_CNTL;
+	     reg <= regSDMA0_QUEUE0_RB_WPTR_HI; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = regSDMA0_QUEUE0_RB_RPTR_ADDR_HI;
+	     reg <= regSDMA0_QUEUE0_DOORBELL; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = regSDMA0_QUEUE0_DOORBELL_LOG;
+	     reg <= regSDMA0_QUEUE0_DOORBELL_LOG; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = regSDMA0_QUEUE0_DOORBELL_OFFSET;
+	     reg <= regSDMA0_QUEUE0_RB_PREEMPT; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+	for (reg = regSDMA0_QUEUE0_MIDCMD_DATA0;
+	     reg <= regSDMA0_QUEUE0_MIDCMD_CNTL; reg++)
+		DUMP_REG(sdma_rlc_reg_offset + reg);
+
+	WARN_ON_ONCE(i != HQD_N_REGS);
+	*n_regs = i;
+
+	return 0;
+}
+
+static bool hqd_is_occupied_v11(struct amdgpu_device *adev, uint64_t queue_address,
+				uint32_t pipe_id, uint32_t queue_id)
+{
+	uint32_t act;
+	bool retval = false;
+	uint32_t low, high;
+
+	acquire_queue(adev, pipe_id, queue_id);
+	act = RREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_ACTIVE));
+	if (act) {
+		low = lower_32_bits(queue_address >> 8);
+		high = upper_32_bits(queue_address >> 8);
+
+		if (low == RREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_BASE)) &&
+		   high == RREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_PQ_BASE_HI)))
+			retval = true;
+	}
+	release_queue(adev);
+	return retval;
+}
+
+static bool hqd_sdma_is_occupied_v11(struct amdgpu_device *adev, void *mqd)
+{
+	struct v11_sdma_mqd *m;
+	uint32_t sdma_rlc_reg_offset;
+	uint32_t sdma_rlc_rb_cntl;
+
+	m = get_sdma_mqd(mqd);
+	sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev, m->sdma_engine_id,
+					    m->sdma_queue_id);
+
+	sdma_rlc_rb_cntl = RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL);
+
+	if (sdma_rlc_rb_cntl & SDMA0_QUEUE0_RB_CNTL__RB_ENABLE_MASK)
+		return true;
+
+	return false;
+}
+
+static int hqd_destroy_v11(struct amdgpu_device *adev, void *mqd,
+				enum kfd_preempt_type reset_type,
+				unsigned int utimeout, uint32_t pipe_id,
+				uint32_t queue_id)
+{
+	enum hqd_dequeue_request_type type;
+	unsigned long end_jiffies;
+	uint32_t temp;
+	struct v11_compute_mqd *m = get_mqd(mqd);
+
+	acquire_queue(adev, pipe_id, queue_id);
+
+	if (m->cp_hqd_vmid == 0)
+		WREG32_FIELD15_PREREG(GC, 0, RLC_CP_SCHEDULERS, scheduler1, 0);
+
+	switch (reset_type) {
+	case KFD_PREEMPT_TYPE_WAVEFRONT_DRAIN:
+		type = DRAIN_PIPE;
+		break;
+	case KFD_PREEMPT_TYPE_WAVEFRONT_RESET:
+		type = RESET_WAVES;
+		break;
+	default:
+		type = DRAIN_PIPE;
+		break;
+	}
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_DEQUEUE_REQUEST), type);
+
+	end_jiffies = (utimeout * HZ / 1000) + jiffies;
+	while (true) {
+		temp = RREG32(SOC15_REG_OFFSET(GC, 0, regCP_HQD_ACTIVE));
+		if (!(temp & CP_HQD_ACTIVE__ACTIVE_MASK))
+			break;
+		if (time_after(jiffies, end_jiffies)) {
+			pr_err("cp queue pipe %d queue %d preemption failed\n",
+					pipe_id, queue_id);
+			release_queue(adev);
+			return -ETIME;
+		}
+		usleep_range(500, 1000);
+	}
+
+	release_queue(adev);
+	return 0;
+}
+
+static int hqd_sdma_destroy_v11(struct amdgpu_device *adev, void *mqd,
+				unsigned int utimeout)
+{
+	struct v11_sdma_mqd *m;
+	uint32_t sdma_rlc_reg_offset;
+	uint32_t temp;
+	unsigned long end_jiffies = (utimeout * HZ / 1000) + jiffies;
+
+	m = get_sdma_mqd(mqd);
+	sdma_rlc_reg_offset = get_sdma_rlc_reg_offset(adev, m->sdma_engine_id,
+					    m->sdma_queue_id);
+
+	temp = RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL);
+	temp = temp & ~SDMA0_QUEUE0_RB_CNTL__RB_ENABLE_MASK;
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL, temp);
+
+	while (true) {
+		temp = RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_CONTEXT_STATUS);
+		if (temp & SDMA0_QUEUE0_CONTEXT_STATUS__IDLE_MASK)
+			break;
+		if (time_after(jiffies, end_jiffies)) {
+			pr_err("SDMA RLC not idle in %s\n", __func__);
+			return -ETIME;
+		}
+		usleep_range(500, 1000);
+	}
+
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_DOORBELL, 0);
+	WREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL,
+		RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_CNTL) |
+		SDMA0_QUEUE0_RB_CNTL__RB_ENABLE_MASK);
+
+	m->sdmax_rlcx_rb_rptr = RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_RPTR);
+	m->sdmax_rlcx_rb_rptr_hi =
+		RREG32(sdma_rlc_reg_offset + regSDMA0_QUEUE0_RB_RPTR_HI);
+
+	return 0;
+}
+
+static int wave_control_execute_v11(struct amdgpu_device *adev,
+					uint32_t gfx_index_val,
+					uint32_t sq_cmd)
+{
+	uint32_t data = 0;
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regGRBM_GFX_INDEX), gfx_index_val);
+	WREG32(SOC15_REG_OFFSET(GC, 0, regSQ_CMD), sq_cmd);
+
+	data = REG_SET_FIELD(data, GRBM_GFX_INDEX,
+		INSTANCE_BROADCAST_WRITES, 1);
+	data = REG_SET_FIELD(data, GRBM_GFX_INDEX,
+		SA_BROADCAST_WRITES, 1);
+	data = REG_SET_FIELD(data, GRBM_GFX_INDEX,
+		SE_BROADCAST_WRITES, 1);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regGRBM_GFX_INDEX), data);
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+static void set_vm_context_page_table_base_v11(struct amdgpu_device *adev,
+		uint32_t vmid, uint64_t page_table_base)
+{
+	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
+		pr_err("trying to set page table base for wrong VMID %u\n",
+		       vmid);
+		return;
+	}
+
+	/* SDMA is on gfxhub as well for gfx11 adapters */
+	adev->gfxhub.funcs->setup_vm_pt_regs(adev, vmid, page_table_base);
+}
+
+const struct kfd2kgd_calls gfx_v11_kfd2kgd = {
+	.program_sh_mem_settings = program_sh_mem_settings_v11,
+	.set_pasid_vmid_mapping = set_pasid_vmid_mapping_v11,
+	.init_interrupts = init_interrupts_v11,
+	.hqd_load = hqd_load_v11,
+	.hiq_mqd_load = hiq_mqd_load_v11,
+	.hqd_sdma_load = hqd_sdma_load_v11,
+	.hqd_dump = hqd_dump_v11,
+	.hqd_sdma_dump = hqd_sdma_dump_v11,
+	.hqd_is_occupied = hqd_is_occupied_v11,
+	.hqd_sdma_is_occupied = hqd_sdma_is_occupied_v11,
+	.hqd_destroy = hqd_destroy_v11,
+	.hqd_sdma_destroy = hqd_sdma_destroy_v11,
+	.wave_control_execute = wave_control_execute_v11,
+	.get_atc_vmid_pasid_mapping_info = NULL,
+	.set_vm_context_page_table_base = set_vm_context_page_table_base_v11,
+};
diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
index 19cfbf9577b4..e758c2a24cd0 100644
--- a/drivers/gpu/drm/amd/amdkfd/Makefile
+++ b/drivers/gpu/drm/amd/amdkfd/Makefile
@@ -37,6 +37,7 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_mqd_manager_vi.o \
 		$(AMDKFD_PATH)/kfd_mqd_manager_v9.o \
 		$(AMDKFD_PATH)/kfd_mqd_manager_v10.o \
+		$(AMDKFD_PATH)/kfd_mqd_manager_v11.o \
 		$(AMDKFD_PATH)/kfd_kernel_queue.o \
 		$(AMDKFD_PATH)/kfd_packet_manager.o \
 		$(AMDKFD_PATH)/kfd_packet_manager_vi.o \
@@ -47,10 +48,12 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
 		$(AMDKFD_PATH)/kfd_device_queue_manager_vi.o \
 		$(AMDKFD_PATH)/kfd_device_queue_manager_v9.o \
 		$(AMDKFD_PATH)/kfd_device_queue_manager_v10.o \
+		$(AMDKFD_PATH)/kfd_device_queue_manager_v11.o \
 		$(AMDKFD_PATH)/kfd_interrupt.o \
 		$(AMDKFD_PATH)/kfd_events.o \
 		$(AMDKFD_PATH)/cik_event_interrupt.o \
 		$(AMDKFD_PATH)/kfd_int_process_v9.o \
+		$(AMDKFD_PATH)/kfd_int_process_v11.o \
 		$(AMDKFD_PATH)/kfd_smi_events.o \
 		$(AMDKFD_PATH)/kfd_crat.o
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 51e1c982ad2a..e9d79facb83a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -1315,6 +1315,8 @@ static int fill_in_l2_l3_pcache(struct crat_subtype_cache *pcache,
 	return 1;
 }
 
+#define KFD_MAX_CACHE_TYPES 6
+
 static int kfd_fill_gpu_cache_info_from_gfx_config(struct kfd_dev *kdev,
 						   struct kfd_gpu_cache_info *pcache_info)
 {
@@ -1408,6 +1410,7 @@ static int kfd_fill_gpu_cache_info(struct kfd_dev *kdev,
 			int *num_of_entries)
 {
 	struct kfd_gpu_cache_info *pcache_info;
+	struct kfd_gpu_cache_info cache_info[KFD_MAX_CACHE_TYPES];
 	int num_of_cache_types = 0;
 	int i, j, k;
 	int ct = 0;
@@ -1516,6 +1519,11 @@ static int kfd_fill_gpu_cache_info(struct kfd_dev *kdev,
 			pcache_info = yellow_carp_cache_info;
 			num_of_cache_types = ARRAY_SIZE(yellow_carp_cache_info);
 			break;
+		case IP_VERSION(11, 0, 0):
+			pcache_info = cache_info;
+			num_of_cache_types =
+				kfd_fill_gpu_cache_info_from_gfx_config(kdev, pcache_info);
+			break;
 		default:
 			return -EINVAL;
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index ed33e95c03e6..3d4faa66d4b0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -53,6 +53,7 @@ extern const struct kfd2kgd_calls arcturus_kfd2kgd;
 extern const struct kfd2kgd_calls aldebaran_kfd2kgd;
 extern const struct kfd2kgd_calls gfx_v10_kfd2kgd;
 extern const struct kfd2kgd_calls gfx_v10_3_kfd2kgd;
+extern const struct kfd2kgd_calls gfx_v11_kfd2kgd;
 
 static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
 				unsigned int chunk_size);
@@ -60,7 +61,7 @@ static void kfd_gtt_sa_fini(struct kfd_dev *kfd);
 
 static int kfd_resume(struct kfd_dev *kfd);
 
-static void kfd_device_info_set_sdma_queue_num(struct kfd_dev *kfd)
+static void kfd_device_info_set_sdma_info(struct kfd_dev *kfd)
 {
 	uint32_t sdma_version = kfd->adev->ip_versions[SDMA0_HWIP][0];
 
@@ -85,6 +86,7 @@ static void kfd_device_info_set_sdma_queue_num(struct kfd_dev *kfd)
 	case IP_VERSION(5, 2, 2):/* NAVY_FLOUNDER */
 	case IP_VERSION(5, 2, 4):/* DIMGREY_CAVEFISH */
 	case IP_VERSION(5, 2, 5):/* BEIGE_GOBY */
+	case IP_VERSION(6, 0, 0):
 		kfd->device_info.num_sdma_queues_per_engine = 8;
 		break;
 	default:
@@ -93,6 +95,17 @@ static void kfd_device_info_set_sdma_queue_num(struct kfd_dev *kfd)
 			sdma_version);
 		kfd->device_info.num_sdma_queues_per_engine = 8;
 	}
+
+	switch (sdma_version) {
+	case IP_VERSION(6, 0, 0):
+		/* Reserve 1 for paging and 1 for gfx */
+		kfd->device_info.num_reserved_sdma_queues_per_engine = 2;
+		/* BIT(0)=engine-0 queue-0; BIT(1)=engine-1 queue-0; BIT(2)=engine-0 queue-1; ... */
+		kfd->device_info.reserved_sdma_queues_bitmap = 0xFULL;
+		break;
+	default:
+		break;
+	}
 }
 
 static void kfd_device_info_set_event_interrupt_class(struct kfd_dev *kfd)
@@ -121,6 +134,9 @@ static void kfd_device_info_set_event_interrupt_class(struct kfd_dev *kfd)
 	case IP_VERSION(10, 3, 5): /* BEIGE_GOBY */
 		kfd->device_info.event_interrupt_class = &event_interrupt_class_v9;
 		break;
+	case IP_VERSION(11, 0, 0):
+		kfd->device_info.event_interrupt_class = &event_interrupt_class_v11;
+		break;
 	default:
 		dev_warn(kfd_device, "v9 event interrupt handler is set due to "
 			"mismatch of gc ip block(GC_HWIP:0x%x).\n", gc_version);
@@ -145,7 +161,7 @@ static void kfd_device_info_init(struct kfd_dev *kfd,
 		kfd->device_info.ih_ring_entry_size = 8 * sizeof(uint32_t);
 		kfd->device_info.supports_cwsr = true;
 
-		kfd_device_info_set_sdma_queue_num(kfd);
+		kfd_device_info_set_sdma_info(kfd);
 
 		kfd_device_info_set_event_interrupt_class(kfd);
 
@@ -346,6 +362,10 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 			if (!vf)
 				f2g = &gfx_v10_3_kfd2kgd;
 			break;
+		case IP_VERSION(11, 0, 0):
+			gfx_target_version = 110000;
+			f2g = &gfx_v11_kfd2kgd;
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 198672264492..e9c9a3a67ab0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -35,6 +35,7 @@
 #include "cik_regs.h"
 #include "kfd_kernel_queue.h"
 #include "amdgpu_amdkfd.h"
+#include "mes_api_def.h"
 
 /* Size of the per-pipe EOP queue */
 #define CIK_HPD_EOP_BYTES_LOG2 11
@@ -118,6 +119,11 @@ unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm)
 		dqm->dev->device_info.num_sdma_queues_per_engine;
 }
 
+static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
+{
+	return dqm->dev->device_info.reserved_sdma_queues_bitmap;
+}
+
 void program_sh_mem_settings(struct device_queue_manager *dqm,
 					struct qcm_process_device *qpd)
 {
@@ -129,6 +135,151 @@ void program_sh_mem_settings(struct device_queue_manager *dqm,
 						qpd->sh_mem_bases);
 }
 
+static void kfd_hws_hang(struct device_queue_manager *dqm)
+{
+	/*
+	 * Issue a GPU reset if HWS is unresponsive
+	 */
+	dqm->is_hws_hang = true;
+
+	/* It's possible we're detecting a HWS hang in the
+	 * middle of a GPU reset. No need to schedule another
+	 * reset in this case.
+	 */
+	if (!dqm->is_resetting)
+		schedule_work(&dqm->hw_exception_work);
+}
+
+static int convert_to_mes_queue_type(int queue_type)
+{
+	int mes_queue_type;
+
+	switch (queue_type) {
+	case KFD_QUEUE_TYPE_COMPUTE:
+		mes_queue_type = MES_QUEUE_TYPE_COMPUTE;
+		break;
+	case KFD_QUEUE_TYPE_SDMA:
+		mes_queue_type = MES_QUEUE_TYPE_SDMA;
+		break;
+	default:
+		WARN(1, "Invalid queue type %d", queue_type);
+		mes_queue_type = -EINVAL;
+		break;
+	}
+
+	return mes_queue_type;
+}
+
+static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
+			 struct qcm_process_device *qpd)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)dqm->dev->adev;
+	struct kfd_process_device *pdd = qpd_to_pdd(qpd);
+	struct mes_add_queue_input queue_input;
+	int r;
+
+	if (dqm->is_hws_hang)
+		return -EIO;
+
+	memset(&queue_input, 0x0, sizeof(struct mes_add_queue_input));
+	queue_input.process_id = qpd->pqm->process->pasid;
+	queue_input.page_table_base_addr =  qpd->page_table_base;
+	queue_input.process_va_start = 0;
+	queue_input.process_va_end = adev->vm_manager.max_pfn - 1;
+	/* MES unit for quantum is 100ns */
+	queue_input.process_quantum = KFD_MES_PROCESS_QUANTUM;  /* Equivalent to 10ms. */
+	queue_input.process_context_addr = pdd->proc_ctx_gpu_addr;
+	queue_input.gang_quantum = KFD_MES_GANG_QUANTUM; /* Equivalent to 1ms */
+	queue_input.gang_context_addr = q->gang_ctx_gpu_addr;
+	queue_input.inprocess_gang_priority = q->properties.priority;
+	queue_input.gang_global_priority_level =
+					AMDGPU_MES_PRIORITY_LEVEL_NORMAL;
+	queue_input.doorbell_offset = q->properties.doorbell_off;
+	queue_input.mqd_addr = q->gart_mqd_addr;
+	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
+	queue_input.paging = false;
+	queue_input.tba_addr = qpd->tba_addr;
+	queue_input.tma_addr = qpd->tma_addr;
+
+	queue_input.queue_type = convert_to_mes_queue_type(q->properties.type);
+	if (queue_input.queue_type < 0) {
+		pr_err("Queue type not supported with MES, queue:%d\n",
+				q->properties.type);
+		return -EINVAL;
+	}
+
+	if (q->gws) {
+		queue_input.gws_base = 0;
+		queue_input.gws_size = qpd->num_gws;
+	}
+
+	amdgpu_mes_lock(&adev->mes);
+	r = adev->mes.funcs->add_hw_queue(&adev->mes, &queue_input);
+	amdgpu_mes_unlock(&adev->mes);
+	if (r) {
+		pr_err("failed to add hardware queue to MES, doorbell=0x%x\n",
+			q->properties.doorbell_off);
+		pr_err("MES might be in unrecoverable state, issue a GPU reset\n");
+		kfd_hws_hang(dqm);
+}
+
+	return r;
+}
+
+static int remove_queue_mes(struct device_queue_manager *dqm, struct queue *q,
+			struct qcm_process_device *qpd)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)dqm->dev->adev;
+	int r;
+	struct mes_remove_queue_input queue_input;
+
+	if (dqm->is_hws_hang)
+		return -EIO;
+
+	memset(&queue_input, 0x0, sizeof(struct mes_remove_queue_input));
+	queue_input.doorbell_offset = q->properties.doorbell_off;
+	queue_input.gang_context_addr = q->gang_ctx_gpu_addr;
+
+	amdgpu_mes_lock(&adev->mes);
+	r = adev->mes.funcs->remove_hw_queue(&adev->mes, &queue_input);
+	amdgpu_mes_unlock(&adev->mes);
+
+	if (r) {
+		pr_err("failed to remove hardware queue from MES, doorbell=0x%x\n",
+			q->properties.doorbell_off);
+		pr_err("MES might be in unrecoverable state, issue a GPU reset\n");
+		kfd_hws_hang(dqm);
+	}
+
+	return r;
+}
+
+static int remove_all_queues_mes(struct device_queue_manager *dqm)
+{
+	struct device_process_node *cur;
+	struct qcm_process_device *qpd;
+	struct queue *q;
+	int retval = 0;
+
+	list_for_each_entry(cur, &dqm->queues, list) {
+		qpd = cur->qpd;
+		list_for_each_entry(q, &qpd->queues_list, list) {
+			if (q->properties.is_active) {
+				retval = remove_queue_mes(dqm, q, qpd);
+				if (retval) {
+					pr_err("%s: Failed to remove queue %d for dev %d",
+						__func__,
+						q->properties.queue_id,
+						dqm->dev->id);
+					return retval;
+				}
+			}
+		}
+	}
+
+	return retval;
+}
+
 static void increment_queue_count(struct device_queue_manager *dqm,
 				  struct qcm_process_device *qpd,
 				  struct queue *q)
@@ -659,6 +810,7 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 	struct mqd_manager *mqd_mgr;
 	struct kfd_process_device *pdd;
 	bool prev_active = false;
+	bool add_queue = false;
 
 	dqm_lock(dqm);
 	pdd = kfd_get_process_device_data(q->device, q->process);
@@ -674,8 +826,12 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 
 	/* Make sure the queue is unmapped before updating the MQD */
 	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) {
-		retval = unmap_queues_cpsch(dqm,
-				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
+		if (!dqm->dev->shared_resources.enable_mes)
+			retval = unmap_queues_cpsch(dqm,
+						    KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
+		else if (prev_active)
+			retval = remove_queue_mes(dqm, q, &pdd->qpd);
+
 		if (retval) {
 			pr_err("unmap queue failed\n");
 			goto out_unlock;
@@ -727,9 +883,12 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 		q->properties.is_gws = false;
 	}
 
-	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS)
-		retval = map_queues_cpsch(dqm);
-	else if (q->properties.is_active &&
+	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) {
+		if (!dqm->dev->shared_resources.enable_mes)
+			retval = map_queues_cpsch(dqm);
+		else if (add_queue)
+			retval = add_queue_mes(dqm, q, &pdd->qpd);
+	} else if (q->properties.is_active &&
 		 (q->properties.type == KFD_QUEUE_TYPE_COMPUTE ||
 		  q->properties.type == KFD_QUEUE_TYPE_SDMA ||
 		  q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)) {
@@ -822,12 +981,22 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 
 		q->properties.is_active = false;
 		decrement_queue_count(dqm, qpd, q);
+
+		if (dqm->dev->shared_resources.enable_mes) {
+			retval = remove_queue_mes(dqm, q, qpd);
+			if (retval) {
+				pr_err("Failed to evict queue %d\n",
+					q->properties.queue_id);
+				goto out;
+			}
+		}
 	}
 	pdd->last_evict_timestamp = get_jiffies_64();
-	retval = execute_queues_cpsch(dqm,
-				qpd->is_debug ?
-				KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
-				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+	if (!dqm->dev->shared_resources.enable_mes)
+		retval = execute_queues_cpsch(dqm,
+					      qpd->is_debug ?
+					      KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
+					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 
 out:
 	dqm_unlock(dqm);
@@ -951,9 +1120,19 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 
 		q->properties.is_active = true;
 		increment_queue_count(dqm, &pdd->qpd, q);
+
+		if (dqm->dev->shared_resources.enable_mes) {
+			retval = add_queue_mes(dqm, q, qpd);
+			if (retval) {
+				pr_err("Failed to restore queue %d\n",
+					q->properties.queue_id);
+				goto out;
+			}
+		}
 	}
-	retval = execute_queues_cpsch(dqm,
-				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+	if (!dqm->dev->shared_resources.enable_mes)
+		retval = execute_queues_cpsch(dqm,
+					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 	qpd->evicted = 0;
 	eviction_duration = get_jiffies_64() - pdd->last_evict_timestamp;
 	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
@@ -1081,6 +1260,9 @@ static int initialize_nocpsch(struct device_queue_manager *dqm)
 	memset(dqm->vmid_pasid, 0, sizeof(dqm->vmid_pasid));
 
 	dqm->sdma_bitmap = ~0ULL >> (64 - get_num_sdma_queues(dqm));
+	dqm->sdma_bitmap &= ~(get_reserved_sdma_queues_bitmap(dqm));
+	pr_info("sdma_bitmap: %llx\n", dqm->sdma_bitmap);
+
 	dqm->xgmi_sdma_bitmap = ~0ULL >> (64 - get_num_xgmi_sdma_queues(dqm));
 
 	return 0;
@@ -1277,6 +1459,9 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
 	else
 		dqm->sdma_bitmap = (BIT_ULL(num_sdma_queues) - 1);
 
+	dqm->sdma_bitmap &= ~(get_reserved_sdma_queues_bitmap(dqm));
+	pr_info("sdma_bitmap: %llx\n", dqm->sdma_bitmap);
+
 	num_xgmi_sdma_queues = get_num_xgmi_sdma_queues(dqm);
 	if (num_xgmi_sdma_queues >= BITS_PER_TYPE(dqm->xgmi_sdma_bitmap))
 		dqm->xgmi_sdma_bitmap = ULLONG_MAX;
@@ -1295,14 +1480,16 @@ static int start_cpsch(struct device_queue_manager *dqm)
 	retval = 0;
 
 	dqm_lock(dqm);
-	retval = pm_init(&dqm->packet_mgr, dqm);
-	if (retval)
-		goto fail_packet_manager_init;
 
-	retval = set_sched_resources(dqm);
-	if (retval)
-		goto fail_set_sched_resources;
+	if (!dqm->dev->shared_resources.enable_mes) {
+		retval = pm_init(&dqm->packet_mgr, dqm);
+		if (retval)
+			goto fail_packet_manager_init;
 
+		retval = set_sched_resources(dqm);
+		if (retval)
+			goto fail_set_sched_resources;
+	}
 	pr_debug("Allocating fence memory\n");
 
 	/* allocate fence memory on the gart */
@@ -1321,13 +1508,15 @@ static int start_cpsch(struct device_queue_manager *dqm)
 	dqm->is_hws_hang = false;
 	dqm->is_resetting = false;
 	dqm->sched_running = true;
-	execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+	if (!dqm->dev->shared_resources.enable_mes)
+		execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 	dqm_unlock(dqm);
 
 	return 0;
 fail_allocate_vidmem:
 fail_set_sched_resources:
-	pm_uninit(&dqm->packet_mgr, false);
+	if (!dqm->dev->shared_resources.enable_mes)
+		pm_uninit(&dqm->packet_mgr, false);
 fail_packet_manager_init:
 	dqm_unlock(dqm);
 	return retval;
@@ -1343,15 +1532,22 @@ static int stop_cpsch(struct device_queue_manager *dqm)
 		return 0;
 	}
 
-	if (!dqm->is_hws_hang)
-		unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
+	if (!dqm->is_hws_hang) {
+		if (!dqm->dev->shared_resources.enable_mes)
+			unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
+		else
+			remove_all_queues_mes(dqm);
+	}
+
 	hanging = dqm->is_hws_hang || dqm->is_resetting;
 	dqm->sched_running = false;
 
-	pm_release_ib(&dqm->packet_mgr);
+	if (!dqm->dev->shared_resources.enable_mes)
+		pm_release_ib(&dqm->packet_mgr);
 
 	kfd_gtt_sa_free(dqm->dev, dqm->fence_mem);
-	pm_uninit(&dqm->packet_mgr, hanging);
+	if (!dqm->dev->shared_resources.enable_mes)
+		pm_uninit(&dqm->packet_mgr, hanging);
 	dqm_unlock(dqm);
 
 	return 0;
@@ -1469,8 +1665,14 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	if (q->properties.is_active) {
 		increment_queue_count(dqm, qpd, q);
 
-		execute_queues_cpsch(dqm,
-				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+		if (!dqm->dev->shared_resources.enable_mes) {
+			retval = execute_queues_cpsch(dqm,
+					     KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+		} else {
+			retval = add_queue_mes(dqm, q, qpd);
+			if (retval)
+				goto cleanup_queue;
+		}
 	}
 
 	/*
@@ -1485,6 +1687,13 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	dqm_unlock(dqm);
 	return retval;
 
+cleanup_queue:
+	qpd->queue_count--;
+	list_del(&q->list);
+	if (q->properties.is_active)
+		decrement_queue_count(dqm, qpd, q);
+	mqd_mgr->free_mqd(mqd_mgr, q->mqd, q->mqd_mem_obj);
+	dqm_unlock(dqm);
 out_deallocate_doorbell:
 	deallocate_doorbell(qpd, q);
 out_deallocate_sdma_queue:
@@ -1572,13 +1781,7 @@ static int unmap_queues_cpsch(struct device_queue_manager *dqm,
 				queue_preemption_timeout_ms);
 	if (retval) {
 		pr_err("The cp might be in an unrecoverable state due to an unsuccessful queues preemption\n");
-		dqm->is_hws_hang = true;
-		/* It's possible we're detecting a HWS hang in the
-		 * middle of a GPU reset. No need to schedule another
-		 * reset in this case.
-		 */
-		if (!dqm->is_resetting)
-			schedule_work(&dqm->hw_exception_work);
+		kfd_hws_hang(dqm);
 		return retval;
 	}
 
@@ -1683,11 +1886,15 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 	list_del(&q->list);
 	qpd->queue_count--;
 	if (q->properties.is_active) {
-		decrement_queue_count(dqm, qpd, q);
-		retval = execute_queues_cpsch(dqm,
-				KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
-		if (retval == -ETIME)
-			qpd->reset_wavefronts = true;
+		if (!dqm->dev->shared_resources.enable_mes) {
+			decrement_queue_count(dqm, qpd, q);
+			retval = execute_queues_cpsch(dqm,
+						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
+			if (retval == -ETIME)
+				qpd->reset_wavefronts = true;
+		} else {
+			retval = remove_queue_mes(dqm, q, qpd);
+		}
 	}
 
 	/*
@@ -1941,9 +2148,17 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
 		else if (q->properties.type == KFD_QUEUE_TYPE_SDMA_XGMI)
 			deallocate_sdma_queue(dqm, q);
 
-		if (q->properties.is_active)
+		if (q->properties.is_active) {
 			decrement_queue_count(dqm, qpd, q);
 
+			if (dqm->dev->shared_resources.enable_mes) {
+				retval = remove_queue_mes(dqm, q, qpd);
+				if (retval)
+					pr_err("Failed to remove queue %d\n",
+						q->properties.queue_id);
+			}
+		}
+
 		dqm->total_queue_count--;
 	}
 
@@ -1958,7 +2173,9 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
 		}
 	}
 
-	retval = execute_queues_cpsch(dqm, filter, 0);
+	if (!dqm->dev->shared_resources.enable_mes)
+		retval = execute_queues_cpsch(dqm, filter, 0);
+
 	if ((!dqm->is_hws_hang) && (retval || qpd->reset_wavefronts)) {
 		pr_warn("Resetting wave fronts (cpsch) on dev %p\n", dqm->dev);
 		dbgdev_wave_reset_wavefronts(dqm->dev, qpd->pqm->process);
@@ -2133,7 +2350,9 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 		break;
 
 	default:
-		if (KFD_GC_VERSION(dev) >= IP_VERSION(10, 1, 1))
+		if (KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0))
+			device_queue_manager_init_v11(&dqm->asic_ops);
+		else if (KFD_GC_VERSION(dev) >= IP_VERSION(10, 1, 1))
 			device_queue_manager_init_v10_navi10(&dqm->asic_ops);
 		else if (KFD_GC_VERSION(dev) >= IP_VERSION(9, 0, 1))
 			device_queue_manager_init_v9(&dqm->asic_ops);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 3d539d6483e0..a537b9ef3e16 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -35,6 +35,9 @@
 
 #define VMID_NUM 16
 
+#define KFD_MES_PROCESS_QUANTUM		100000
+#define KFD_MES_GANG_QUANTUM		10000
+
 struct device_process_node {
 	struct qcm_process_device *qpd;
 	struct list_head list;
@@ -267,6 +270,8 @@ void device_queue_manager_init_v9(
 		struct device_queue_manager_asic_ops *asic_ops);
 void device_queue_manager_init_v10_navi10(
 		struct device_queue_manager_asic_ops *asic_ops);
+void device_queue_manager_init_v11(
+		struct device_queue_manager_asic_ops *asic_ops);
 void program_sh_mem_settings(struct device_queue_manager *dqm,
 					struct qcm_process_device *qpd);
 unsigned int get_cp_queues_num(struct device_queue_manager *dqm);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
new file mode 100644
index 000000000000..2e129da7acb4
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v11.c
@@ -0,0 +1,81 @@
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
+
+#include "kfd_device_queue_manager.h"
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
+#include "soc21_enum.h"
+
+static int update_qpd_v11(struct device_queue_manager *dqm,
+			 struct qcm_process_device *qpd);
+static void init_sdma_vm_v11(struct device_queue_manager *dqm, struct queue *q,
+			    struct qcm_process_device *qpd);
+
+void device_queue_manager_init_v11(
+	struct device_queue_manager_asic_ops *asic_ops)
+{
+	asic_ops->update_qpd = update_qpd_v11;
+	asic_ops->init_sdma_vm = init_sdma_vm_v11;
+	asic_ops->mqd_manager_init = mqd_manager_init_v11;
+}
+
+static uint32_t compute_sh_mem_bases_64bit(struct kfd_process_device *pdd)
+{
+	uint32_t shared_base = pdd->lds_base >> 48;
+	uint32_t private_base = pdd->scratch_base >> 48;
+
+	return (shared_base << SH_MEM_BASES__SHARED_BASE__SHIFT) |
+		private_base;
+}
+
+static int update_qpd_v11(struct device_queue_manager *dqm,
+			 struct qcm_process_device *qpd)
+{
+	struct kfd_process_device *pdd;
+
+	pdd = qpd_to_pdd(qpd);
+
+	/* check if sh_mem_config register already configured */
+	if (qpd->sh_mem_config == 0) {
+		qpd->sh_mem_config =
+			(SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
+				SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) |
+			(3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT);
+
+		qpd->sh_mem_ape1_limit = 0;
+		qpd->sh_mem_ape1_base = 0;
+	}
+
+	qpd->sh_mem_bases = compute_sh_mem_bases_64bit(pdd);
+
+	pr_debug("sh_mem_bases 0x%X\n", qpd->sh_mem_bases);
+
+	return 0;
+}
+
+static void init_sdma_vm_v11(struct device_queue_manager *dqm, struct queue *q,
+			    struct qcm_process_device *qpd)
+{
+	/* Not needed on SDMAv4 onwards any more */
+	q->properties.sdma_vm_addr = 0;
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
index 5401b6317f25..cb3d2ccc5100 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
@@ -49,9 +49,13 @@
 /* # of doorbell bytes allocated for each process. */
 size_t kfd_doorbell_process_slice(struct kfd_dev *kfd)
 {
-	return roundup(kfd->device_info.doorbell_size *
-			KFD_MAX_NUM_OF_QUEUES_PER_PROCESS,
-			PAGE_SIZE);
+	if (!kfd->shared_resources.enable_mes)
+		return roundup(kfd->device_info.doorbell_size *
+				KFD_MAX_NUM_OF_QUEUES_PER_PROCESS,
+				PAGE_SIZE);
+	else
+		return amdgpu_mes_doorbell_process_slice(
+					(struct amdgpu_device *)kfd->adev);
 }
 
 /* Doorbell calculations for device init. */
@@ -61,6 +65,16 @@ int kfd_doorbell_init(struct kfd_dev *kfd)
 	size_t doorbell_aperture_size;
 	size_t doorbell_process_limit;
 
+	/*
+	 * With MES enabled, just set the doorbell base as it is needed
+	 * to calculate doorbell physical address.
+	 */
+	if (kfd->shared_resources.enable_mes) {
+		kfd->doorbell_base =
+			kfd->shared_resources.doorbell_physical_address;
+		return 0;
+	}
+
 	/*
 	 * We start with calculations in bytes because the input data might
 	 * only be byte-aligned.
@@ -237,10 +251,16 @@ unsigned int kfd_get_doorbell_dw_offset_in_bar(struct kfd_dev *kfd,
 	 * the process's doorbells. The offset returned is in dword
 	 * units regardless of the ASIC-dependent doorbell size.
 	 */
-	return kfd->doorbell_base_dw_offset +
-		pdd->doorbell_index
-		* kfd_doorbell_process_slice(kfd) / sizeof(u32) +
-		doorbell_id * kfd->device_info.doorbell_size / sizeof(u32);
+	if (!kfd->shared_resources.enable_mes)
+		return kfd->doorbell_base_dw_offset +
+			pdd->doorbell_index
+			* kfd_doorbell_process_slice(kfd) / sizeof(u32) +
+			doorbell_id *
+			kfd->device_info.doorbell_size / sizeof(u32);
+	else
+		return amdgpu_mes_get_doorbell_dw_offset_in_bar(
+				(struct amdgpu_device *)kfd->adev,
+				pdd->doorbell_index, doorbell_id);
 }
 
 uint64_t kfd_get_number_elems(struct kfd_dev *kfd)
@@ -261,8 +281,16 @@ phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd)
 
 int kfd_alloc_process_doorbells(struct kfd_dev *kfd, unsigned int *doorbell_index)
 {
-	int r = ida_simple_get(&kfd->doorbell_ida, 1, kfd->max_doorbell_slices,
-				GFP_KERNEL);
+	int r = 0;
+
+	if (!kfd->shared_resources.enable_mes)
+		r = ida_simple_get(&kfd->doorbell_ida, 1,
+				   kfd->max_doorbell_slices, GFP_KERNEL);
+	else
+		r = amdgpu_mes_alloc_process_doorbells(
+				(struct amdgpu_device *)kfd->adev,
+				doorbell_index);
+
 	if (r > 0)
 		*doorbell_index = r;
 
@@ -271,6 +299,12 @@ int kfd_alloc_process_doorbells(struct kfd_dev *kfd, unsigned int *doorbell_inde
 
 void kfd_free_process_doorbells(struct kfd_dev *kfd, unsigned int doorbell_index)
 {
-	if (doorbell_index)
-		ida_simple_remove(&kfd->doorbell_ida, doorbell_index);
+	if (doorbell_index) {
+		if (!kfd->shared_resources.enable_mes)
+			ida_simple_remove(&kfd->doorbell_ida, doorbell_index);
+		else
+			amdgpu_mes_free_process_doorbells(
+					(struct amdgpu_device *)kfd->adev,
+					doorbell_index);
+	}
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
new file mode 100644
index 000000000000..c3919aaa76e6
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -0,0 +1,383 @@
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
+ */
+
+#include "kfd_priv.h"
+#include "kfd_events.h"
+#include "soc15_int.h"
+#include "kfd_device_queue_manager.h"
+#include "ivsrcid/vmc/irqsrcs_vmc_1_0.h"
+#include "kfd_smi_events.h"
+
+/*
+ * GFX11 SQ Interrupts
+ *
+ * There are 3 encoding types of interrupts sourced from SQ sent as a 44-bit
+ * packet to the Interrupt Handler:
+ * Auto - Generated by the SQG (various cmd overflows, timestamps etc)
+ * Wave - Generated by S_SENDMSG through a shader program
+ * Error - HW generated errors (Illegal instructions, Memviols, EDC etc)
+ *
+ * The 44-bit packet is mapped as {context_id1[7:0],context_id0[31:0]} plus
+ * 4-bits for VMID (SOC15_VMID_FROM_IH_ENTRY) as such:
+ *
+ * - context_id1[7:6]
+ * Encoding type (0 = Auto, 1 = Wave, 2 = Error)
+ *
+ * - context_id0[26]
+ * PRIV bit indicates that Wave S_SEND or error occurred within trap
+ *
+ * - context_id0[24:0]
+ * 25-bit data with the following layout per encoding type:
+ * Auto - only context_id0[8:0] is used, which reports various interrupts
+ * generated by SQG.  The rest is 0.
+ * Wave - user data sent from m0 via S_SENDMSG (context_id0[23:0])
+ * Error - Error Type (context_id0[24:21]), Error Details (context_id0[20:0])
+ *
+ * The other context_id bits show coordinates (SE/SH/CU/SIMD/WGP) for wave
+ * S_SENDMSG and Errors.  These are 0 for Auto.
+ */
+
+enum SQ_INTERRUPT_WORD_ENCODING {
+	SQ_INTERRUPT_WORD_ENCODING_AUTO = 0x0,
+	SQ_INTERRUPT_WORD_ENCODING_INST,
+	SQ_INTERRUPT_WORD_ENCODING_ERROR,
+};
+
+enum SQ_INTERRUPT_ERROR_TYPE {
+	SQ_INTERRUPT_ERROR_TYPE_EDC_FUE = 0x0,
+	SQ_INTERRUPT_ERROR_TYPE_ILLEGAL_INST,
+	SQ_INTERRUPT_ERROR_TYPE_MEMVIOL,
+	SQ_INTERRUPT_ERROR_TYPE_EDC_FED,
+};
+
+/* SQ_INTERRUPT_WORD_AUTO_CTXID */
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE__SHIFT		0
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__WLT__SHIFT			1
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_BUF_FULL__SHIFT	2
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__REG_TIMESTAMP__SHIFT		3
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__CMD_TIMESTAMP__SHIFT		4
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__HOST_CMD_OVERFLOW__SHIFT		5
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__HOST_REG_OVERFLOW__SHIFT		6
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__IMMED_OVERFLOW__SHIFT		7
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_UTC_ERROR__SHIFT	8
+#define SQ_INTERRUPT_WORD_AUTO_CTXID1__ENCODING__SHIFT			6
+
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_MASK		0x00000001
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__WLT_MASK				0x00000002
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_BUF_FULL_MASK	0x00000004
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__REG_TIMESTAMP_MASK		0x00000008
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__CMD_TIMESTAMP_MASK		0x00000010
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__HOST_CMD_OVERFLOW_MASK		0x00000020
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__HOST_REG_OVERFLOW_MASK		0x00000040
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__IMMED_OVERFLOW_MASK		0x00000080
+#define SQ_INTERRUPT_WORD_AUTO_CTXID0__THREAD_TRACE_UTC_ERROR_MASK	0x00000100
+#define SQ_INTERRUPT_WORD_AUTO_CTXID1__ENCODING_MASK			0x000000c0
+
+/* SQ_INTERRUPT_WORD_WAVE_CTXID */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__DATA__SHIFT	0
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__SH_ID__SHIFT	25
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__PRIV__SHIFT	26
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__WAVE_ID__SHIFT	27
+#define SQ_INTERRUPT_WORD_WAVE_CTXID1__SIMD_ID__SHIFT	0
+#define SQ_INTERRUPT_WORD_WAVE_CTXID1__WGP_ID__SHIFT	2
+#define SQ_INTERRUPT_WORD_WAVE_CTXID1__ENCODING__SHIFT	6
+
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__DATA_MASK	0x00ffffff /* [23:0] */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__SH_ID_MASK	0x02000000 /* [25] */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__PRIV_MASK	0x04000000 /* [26] */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID0__WAVE_ID_MASK	0xf8000000 /* [31:27] */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID1__SIMD_ID_MASK	0x00000003 /* [33:32] */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID1__WGP_ID_MASK	0x0000003c /* [37:34] */
+#define SQ_INTERRUPT_WORD_WAVE_CTXID1__ENCODING_MASK	0x000000c0 /* [39:38] */
+
+/* SQ_INTERRUPT_WORD_ERROR_CTXID */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__DETAIL__SHIFT	0
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__TYPE__SHIFT	21
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__SH_ID__SHIFT	25
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__PRIV__SHIFT	26
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__WAVE_ID__SHIFT	27
+#define SQ_INTERRUPT_WORD_ERROR_CTXID1__SIMD_ID__SHIFT	0
+#define SQ_INTERRUPT_WORD_ERROR_CTXID1__WGP_ID__SHIFT	2
+#define SQ_INTERRUPT_WORD_ERROR_CTXID1__ENCODING__SHIFT	6
+
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__DETAIL_MASK	0x001fffff /* [20:0] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__TYPE_MASK	0x01e00000 /* [24:21] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__SH_ID_MASK	0x02000000 /* [25] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__PRIV_MASK	0x04000000 /* [26] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID0__WAVE_ID_MASK	0xf8000000 /* [31:27] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID1__SIMD_ID_MASK	0x00000003 /* [33:32] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID1__WGP_ID_MASK	0x0000003c /* [37:34] */
+#define SQ_INTERRUPT_WORD_ERROR_CTXID1__ENCODING_MASK	0x000000c0 /* [39:38] */
+
+/*
+ * The debugger will send user data(m0) with PRIV=1 to indicate it requires
+ * notification from the KFD with the following queue id (DOORBELL_ID) and
+ * trap code (TRAP_CODE).
+ */
+#define KFD_CTXID0_TRAP_CODE_SHIFT	10
+#define KFD_CTXID0_TRAP_CODE_MASK	0xfffc00
+#define KFD_CTXID0_CP_BAD_OP_ECODE_MASK	0x3ffffff
+#define KFD_CTXID0_DOORBELL_ID_MASK	0x0003ff
+
+#define KFD_CTXID0_TRAP_CODE(ctxid0)		(((ctxid0) &  \
+				KFD_CTXID0_TRAP_CODE_MASK) >> \
+				KFD_CTXID0_TRAP_CODE_SHIFT)
+#define KFD_CTXID0_CP_BAD_OP_ECODE(ctxid0)	(((ctxid0) &        \
+				KFD_CTXID0_CP_BAD_OP_ECODE_MASK) >> \
+				KFD_CTXID0_TRAP_CODE_SHIFT)
+#define KFD_CTXID0_DOORBELL_ID(ctxid0)		((ctxid0) & \
+				KFD_CTXID0_DOORBELL_ID_MASK)
+
+static void print_sq_intr_info_auto(uint32_t context_id0, uint32_t context_id1)
+{
+	pr_debug(
+		"sq_intr: auto, ttrace %d, wlt %d, ttrace_buf_full %d, reg_tms %d, cmd_tms %d, host_cmd_ovf %d, host_reg_ovf %d, immed_ovf %d, ttrace_utc_err %d\n",
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, THREAD_TRACE),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, WLT),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, THREAD_TRACE_BUF_FULL),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, REG_TIMESTAMP),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, CMD_TIMESTAMP),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, HOST_CMD_OVERFLOW),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, HOST_REG_OVERFLOW),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, IMMED_OVERFLOW),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_AUTO_CTXID0, THREAD_TRACE_UTC_ERROR));
+}
+
+static void print_sq_intr_info_inst(uint32_t context_id0, uint32_t context_id1)
+{
+	pr_debug(
+		"sq_intr: inst, data 0x%08x, sh %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0, DATA),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0, SH_ID),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_WAVE_CTXID0, WAVE_ID),
+		REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1, SIMD_ID),
+		REG_GET_FIELD(context_id1, SQ_INTERRUPT_WORD_WAVE_CTXID1, WGP_ID));
+}
+
+static void print_sq_intr_info_error(uint32_t context_id0, uint32_t context_id1)
+{
+	pr_warn(
+		"sq_intr: error, detail 0x%08x, type %d, sh %d, priv %d, wave_id %d, simd_id %d, wgp_id %d\n",
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, DETAIL),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, TYPE),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, SH_ID),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, PRIV),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID0, WAVE_ID),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID1, SIMD_ID),
+		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID1, WGP_ID));
+}
+
+static void event_interrupt_poison_consumption_v11(struct kfd_dev *dev,
+				uint16_t pasid, uint16_t source_id)
+{
+	int ret = -EINVAL;
+	struct kfd_process *p = kfd_lookup_process_by_pasid(pasid);
+
+	if (!p)
+		return;
+
+	/* all queues of a process will be unmapped in one time */
+	if (atomic_read(&p->poison)) {
+		kfd_unref_process(p);
+		return;
+	}
+
+	atomic_set(&p->poison, 1);
+	kfd_unref_process(p);
+
+	switch (source_id) {
+	case SOC15_INTSRC_SQ_INTERRUPT_MSG:
+		if (dev->dqm->ops.reset_queues)
+			ret = dev->dqm->ops.reset_queues(dev->dqm, pasid);
+		break;
+	case SOC21_INTSRC_SDMA_ECC:
+	default:
+		break;
+	}
+
+	kfd_signal_poison_consumed_event(dev, pasid);
+
+	/* resetting queue passes, do page retirement without gpu reset
+	   resetting queue fails, fallback to gpu reset solution */
+	if (!ret)
+		amdgpu_amdkfd_ras_poison_consumption_handler(dev->adev, false);
+	else
+		amdgpu_amdkfd_ras_poison_consumption_handler(dev->adev, true);
+}
+
+static bool event_interrupt_isr_v11(struct kfd_dev *dev,
+					const uint32_t *ih_ring_entry,
+					uint32_t *patched_ihre,
+					bool *patched_flag)
+{
+	uint16_t source_id, client_id, pasid, vmid;
+	const uint32_t *data = ih_ring_entry;
+	uint32_t context_id0;
+
+	source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
+	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
+	/* Only handle interrupts from KFD VMIDs */
+	vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
+	if (/*!KFD_IRQ_IS_FENCE(client_id, source_id) &&*/
+	    (vmid < dev->vm_info.first_vmid_kfd ||
+	    vmid > dev->vm_info.last_vmid_kfd))
+		return 0;
+
+	pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
+	context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
+
+	if ((source_id == SOC15_INTSRC_CP_END_OF_PIPE) &&
+	    (context_id0 & AMDGPU_FENCE_MES_QUEUE_FLAG))
+		return 0;
+
+	pr_debug("client id 0x%x, source id %d, vmid %d, pasid 0x%x. raw data:\n",
+		 client_id, source_id, vmid, pasid);
+	pr_debug("%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X.\n",
+		 data[0], data[1], data[2], data[3],
+		 data[4], data[5], data[6], data[7]);
+
+	/* If there is no valid PASID, it's likely a bug */
+	if (WARN_ONCE(pasid == 0, "Bug: No PASID in KFD interrupt"))
+		return 0;
+
+	/* Interrupt types we care about: various signals and faults.
+	 * They will be forwarded to a work queue (see below).
+	 */
+	return source_id == SOC15_INTSRC_CP_END_OF_PIPE ||
+		source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG ||
+		source_id == SOC15_INTSRC_CP_BAD_OPCODE ||
+		source_id == SOC21_INTSRC_SDMA_TRAP ||
+		client_id == SOC21_IH_CLIENTID_VMC ||
+		((client_id == SOC21_IH_CLIENTID_GFX) &&
+		 (source_id == UTCL2_1_0__SRCID__FAULT)) /*||
+		   KFD_IRQ_IS_FENCE(client_id, source_id)*/;
+}
+
+static void event_interrupt_wq_v11(struct kfd_dev *dev,
+					const uint32_t *ih_ring_entry)
+{
+	uint16_t source_id, client_id, ring_id, pasid, vmid;
+	uint32_t context_id0, context_id1;
+	uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
+	struct kfd_vm_fault_info info = {0};
+	struct kfd_hsa_memory_exception_data exception_data;
+
+	source_id = SOC15_SOURCE_ID_FROM_IH_ENTRY(ih_ring_entry);
+	client_id = SOC15_CLIENT_ID_FROM_IH_ENTRY(ih_ring_entry);
+	ring_id = SOC15_RING_ID_FROM_IH_ENTRY(ih_ring_entry);
+	pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
+	vmid = SOC15_VMID_FROM_IH_ENTRY(ih_ring_entry);
+	context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
+	context_id1 = SOC15_CONTEXT_ID1_FROM_IH_ENTRY(ih_ring_entry);
+
+	/* VMC, UTCL2 */
+	if (client_id == SOC21_IH_CLIENTID_VMC ||
+	     ((client_id == SOC21_IH_CLIENTID_GFX) &&
+	     (source_id == UTCL2_1_0__SRCID__FAULT))) {
+
+		info.vmid = vmid;
+		info.mc_id = client_id;
+		info.page_addr = ih_ring_entry[4] |
+			(uint64_t)(ih_ring_entry[5] & 0xf) << 32;
+		info.prot_valid = ring_id & 0x08;
+		info.prot_read  = ring_id & 0x10;
+		info.prot_write = ring_id & 0x20;
+
+		memset(&exception_data, 0, sizeof(exception_data));
+		exception_data.gpu_id = dev->id;
+		exception_data.va = (info.page_addr) << PAGE_SHIFT;
+		exception_data.failure.NotPresent = info.prot_valid ? 1 : 0;
+		exception_data.failure.NoExecute = info.prot_exec ? 1 : 0;
+		exception_data.failure.ReadOnly = info.prot_write ? 1 : 0;
+		exception_data.failure.imprecise = 0;
+
+		/*kfd_set_dbg_ev_from_interrupt(dev, pasid, -1,
+					      KFD_EC_MASK(EC_DEVICE_MEMORY_VIOLATION),
+					      &exception_data, sizeof(exception_data));*/
+		kfd_smi_event_update_vmfault(dev, pasid);
+
+	/* GRBM, SDMA, SE, PMM */
+	} else if (client_id == SOC21_IH_CLIENTID_GRBM_CP ||
+		   client_id == SOC21_IH_CLIENTID_GFX) {
+
+		/* CP */
+		if (source_id == SOC15_INTSRC_CP_END_OF_PIPE)
+			kfd_signal_event_interrupt(pasid, context_id0, 32);
+		/*else if (source_id == SOC15_INTSRC_CP_BAD_OPCODE)
+			kfd_set_dbg_ev_from_interrupt(dev, pasid,
+				KFD_CTXID0_DOORBELL_ID(context_id0),
+				KFD_EC_MASK(KFD_CTXID0_CP_BAD_OP_ECODE(context_id0)),
+				NULL, 0);*/
+
+		/* SDMA */
+		else if (source_id == SOC21_INTSRC_SDMA_TRAP)
+			kfd_signal_event_interrupt(pasid, context_id0 & 0xfffffff, 28);
+		else if (source_id == SOC21_INTSRC_SDMA_ECC) {
+			event_interrupt_poison_consumption_v11(dev, pasid, source_id);
+			return;
+		}
+
+		/* SQ */
+		else if (source_id == SOC15_INTSRC_SQ_INTERRUPT_MSG) {
+			sq_int_enc = REG_GET_FIELD(context_id1,
+					SQ_INTERRUPT_WORD_WAVE_CTXID1, ENCODING);
+			switch (sq_int_enc) {
+			case SQ_INTERRUPT_WORD_ENCODING_AUTO:
+				print_sq_intr_info_auto(context_id0, context_id1);
+				break;
+			case SQ_INTERRUPT_WORD_ENCODING_INST:
+				print_sq_intr_info_inst(context_id0, context_id1);
+				sq_int_priv = REG_GET_FIELD(context_id0,
+						SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV);
+				if (sq_int_priv /*&& (kfd_set_dbg_ev_from_interrupt(dev, pasid,
+						KFD_CTXID0_DOORBELL_ID(context_id0),
+						KFD_CTXID0_TRAP_CODE(context_id0),
+						NULL, 0))*/)
+					return;
+				break;
+			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
+				print_sq_intr_info_error(context_id0, context_id1);
+				sq_int_errtype = REG_GET_FIELD(context_id0,
+						SQ_INTERRUPT_WORD_ERROR_CTXID0, TYPE);
+				if (sq_int_errtype != SQ_INTERRUPT_ERROR_TYPE_ILLEGAL_INST &&
+				    sq_int_errtype != SQ_INTERRUPT_ERROR_TYPE_MEMVIOL) {
+					event_interrupt_poison_consumption_v11(
+							dev, pasid, source_id);
+					return;
+				}
+				break;
+			default:
+				break;
+			}
+			kfd_signal_event_interrupt(pasid, context_id0 & 0xffffff, 24);
+		}
+
+	/*} else if (KFD_IRQ_IS_FENCE(client_id, source_id)) {
+		kfd_process_close_interrupt_drain(pasid);*/
+	}
+}
+
+const struct kfd_event_interrupt_class event_interrupt_class_v11 = {
+	.interrupt_isr = event_interrupt_isr_v11,
+	.interrupt_wq = event_interrupt_wq_v11,
+};
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index f27fe022ef6f..0b75a37b689b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -90,7 +90,7 @@ enum SQ_INTERRUPT_ERROR_TYPE {
 #define KFD_SQ_INT_DATA__ERR_TYPE_MASK 0xF00000
 #define KFD_SQ_INT_DATA__ERR_TYPE__SHIFT 20
 
-static void event_interrupt_poison_consumption(struct kfd_dev *dev,
+static void event_interrupt_poison_consumption_v9(struct kfd_dev *dev,
 				uint16_t pasid, uint16_t client_id)
 {
 	int old_poison, ret = -EINVAL;
@@ -316,7 +316,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
 					sq_intr_err);
 				if (sq_intr_err != SQ_INTERRUPT_ERROR_TYPE_ILLEGAL_INST &&
 					sq_intr_err != SQ_INTERRUPT_ERROR_TYPE_MEMVIOL) {
-					event_interrupt_poison_consumption(dev, pasid, client_id);
+					event_interrupt_poison_consumption_v9(dev, pasid, client_id);
 					return;
 				}
 				break;
@@ -337,7 +337,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
 		if (source_id == SOC15_INTSRC_SDMA_TRAP) {
 			kfd_signal_event_interrupt(pasid, context_id0 & 0xfffffff, 28);
 		} else if (source_id == SOC15_INTSRC_SDMA_ECC) {
-			event_interrupt_poison_consumption(dev, pasid, client_id);
+			event_interrupt_poison_consumption_v9(dev, pasid, client_id);
 			return;
 		}
 	} else if (client_id == SOC15_IH_CLIENTID_VMC ||
@@ -348,7 +348,7 @@ static void event_interrupt_wq_v9(struct kfd_dev *dev,
 
 		if (client_id == SOC15_IH_CLIENTID_UTCL2 &&
 		    amdgpu_amdkfd_ras_query_utcl2_poison_status(dev->adev)) {
-			event_interrupt_poison_consumption(dev, pasid, client_id);
+			event_interrupt_poison_consumption_v9(dev, pasid, client_id);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 5ac209209613..49a283be6b57 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -100,7 +100,7 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 {
 	struct kfd_cu_info cu_info;
 	uint32_t cu_per_sh[KFD_MAX_NUM_SE][KFD_MAX_NUM_SH_PER_SE] = {0};
-	int i, se, sh, cu;
+	int i, se, sh, cu, cu_bitmap_sh_mul;
 
 	amdgpu_amdkfd_get_cu_info(mm->dev->adev, &cu_info);
 
@@ -120,6 +120,10 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 			cu_info.num_shader_arrays_per_engine * cu_info.num_shader_engines);
 		return;
 	}
+
+	cu_bitmap_sh_mul = (KFD_GC_VERSION(mm->dev) >= IP_VERSION(11, 0, 0) &&
+			    KFD_GC_VERSION(mm->dev) < IP_VERSION(12, 0, 0)) ? 2 : 1;
+
 	/* Count active CUs per SH.
 	 *
 	 * Some CUs in an SH may be disabled.	HW expects disabled CUs to be
@@ -129,10 +133,12 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 	 * Each half of se_mask must be filled only on bits 0-cu_per_sh[se][sh]-1.
 	 *
 	 * See note on Arcturus cu_bitmap layout in gfx_v9_0_get_cu_info.
+	 * See note on GFX11 cu_bitmap layout in gfx_v11_0_get_cu_info.
 	 */
 	for (se = 0; se < cu_info.num_shader_engines; se++)
 		for (sh = 0; sh < cu_info.num_shader_arrays_per_engine; sh++)
-			cu_per_sh[se][sh] = hweight32(cu_info.cu_bitmap[se % 4][sh + (se / 4)]);
+			cu_per_sh[se][sh] = hweight32(
+				cu_info.cu_bitmap[se % 4][sh + (se / 4) * cu_bitmap_sh_mul]);
 
 	/* Symmetrically map cu_mask to all SEs & SHs:
 	 * se_mask programs up to 2 SH in the upper and lower 16 bits.
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
new file mode 100644
index 000000000000..4e0387f591be
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -0,0 +1,508 @@
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
+
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include "kfd_priv.h"
+#include "kfd_mqd_manager.h"
+#include "v11_structs.h"
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
+#include "amdgpu_amdkfd.h"
+
+static inline struct v11_compute_mqd *get_mqd(void *mqd)
+{
+	return (struct v11_compute_mqd *)mqd;
+}
+
+static inline struct v11_sdma_mqd *get_sdma_mqd(void *mqd)
+{
+	return (struct v11_sdma_mqd *)mqd;
+}
+
+static void update_cu_mask(struct mqd_manager *mm, void *mqd,
+			   struct mqd_update_info *minfo)
+{
+	struct v11_compute_mqd *m;
+	uint32_t se_mask[KFD_MAX_NUM_SE] = {0};
+
+	if (!minfo || (minfo->update_flag != UPDATE_FLAG_CU_MASK) ||
+	    !minfo->cu_mask.ptr)
+		return;
+
+	mqd_symmetrically_map_cu_mask(mm,
+		minfo->cu_mask.ptr, minfo->cu_mask.count, se_mask);
+
+	m = get_mqd(mqd);
+	m->compute_static_thread_mgmt_se0 = se_mask[0];
+	m->compute_static_thread_mgmt_se1 = se_mask[1];
+	m->compute_static_thread_mgmt_se2 = se_mask[2];
+	m->compute_static_thread_mgmt_se3 = se_mask[3];
+	m->compute_static_thread_mgmt_se4 = se_mask[4];
+	m->compute_static_thread_mgmt_se5 = se_mask[5];
+	m->compute_static_thread_mgmt_se6 = se_mask[6];
+	m->compute_static_thread_mgmt_se7 = se_mask[7];
+
+	pr_debug("update cu mask to %#x %#x %#x %#x %#x %#x %#x %#x\n",
+		m->compute_static_thread_mgmt_se0,
+		m->compute_static_thread_mgmt_se1,
+		m->compute_static_thread_mgmt_se2,
+		m->compute_static_thread_mgmt_se3,
+		m->compute_static_thread_mgmt_se4,
+		m->compute_static_thread_mgmt_se5,
+		m->compute_static_thread_mgmt_se6,
+		m->compute_static_thread_mgmt_se7);
+}
+
+static void set_priority(struct v11_compute_mqd *m, struct queue_properties *q)
+{
+	m->cp_hqd_pipe_priority = pipe_priority_map[q->priority];
+	m->cp_hqd_queue_priority = q->priority;
+}
+
+static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
+		struct queue_properties *q)
+{
+	struct kfd_mem_obj *mqd_mem_obj;
+	int size;
+
+	/*
+	 * MES write to areas beyond MQD size. So allocate
+	 * 1 PAGE_SIZE memory for MQD is MES is enabled.
+	 */
+	if (kfd->shared_resources.enable_mes)
+		size = PAGE_SIZE;
+	else
+		size = sizeof(struct v11_compute_mqd);
+
+	if (kfd_gtt_sa_allocate(kfd, size, &mqd_mem_obj))
+		return NULL;
+
+	return mqd_mem_obj;
+}
+
+static void init_mqd(struct mqd_manager *mm, void **mqd,
+			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			struct queue_properties *q)
+{
+	uint64_t addr;
+	struct v11_compute_mqd *m;
+	int size;
+
+	m = (struct v11_compute_mqd *) mqd_mem_obj->cpu_ptr;
+	addr = mqd_mem_obj->gpu_addr;
+
+	if (mm->dev->shared_resources.enable_mes)
+		size = PAGE_SIZE;
+	else
+		size = sizeof(struct v11_compute_mqd);
+
+	memset(m, 0, size);
+
+	m->header = 0xC0310800;
+	m->compute_pipelinestat_enable = 1;
+	m->compute_static_thread_mgmt_se0 = 0xFFFFFFFF;
+	m->compute_static_thread_mgmt_se1 = 0xFFFFFFFF;
+	m->compute_static_thread_mgmt_se2 = 0xFFFFFFFF;
+	m->compute_static_thread_mgmt_se3 = 0xFFFFFFFF;
+
+	m->cp_hqd_persistent_state = CP_HQD_PERSISTENT_STATE__PRELOAD_REQ_MASK |
+			0x55 << CP_HQD_PERSISTENT_STATE__PRELOAD_SIZE__SHIFT;
+
+	m->cp_mqd_control = 1 << CP_MQD_CONTROL__PRIV_STATE__SHIFT;
+
+	m->cp_mqd_base_addr_lo        = lower_32_bits(addr);
+	m->cp_mqd_base_addr_hi        = upper_32_bits(addr);
+
+	m->cp_hqd_quantum = 1 << CP_HQD_QUANTUM__QUANTUM_EN__SHIFT |
+			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
+			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
+
+	if (q->format == KFD_QUEUE_FORMAT_AQL) {
+		m->cp_hqd_aql_control =
+			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
+	}
+
+	if (mm->dev->cwsr_enabled) {
+		m->cp_hqd_persistent_state |=
+			(1 << CP_HQD_PERSISTENT_STATE__QSWITCH_MODE__SHIFT);
+		m->cp_hqd_ctx_save_base_addr_lo =
+			lower_32_bits(q->ctx_save_restore_area_address);
+		m->cp_hqd_ctx_save_base_addr_hi =
+			upper_32_bits(q->ctx_save_restore_area_address);
+		m->cp_hqd_ctx_save_size = q->ctx_save_restore_area_size;
+		m->cp_hqd_cntl_stack_size = q->ctl_stack_size;
+		m->cp_hqd_cntl_stack_offset = q->ctl_stack_size;
+		m->cp_hqd_wg_state_offset = q->ctl_stack_size;
+	}
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = addr;
+	mm->update_mqd(mm, m, q, NULL);
+}
+
+static int load_mqd(struct mqd_manager *mm, void *mqd,
+			uint32_t pipe_id, uint32_t queue_id,
+			struct queue_properties *p, struct mm_struct *mms)
+{
+	int r = 0;
+	/* AQL write pointer counts in 64B packets, PM4/CP counts in dwords. */
+	uint32_t wptr_shift = (p->format == KFD_QUEUE_FORMAT_AQL ? 4 : 0);
+
+	r = mm->dev->kfd2kgd->hqd_load(mm->dev->adev, mqd, pipe_id, queue_id,
+					  (uint32_t __user *)p->write_ptr,
+					  wptr_shift, 0, mms);
+	return r;
+}
+
+static int hiq_load_mqd_kiq(struct mqd_manager *mm, void *mqd,
+			    uint32_t pipe_id, uint32_t queue_id,
+			    struct queue_properties *p, struct mm_struct *mms)
+{
+	return mm->dev->kfd2kgd->hiq_mqd_load(mm->dev->adev, mqd, pipe_id,
+					      queue_id, p->doorbell_off);
+}
+
+static void update_mqd(struct mqd_manager *mm, void *mqd,
+		       struct queue_properties *q,
+		       struct mqd_update_info *minfo)
+{
+	struct v11_compute_mqd *m;
+
+	m = get_mqd(mqd);
+
+	m->cp_hqd_pq_control = 5 << CP_HQD_PQ_CONTROL__RPTR_BLOCK_SIZE__SHIFT;
+	m->cp_hqd_pq_control |=
+			ffs(q->queue_size / sizeof(unsigned int)) - 1 - 1;
+	pr_debug("cp_hqd_pq_control 0x%x\n", m->cp_hqd_pq_control);
+
+	m->cp_hqd_pq_base_lo = lower_32_bits((uint64_t)q->queue_address >> 8);
+	m->cp_hqd_pq_base_hi = upper_32_bits((uint64_t)q->queue_address >> 8);
+
+	m->cp_hqd_pq_rptr_report_addr_lo = lower_32_bits((uint64_t)q->read_ptr);
+	m->cp_hqd_pq_rptr_report_addr_hi = upper_32_bits((uint64_t)q->read_ptr);
+	m->cp_hqd_pq_wptr_poll_addr_lo = lower_32_bits((uint64_t)q->write_ptr);
+	m->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits((uint64_t)q->write_ptr);
+
+	m->cp_hqd_pq_doorbell_control =
+		q->doorbell_off <<
+			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_OFFSET__SHIFT;
+	pr_debug("cp_hqd_pq_doorbell_control 0x%x\n",
+			m->cp_hqd_pq_doorbell_control);
+
+	m->cp_hqd_ib_control = 3 << CP_HQD_IB_CONTROL__MIN_IB_AVAIL_SIZE__SHIFT;
+
+	/*
+	 * HW does not clamp this field correctly. Maximum EOP queue size
+	 * is constrained by per-SE EOP done signal count, which is 8-bit.
+	 * Limit is 0xFF EOP entries (= 0x7F8 dwords). CP will not submit
+	 * more than (EOP entry count - 1) so a queue size of 0x800 dwords
+	 * is safe, giving a maximum field value of 0xA.
+	 */
+	m->cp_hqd_eop_control = min(0xA,
+		ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 - 1);
+	m->cp_hqd_eop_base_addr_lo =
+			lower_32_bits(q->eop_ring_buffer_address >> 8);
+	m->cp_hqd_eop_base_addr_hi =
+			upper_32_bits(q->eop_ring_buffer_address >> 8);
+
+	m->cp_hqd_iq_timer = 0;
+
+	m->cp_hqd_vmid = q->vmid;
+
+	if (q->format == KFD_QUEUE_FORMAT_AQL) {
+		/* GC 10 removed WPP_CLAMP from PQ Control */
+		m->cp_hqd_pq_control |= CP_HQD_PQ_CONTROL__NO_UPDATE_RPTR_MASK |
+				2 << CP_HQD_PQ_CONTROL__SLOT_BASED_WPTR__SHIFT |
+				1 << CP_HQD_PQ_CONTROL__QUEUE_FULL_EN__SHIFT ;
+		m->cp_hqd_pq_doorbell_control |=
+			1 << CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_BIF_DROP__SHIFT;
+	}
+	if (mm->dev->cwsr_enabled)
+		m->cp_hqd_ctx_save_control = 0;
+
+	update_cu_mask(mm, mqd, minfo);
+	set_priority(m, q);
+
+	q->is_active = QUEUE_IS_ACTIVE(*q);
+}
+
+static uint32_t read_doorbell_id(void *mqd)
+{
+	struct v11_compute_mqd *m = (struct v11_compute_mqd *)mqd;
+
+	return m->queue_doorbell_id0;
+}
+
+static int destroy_mqd(struct mqd_manager *mm, void *mqd,
+		       enum kfd_preempt_type type,
+		       unsigned int timeout, uint32_t pipe_id,
+		       uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_destroy
+		(mm->dev->adev, mqd, type, timeout,
+		 pipe_id, queue_id);
+}
+
+static void free_mqd(struct mqd_manager *mm, void *mqd,
+			struct kfd_mem_obj *mqd_mem_obj)
+{
+	kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
+}
+
+static bool is_occupied(struct mqd_manager *mm, void *mqd,
+			uint64_t queue_address,	uint32_t pipe_id,
+			uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_is_occupied(
+		mm->dev->adev, queue_address,
+		pipe_id, queue_id);
+}
+
+static int get_wave_state(struct mqd_manager *mm, void *mqd,
+			  void __user *ctl_stack,
+			  u32 *ctl_stack_used_size,
+			  u32 *save_area_used_size)
+{
+	struct v11_compute_mqd *m;
+	/*struct mqd_user_context_save_area_header header;*/
+
+	m = get_mqd(mqd);
+
+	/* Control stack is written backwards, while workgroup context data
+	 * is written forwards. Both starts from m->cp_hqd_cntl_stack_size.
+	 * Current position is at m->cp_hqd_cntl_stack_offset and
+	 * m->cp_hqd_wg_state_offset, respectively.
+	 */
+	*ctl_stack_used_size = m->cp_hqd_cntl_stack_size -
+		m->cp_hqd_cntl_stack_offset;
+	*save_area_used_size = m->cp_hqd_wg_state_offset -
+		m->cp_hqd_cntl_stack_size;
+
+	/* Control stack is not copied to user mode for GFXv11 because
+	 * it's part of the context save area that is already
+	 * accessible to user mode
+	 */
+/*
+	header.control_stack_size = *ctl_stack_used_size;
+	header.wave_state_size = *save_area_used_size;
+
+	header.wave_state_offset = m->cp_hqd_wg_state_offset;
+	header.control_stack_offset = m->cp_hqd_cntl_stack_offset;
+
+	if (copy_to_user(ctl_stack, &header, sizeof(header)))
+		return -EFAULT;
+*/
+	return 0;
+}
+
+static void init_mqd_hiq(struct mqd_manager *mm, void **mqd,
+			struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+			struct queue_properties *q)
+{
+	struct v11_compute_mqd *m;
+
+	init_mqd(mm, mqd, mqd_mem_obj, gart_addr, q);
+
+	m = get_mqd(*mqd);
+
+	m->cp_hqd_pq_control |= 1 << CP_HQD_PQ_CONTROL__PRIV_STATE__SHIFT |
+			1 << CP_HQD_PQ_CONTROL__KMD_QUEUE__SHIFT;
+}
+
+static void init_mqd_sdma(struct mqd_manager *mm, void **mqd,
+		struct kfd_mem_obj *mqd_mem_obj, uint64_t *gart_addr,
+		struct queue_properties *q)
+{
+	struct v11_sdma_mqd *m;
+
+	m = (struct v11_sdma_mqd *) mqd_mem_obj->cpu_ptr;
+
+	memset(m, 0, sizeof(struct v11_sdma_mqd));
+
+	*mqd = m;
+	if (gart_addr)
+		*gart_addr = mqd_mem_obj->gpu_addr;
+
+	mm->update_mqd(mm, m, q, NULL);
+}
+
+static int load_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		uint32_t pipe_id, uint32_t queue_id,
+		struct queue_properties *p, struct mm_struct *mms)
+{
+	return mm->dev->kfd2kgd->hqd_sdma_load(mm->dev->adev, mqd,
+					       (uint32_t __user *)p->write_ptr,
+					       mms);
+}
+
+#define SDMA_RLC_DUMMY_DEFAULT 0xf
+
+static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		struct queue_properties *q,
+		struct mqd_update_info *minfo)
+{
+	struct v11_sdma_mqd *m;
+
+	m = get_sdma_mqd(mqd);
+	m->sdmax_rlcx_rb_cntl = (ffs(q->queue_size / sizeof(unsigned int)) - 1)
+		<< SDMA0_QUEUE0_RB_CNTL__RB_SIZE__SHIFT |
+		q->vmid << SDMA0_QUEUE0_RB_CNTL__RB_VMID__SHIFT |
+		1 << SDMA0_QUEUE0_RB_CNTL__RPTR_WRITEBACK_ENABLE__SHIFT |
+		6 << SDMA0_QUEUE0_RB_CNTL__RPTR_WRITEBACK_TIMER__SHIFT;
+
+	m->sdmax_rlcx_rb_base = lower_32_bits(q->queue_address >> 8);
+	m->sdmax_rlcx_rb_base_hi = upper_32_bits(q->queue_address >> 8);
+	m->sdmax_rlcx_rb_rptr_addr_lo = lower_32_bits((uint64_t)q->read_ptr);
+	m->sdmax_rlcx_rb_rptr_addr_hi = upper_32_bits((uint64_t)q->read_ptr);
+	m->sdmax_rlcx_doorbell_offset =
+		q->doorbell_off << SDMA0_QUEUE0_DOORBELL_OFFSET__OFFSET__SHIFT;
+
+	m->sdma_engine_id = q->sdma_engine_id;
+	m->sdma_queue_id = q->sdma_queue_id;
+	m->sdmax_rlcx_dummy_reg = SDMA_RLC_DUMMY_DEFAULT;
+
+	q->is_active = QUEUE_IS_ACTIVE(*q);
+}
+
+/*
+ *  * preempt type here is ignored because there is only one way
+ *  * to preempt sdma queue
+ */
+static int destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		enum kfd_preempt_type type,
+		unsigned int timeout, uint32_t pipe_id,
+		uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_sdma_destroy(mm->dev->adev, mqd, timeout);
+}
+
+static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
+		uint64_t queue_address, uint32_t pipe_id,
+		uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
+}
+
+#if defined(CONFIG_DEBUG_FS)
+
+static int debugfs_show_mqd(struct seq_file *m, void *data)
+{
+	seq_hex_dump(m, "    ", DUMP_PREFIX_OFFSET, 32, 4,
+		     data, sizeof(struct v11_compute_mqd), false);
+	return 0;
+}
+
+static int debugfs_show_mqd_sdma(struct seq_file *m, void *data)
+{
+	seq_hex_dump(m, "    ", DUMP_PREFIX_OFFSET, 32, 4,
+		     data, sizeof(struct v11_sdma_mqd), false);
+	return 0;
+}
+
+#endif
+
+struct mqd_manager *mqd_manager_init_v11(enum KFD_MQD_TYPE type,
+		struct kfd_dev *dev)
+{
+	struct mqd_manager *mqd;
+
+	if (WARN_ON(type >= KFD_MQD_TYPE_MAX))
+		return NULL;
+
+	mqd = kzalloc(sizeof(*mqd), GFP_KERNEL);
+	if (!mqd)
+		return NULL;
+
+	mqd->dev = dev;
+
+	switch (type) {
+	case KFD_MQD_TYPE_CP:
+		pr_debug("%s@%i\n", __func__, __LINE__);
+		mqd->allocate_mqd = allocate_mqd;
+		mqd->init_mqd = init_mqd;
+		mqd->free_mqd = free_mqd;
+		mqd->load_mqd = load_mqd;
+		mqd->update_mqd = update_mqd;
+		mqd->destroy_mqd = destroy_mqd;
+		mqd->is_occupied = is_occupied;
+		mqd->mqd_size = sizeof(struct v11_compute_mqd);
+		mqd->get_wave_state = get_wave_state;
+#if defined(CONFIG_DEBUG_FS)
+		mqd->debugfs_show_mqd = debugfs_show_mqd;
+#endif
+		pr_debug("%s@%i\n", __func__, __LINE__);
+		break;
+	case KFD_MQD_TYPE_HIQ:
+		pr_debug("%s@%i\n", __func__, __LINE__);
+		mqd->allocate_mqd = allocate_hiq_mqd;
+		mqd->init_mqd = init_mqd_hiq;
+		mqd->free_mqd = free_mqd_hiq_sdma;
+		mqd->load_mqd = hiq_load_mqd_kiq;
+		mqd->update_mqd = update_mqd;
+		mqd->destroy_mqd = destroy_mqd;
+		mqd->is_occupied = is_occupied;
+		mqd->mqd_size = sizeof(struct v11_compute_mqd);
+#if defined(CONFIG_DEBUG_FS)
+		mqd->debugfs_show_mqd = debugfs_show_mqd;
+#endif
+		mqd->read_doorbell_id = read_doorbell_id;
+		pr_debug("%s@%i\n", __func__, __LINE__);
+		break;
+	case KFD_MQD_TYPE_DIQ:
+		mqd->allocate_mqd = allocate_mqd;
+		mqd->init_mqd = init_mqd_hiq;
+		mqd->free_mqd = free_mqd;
+		mqd->load_mqd = load_mqd;
+		mqd->update_mqd = update_mqd;
+		mqd->destroy_mqd = destroy_mqd;
+		mqd->is_occupied = is_occupied;
+		mqd->mqd_size = sizeof(struct v11_compute_mqd);
+#if defined(CONFIG_DEBUG_FS)
+		mqd->debugfs_show_mqd = debugfs_show_mqd;
+#endif
+		break;
+	case KFD_MQD_TYPE_SDMA:
+		pr_debug("%s@%i\n", __func__, __LINE__);
+		mqd->allocate_mqd = allocate_sdma_mqd;
+		mqd->init_mqd = init_mqd_sdma;
+		mqd->free_mqd = free_mqd_hiq_sdma;
+		mqd->load_mqd = load_mqd_sdma;
+		mqd->update_mqd = update_mqd_sdma;
+		mqd->destroy_mqd = destroy_mqd_sdma;
+		mqd->is_occupied = is_occupied_sdma;
+		mqd->mqd_size = sizeof(struct v11_sdma_mqd);
+#if defined(CONFIG_DEBUG_FS)
+		mqd->debugfs_show_mqd = debugfs_show_mqd_sdma;
+#endif
+		pr_debug("%s@%i\n", __func__, __LINE__);
+		break;
+	default:
+		kfree(mqd);
+		return NULL;
+	}
+
+	return mqd;
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index b9ca957246dc..91e5fa56f0a2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -228,6 +228,8 @@ struct kfd_device_info {
 	bool needs_pci_atomics;
 	uint32_t no_atomic_fw_version;
 	unsigned int num_sdma_queues_per_engine;
+	unsigned int num_reserved_sdma_queues_per_engine;
+	uint64_t reserved_sdma_queues_bitmap;
 };
 
 unsigned int kfd_get_num_sdma_engines(struct kfd_dev *kdev);
@@ -564,6 +566,10 @@ struct queue {
 
 	/* procfs */
 	struct kobject kobj;
+
+	void *gang_ctx_bo;
+	uint64_t gang_ctx_gpu_addr;
+	void *gang_ctx_cpu_ptr;
 };
 
 enum KFD_MQD_TYPE {
@@ -779,6 +785,10 @@ struct kfd_process_device {
 	 * checkpointed node to refer to this device.
 	 */
 	uint32_t user_gpu_id;
+
+	void *proc_ctx_bo;
+	uint64_t proc_ctx_gpu_addr;
+	void *proc_ctx_cpu_ptr;
 };
 
 #define qpd_to_pdd(x) container_of(x, struct kfd_process_device, qpd)
@@ -1170,6 +1180,8 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		struct kfd_dev *dev);
 struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		struct kfd_dev *dev);
+struct mqd_manager *mqd_manager_init_v11(enum KFD_MQD_TYPE type,
+		struct kfd_dev *dev);
 struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev);
 void device_queue_manager_uninit(struct device_queue_manager *dqm);
 struct kernel_queue *kernel_queue_init(struct kfd_dev *dev,
@@ -1292,6 +1304,7 @@ uint64_t kfd_get_number_elems(struct kfd_dev *kfd);
 /* Events */
 extern const struct kfd_event_interrupt_class event_interrupt_class_cik;
 extern const struct kfd_event_interrupt_class event_interrupt_class_v9;
+extern const struct kfd_event_interrupt_class event_interrupt_class_v11;
 
 extern const struct kfd_device_global_init_class device_global_init_class_cik;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index cb8f4a459add..e3d64ec8c353 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1041,6 +1041,9 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 
 		kfd_free_process_doorbells(pdd->dev, pdd->doorbell_index);
 
+		if (pdd->dev->shared_resources.enable_mes)
+			amdgpu_amdkfd_free_gtt_mem(pdd->dev->adev,
+						   pdd->proc_ctx_bo);
 		/*
 		 * before destroying pdd, make sure to report availability
 		 * for auto suspend
@@ -1484,6 +1487,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p)
 {
 	struct kfd_process_device *pdd = NULL;
+	int retval = 0;
 
 	if (WARN_ON_ONCE(p->n_pdds >= MAX_GPU_INSTANCE))
 		return NULL;
@@ -1516,6 +1520,21 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->sdma_past_activity_counter = 0;
 	pdd->user_gpu_id = dev->id;
 	atomic64_set(&pdd->evict_duration_counter, 0);
+
+	if (dev->shared_resources.enable_mes) {
+		retval = amdgpu_amdkfd_alloc_gtt_mem(dev->adev,
+						AMDGPU_MES_PROC_CTX_SIZE,
+						&pdd->proc_ctx_bo,
+						&pdd->proc_ctx_gpu_addr,
+						&pdd->proc_ctx_cpu_ptr,
+						false);
+		if (retval) {
+			pr_err("failed to allocate process context bo\n");
+			goto err_free_pdd;
+		}
+		memset(pdd->proc_ctx_cpu_ptr, 0, AMDGPU_MES_PROC_CTX_SIZE);
+	}
+
 	p->pdds[p->n_pdds++] = pdd;
 
 	/* Init idr used for memory handle translation */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 4f58e671d39b..dc00484ff484 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -198,8 +198,26 @@ static int init_user_queue(struct process_queue_manager *pqm,
 	(*q)->device = dev;
 	(*q)->process = pqm->process;
 
+	if (dev->shared_resources.enable_mes) {
+		retval = amdgpu_amdkfd_alloc_gtt_mem(dev->adev,
+						AMDGPU_MES_GANG_CTX_SIZE,
+						&(*q)->gang_ctx_bo,
+						&(*q)->gang_ctx_gpu_addr,
+						&(*q)->gang_ctx_cpu_ptr,
+						false);
+		if (retval) {
+			pr_err("failed to allocate gang context bo\n");
+			goto cleanup;
+		}
+		memset((*q)->gang_ctx_cpu_ptr, 0, AMDGPU_MES_GANG_CTX_SIZE);
+	}
+
 	pr_debug("PQM After init queue");
+	return 0;
 
+cleanup:
+	if (dev->shared_resources.enable_mes)
+		uninit_queue(*q);
 	return retval;
 }
 
@@ -418,6 +436,9 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
 			pdd->qpd.num_gws = 0;
 		}
 
+		if (dev->shared_resources.enable_mes)
+			amdgpu_amdkfd_free_gtt_mem(dev->adev,
+						   pqn->q->gang_ctx_bo);
 		uninit_queue(pqn->q);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 05089f1de4e9..2e20f54bb147 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -1412,7 +1412,8 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	dev->node_props.num_sdma_xgmi_engines =
 					kfd_get_num_xgmi_sdma_engines(gpu);
 	dev->node_props.num_sdma_queues_per_engine =
-				gpu->device_info.num_sdma_queues_per_engine;
+				gpu->device_info.num_sdma_queues_per_engine -
+				gpu->device_info.num_reserved_sdma_queues_per_engine;
 	dev->node_props.num_gws = (dev->gpu->gws &&
 		dev->gpu->dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) ?
 		dev->gpu->adev->gds.gws_size : 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/soc15_int.h b/drivers/gpu/drm/amd/amdkfd/soc15_int.h
index daf3c44547d3..e3f3b0b93a59 100644
--- a/drivers/gpu/drm/amd/amdkfd/soc15_int.h
+++ b/drivers/gpu/drm/amd/amdkfd/soc15_int.h
@@ -31,7 +31,8 @@
 #define SOC15_INTSRC_VMC_FAULT		0
 #define SOC15_INTSRC_SDMA_TRAP		224
 #define SOC15_INTSRC_SDMA_ECC		220
-
+#define SOC21_INTSRC_SDMA_TRAP		49
+#define SOC21_INTSRC_SDMA_ECC		62
 
 #define SOC15_CLIENT_ID_FROM_IH_ENTRY(entry) (le32_to_cpu(entry[0]) & 0xff)
 #define SOC15_SOURCE_ID_FROM_IH_ENTRY(entry) (le32_to_cpu(entry[0]) >> 8 & 0xff)
diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index 2f60cf35a444..e85364dff4e0 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -152,6 +152,7 @@ struct kgd2kfd_shared_resources {
 	/* Minor device number of the render node */
 	int drm_render_minor;
 
+	bool enable_mes;
 };
 
 struct tile_config {
-- 
2.35.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34948B5B55
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2024 16:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCA6112C95;
	Mon, 29 Apr 2024 14:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c7ZS5grW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463110EE8E
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2024 14:34:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gM5G9rOaRptre81AexrT+pBSjfD/SsWf6+VmKTV8DUKLTqRxvXSv1gMx8TNlPwKCSm/dnih/WJnDYn5Rr+noMddNTCFWQF+SNUNVt6CbXvegG5ast8cZMu9mT8OGYNih5J2LykoP3Mr5YWl3Ag//ncQA9u+Hk1ztno0AS64aBU0MKoHXbsT5oQ/VC3sp6g2nr2NkPq3L5qX7EoX+rJEOB/yXKHTpoViQeItVhDu1znvmoYloPq8kIjgjEuLfdpo3yYJ00hudC8lmg3rTy3Vt7OJ5AkvJzamSet7Jp2ZOzbzkcQIYq2u5qSFXp/SglYCAhbdV1Klb0h3WYGlneHFTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmPXpBQ0eT+VPl/Kn+1xBvNHcfubTJ8XGZJ+3xIUf50=;
 b=AMeFVIk8MmoQKDIqebnlaAZ6LzFtK5PTS3/wo8Z0JtwsMzB4gy40Ode2oyjOza4tkKuxC+GMtCNBgFKoWUI+so9Bj7sjg4DPi8ACRw2uNe1AP21MhTVr9J0p25GDqEwrbSMjzs2V24Tu7G2eJ92i0Fd3mNzxNs/tG1m6+8uB3B3wqgq/ytKKdodM7sZZamFlXQMPiXpipHXwYF3MQUnIH6Y4ekJTc0naYS2soPmkN1RIBxBZi2IzOvg4dVGRcJGIXcWwveaA33RtCefOgtNk1k9fNuBEhr8Cf88OL805NClGHj3WhrtwH56WTLKLudJwecIuNqEV402w7kp/+tP9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmPXpBQ0eT+VPl/Kn+1xBvNHcfubTJ8XGZJ+3xIUf50=;
 b=c7ZS5grWF5ZRoUg2B8WrBDQAMubTBdoxVFONtETUkVwUJGWThkkHJ/5ycnrXCaaX66y6imyhJJQYFUOsBNZ8YqFzZP7CrGzsEb/bTz1VniTAyfOrlvdr+vBtC+h0jnZaMzbkLmxu1EE4b/BlwPJrJKJxOswsH3o/qFlivLZ28oU=
Received: from SJ0PR03CA0344.namprd03.prod.outlook.com (2603:10b6:a03:39c::19)
 by CH3PR12MB9393.namprd12.prod.outlook.com (2603:10b6:610:1c5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 14:34:10 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::18) by SJ0PR03CA0344.outlook.office365.com
 (2603:10b6:a03:39c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32 via Frontend
 Transport; Mon, 29 Apr 2024 14:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 29 Apr 2024 14:34:10 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 09:34:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "Alex Deucher" <alexander.deucher@amd.com>
Subject: [PATCH 08/31] drm/amdgpu: Add mes v12_0 ip block support (v4)
Date: Mon, 29 Apr 2024 10:33:16 -0400
Message-ID: <20240429143339.3450256-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429143339.3450256-1-alexander.deucher@amd.com>
References: <20240429143339.3450256-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|CH3PR12MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: d123bb50-f61f-4d2f-b036-08dc68596f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400014|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GKWrDfHFFoMuSXrlI1eDB8gmgNCmrzhqdUBsorFt/tgaNroxU89oLy0UXOST?=
 =?us-ascii?Q?NAA20U/qDhZs6Zx1+RePn+e5t0Cr7/fDP/+gJRbeXRsCbVdBNI2nCa/5k0aC?=
 =?us-ascii?Q?zXosSYwllnWsbvMPg6NqReoMbvo/oAKZUo5tQZqIRDhm7WTKpgyZld5BWlfV?=
 =?us-ascii?Q?qLkSHRTaO6PGjT/QNP5cGHh0vV31nOiR/c/E0lBMWP/eyut8qjiGVRsabpmQ?=
 =?us-ascii?Q?Jb7sCeAOHaXdHYGwZ5+9fqwIAhC/n7sZL+cI1PTeqGj0cbxKs8DUzYMoFkPd?=
 =?us-ascii?Q?N9KCT0N9/us1EJsIqAKcNHWqGWJmberLg7XZAXUu4S9fbTBiOHoiOngUiuIL?=
 =?us-ascii?Q?txynO1GztJbM9iYbp/BHMmVxHJZezCjXmDPbyx8tf+bNCq63NFWNjQqUlCsU?=
 =?us-ascii?Q?cm7qQlFlGtLGdGsUvyvjntjLdpii5pnYzgqcI0iRRTiHJKZqTHdIRiIGLbYM?=
 =?us-ascii?Q?eP5W9b40jzGlNhxuoG8kE3Q0hYbILHzfwd5rMwKTBgqX7G8x7Fe0FeIFHiqA?=
 =?us-ascii?Q?Eo5mztklQvnI3i3B9OcBFuDnQXkJQb+oXnVy8WAIjNgOmnYy/0LdPOqafTlw?=
 =?us-ascii?Q?Q2bEsyUb5YQZR+rjUr2L5J5gx9O0SHj96ZCL4DuF3o4Iob0+e3LTbLeYuWqU?=
 =?us-ascii?Q?jDWBlTQRrTenZ6D2TlZrpvL06Nc/wlwhSpSKFlRXZRgtNtJfBq85iE/wItfi?=
 =?us-ascii?Q?N4lxrkkLAbt3p8YcLtJS9lh7ScN+GulQBLNzgJQftFz/kNUcFoRSOeg6jo8/?=
 =?us-ascii?Q?Je96JOBfSx0Ec+8gErEFlxahm3Lb//VQxrgZ2Ghg972X1zeGLWVNvhc1Fj7y?=
 =?us-ascii?Q?Z4CLECfAAY5t3542iLYpVUH+9Tcps7JDZ1TTyXRuvxK5zh55X3T/IDNkx/C4?=
 =?us-ascii?Q?gRyatqhaiAYpUnK/NXlx1pVSSCf4fcPhnvBtuerK0lMlecsnPAvQ3Nr/k6ri?=
 =?us-ascii?Q?gKzRT0oC2uQIhbrIGPPSRVY1agtDGmAvN+melc66lf/fbEku8TWF3h5AluRM?=
 =?us-ascii?Q?47RkA77i5cOxTdfGLhmTnjnkOktBgn/sADhqN07GO22R5FC0vMgWo0FEvWtl?=
 =?us-ascii?Q?dZT4KHiaSVeFYK8v3OievEJFezFX7jJ3dVmUzr1Xj8yU6tpOC1LLvEZM6nlb?=
 =?us-ascii?Q?Xoh6crRu1oCQztboOSQAvI3HVJ5Y3WzytwcFZ6Rka+hUB/vXoi6GX2j2GC2T?=
 =?us-ascii?Q?AiD7DjyEee12vis3Of/4dT7s78csQ68LNKjv7HDxMw8Acohw4RTyFfvT0FI4?=
 =?us-ascii?Q?j5YOAA85gq8XbltOT0SBDNfzjJFkzcc2qS1P3Irrj7D6C+cPP4+a+I2d5wzI?=
 =?us-ascii?Q?AXuwxMPlpWcMvW7Ol1acVGDEX7lkG18tqQgEpzdOrYUOdrVloML5nO9q3fTH?=
 =?us-ascii?Q?DzEaxV1UXbZtIua+CTQBx4f2SUVU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 14:34:10.6996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d123bb50-f61f-4d2f-b036-08dc68596f49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9393
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

From: Jack Xiao <Jack.Xiao@amd.com>

v1: Add mes v12_0 ip block support. (Jack)
v2: Switch to gfx.kiq array. (Hawking)
v3: Switch to AMDGPU_GFXHUB(0). (Hawking)
v4: Rebase (Alex)

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile    |    3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c | 1306 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v12_0.h |   29 +
 3 files changed, 1337 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v12_0.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index ce460523f28c3..7d03e89f15d00 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -186,7 +186,8 @@ amdgpu-y += \
 amdgpu-y += \
 	amdgpu_mes.o \
 	mes_v10_1.o \
-	mes_v11_0.o
+	mes_v11_0.o \
+	mes_v12_0.o
 
 # add UVD block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
new file mode 100644
index 0000000000000..1bf12fc1f72e5
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.c
@@ -0,0 +1,1306 @@
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
+
+#include <linux/firmware.h>
+#include <linux/module.h>
+#include "amdgpu.h"
+#include "soc15_common.h"
+#include "soc21.h"
+#include "gc/gc_12_0_0_offset.h"
+#include "gc/gc_12_0_0_sh_mask.h"
+#include "gc/gc_11_0_0_default.h"
+#include "v12_structs.h"
+#include "mes_v12_api_def.h"
+
+MODULE_FIRMWARE("amdgpu/gc_12_0_0_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_12_0_0_mes1.bin");
+MODULE_FIRMWARE("amdgpu/gc_12_0_1_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_12_0_1_mes1.bin");
+
+static int mes_v12_0_hw_fini(void *handle);
+static int mes_v12_0_kiq_hw_init(struct amdgpu_device *adev);
+static int mes_v12_0_kiq_hw_fini(struct amdgpu_device *adev);
+
+#define MES_EOP_SIZE   2048
+
+static void mes_v12_0_ring_set_wptr(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+
+	if (ring->use_doorbell) {
+		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
+			     ring->wptr);
+		WDOORBELL64(ring->doorbell_index, ring->wptr);
+	} else {
+		BUG();
+	}
+}
+
+static u64 mes_v12_0_ring_get_rptr(struct amdgpu_ring *ring)
+{
+	return *ring->rptr_cpu_addr;
+}
+
+static u64 mes_v12_0_ring_get_wptr(struct amdgpu_ring *ring)
+{
+	u64 wptr;
+
+	if (ring->use_doorbell)
+		wptr = atomic64_read((atomic64_t *)ring->wptr_cpu_addr);
+	else
+		BUG();
+	return wptr;
+}
+
+static const struct amdgpu_ring_funcs mes_v12_0_ring_funcs = {
+	.type = AMDGPU_RING_TYPE_MES,
+	.align_mask = 1,
+	.nop = 0,
+	.support_64bit_ptrs = true,
+	.get_rptr = mes_v12_0_ring_get_rptr,
+	.get_wptr = mes_v12_0_ring_get_wptr,
+	.set_wptr = mes_v12_0_ring_set_wptr,
+	.insert_nop = amdgpu_ring_insert_nop,
+};
+
+static int mes_v12_0_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
+						    void *pkt, int size,
+						    int api_status_off)
+{
+	int ndw = size / 4;
+	signed long r;
+	union MESAPI__ADD_QUEUE *x_pkt = pkt;
+	struct MES_API_STATUS *api_status;
+	struct amdgpu_device *adev = mes->adev;
+	struct amdgpu_ring *ring = &mes->ring;
+	unsigned long flags;
+	signed long timeout = adev->usec_timeout;
+
+	if (amdgpu_emu_mode) {
+		timeout *= 100;
+	} else if (amdgpu_sriov_vf(adev)) {
+		/* Worst case in sriov where all other 15 VF timeout, each VF needs about 600ms */
+		timeout = 15 * 600 * 1000;
+	}
+	BUG_ON(size % 4 != 0);
+
+	spin_lock_irqsave(&mes->ring_lock, flags);
+	if (amdgpu_ring_alloc(ring, ndw)) {
+		spin_unlock_irqrestore(&mes->ring_lock, flags);
+		return -ENOMEM;
+	}
+
+	api_status = (struct MES_API_STATUS *)((char *)pkt + api_status_off);
+	api_status->api_completion_fence_addr = mes->ring.fence_drv.gpu_addr;
+	api_status->api_completion_fence_value = ++mes->ring.fence_drv.sync_seq;
+
+	amdgpu_ring_write_multiple(ring, pkt, ndw);
+	amdgpu_ring_commit(ring);
+	spin_unlock_irqrestore(&mes->ring_lock, flags);
+
+	DRM_DEBUG("MES msg=%d was emitted\n", x_pkt->header.opcode);
+
+	r = amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq,
+		      timeout);
+	if (r < 1) {
+		DRM_ERROR("MES failed to response msg=%d\n",
+			  x_pkt->header.opcode);
+
+		while (halt_if_hws_hang)
+			schedule();
+
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int convert_to_mes_queue_type(int queue_type)
+{
+	if (queue_type == AMDGPU_RING_TYPE_GFX)
+		return MES_QUEUE_TYPE_GFX;
+	else if (queue_type == AMDGPU_RING_TYPE_COMPUTE)
+		return MES_QUEUE_TYPE_COMPUTE;
+	else if (queue_type == AMDGPU_RING_TYPE_SDMA)
+		return MES_QUEUE_TYPE_SDMA;
+	else
+		BUG();
+	return -1;
+}
+
+static int mes_v12_0_add_hw_queue(struct amdgpu_mes *mes,
+				  struct mes_add_queue_input *input)
+{
+	struct amdgpu_device *adev = mes->adev;
+	union MESAPI__ADD_QUEUE mes_add_queue_pkt;
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
+	uint32_t vm_cntx_cntl = hub->vm_cntx_cntl;
+
+	memset(&mes_add_queue_pkt, 0, sizeof(mes_add_queue_pkt));
+
+	mes_add_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_add_queue_pkt.header.opcode = MES_SCH_API_ADD_QUEUE;
+	mes_add_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	mes_add_queue_pkt.process_id = input->process_id;
+	mes_add_queue_pkt.page_table_base_addr = input->page_table_base_addr;
+	mes_add_queue_pkt.process_va_start = input->process_va_start;
+	mes_add_queue_pkt.process_va_end = input->process_va_end;
+	mes_add_queue_pkt.process_quantum = input->process_quantum;
+	mes_add_queue_pkt.process_context_addr = input->process_context_addr;
+	mes_add_queue_pkt.gang_quantum = input->gang_quantum;
+	mes_add_queue_pkt.gang_context_addr = input->gang_context_addr;
+	mes_add_queue_pkt.inprocess_gang_priority =
+		input->inprocess_gang_priority;
+	mes_add_queue_pkt.gang_global_priority_level =
+		input->gang_global_priority_level;
+	mes_add_queue_pkt.doorbell_offset = input->doorbell_offset;
+	mes_add_queue_pkt.mqd_addr = input->mqd_addr;
+
+	if (((adev->mes.sched_version & AMDGPU_MES_API_VERSION_MASK) >>
+			AMDGPU_MES_API_VERSION_SHIFT) >= 2)
+		mes_add_queue_pkt.wptr_addr = input->wptr_mc_addr;
+	else
+		mes_add_queue_pkt.wptr_addr = input->wptr_addr;
+
+	mes_add_queue_pkt.queue_type =
+		convert_to_mes_queue_type(input->queue_type);
+	mes_add_queue_pkt.paging = input->paging;
+	mes_add_queue_pkt.vm_context_cntl = vm_cntx_cntl;
+	mes_add_queue_pkt.gws_base = input->gws_base;
+	mes_add_queue_pkt.gws_size = input->gws_size;
+	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
+	mes_add_queue_pkt.tma_addr = input->tma_addr;
+	mes_add_queue_pkt.trap_en = input->trap_en;
+	mes_add_queue_pkt.skip_process_ctx_clear = input->skip_process_ctx_clear;
+	mes_add_queue_pkt.is_kfd_process = input->is_kfd_process;
+
+	/* For KFD, gds_size is re-used for queue size (needed in MES for AQL queues) */
+	mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
+	mes_add_queue_pkt.gds_size = input->queue_size;
+
+	/* For KFD, gds_size is re-used for queue size (needed in MES for AQL queues) */
+	mes_add_queue_pkt.is_aql_queue = input->is_aql_queue;
+	mes_add_queue_pkt.gds_size = input->queue_size;
+
+	return mes_v12_0_submit_pkt_and_poll_completion(mes,
+			&mes_add_queue_pkt, sizeof(mes_add_queue_pkt),
+			offsetof(union MESAPI__ADD_QUEUE, api_status));
+}
+
+static int mes_v12_0_remove_hw_queue(struct amdgpu_mes *mes,
+				     struct mes_remove_queue_input *input)
+{
+	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
+
+	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
+
+	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
+	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
+	mes_remove_queue_pkt.gang_context_addr = input->gang_context_addr;
+
+	return mes_v12_0_submit_pkt_and_poll_completion(mes,
+			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
+			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
+}
+
+static int mes_v12_0_unmap_legacy_queue(struct amdgpu_mes *mes,
+			struct mes_unmap_legacy_queue_input *input)
+{
+	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
+
+	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
+
+	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
+	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
+	mes_remove_queue_pkt.gang_context_addr = 0;
+
+	mes_remove_queue_pkt.pipe_id = input->pipe_id;
+	mes_remove_queue_pkt.queue_id = input->queue_id;
+
+	if (input->action == PREEMPT_QUEUES_NO_UNMAP) {
+		mes_remove_queue_pkt.preempt_legacy_gfx_queue = 1;
+		mes_remove_queue_pkt.tf_addr = input->trail_fence_addr;
+		mes_remove_queue_pkt.tf_data =
+			lower_32_bits(input->trail_fence_data);
+	} else {
+		mes_remove_queue_pkt.unmap_legacy_queue = 1;
+		mes_remove_queue_pkt.queue_type =
+			convert_to_mes_queue_type(input->queue_type);
+	}
+
+	return mes_v12_0_submit_pkt_and_poll_completion(mes,
+			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
+			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
+}
+
+static int mes_v12_0_suspend_gang(struct amdgpu_mes *mes,
+				  struct mes_suspend_gang_input *input)
+{
+	return 0;
+}
+
+static int mes_v12_0_resume_gang(struct amdgpu_mes *mes,
+				 struct mes_resume_gang_input *input)
+{
+	return 0;
+}
+
+static int mes_v12_0_query_sched_status(struct amdgpu_mes *mes)
+{
+	union MESAPI__QUERY_MES_STATUS mes_status_pkt;
+
+	memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
+
+	mes_status_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_status_pkt.header.opcode = MES_SCH_API_QUERY_SCHEDULER_STATUS;
+	mes_status_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	return mes_v12_0_submit_pkt_and_poll_completion(mes,
+			&mes_status_pkt, sizeof(mes_status_pkt),
+			offsetof(union MESAPI__QUERY_MES_STATUS, api_status));
+}
+
+static int mes_v12_0_misc_op(struct amdgpu_mes *mes,
+			     struct mes_misc_op_input *input)
+{
+	union MESAPI__MISC misc_pkt;
+
+	memset(&misc_pkt, 0, sizeof(misc_pkt));
+
+	misc_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	misc_pkt.header.opcode = MES_SCH_API_MISC;
+	misc_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	switch (input->op) {
+	case MES_MISC_OP_READ_REG:
+		misc_pkt.opcode = MESAPI_MISC__READ_REG;
+		misc_pkt.read_reg.reg_offset = input->read_reg.reg_offset;
+		misc_pkt.read_reg.buffer_addr = input->read_reg.buffer_addr;
+		break;
+	case MES_MISC_OP_WRITE_REG:
+		misc_pkt.opcode = MESAPI_MISC__WRITE_REG;
+		misc_pkt.write_reg.reg_offset = input->write_reg.reg_offset;
+		misc_pkt.write_reg.reg_value = input->write_reg.reg_value;
+		break;
+	case MES_MISC_OP_WRM_REG_WAIT:
+		misc_pkt.opcode = MESAPI_MISC__WAIT_REG_MEM;
+		misc_pkt.wait_reg_mem.op = WRM_OPERATION__WAIT_REG_MEM;
+		misc_pkt.wait_reg_mem.reference = input->wrm_reg.ref;
+		misc_pkt.wait_reg_mem.mask = input->wrm_reg.mask;
+		misc_pkt.wait_reg_mem.reg_offset1 = input->wrm_reg.reg0;
+		misc_pkt.wait_reg_mem.reg_offset2 = 0;
+		break;
+	case MES_MISC_OP_WRM_REG_WR_WAIT:
+		misc_pkt.opcode = MESAPI_MISC__WAIT_REG_MEM;
+		misc_pkt.wait_reg_mem.op = WRM_OPERATION__WR_WAIT_WR_REG;
+		misc_pkt.wait_reg_mem.reference = input->wrm_reg.ref;
+		misc_pkt.wait_reg_mem.mask = input->wrm_reg.mask;
+		misc_pkt.wait_reg_mem.reg_offset1 = input->wrm_reg.reg0;
+		misc_pkt.wait_reg_mem.reg_offset2 = input->wrm_reg.reg1;
+		break;
+	case MES_MISC_OP_SET_SHADER_DEBUGGER:
+		misc_pkt.opcode = MESAPI_MISC__SET_SHADER_DEBUGGER;
+		misc_pkt.set_shader_debugger.process_context_addr =
+				input->set_shader_debugger.process_context_addr;
+		misc_pkt.set_shader_debugger.flags.u32all =
+				input->set_shader_debugger.flags.u32all;
+		misc_pkt.set_shader_debugger.spi_gdbg_per_vmid_cntl =
+				input->set_shader_debugger.spi_gdbg_per_vmid_cntl;
+		memcpy(misc_pkt.set_shader_debugger.tcp_watch_cntl,
+				input->set_shader_debugger.tcp_watch_cntl,
+				sizeof(misc_pkt.set_shader_debugger.tcp_watch_cntl));
+		break;
+	default:
+		DRM_ERROR("unsupported misc op (%d) \n", input->op);
+		return -EINVAL;
+	}
+
+	return mes_v12_0_submit_pkt_and_poll_completion(mes,
+			&misc_pkt, sizeof(misc_pkt),
+			offsetof(union MESAPI__MISC, api_status));
+}
+
+static int mes_v12_0_set_hw_resources(struct amdgpu_mes *mes)
+{
+	int i;
+	struct amdgpu_device *adev = mes->adev;
+	union MESAPI_SET_HW_RESOURCES mes_set_hw_res_pkt;
+
+	memset(&mes_set_hw_res_pkt, 0, sizeof(mes_set_hw_res_pkt));
+
+	mes_set_hw_res_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_set_hw_res_pkt.header.opcode = MES_SCH_API_SET_HW_RSRC;
+	mes_set_hw_res_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	mes_set_hw_res_pkt.vmid_mask_mmhub = mes->vmid_mask_mmhub;
+	mes_set_hw_res_pkt.vmid_mask_gfxhub = mes->vmid_mask_gfxhub;
+	mes_set_hw_res_pkt.gds_size = adev->gds.gds_size;
+	mes_set_hw_res_pkt.paging_vmid = 0;
+	mes_set_hw_res_pkt.g_sch_ctx_gpu_mc_ptr = mes->sch_ctx_gpu_addr;
+	mes_set_hw_res_pkt.query_status_fence_gpu_mc_ptr =
+		mes->query_status_fence_gpu_addr;
+
+	for (i = 0; i < MAX_COMPUTE_PIPES; i++)
+		mes_set_hw_res_pkt.compute_hqd_mask[i] =
+			mes->compute_hqd_mask[i];
+
+	for (i = 0; i < MAX_GFX_PIPES; i++)
+		mes_set_hw_res_pkt.gfx_hqd_mask[i] = mes->gfx_hqd_mask[i];
+
+	for (i = 0; i < MAX_SDMA_PIPES; i++)
+		mes_set_hw_res_pkt.sdma_hqd_mask[i] = mes->sdma_hqd_mask[i];
+
+	for (i = 0; i < AMD_PRIORITY_NUM_LEVELS; i++)
+		mes_set_hw_res_pkt.aggregated_doorbells[i] =
+			mes->aggregated_doorbells[i];
+
+	for (i = 0; i < 5; i++) {
+		mes_set_hw_res_pkt.gc_base[i] = adev->reg_offset[GC_HWIP][0][i];
+		mes_set_hw_res_pkt.mmhub_base[i] =
+				adev->reg_offset[MMHUB_HWIP][0][i];
+		mes_set_hw_res_pkt.osssys_base[i] =
+		adev->reg_offset[OSSSYS_HWIP][0][i];
+	}
+
+	mes_set_hw_res_pkt.disable_reset = 1;
+	mes_set_hw_res_pkt.disable_mes_log = 1;
+	mes_set_hw_res_pkt.use_different_vmid_compute = 1;
+	mes_set_hw_res_pkt.enable_reg_active_poll = 1;
+	mes_set_hw_res_pkt.oversubscription_timer = 50;
+
+	return mes_v12_0_submit_pkt_and_poll_completion(mes,
+			&mes_set_hw_res_pkt, sizeof(mes_set_hw_res_pkt),
+			offsetof(union MESAPI_SET_HW_RESOURCES, api_status));
+}
+
+static void mes_v12_0_init_aggregated_doorbell(struct amdgpu_mes *mes)
+{
+	struct amdgpu_device *adev = mes->adev;
+	uint32_t data;
+
+	data = RREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL1);
+	data &= ~(CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET_MASK |
+		  CP_MES_DOORBELL_CONTROL1__DOORBELL_EN_MASK |
+		  CP_MES_DOORBELL_CONTROL1__DOORBELL_HIT_MASK);
+	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_LOW] <<
+		CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET__SHIFT;
+	data |= 1 << CP_MES_DOORBELL_CONTROL1__DOORBELL_EN__SHIFT;
+	WREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL1, data);
+
+	data = RREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL2);
+	data &= ~(CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET_MASK |
+		  CP_MES_DOORBELL_CONTROL2__DOORBELL_EN_MASK |
+		  CP_MES_DOORBELL_CONTROL2__DOORBELL_HIT_MASK);
+	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_NORMAL] <<
+		CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET__SHIFT;
+	data |= 1 << CP_MES_DOORBELL_CONTROL2__DOORBELL_EN__SHIFT;
+	WREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL2, data);
+
+	data = RREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL3);
+	data &= ~(CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET_MASK |
+		  CP_MES_DOORBELL_CONTROL3__DOORBELL_EN_MASK |
+		  CP_MES_DOORBELL_CONTROL3__DOORBELL_HIT_MASK);
+	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_MEDIUM] <<
+		CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET__SHIFT;
+	data |= 1 << CP_MES_DOORBELL_CONTROL3__DOORBELL_EN__SHIFT;
+	WREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL3, data);
+
+	data = RREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL4);
+	data &= ~(CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET_MASK |
+		  CP_MES_DOORBELL_CONTROL4__DOORBELL_EN_MASK |
+		  CP_MES_DOORBELL_CONTROL4__DOORBELL_HIT_MASK);
+	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_HIGH] <<
+		CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET__SHIFT;
+	data |= 1 << CP_MES_DOORBELL_CONTROL4__DOORBELL_EN__SHIFT;
+	WREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL4, data);
+
+	data = RREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL5);
+	data &= ~(CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET_MASK |
+		  CP_MES_DOORBELL_CONTROL5__DOORBELL_EN_MASK |
+		  CP_MES_DOORBELL_CONTROL5__DOORBELL_HIT_MASK);
+	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_REALTIME] <<
+		CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET__SHIFT;
+	data |= 1 << CP_MES_DOORBELL_CONTROL5__DOORBELL_EN__SHIFT;
+	WREG32_SOC15(GC, 0, regCP_MES_DOORBELL_CONTROL5, data);
+
+	data = 1 << CP_HQD_GFX_CONTROL__DB_UPDATED_MSG_EN__SHIFT;
+	WREG32_SOC15(GC, 0, regCP_HQD_GFX_CONTROL, data);
+}
+
+static const struct amdgpu_mes_funcs mes_v12_0_funcs = {
+	.add_hw_queue = mes_v12_0_add_hw_queue,
+	.remove_hw_queue = mes_v12_0_remove_hw_queue,
+	.unmap_legacy_queue = mes_v12_0_unmap_legacy_queue,
+	.suspend_gang = mes_v12_0_suspend_gang,
+	.resume_gang = mes_v12_0_resume_gang,
+	.misc_op = mes_v12_0_misc_op,
+};
+
+static int mes_v12_0_allocate_ucode_buffer(struct amdgpu_device *adev,
+					   enum admgpu_mes_pipe pipe)
+{
+	int r;
+	const struct mes_firmware_header_v1_0 *mes_hdr;
+	const __le32 *fw_data;
+	unsigned fw_size;
+
+	mes_hdr = (const struct mes_firmware_header_v1_0 *)
+		adev->mes.fw[pipe]->data;
+
+	fw_data = (const __le32 *)(adev->mes.fw[pipe]->data +
+		   le32_to_cpu(mes_hdr->mes_ucode_offset_bytes));
+	fw_size = le32_to_cpu(mes_hdr->mes_ucode_size_bytes);
+
+	r = amdgpu_bo_create_reserved(adev, fw_size,
+				      PAGE_SIZE,
+				      AMDGPU_GEM_DOMAIN_VRAM,
+				      &adev->mes.ucode_fw_obj[pipe],
+				      &adev->mes.ucode_fw_gpu_addr[pipe],
+				      (void **)&adev->mes.ucode_fw_ptr[pipe]);
+	if (r) {
+		dev_err(adev->dev, "(%d) failed to create mes fw bo\n", r);
+		return r;
+	}
+
+	memcpy(adev->mes.ucode_fw_ptr[pipe], fw_data, fw_size);
+
+	amdgpu_bo_kunmap(adev->mes.ucode_fw_obj[pipe]);
+	amdgpu_bo_unreserve(adev->mes.ucode_fw_obj[pipe]);
+
+	return 0;
+}
+
+static int mes_v12_0_allocate_ucode_data_buffer(struct amdgpu_device *adev,
+						enum admgpu_mes_pipe pipe)
+{
+	int r;
+	const struct mes_firmware_header_v1_0 *mes_hdr;
+	const __le32 *fw_data;
+	unsigned fw_size;
+
+	mes_hdr = (const struct mes_firmware_header_v1_0 *)
+		adev->mes.fw[pipe]->data;
+
+	fw_data = (const __le32 *)(adev->mes.fw[pipe]->data +
+		   le32_to_cpu(mes_hdr->mes_ucode_data_offset_bytes));
+	fw_size = le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes);
+
+	r = amdgpu_bo_create_reserved(adev, fw_size,
+				      64 * 1024,
+				      AMDGPU_GEM_DOMAIN_VRAM,
+				      &adev->mes.data_fw_obj[pipe],
+				      &adev->mes.data_fw_gpu_addr[pipe],
+				      (void **)&adev->mes.data_fw_ptr[pipe]);
+	if (r) {
+		dev_err(adev->dev, "(%d) failed to create mes data fw bo\n", r);
+		return r;
+	}
+
+	memcpy(adev->mes.data_fw_ptr[pipe], fw_data, fw_size);
+
+	amdgpu_bo_kunmap(adev->mes.data_fw_obj[pipe]);
+	amdgpu_bo_unreserve(adev->mes.data_fw_obj[pipe]);
+
+	return 0;
+}
+
+static void mes_v12_0_free_ucode_buffers(struct amdgpu_device *adev,
+					 enum admgpu_mes_pipe pipe)
+{
+	amdgpu_bo_free_kernel(&adev->mes.data_fw_obj[pipe],
+			      &adev->mes.data_fw_gpu_addr[pipe],
+			      (void **)&adev->mes.data_fw_ptr[pipe]);
+
+	amdgpu_bo_free_kernel(&adev->mes.ucode_fw_obj[pipe],
+			      &adev->mes.ucode_fw_gpu_addr[pipe],
+			      (void **)&adev->mes.ucode_fw_ptr[pipe]);
+}
+
+static void mes_v12_0_enable(struct amdgpu_device *adev, bool enable)
+{
+	uint64_t ucode_addr;
+	uint32_t pipe, data = 0;
+
+	if (enable) {
+		data = RREG32_SOC15(GC, 0, regCP_MES_CNTL);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, 1);
+		data = REG_SET_FIELD(data, CP_MES_CNTL,
+			     MES_PIPE1_RESET, adev->enable_mes_kiq ? 1 : 0);
+		WREG32_SOC15(GC, 0, regCP_MES_CNTL, data);
+
+		mutex_lock(&adev->srbm_mutex);
+		for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+			if (!adev->enable_mes_kiq &&
+			    pipe == AMDGPU_MES_KIQ_PIPE)
+				continue;
+
+			soc21_grbm_select(adev, 3, pipe, 0, 0);
+
+			ucode_addr = adev->mes.uc_start_addr[pipe] >> 2;
+			WREG32_SOC15(GC, 0, regCP_MES_PRGRM_CNTR_START,
+				     lower_32_bits(ucode_addr));
+			WREG32_SOC15(GC, 0, regCP_MES_PRGRM_CNTR_START_HI,
+				     upper_32_bits(ucode_addr));
+		}
+		soc21_grbm_select(adev, 0, 0, 0, 0);
+		mutex_unlock(&adev->srbm_mutex);
+
+		/* unhalt MES and activate pipe0 */
+		data = REG_SET_FIELD(0, CP_MES_CNTL, MES_PIPE0_ACTIVE, 1);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE,
+				     adev->enable_mes_kiq ? 1 : 0);
+		WREG32_SOC15(GC, 0, regCP_MES_CNTL, data);
+
+		if (amdgpu_emu_mode)
+			msleep(100);
+		else
+			udelay(50);
+	} else {
+		data = RREG32_SOC15(GC, 0, regCP_MES_CNTL);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_ACTIVE, 0);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE, 0);
+		data = REG_SET_FIELD(data, CP_MES_CNTL,
+				     MES_INVALIDATE_ICACHE, 1);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, 1);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_RESET,
+				     adev->enable_mes_kiq ? 1 : 0);
+		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_HALT, 1);
+		WREG32_SOC15(GC, 0, regCP_MES_CNTL, data);
+	}
+}
+
+/* This function is for backdoor MES firmware */
+static int mes_v12_0_load_microcode(struct amdgpu_device *adev,
+				    enum admgpu_mes_pipe pipe, bool prime_icache)
+{
+	int r;
+	uint32_t data;
+	uint64_t ucode_addr;
+
+	mes_v12_0_enable(adev, false);
+
+	if (!adev->mes.fw[pipe])
+		return -EINVAL;
+
+	r = mes_v12_0_allocate_ucode_buffer(adev, pipe);
+	if (r)
+		return r;
+
+	r = mes_v12_0_allocate_ucode_data_buffer(adev, pipe);
+	if (r) {
+		mes_v12_0_free_ucode_buffers(adev, pipe);
+		return r;
+	}
+
+	mutex_lock(&adev->srbm_mutex);
+	/* me=3, pipe=0, queue=0 */
+	soc21_grbm_select(adev, 3, pipe, 0, 0);
+
+	WREG32_SOC15(GC, 0, regCP_MES_IC_BASE_CNTL, 0);
+
+	/* set ucode start address */
+	ucode_addr = adev->mes.uc_start_addr[pipe] >> 2;
+	WREG32_SOC15(GC, 0, regCP_MES_PRGRM_CNTR_START,
+		     lower_32_bits(ucode_addr));
+	WREG32_SOC15(GC, 0, regCP_MES_PRGRM_CNTR_START_HI,
+		     upper_32_bits(ucode_addr));
+
+	/* set ucode fimrware address */
+	WREG32_SOC15(GC, 0, regCP_MES_IC_BASE_LO,
+		     lower_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
+	WREG32_SOC15(GC, 0, regCP_MES_IC_BASE_HI,
+		     upper_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
+
+	/* set ucode instruction cache boundary to 2M-1 */
+	WREG32_SOC15(GC, 0, regCP_MES_MIBOUND_LO, 0x1FFFFF);
+
+	/* set ucode data firmware address */
+	WREG32_SOC15(GC, 0, regCP_MES_MDBASE_LO,
+		     lower_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
+	WREG32_SOC15(GC, 0, regCP_MES_MDBASE_HI,
+		     upper_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
+
+	/* Set 0x3FFFF (256K-1) to CP_MES_MDBOUND_LO */
+	WREG32_SOC15(GC, 0, regCP_MES_MDBOUND_LO, 0x3FFFF);
+
+	if (prime_icache) {
+		/* invalidate ICACHE */
+		data = RREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL);
+		data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
+		data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE, 1);
+		WREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL, data);
+
+		/* prime the ICACHE. */
+		data = RREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL);
+		data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
+		WREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL, data);
+	}
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	return 0;
+}
+
+static int mes_v12_0_allocate_eop_buf(struct amdgpu_device *adev,
+				      enum admgpu_mes_pipe pipe)
+{
+	int r;
+	u32 *eop;
+
+	r = amdgpu_bo_create_reserved(adev, MES_EOP_SIZE, PAGE_SIZE,
+			      AMDGPU_GEM_DOMAIN_GTT,
+			      &adev->mes.eop_gpu_obj[pipe],
+			      &adev->mes.eop_gpu_addr[pipe],
+			      (void **)&eop);
+	if (r) {
+		dev_warn(adev->dev, "(%d) create EOP bo failed\n", r);
+		return r;
+	}
+
+	memset(eop, 0,
+	       adev->mes.eop_gpu_obj[pipe]->tbo.base.size);
+
+	amdgpu_bo_kunmap(adev->mes.eop_gpu_obj[pipe]);
+	amdgpu_bo_unreserve(adev->mes.eop_gpu_obj[pipe]);
+
+	return 0;
+}
+
+static int mes_v12_0_mqd_init(struct amdgpu_ring *ring)
+{
+	struct v12_compute_mqd *mqd = ring->mqd_ptr;
+	uint64_t hqd_gpu_addr, wb_gpu_addr, eop_base_addr;
+	uint32_t tmp;
+
+	mqd->header = 0xC0310800;
+	mqd->compute_pipelinestat_enable = 0x00000001;
+	mqd->compute_static_thread_mgmt_se0 = 0xffffffff;
+	mqd->compute_static_thread_mgmt_se1 = 0xffffffff;
+	mqd->compute_static_thread_mgmt_se2 = 0xffffffff;
+	mqd->compute_static_thread_mgmt_se3 = 0xffffffff;
+	mqd->compute_misc_reserved = 0x00000007;
+
+	eop_base_addr = ring->eop_gpu_addr >> 8;
+
+	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
+	tmp = regCP_HQD_EOP_CONTROL_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
+			(order_base_2(MES_EOP_SIZE / 4) - 1));
+
+	mqd->cp_hqd_eop_base_addr_lo = lower_32_bits(eop_base_addr);
+	mqd->cp_hqd_eop_base_addr_hi = upper_32_bits(eop_base_addr);
+	mqd->cp_hqd_eop_control = tmp;
+
+	/* disable the queue if it's active */
+	ring->wptr = 0;
+	mqd->cp_hqd_pq_rptr = 0;
+	mqd->cp_hqd_pq_wptr_lo = 0;
+	mqd->cp_hqd_pq_wptr_hi = 0;
+
+	/* set the pointer to the MQD */
+	mqd->cp_mqd_base_addr_lo = ring->mqd_gpu_addr & 0xfffffffc;
+	mqd->cp_mqd_base_addr_hi = upper_32_bits(ring->mqd_gpu_addr);
+
+	/* set MQD vmid to 0 */
+	tmp = regCP_MQD_CONTROL_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
+	mqd->cp_mqd_control = tmp;
+
+	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
+	hqd_gpu_addr = ring->gpu_addr >> 8;
+	mqd->cp_hqd_pq_base_lo = lower_32_bits(hqd_gpu_addr);
+	mqd->cp_hqd_pq_base_hi = upper_32_bits(hqd_gpu_addr);
+
+	/* set the wb address whether it's enabled or not */
+	wb_gpu_addr = ring->rptr_gpu_addr;
+	mqd->cp_hqd_pq_rptr_report_addr_lo = wb_gpu_addr & 0xfffffffc;
+	mqd->cp_hqd_pq_rptr_report_addr_hi =
+		upper_32_bits(wb_gpu_addr) & 0xffff;
+
+	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
+	wb_gpu_addr = ring->wptr_gpu_addr;
+	mqd->cp_hqd_pq_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffff8;
+	mqd->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
+
+	/* set up the HQD, this is similar to CP_RB0_CNTL */
+	tmp = regCP_HQD_PQ_CONTROL_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
+			    (order_base_2(ring->ring_size / 4) - 1));
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
+			    ((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1) << 8));
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, TUNNEL_DISPATCH, 0);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, NO_UPDATE_RPTR, 1);
+	mqd->cp_hqd_pq_control = tmp;
+
+	/* enable doorbell */
+	tmp = 0;
+	if (ring->use_doorbell) {
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_OFFSET, ring->doorbell_index);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_EN, 1);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_SOURCE, 0);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_HIT, 0);
+	} else {
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_EN, 0);
+	}
+	mqd->cp_hqd_pq_doorbell_control = tmp;
+
+	mqd->cp_hqd_vmid = 0;
+	/* activate the queue */
+	mqd->cp_hqd_active = 1;
+
+	tmp = regCP_HQD_PERSISTENT_STATE_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PERSISTENT_STATE,
+			    PRELOAD_SIZE, 0x55);
+	mqd->cp_hqd_persistent_state = tmp;
+
+	mqd->cp_hqd_ib_control = regCP_HQD_IB_CONTROL_DEFAULT;
+	mqd->cp_hqd_iq_timer = regCP_HQD_IQ_TIMER_DEFAULT;
+	mqd->cp_hqd_quantum = regCP_HQD_QUANTUM_DEFAULT;
+
+	return 0;
+}
+
+static void mes_v12_0_queue_init_register(struct amdgpu_ring *ring)
+{
+	struct v12_compute_mqd *mqd = ring->mqd_ptr;
+	struct amdgpu_device *adev = ring->adev;
+	uint32_t data = 0;
+
+	mutex_lock(&adev->srbm_mutex);
+	soc21_grbm_select(adev, 3, ring->pipe, 0, 0);
+
+	/* set CP_HQD_VMID.VMID = 0. */
+	data = RREG32_SOC15(GC, 0, regCP_HQD_VMID);
+	data = REG_SET_FIELD(data, CP_HQD_VMID, VMID, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_VMID, data);
+
+	/* set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_EN=0 */
+	data = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+			     DOORBELL_EN, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, data);
+
+	/* set CP_MQD_BASE_ADDR/HI with the MQD base address */
+	WREG32_SOC15(GC, 0, regCP_MQD_BASE_ADDR, mqd->cp_mqd_base_addr_lo);
+	WREG32_SOC15(GC, 0, regCP_MQD_BASE_ADDR_HI, mqd->cp_mqd_base_addr_hi);
+
+	/* set CP_MQD_CONTROL.VMID=0 */
+	data = RREG32_SOC15(GC, 0, regCP_MQD_CONTROL);
+	data = REG_SET_FIELD(data, CP_MQD_CONTROL, VMID, 0);
+	WREG32_SOC15(GC, 0, regCP_MQD_CONTROL, 0);
+
+	/* set CP_HQD_PQ_BASE/HI with the ring buffer base address */
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_BASE, mqd->cp_hqd_pq_base_lo);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_BASE_HI, mqd->cp_hqd_pq_base_hi);
+
+	/* set CP_HQD_PQ_RPTR_REPORT_ADDR/HI */
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR,
+		     mqd->cp_hqd_pq_rptr_report_addr_lo);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
+		     mqd->cp_hqd_pq_rptr_report_addr_hi);
+
+	/* set CP_HQD_PQ_CONTROL */
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_CONTROL, mqd->cp_hqd_pq_control);
+
+	/* set CP_HQD_PQ_WPTR_POLL_ADDR/HI */
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR,
+		     mqd->cp_hqd_pq_wptr_poll_addr_lo);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_POLL_ADDR_HI,
+		     mqd->cp_hqd_pq_wptr_poll_addr_hi);
+
+	/* set CP_HQD_PQ_DOORBELL_CONTROL */
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL,
+		     mqd->cp_hqd_pq_doorbell_control);
+
+	/* set CP_HQD_PERSISTENT_STATE.PRELOAD_SIZE=0x53 */
+	WREG32_SOC15(GC, 0, regCP_HQD_PERSISTENT_STATE, mqd->cp_hqd_persistent_state);
+
+	/* set CP_HQD_ACTIVE.ACTIVE=1 */
+	WREG32_SOC15(GC, 0, regCP_HQD_ACTIVE, mqd->cp_hqd_active);
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+}
+
+static int mes_v12_0_kiq_enable_queue(struct amdgpu_device *adev)
+{
+	struct amdgpu_kiq *kiq = &adev->gfx.kiq[0];
+	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq[0].ring;
+	int r;
+
+	if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
+		return -EINVAL;
+
+	r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size);
+	if (r) {
+		DRM_ERROR("Failed to lock KIQ (%d).\n", r);
+		return r;
+	}
+
+	kiq->pmf->kiq_map_queues(kiq_ring, &adev->mes.ring);
+
+	r = amdgpu_ring_test_ring(kiq_ring);
+	if (r) {
+		DRM_ERROR("kfq enable failed\n");
+		kiq_ring->sched.ready = false;
+	}
+	return r;
+}
+
+static int mes_v12_0_queue_init(struct amdgpu_device *adev,
+				enum admgpu_mes_pipe pipe)
+{
+	struct amdgpu_ring *ring;
+	int r;
+
+	if (pipe == AMDGPU_MES_KIQ_PIPE)
+		ring = &adev->gfx.kiq[0].ring;
+	else if (pipe == AMDGPU_MES_SCHED_PIPE)
+		ring = &adev->mes.ring;
+	else
+		BUG();
+
+	if ((pipe == AMDGPU_MES_SCHED_PIPE) &&
+	    (amdgpu_in_reset(adev) || adev->in_suspend)) {
+		*(ring->wptr_cpu_addr) = 0;
+		*(ring->rptr_cpu_addr) = 0;
+		amdgpu_ring_clear_ring(ring);
+	}
+
+	r = mes_v12_0_mqd_init(ring);
+	if (r)
+		return r;
+
+	if (pipe == AMDGPU_MES_SCHED_PIPE) {
+		r = mes_v12_0_kiq_enable_queue(adev);
+		if (r)
+			return r;
+	} else {
+		mes_v12_0_queue_init_register(ring);
+	}
+
+	/* get MES scheduler/KIQ versions */
+	mutex_lock(&adev->srbm_mutex);
+	soc21_grbm_select(adev, 3, pipe, 0, 0);
+
+	if (pipe == AMDGPU_MES_SCHED_PIPE)
+		adev->mes.sched_version = RREG32_SOC15(GC, 0, regCP_MES_GP3_LO);
+	else if (pipe == AMDGPU_MES_KIQ_PIPE && adev->enable_mes_kiq)
+		adev->mes.kiq_version = RREG32_SOC15(GC, 0, regCP_MES_GP3_LO);
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	return 0;
+}
+
+static int mes_v12_0_ring_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+
+	ring = &adev->mes.ring;
+
+	ring->funcs = &mes_v12_0_ring_funcs;
+
+	ring->me = 3;
+	ring->pipe = 0;
+	ring->queue = 0;
+
+	ring->ring_obj = NULL;
+	ring->use_doorbell = true;
+	ring->doorbell_index = adev->doorbell_index.mes_ring0 << 1;
+	ring->eop_gpu_addr = adev->mes.eop_gpu_addr[AMDGPU_MES_SCHED_PIPE];
+	ring->no_scheduler = true;
+	sprintf(ring->name, "mes_%d.%d.%d", ring->me, ring->pipe, ring->queue);
+
+	return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
+				AMDGPU_RING_PRIO_DEFAULT, NULL);
+}
+
+static int mes_v12_0_kiq_ring_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+
+	spin_lock_init(&adev->gfx.kiq[0].ring_lock);
+
+	ring = &adev->gfx.kiq[0].ring;
+
+	ring->me = 3;
+	ring->pipe = 1;
+	ring->queue = 0;
+
+	ring->adev = NULL;
+	ring->ring_obj = NULL;
+	ring->use_doorbell = true;
+	ring->doorbell_index = adev->doorbell_index.mes_ring1 << 1;
+	ring->eop_gpu_addr = adev->mes.eop_gpu_addr[AMDGPU_MES_KIQ_PIPE];
+	ring->no_scheduler = true;
+	sprintf(ring->name, "mes_kiq_%d.%d.%d",
+		ring->me, ring->pipe, ring->queue);
+
+	return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
+				AMDGPU_RING_PRIO_DEFAULT, NULL);
+}
+
+static int mes_v12_0_mqd_sw_init(struct amdgpu_device *adev,
+				 enum admgpu_mes_pipe pipe)
+{
+	int r, mqd_size = sizeof(struct v12_compute_mqd);
+	struct amdgpu_ring *ring;
+
+	if (pipe == AMDGPU_MES_KIQ_PIPE)
+		ring = &adev->gfx.kiq[0].ring;
+	else if (pipe == AMDGPU_MES_SCHED_PIPE)
+		ring = &adev->mes.ring;
+	else
+		BUG();
+
+	if (ring->mqd_obj)
+		return 0;
+
+	r = amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
+				    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
+				    &ring->mqd_gpu_addr, &ring->mqd_ptr);
+	if (r) {
+		dev_warn(adev->dev, "failed to create ring mqd bo (%d)", r);
+		return r;
+	}
+
+	memset(ring->mqd_ptr, 0, mqd_size);
+
+	/* prepare MQD backup */
+	adev->mes.mqd_backup[pipe] = kmalloc(mqd_size, GFP_KERNEL);
+	if (!adev->mes.mqd_backup[pipe])
+		dev_warn(adev->dev,
+			 "no memory to create MQD backup for ring %s\n",
+			 ring->name);
+
+	return 0;
+}
+
+static int mes_v12_0_sw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int pipe, r;
+
+	adev->mes.funcs = &mes_v12_0_funcs;
+	adev->mes.kiq_hw_init = &mes_v12_0_kiq_hw_init;
+	adev->mes.kiq_hw_fini = &mes_v12_0_kiq_hw_fini;
+
+	r = amdgpu_mes_init(adev);
+	if (r)
+		return r;
+
+	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
+			continue;
+
+		r = mes_v12_0_allocate_eop_buf(adev, pipe);
+		if (r)
+			return r;
+
+		r = mes_v12_0_mqd_sw_init(adev, pipe);
+		if (r)
+			return r;
+	}
+
+	if (adev->enable_mes_kiq) {
+		r = mes_v12_0_kiq_ring_init(adev);
+		if (r)
+			return r;
+	}
+
+	r = mes_v12_0_ring_init(adev);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+static int mes_v12_0_sw_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int pipe;
+
+	amdgpu_device_wb_free(adev, adev->mes.sch_ctx_offs);
+	amdgpu_device_wb_free(adev, adev->mes.query_status_fence_offs);
+
+	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+		kfree(adev->mes.mqd_backup[pipe]);
+
+		amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
+				      &adev->mes.eop_gpu_addr[pipe],
+				      NULL);
+		amdgpu_ucode_release(&adev->mes.fw[pipe]);
+	}
+
+	amdgpu_bo_free_kernel(&adev->gfx.kiq[0].ring.mqd_obj,
+			      &adev->gfx.kiq[0].ring.mqd_gpu_addr,
+			      &adev->gfx.kiq[0].ring.mqd_ptr);
+
+	amdgpu_bo_free_kernel(&adev->mes.ring.mqd_obj,
+			      &adev->mes.ring.mqd_gpu_addr,
+			      &adev->mes.ring.mqd_ptr);
+
+	amdgpu_ring_fini(&adev->gfx.kiq[0].ring);
+	amdgpu_ring_fini(&adev->mes.ring);
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
+		mes_v12_0_free_ucode_buffers(adev, AMDGPU_MES_KIQ_PIPE);
+		mes_v12_0_free_ucode_buffers(adev, AMDGPU_MES_SCHED_PIPE);
+	}
+
+	amdgpu_mes_fini(adev);
+	return 0;
+}
+
+static void mes_v12_0_kiq_dequeue_sched(struct amdgpu_device *adev)
+{
+	uint32_t data;
+	int i;
+
+	mutex_lock(&adev->srbm_mutex);
+	soc21_grbm_select(adev, 3, AMDGPU_MES_SCHED_PIPE, 0, 0);
+
+	/* disable the queue if it's active */
+	if (RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1) {
+		WREG32_SOC15(GC, 0, regCP_HQD_DEQUEUE_REQUEST, 1);
+		for (i = 0; i < adev->usec_timeout; i++) {
+			if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
+				break;
+			udelay(1);
+		}
+	}
+	data = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_EN, 0);
+	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_HIT, 1);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, data);
+
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL, 0);
+
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_LO, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_WPTR_HI, 0);
+	WREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR, 0);
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	adev->mes.ring.sched.ready = false;
+}
+
+static void mes_v12_0_kiq_setting(struct amdgpu_ring *ring)
+{
+	uint32_t tmp;
+	struct amdgpu_device *adev = ring->adev;
+
+	/* tell RLC which is KIQ queue */
+	tmp = RREG32_SOC15(GC, 0, regRLC_CP_SCHEDULERS);
+	tmp &= 0xffffff00;
+	tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
+	WREG32_SOC15(GC, 0, regRLC_CP_SCHEDULERS, tmp);
+	tmp |= 0x80;
+	WREG32_SOC15(GC, 0, regRLC_CP_SCHEDULERS, tmp);
+}
+
+static int mes_v12_0_kiq_hw_init(struct amdgpu_device *adev)
+{
+	int r = 0;
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
+
+		r = mes_v12_0_load_microcode(adev, AMDGPU_MES_SCHED_PIPE, false);
+		if (r) {
+			DRM_ERROR("failed to load MES fw, r=%d\n", r);
+			return r;
+		}
+
+		r = mes_v12_0_load_microcode(adev, AMDGPU_MES_KIQ_PIPE, true);
+		if (r) {
+			DRM_ERROR("failed to load MES kiq fw, r=%d\n", r);
+			return r;
+		}
+
+	}
+
+	mes_v12_0_enable(adev, true);
+
+	mes_v12_0_kiq_setting(&adev->gfx.kiq[0].ring);
+
+	r = mes_v12_0_queue_init(adev, AMDGPU_MES_KIQ_PIPE);
+	if (r)
+		goto failure;
+
+	return r;
+
+failure:
+	mes_v12_0_hw_fini(adev);
+	return r;
+}
+
+static int mes_v12_0_kiq_hw_fini(struct amdgpu_device *adev)
+{
+	if (adev->mes.ring.sched.ready)
+		mes_v12_0_kiq_dequeue_sched(adev);
+
+	if (!amdgpu_sriov_vf(adev))
+		mes_v12_0_enable(adev, false);
+
+	return 0;
+}
+
+static int mes_v12_0_hw_init(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (!adev->enable_mes_kiq) {
+		if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
+			r = mes_v12_0_load_microcode(adev,
+					     AMDGPU_MES_SCHED_PIPE, true);
+			if (r) {
+				DRM_ERROR("failed to MES fw, r=%d\n", r);
+				return r;
+			}
+		}
+
+		mes_v12_0_enable(adev, true);
+	}
+
+	r = mes_v12_0_queue_init(adev, AMDGPU_MES_SCHED_PIPE);
+	if (r)
+		goto failure;
+
+	r = mes_v12_0_set_hw_resources(&adev->mes);
+	if (r)
+		goto failure;
+
+	mes_v12_0_init_aggregated_doorbell(&adev->mes);
+
+	r = mes_v12_0_query_sched_status(&adev->mes);
+	if (r) {
+		DRM_ERROR("MES is busy\n");
+		goto failure;
+	}
+
+	/*
+	 * Disable KIQ ring usage from the driver once MES is enabled.
+	 * MES uses KIQ ring exclusively so driver cannot access KIQ ring
+	 * with MES enabled.
+	 */
+	adev->gfx.kiq[0].ring.sched.ready = false;
+	adev->mes.ring.sched.ready = true;
+
+	return 0;
+
+failure:
+	mes_v12_0_hw_fini(adev);
+	return r;
+}
+
+static int mes_v12_0_hw_fini(void *handle)
+{
+	return 0;
+}
+
+static int mes_v12_0_suspend(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = amdgpu_mes_suspend(adev);
+	if (r)
+		return r;
+
+	return mes_v12_0_hw_fini(adev);
+}
+
+static int mes_v12_0_resume(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = mes_v12_0_hw_init(adev);
+	if (r)
+		return r;
+
+	return amdgpu_mes_resume(adev);
+}
+
+static int mes_v12_0_early_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int pipe, r;
+
+	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
+			continue;
+		r = amdgpu_mes_init_microcode(adev, pipe);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
+static int mes_v12_0_late_init(void *handle)
+{
+	return 0;
+}
+
+static const struct amd_ip_funcs mes_v12_0_ip_funcs = {
+	.name = "mes_v12_0",
+	.early_init = mes_v12_0_early_init,
+	.late_init = mes_v12_0_late_init,
+	.sw_init = mes_v12_0_sw_init,
+	.sw_fini = mes_v12_0_sw_fini,
+	.hw_init = mes_v12_0_hw_init,
+	.hw_fini = mes_v12_0_hw_fini,
+	.suspend = mes_v12_0_suspend,
+	.resume = mes_v12_0_resume,
+};
+
+const struct amdgpu_ip_block_version mes_v12_0_ip_block = {
+	.type = AMD_IP_BLOCK_TYPE_MES,
+	.major = 12,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &mes_v12_0_ip_funcs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v12_0.h b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.h
new file mode 100644
index 0000000000000..ac3740f353aa0
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v12_0.h
@@ -0,0 +1,29 @@
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
+#ifndef __MES_V12_0_H__
+#define __MES_V12_0_H__
+
+extern const struct amdgpu_ip_block_version mes_v12_0_ip_block;
+
+#endif
-- 
2.44.0


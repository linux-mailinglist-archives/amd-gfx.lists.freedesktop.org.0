Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E951533F
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Apr 2022 20:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FF610F8C6;
	Fri, 29 Apr 2022 18:03:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEFD10F8B6
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Apr 2022 18:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlmXZCF7/vKlZdFyP9Jht7UWb/p4Cp6qkSpUNaANQLycYtbil9f9KsyQbl3f3bbRJxgJF5tRRRsLktaz+VmSoTY3uJzwSWD4JUy5WkNfNw+t4GlYWDDHYiO+HfYEB6NVuslwPhLoUuQ+zeqjHHSuNqE6ZzTI3xkP6W84SsWcFgZOG1DZIgDg+j/rz9GshLN0BOxg9vmd0toE9dRSCtwQWvcEfx2C3jPXZp5XKWxuHbb1tcbbZgzSQD6zgfkkfav/ulQ5J8PgmatV8Um4oLc/+7ePxrhRw2e0HgQgXt+awfmM4POjNfob7nVZqet6fKy6iblixeUj8n1s+mDjJpQe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xezzhncQjG1WWnhj1JKHXV5mIecL8pi+njDsvXcmQks=;
 b=N/5bKcmOnHEQ/sbarQyCv02We8c7X7uic1GxHU2/FdoENCZhLdDE2My2Rleq8PPyF7Oa8zmihwPmWyYpPjhtr9ateP/5hK944I+fnOkRWbN92eETV1Me45xsOescOG3/v/SoreRxJjPnLNTfV6uJjJp2BqMSMPqG22tOaEeOLqlI+rLAtEu0BTtVtQ81S+mkkBoGOcW6Uu1IBSY1gZHIJbxnejwe1WsfGkJFcyjzWZlG8+22aNo5vkwyi/zWMQMxikEFoTxvnjjj8gi6LexE4Ovfke/yG/KvNQARdBnOw6C6vzEIClLjSe0manexDwjIyQ4evAnWX2GeagjJLsRODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xezzhncQjG1WWnhj1JKHXV5mIecL8pi+njDsvXcmQks=;
 b=tclcm6JVsAGARXfNLT6ZEsAJGLSg8w1Kx70PyVBOno4EdgOUbVuWSKA66oQOA5Oqv1v+XXWF+mOczzc8NOkF8Ytk6YObez3nR26DFr93Cza/1OVMHK+8C+TaRM7OMXc5jWOamReb55qJSOe/uCP4Szj/DDa8PWfsUdxlCkv3yWs=
Received: from MW2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:907::45) by
 BYAPR12MB3095.namprd12.prod.outlook.com (2603:10b6:a03:a9::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Fri, 29 Apr 2022 18:02:51 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::89) by MW2PR16CA0032.outlook.office365.com
 (2603:10b6:907::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.26 via Frontend
 Transport; Fri, 29 Apr 2022 18:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 18:02:50 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 13:02:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/29] drm/amdgpu/mes11: initiate mes v11 support
Date: Fri, 29 Apr 2022 14:02:17 -0400
Message-ID: <20220429180226.536084-21-alexander.deucher@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: a3c33e78-6e0e-4cba-ad30-08da2a0a79da
X-MS-TrafficTypeDiagnostic: BYAPR12MB3095:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3095B8AC712EF57747107263F7FC9@BYAPR12MB3095.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksJ7uUJMhr2HQOjl4m/m7/Ran4bFL9/blCLMwWRgjF/rSIKLQFvebMK9x2FI+x9NSV8PccSIbLOzlpdAg3gSdfgqSgkCZGpO2cCtgESTSICD7I7CFvrqIqxSAZVez5awrNDVseCnWZOMLDmGWuVVrTEhzxAx/t1i0AcrC1sXb2ktzRiXWJuFNPQV2qprzQGp3gVkoorVs/5yYijWWMv/a4LcLr+gYDs/yVYZO8Y/rwvBRPxHp5la6LnwPatHAmJNLVk/QNYSNY/8RcCjCyQobL4j4ELfnnibrv5IVE4Frnh8XVn2qeCx2DCTToumD0K/FWC7jc7DGIY+p+BkVCqePfzJom9bVazzhFH1T76qbiX77WGc+OFOBSQCUGvJ67HA9sw77cwsBJ4gpwk1lyZBly3nUqArFZp7nNeXWuNmI9Yc3OJfwu0SFTR8gJ23V8+ox1rwyGLYbPHtlEkHLicXYSa3GLwUNDWSptqgogd5M3OvqR6JYc0oSa6MsXuKDfqTApRa2bMx4VZEdUx8aDZLXmEBO+eMG8Jyx/tjPJjgx3VFqBUUiCvGYRddni4evJQ5XTNKs9AEfiCrtKIVyPEWz+Vytw0AsYx2qLMbXoHHTHbm3N6hQQZPhisdJDnK+3ikOGQF+Gx5J3xCW7kIDxd8nS6U5vrB90lyuH3+GA0ItpiLhek+Y2Im9IzwBKzLPJLO29IcQjZXX3owYuGgb+rL3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(30864003)(7696005)(6666004)(5660300002)(8936002)(26005)(336012)(356005)(81166007)(426003)(1076003)(2616005)(186003)(47076005)(16526019)(316002)(6916009)(36756003)(54906003)(82310400005)(4326008)(2906002)(83380400001)(70206006)(8676002)(36860700001)(70586007)(40460700003)(86362001)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 18:02:50.6885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c33e78-6e0e-4cba-ad30-08da2a0a79da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3095
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

Initiate mes v11 code base from mes v10, rename function
and register names.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |    3 +-
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        | 1204 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.h        |   29 +
 drivers/gpu/drm/amd/include/mes_v11_api_def.h |  579 ++++++++
 4 files changed, 1814 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v11_0.h
 create mode 100644 drivers/gpu/drm/amd/include/mes_v11_api_def.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index e74bf1bde8b9..2c490a5c2a87 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -146,7 +146,8 @@ amdgpu-y += \
 # add MES block
 amdgpu-y += \
 	amdgpu_mes.o \
-	mes_v10_1.o
+	mes_v10_1.o \
+	mes_v11_0.o
 
 # add UVD block
 amdgpu-y += \
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
new file mode 100644
index 000000000000..af944a43fb03
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -0,0 +1,1204 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
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
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
+#include "v10_structs.h"
+#include "mes_v11_api_def.h"
+
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_mes.bin");
+MODULE_FIRMWARE("amdgpu/gc_11_0_0_mes1.bin");
+
+static int mes_v11_0_hw_fini(void *handle);
+static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev);
+static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev);
+
+#define MES_EOP_SIZE   2048
+
+static void mes_v11_0_ring_set_wptr(struct amdgpu_ring *ring)
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
+static u64 mes_v11_0_ring_get_rptr(struct amdgpu_ring *ring)
+{
+	return *ring->rptr_cpu_addr;
+}
+
+static u64 mes_v11_0_ring_get_wptr(struct amdgpu_ring *ring)
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
+static const struct amdgpu_ring_funcs mes_v11_0_ring_funcs = {
+	.type = AMDGPU_RING_TYPE_MES,
+	.align_mask = 1,
+	.nop = 0,
+	.support_64bit_ptrs = true,
+	.get_rptr = mes_v11_0_ring_get_rptr,
+	.get_wptr = mes_v11_0_ring_get_wptr,
+	.set_wptr = mes_v11_0_ring_set_wptr,
+	.insert_nop = amdgpu_ring_insert_nop,
+};
+
+static int mes_v11_0_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
+						    void *pkt, int size)
+{
+	int ndw = size / 4;
+	signed long r;
+	union MESAPI__ADD_QUEUE *x_pkt = pkt;
+	struct amdgpu_device *adev = mes->adev;
+	struct amdgpu_ring *ring = &mes->ring;
+
+	BUG_ON(size % 4 != 0);
+
+	if (amdgpu_ring_alloc(ring, ndw))
+		return -ENOMEM;
+
+	amdgpu_ring_write_multiple(ring, pkt, ndw);
+	amdgpu_ring_commit(ring);
+
+	DRM_DEBUG("MES msg=%d was emitted\n", x_pkt->header.opcode);
+
+	r = amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq,
+		      adev->usec_timeout * (amdgpu_emu_mode ? 100 : 1));
+	if (r < 1) {
+		DRM_ERROR("MES failed to response msg=%d\n",
+			  x_pkt->header.opcode);
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
+static int mes_v11_0_add_hw_queue(struct amdgpu_mes *mes,
+				  struct mes_add_queue_input *input)
+{
+	struct amdgpu_device *adev = mes->adev;
+	union MESAPI__ADD_QUEUE mes_add_queue_pkt;
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
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
+	mes_add_queue_pkt.wptr_addr = input->wptr_addr;
+	mes_add_queue_pkt.queue_type =
+		convert_to_mes_queue_type(input->queue_type);
+	mes_add_queue_pkt.paging = input->paging;
+	mes_add_queue_pkt.vm_context_cntl = vm_cntx_cntl;
+	mes_add_queue_pkt.gws_base = input->gws_base;
+	mes_add_queue_pkt.gws_size = input->gws_size;
+	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
+	mes_add_queue_pkt.tma_addr = input->tma_addr;
+
+	mes_add_queue_pkt.api_status.api_completion_fence_addr =
+		mes->ring.fence_drv.gpu_addr;
+	mes_add_queue_pkt.api_status.api_completion_fence_value =
+		++mes->ring.fence_drv.sync_seq;
+
+	return mes_v11_0_submit_pkt_and_poll_completion(mes,
+			&mes_add_queue_pkt, sizeof(mes_add_queue_pkt));
+}
+
+static int mes_v11_0_remove_hw_queue(struct amdgpu_mes *mes,
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
+	mes_remove_queue_pkt.api_status.api_completion_fence_addr =
+		mes->ring.fence_drv.gpu_addr;
+	mes_remove_queue_pkt.api_status.api_completion_fence_value =
+		++mes->ring.fence_drv.sync_seq;
+
+	return mes_v11_0_submit_pkt_and_poll_completion(mes,
+			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt));
+}
+
+static int mes_v11_0_unmap_legacy_queue(struct amdgpu_mes *mes,
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
+	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset << 2;
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
+		if (input->queue_type == AMDGPU_RING_TYPE_GFX)
+			mes_remove_queue_pkt.unmap_legacy_gfx_queue = 1;
+		else
+			mes_remove_queue_pkt.unmap_kiq_utility_queue = 1;
+	}
+
+	mes_remove_queue_pkt.api_status.api_completion_fence_addr =
+		mes->ring.fence_drv.gpu_addr;
+	mes_remove_queue_pkt.api_status.api_completion_fence_value =
+		++mes->ring.fence_drv.sync_seq;
+
+	return mes_v11_0_submit_pkt_and_poll_completion(mes,
+			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt));
+}
+
+static int mes_v11_0_suspend_gang(struct amdgpu_mes *mes,
+				  struct mes_suspend_gang_input *input)
+{
+	return 0;
+}
+
+static int mes_v11_0_resume_gang(struct amdgpu_mes *mes,
+				 struct mes_resume_gang_input *input)
+{
+	return 0;
+}
+
+static int mes_v11_0_query_sched_status(struct amdgpu_mes *mes)
+{
+	union MESAPI__QUERY_MES_STATUS mes_status_pkt;
+
+	memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
+
+	mes_status_pkt.header.type = MES_API_TYPE_SCHEDULER;
+	mes_status_pkt.header.opcode = MES_SCH_API_QUERY_SCHEDULER_STATUS;
+	mes_status_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
+
+	mes_status_pkt.api_status.api_completion_fence_addr =
+		mes->ring.fence_drv.gpu_addr;
+	mes_status_pkt.api_status.api_completion_fence_value =
+		++mes->ring.fence_drv.sync_seq;
+
+	return mes_v11_0_submit_pkt_and_poll_completion(mes,
+			&mes_status_pkt, sizeof(mes_status_pkt));
+}
+
+static int mes_v11_0_set_hw_resources(struct amdgpu_mes *mes)
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
+			mes->agreegated_doorbells[i];
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
+
+	mes_set_hw_res_pkt.api_status.api_completion_fence_addr =
+		mes->ring.fence_drv.gpu_addr;
+	mes_set_hw_res_pkt.api_status.api_completion_fence_value =
+		++mes->ring.fence_drv.sync_seq;
+
+	return mes_v11_0_submit_pkt_and_poll_completion(mes,
+			&mes_set_hw_res_pkt, sizeof(mes_set_hw_res_pkt));
+}
+
+static const struct amdgpu_mes_funcs mes_v11_0_funcs = {
+	.add_hw_queue = mes_v11_0_add_hw_queue,
+	.remove_hw_queue = mes_v11_0_remove_hw_queue,
+	.unmap_legacy_queue = mes_v11_0_unmap_legacy_queue,
+	.suspend_gang = mes_v11_0_suspend_gang,
+	.resume_gang = mes_v11_0_resume_gang,
+};
+
+static int mes_v11_0_init_microcode(struct amdgpu_device *adev,
+				    enum admgpu_mes_pipe pipe)
+{
+	char fw_name[30];
+	char ucode_prefix[30];
+	int err;
+	const struct mes_firmware_header_v1_0 *mes_hdr;
+	struct amdgpu_firmware_info *info;
+
+	amdgpu_ucode_ip_version_decode(adev, GC_HWIP, ucode_prefix, sizeof(ucode_prefix));
+
+	if (pipe == AMDGPU_MES_SCHED_PIPE)
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes.bin",
+			 ucode_prefix);
+	else
+		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mes1.bin",
+			 ucode_prefix);
+
+	err = request_firmware(&adev->mes.fw[pipe], fw_name, adev->dev);
+	if (err)
+		return err;
+
+	err = amdgpu_ucode_validate(adev->mes.fw[pipe]);
+	if (err) {
+		release_firmware(adev->mes.fw[pipe]);
+		adev->mes.fw[pipe] = NULL;
+		return err;
+	}
+
+	mes_hdr = (const struct mes_firmware_header_v1_0 *)
+		adev->mes.fw[pipe]->data;
+	adev->mes.ucode_fw_version[pipe] =
+		le32_to_cpu(mes_hdr->mes_ucode_version);
+	adev->mes.ucode_fw_version[pipe] =
+		le32_to_cpu(mes_hdr->mes_ucode_data_version);
+	adev->mes.uc_start_addr[pipe] =
+		le32_to_cpu(mes_hdr->mes_uc_start_addr_lo) |
+		((uint64_t)(le32_to_cpu(mes_hdr->mes_uc_start_addr_hi)) << 32);
+	adev->mes.data_start_addr[pipe] =
+		le32_to_cpu(mes_hdr->mes_data_start_addr_lo) |
+		((uint64_t)(le32_to_cpu(mes_hdr->mes_data_start_addr_hi)) << 32);
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
+		int ucode, ucode_data;
+
+		if (pipe == AMDGPU_MES_SCHED_PIPE) {
+			ucode = AMDGPU_UCODE_ID_CP_MES;
+			ucode_data = AMDGPU_UCODE_ID_CP_MES_DATA;
+		} else {
+			ucode = AMDGPU_UCODE_ID_CP_MES1;
+			ucode_data = AMDGPU_UCODE_ID_CP_MES1_DATA;
+		}
+
+		info = &adev->firmware.ucode[ucode];
+		info->ucode_id = ucode;
+		info->fw = adev->mes.fw[pipe];
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_size_bytes),
+			      PAGE_SIZE);
+
+		info = &adev->firmware.ucode[ucode_data];
+		info->ucode_id = ucode_data;
+		info->fw = adev->mes.fw[pipe];
+		adev->firmware.fw_size +=
+			ALIGN(le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes),
+			      PAGE_SIZE);
+	}
+
+	return 0;
+}
+
+static void mes_v11_0_free_microcode(struct amdgpu_device *adev,
+				     enum admgpu_mes_pipe pipe)
+{
+	release_firmware(adev->mes.fw[pipe]);
+	adev->mes.fw[pipe] = NULL;
+}
+
+static int mes_v11_0_allocate_ucode_buffer(struct amdgpu_device *adev,
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
+				      PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM,
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
+static int mes_v11_0_allocate_ucode_data_buffer(struct amdgpu_device *adev,
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
+				      64 * 1024, AMDGPU_GEM_DOMAIN_VRAM,
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
+static void mes_v11_0_free_ucode_buffers(struct amdgpu_device *adev,
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
+static void mes_v11_0_enable(struct amdgpu_device *adev, bool enable)
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
+static int mes_v11_0_load_microcode(struct amdgpu_device *adev,
+				    enum admgpu_mes_pipe pipe)
+{
+	int r;
+	uint32_t data;
+	uint64_t ucode_addr;
+
+	mes_v11_0_enable(adev, false);
+
+	if (!adev->mes.fw[pipe])
+		return -EINVAL;
+
+	r = mes_v11_0_allocate_ucode_buffer(adev, pipe);
+	if (r)
+		return r;
+
+	r = mes_v11_0_allocate_ucode_data_buffer(adev, pipe);
+	if (r) {
+		mes_v11_0_free_ucode_buffers(adev, pipe);
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
+	/* invalidate ICACHE */
+	data = RREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL);
+	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
+	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE, 1);
+	WREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL, data);
+
+	/* prime the ICACHE. */
+	data = RREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL);
+	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
+	WREG32_SOC15(GC, 0, regCP_MES_IC_OP_CNTL, data);
+
+	soc21_grbm_select(adev, 0, 0, 0, 0);
+	mutex_unlock(&adev->srbm_mutex);
+
+	return 0;
+}
+
+static int mes_v11_0_allocate_eop_buf(struct amdgpu_device *adev,
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
+static int mes_v11_0_mqd_init(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct v10_compute_mqd *mqd = ring->mqd_ptr;
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
+	mqd->cp_hqd_eop_base_addr_lo = eop_base_addr;
+	mqd->cp_hqd_eop_base_addr_hi = upper_32_bits(eop_base_addr);
+
+	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_EOP_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
+			(order_base_2(MES_EOP_SIZE / 4) - 1));
+
+	mqd->cp_hqd_eop_control = tmp;
+
+	/* enable doorbell? */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+
+	if (ring->use_doorbell) {
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_OFFSET, ring->doorbell_index);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_EN, 1);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_SOURCE, 0);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_HIT, 0);
+	}
+	else
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_EN, 0);
+
+	mqd->cp_hqd_pq_doorbell_control = tmp;
+
+	/* disable the queue if it's active */
+	ring->wptr = 0;
+	mqd->cp_hqd_dequeue_request = 0;
+	mqd->cp_hqd_pq_rptr = 0;
+	mqd->cp_hqd_pq_wptr_lo = 0;
+	mqd->cp_hqd_pq_wptr_hi = 0;
+
+	/* set the pointer to the MQD */
+	mqd->cp_mqd_base_addr_lo = ring->mqd_gpu_addr & 0xfffffffc;
+	mqd->cp_mqd_base_addr_hi = upper_32_bits(ring->mqd_gpu_addr);
+
+	/* set MQD vmid to 0 */
+	tmp = RREG32_SOC15(GC, 0, regCP_MQD_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
+	mqd->cp_mqd_control = tmp;
+
+	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
+	hqd_gpu_addr = ring->gpu_addr >> 8;
+	mqd->cp_hqd_pq_base_lo = hqd_gpu_addr;
+	mqd->cp_hqd_pq_base_hi = upper_32_bits(hqd_gpu_addr);
+
+	/* set up the HQD, this is similar to CP_RB0_CNTL */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_PQ_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
+			    (order_base_2(ring->ring_size / 4) - 1));
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
+			    ((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1) << 8));
+#ifdef __BIG_ENDIAN
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ENDIAN_SWAP, 1);
+#endif
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 0);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, TUNNEL_DISPATCH, 0);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
+	mqd->cp_hqd_pq_control = tmp;
+
+	/* set the wb address whether it's enabled or not */
+	wb_gpu_addr = ring->rptr_gpu_addr;;
+	mqd->cp_hqd_pq_rptr_report_addr_lo = wb_gpu_addr & 0xfffffffc;
+	mqd->cp_hqd_pq_rptr_report_addr_hi =
+		upper_32_bits(wb_gpu_addr) & 0xffff;
+
+	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
+	wb_gpu_addr = ring->wptr_gpu_addr;
+	mqd->cp_hqd_pq_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffff8;
+	mqd->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
+
+	tmp = 0;
+	/* enable the doorbell if requested */
+	if (ring->use_doorbell) {
+		tmp = RREG32_SOC15(GC, 0, regCP_HQD_PQ_DOORBELL_CONTROL);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				DOORBELL_OFFSET, ring->doorbell_index);
+
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_EN, 1);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_SOURCE, 0);
+		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
+				    DOORBELL_HIT, 0);
+	}
+
+	mqd->cp_hqd_pq_doorbell_control = tmp;
+
+	/* reset read and write pointers, similar to CP_RB0_WPTR/_RPTR */
+	ring->wptr = 0;
+	mqd->cp_hqd_pq_rptr = RREG32_SOC15(GC, 0, regCP_HQD_PQ_RPTR);
+
+	/* set the vmid for the queue */
+	mqd->cp_hqd_vmid = 0;
+
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_PERSISTENT_STATE);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_PERSISTENT_STATE, PRELOAD_SIZE, 0x55);
+	mqd->cp_hqd_persistent_state = tmp;
+
+	/* set MIN_IB_AVAIL_SIZE */
+	tmp = RREG32_SOC15(GC, 0, regCP_HQD_IB_CONTROL);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_IB_CONTROL, MIN_IB_AVAIL_SIZE, 3);
+	mqd->cp_hqd_ib_control = tmp;
+
+	/* activate the queue */
+	mqd->cp_hqd_active = 1;
+	return 0;
+}
+
+static void mes_v11_0_queue_init_register(struct amdgpu_ring *ring)
+{
+	struct v10_compute_mqd *mqd = ring->mqd_ptr;
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
+#if 0
+static int mes_v11_0_kiq_enable_queue(struct amdgpu_device *adev)
+{
+	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
+	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq.ring;
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
+#endif
+
+static int mes_v11_0_queue_init(struct amdgpu_device *adev,
+				enum admgpu_mes_pipe pipe)
+{
+	struct amdgpu_ring *ring;
+	int r;
+
+	if (pipe == AMDGPU_MES_KIQ_PIPE)
+		ring = &adev->gfx.kiq.ring;
+	else if (pipe == AMDGPU_MES_SCHED_PIPE)
+		ring = &adev->mes.ring;
+	else
+		BUG();
+
+	r = mes_v11_0_mqd_init(ring);
+	if (r)
+		return r;
+
+#if 0
+	if (pipe == AMDGPU_MES_SCHED_PIPE) {
+		r = mes_v11_0_kiq_enable_queue(adev);
+		if (r)
+			return r;
+	} else {
+		mes_v11_0_queue_init_register(ring);
+	}
+#else
+	mes_v11_0_queue_init_register(ring);
+#endif
+
+	return 0;
+}
+
+static int mes_v11_0_ring_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+
+	ring = &adev->mes.ring;
+
+	ring->funcs = &mes_v11_0_ring_funcs;
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
+static int mes_v11_0_kiq_ring_init(struct amdgpu_device *adev)
+{
+	struct amdgpu_ring *ring;
+
+	spin_lock_init(&adev->gfx.kiq.ring_lock);
+
+	ring = &adev->gfx.kiq.ring;
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
+static int mes_v11_0_mqd_sw_init(struct amdgpu_device *adev,
+				 enum admgpu_mes_pipe pipe)
+{
+	int r, mqd_size = sizeof(struct v10_compute_mqd);
+	struct amdgpu_ring *ring;
+
+	if (pipe == AMDGPU_MES_KIQ_PIPE)
+		ring = &adev->gfx.kiq.ring;
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
+static int mes_v11_0_sw_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int pipe, r;
+
+	adev->mes.adev = adev;
+	adev->mes.funcs = &mes_v11_0_funcs;
+	adev->mes.kiq_hw_init = &mes_v11_0_kiq_hw_init;
+	adev->mes.kiq_hw_fini = &mes_v11_0_kiq_hw_fini;
+
+	r = amdgpu_mes_init(adev);
+	if (r)
+		return r;
+
+	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
+		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
+			continue;
+
+		r = mes_v11_0_init_microcode(adev, pipe);
+		if (r)
+			return r;
+
+		r = mes_v11_0_allocate_eop_buf(adev, pipe);
+		if (r)
+			return r;
+
+		r = mes_v11_0_mqd_sw_init(adev, pipe);
+		if (r)
+			return r;
+	}
+
+	if (adev->enable_mes_kiq) {
+		r = mes_v11_0_kiq_ring_init(adev);
+		if (r)
+			return r;
+	}
+
+	r = mes_v11_0_ring_init(adev);
+	if (r)
+		return r;
+
+	return 0;
+}
+
+static int mes_v11_0_sw_fini(void *handle)
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
+
+		mes_v11_0_free_microcode(adev, pipe);
+	}
+
+	amdgpu_bo_free_kernel(&adev->gfx.kiq.ring.mqd_obj,
+			      &adev->gfx.kiq.ring.mqd_gpu_addr,
+			      &adev->gfx.kiq.ring.mqd_ptr);
+
+	amdgpu_bo_free_kernel(&adev->mes.ring.mqd_obj,
+			      &adev->mes.ring.mqd_gpu_addr,
+			      &adev->mes.ring.mqd_ptr);
+
+	amdgpu_ring_fini(&adev->gfx.kiq.ring);
+	amdgpu_ring_fini(&adev->mes.ring);
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
+		mes_v11_0_free_ucode_buffers(adev, AMDGPU_MES_KIQ_PIPE);
+		mes_v11_0_free_ucode_buffers(adev, AMDGPU_MES_SCHED_PIPE);
+	}
+
+	amdgpu_mes_fini(adev);
+	return 0;
+}
+
+static void mes_v11_0_kiq_setting(struct amdgpu_ring *ring)
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
+static int mes_v11_0_kiq_hw_init(struct amdgpu_device *adev)
+{
+	int r = 0;
+
+	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
+		r = mes_v11_0_load_microcode(adev, AMDGPU_MES_KIQ_PIPE);
+		if (r) {
+			DRM_ERROR("failed to load MES kiq fw, r=%d\n", r);
+			return r;
+		}
+
+		r = mes_v11_0_load_microcode(adev, AMDGPU_MES_SCHED_PIPE);
+		if (r) {
+			DRM_ERROR("failed to load MES fw, r=%d\n", r);
+			return r;
+		}
+	}
+
+	mes_v11_0_enable(adev, true);
+
+	mes_v11_0_kiq_setting(&adev->gfx.kiq.ring);
+
+	r = mes_v11_0_queue_init(adev, AMDGPU_MES_KIQ_PIPE);
+	if (r)
+		goto failure;
+
+	return r;
+
+failure:
+	mes_v11_0_hw_fini(adev);
+	return r;
+}
+
+static int mes_v11_0_kiq_hw_fini(struct amdgpu_device *adev)
+{
+	mes_v11_0_enable(adev, false);
+	return 0;
+}
+
+static int mes_v11_0_hw_init(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	if (!adev->enable_mes_kiq) {
+		if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
+			r = mes_v11_0_load_microcode(adev,
+					     AMDGPU_MES_SCHED_PIPE);
+			if (r) {
+				DRM_ERROR("failed to MES fw, r=%d\n", r);
+				return r;
+			}
+		}
+
+		mes_v11_0_enable(adev, true);
+	}
+
+	r = mes_v11_0_queue_init(adev, AMDGPU_MES_SCHED_PIPE);
+	if (r)
+		goto failure;
+
+	r = mes_v11_0_set_hw_resources(&adev->mes);
+	if (r)
+		goto failure;
+
+	r = mes_v11_0_query_sched_status(&adev->mes);
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
+	adev->gfx.kiq.ring.sched.ready = false;
+
+	return 0;
+
+failure:
+	mes_v11_0_hw_fini(adev);
+	return r;
+}
+
+static int mes_v11_0_hw_fini(void *handle)
+{
+	return 0;
+}
+
+static int mes_v11_0_suspend(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = amdgpu_mes_suspend(adev);
+	if (r)
+		return r;
+
+	return mes_v11_0_hw_fini(adev);
+}
+
+static int mes_v11_0_resume(void *handle)
+{
+	int r;
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	r = mes_v11_0_hw_init(adev);
+	if (r)
+		return r;
+
+	return amdgpu_mes_resume(adev);
+}
+
+static int mes_v11_0_late_init(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	amdgpu_mes_self_test(adev);
+
+	return 0;
+}
+
+static const struct amd_ip_funcs mes_v11_0_ip_funcs = {
+	.name = "mes_v11_0",
+	.late_init = mes_v11_0_late_init,
+	.sw_init = mes_v11_0_sw_init,
+	.sw_fini = mes_v11_0_sw_fini,
+	.hw_init = mes_v11_0_hw_init,
+	.hw_fini = mes_v11_0_hw_fini,
+	.suspend = mes_v11_0_suspend,
+	.resume = mes_v11_0_resume,
+};
+
+const struct amdgpu_ip_block_version mes_v11_0_ip_block = {
+	.type = AMD_IP_BLOCK_TYPE_MES,
+	.major = 11,
+	.minor = 0,
+	.rev = 0,
+	.funcs = &mes_v11_0_ip_funcs,
+};
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.h b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.h
new file mode 100644
index 000000000000..b3519e1df2b2
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.h
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
+#ifndef __MES_V11_0_H__
+#define __MES_V11_0_H__
+
+extern const struct amdgpu_ip_block_version mes_v11_0_ip_block;
+
+#endif
diff --git a/drivers/gpu/drm/amd/include/mes_v11_api_def.h b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
new file mode 100644
index 000000000000..e30064477d82
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/mes_v11_api_def.h
@@ -0,0 +1,579 @@
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
+#ifndef __MES_API_DEF_H__
+#define __MES_API_DEF_H__
+
+#pragma pack(push, 4)
+
+#define MES_API_VERSION 1
+
+/* Driver submits one API(cmd) as a single Frame and this command size is same
+ * for all API to ease the debugging and parsing of ring buffer.
+ */
+enum { API_FRAME_SIZE_IN_DWORDS = 64 };
+
+/* To avoid command in scheduler context to be overwritten whenenver mutilple
+ * interrupts come in, this creates another queue.
+ */
+enum { API_NUMBER_OF_COMMAND_MAX = 32 };
+
+enum MES_API_TYPE {
+	MES_API_TYPE_SCHEDULER = 1,
+	MES_API_TYPE_MAX
+};
+
+enum MES_SCH_API_OPCODE {
+	MES_SCH_API_SET_HW_RSRC			= 0,
+	MES_SCH_API_SET_SCHEDULING_CONFIG	= 1, /* agreegated db, quantums, etc */
+	MES_SCH_API_ADD_QUEUE			= 2,
+	MES_SCH_API_REMOVE_QUEUE		= 3,
+	MES_SCH_API_PERFORM_YIELD		= 4,
+	MES_SCH_API_SET_GANG_PRIORITY_LEVEL	= 5,
+	MES_SCH_API_SUSPEND			= 6,
+	MES_SCH_API_RESUME			= 7,
+	MES_SCH_API_RESET			= 8,
+	MES_SCH_API_SET_LOG_BUFFER		= 9,
+	MES_SCH_API_CHANGE_GANG_PRORITY		= 10,
+	MES_SCH_API_QUERY_SCHEDULER_STATUS	= 11,
+	MES_SCH_API_PROGRAM_GDS			= 12,
+	MES_SCH_API_SET_DEBUG_VMID		= 13,
+	MES_SCH_API_MISC			= 14,
+	MES_SCH_API_UPDATE_ROOT_PAGE_TABLE      = 15,
+	MES_SCH_API_AMD_LOG                     = 16,
+	MES_SCH_API_MAX				= 0xFF
+};
+
+union MES_API_HEADER {
+	struct {
+		uint32_t type		: 4; /* 0 - Invalid; 1 - Scheduling; 2 - TBD */
+		uint32_t opcode		: 8;
+		uint32_t dwsize		: 8; /* including header */
+		uint32_t reserved	: 12;
+	};
+
+	uint32_t	u32All;
+};
+
+enum MES_AMD_PRIORITY_LEVEL {
+	AMD_PRIORITY_LEVEL_LOW		= 0,
+	AMD_PRIORITY_LEVEL_NORMAL	= 1,
+	AMD_PRIORITY_LEVEL_MEDIUM	= 2,
+	AMD_PRIORITY_LEVEL_HIGH		= 3,
+	AMD_PRIORITY_LEVEL_REALTIME	= 4,
+	AMD_PRIORITY_NUM_LEVELS
+};
+
+enum MES_QUEUE_TYPE {
+	MES_QUEUE_TYPE_GFX,
+	MES_QUEUE_TYPE_COMPUTE,
+	MES_QUEUE_TYPE_SDMA,
+	MES_QUEUE_TYPE_MAX,
+};
+
+struct MES_API_STATUS {
+	uint64_t	api_completion_fence_addr;
+	uint64_t	api_completion_fence_value;
+};
+
+enum { MAX_COMPUTE_PIPES = 8 };
+enum { MAX_GFX_PIPES = 2 };
+enum { MAX_SDMA_PIPES = 2 };
+
+enum { MAX_COMPUTE_HQD_PER_PIPE = 8 };
+enum { MAX_GFX_HQD_PER_PIPE = 8 };
+enum { MAX_SDMA_HQD_PER_PIPE = 10 };
+enum { MAX_SDMA_HQD_PER_PIPE_11_0   = 8 };
+
+enum { MAX_QUEUES_IN_A_GANG = 8 };
+
+enum VM_HUB_TYPE {
+	VM_HUB_TYPE_GC = 0,
+	VM_HUB_TYPE_MM = 1,
+	VM_HUB_TYPE_MAX,
+};
+
+enum { VMID_INVALID = 0xffff };
+
+enum { MAX_VMID_GCHUB = 16 };
+enum { MAX_VMID_MMHUB = 16 };
+
+enum SET_DEBUG_VMID_OPERATIONS {
+	DEBUG_VMID_OP_PROGRAM = 0,
+	DEBUG_VMID_OP_ALLOCATE = 1,
+	DEBUG_VMID_OP_RELEASE = 2
+};
+
+enum MES_LOG_OPERATION {
+	MES_LOG_OPERATION_CONTEXT_STATE_CHANGE = 0,
+	MES_LOG_OPERATION_QUEUE_NEW_WORK = 1,
+	MES_LOG_OPERATION_QUEUE_UNWAIT_SYNC_OBJECT = 2,
+	MES_LOG_OPERATION_QUEUE_NO_MORE_WORK = 3,
+	MES_LOG_OPERATION_QUEUE_WAIT_SYNC_OBJECT = 4,
+	MES_LOG_OPERATION_QUEUE_INVALID = 0xF,
+};
+
+enum MES_LOG_CONTEXT_STATE {
+	MES_LOG_CONTEXT_STATE_IDLE		= 0,
+	MES_LOG_CONTEXT_STATE_RUNNING		= 1,
+	MES_LOG_CONTEXT_STATE_READY		= 2,
+	MES_LOG_CONTEXT_STATE_READY_STANDBY	= 3,
+	MES_LOG_CONTEXT_STATE_INVALID           = 0xF,
+};
+
+struct MES_LOG_CONTEXT_STATE_CHANGE {
+	void				*h_context;
+	enum MES_LOG_CONTEXT_STATE	new_context_state;
+};
+
+struct MES_LOG_QUEUE_NEW_WORK {
+	uint64_t                   h_queue;
+	uint64_t                   reserved;
+};
+
+struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT {
+	uint64_t                   h_queue;
+	uint64_t                   h_sync_object;
+};
+
+struct MES_LOG_QUEUE_NO_MORE_WORK {
+	uint64_t                   h_queue;
+	uint64_t                   reserved;
+};
+
+struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT {
+	uint64_t                   h_queue;
+	uint64_t                   h_sync_object;
+};
+
+struct MES_LOG_ENTRY_HEADER {
+	uint32_t	first_free_entry_index;
+	uint32_t	wraparound_count;
+	uint64_t	number_of_entries;
+	uint64_t	reserved[2];
+};
+
+struct MES_LOG_ENTRY_DATA {
+	uint64_t	gpu_time_stamp;
+	uint32_t	operation_type; /* operation_type is of MES_LOG_OPERATION type */
+	uint32_t	reserved_operation_type_bits;
+	union {
+		struct MES_LOG_CONTEXT_STATE_CHANGE     context_state_change;
+		struct MES_LOG_QUEUE_NEW_WORK           queue_new_work;
+		struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT queue_unwait_sync_object;
+		struct MES_LOG_QUEUE_NO_MORE_WORK       queue_no_more_work;
+		struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT   queue_wait_sync_object;
+		uint64_t                                all[2];
+	};
+};
+
+struct MES_LOG_BUFFER {
+	struct MES_LOG_ENTRY_HEADER	header;
+	struct MES_LOG_ENTRY_DATA	entries[1];
+};
+
+enum MES_SWIP_TO_HWIP_DEF {
+	MES_MAX_HWIP_SEGMENT = 6,
+};
+
+union MESAPI_SET_HW_RESOURCES {
+	struct {
+		union MES_API_HEADER	header;
+		uint32_t		vmid_mask_mmhub;
+		uint32_t		vmid_mask_gfxhub;
+		uint32_t		gds_size;
+		uint32_t		paging_vmid;
+		uint32_t		compute_hqd_mask[MAX_COMPUTE_PIPES];
+		uint32_t		gfx_hqd_mask[MAX_GFX_PIPES];
+		uint32_t		sdma_hqd_mask[MAX_SDMA_PIPES];
+		uint32_t		aggregated_doorbells[AMD_PRIORITY_NUM_LEVELS];
+		uint64_t		g_sch_ctx_gpu_mc_ptr;
+		uint64_t		query_status_fence_gpu_mc_ptr;
+		uint32_t		gc_base[MES_MAX_HWIP_SEGMENT];
+		uint32_t		mmhub_base[MES_MAX_HWIP_SEGMENT];
+		uint32_t		osssys_base[MES_MAX_HWIP_SEGMENT];
+		struct MES_API_STATUS	api_status;
+		union {
+			struct {
+				uint32_t disable_reset	: 1;
+				uint32_t use_different_vmid_compute : 1;
+				uint32_t disable_mes_log   : 1;
+				uint32_t apply_mmhub_pgvm_invalidate_ack_loss_wa : 1;
+				uint32_t apply_grbm_remote_register_dummy_read_wa : 1;
+				uint32_t second_gfx_pipe_enabled : 1;
+				uint32_t enable_level_process_quantum_check : 1;
+				uint32_t reserved	: 25;
+			};
+			uint32_t	uint32_t_all;
+		};
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__ADD_QUEUE {
+	struct {
+		union MES_API_HEADER		header;
+		uint32_t			process_id;
+		uint64_t			page_table_base_addr;
+		uint64_t			process_va_start;
+		uint64_t			process_va_end;
+		uint64_t			process_quantum;
+		uint64_t			process_context_addr;
+		uint64_t			gang_quantum;
+		uint64_t			gang_context_addr;
+		uint32_t			inprocess_gang_priority;
+		enum MES_AMD_PRIORITY_LEVEL	gang_global_priority_level;
+		uint32_t			doorbell_offset;
+		uint64_t			mqd_addr;
+		uint64_t			wptr_addr;
+		uint64_t                        h_context;
+		uint64_t                        h_queue;
+		enum MES_QUEUE_TYPE		queue_type;
+		uint32_t			gds_base;
+		uint32_t			gds_size;
+		uint32_t			gws_base;
+		uint32_t			gws_size;
+		uint32_t			oa_mask;
+		uint64_t                        trap_handler_addr;
+		uint32_t                        vm_context_cntl;
+
+		struct {
+			uint32_t paging			: 1;
+			uint32_t debug_vmid		: 4;
+			uint32_t program_gds		: 1;
+			uint32_t is_gang_suspended	: 1;
+			uint32_t is_tmz_queue		: 1;
+			uint32_t map_kiq_utility_queue  : 1;
+			uint32_t reserved		: 23;
+		};
+		struct MES_API_STATUS		api_status;
+		uint64_t                        tma_addr;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__REMOVE_QUEUE {
+	struct {
+		union MES_API_HEADER	header;
+		uint32_t		doorbell_offset;
+		uint64_t		gang_context_addr;
+
+		struct {
+			uint32_t unmap_legacy_gfx_queue   : 1;
+			uint32_t unmap_kiq_utility_queue  : 1;
+			uint32_t preempt_legacy_gfx_queue : 1;
+			uint32_t reserved                 : 29;
+		};
+		struct MES_API_STATUS	    api_status;
+
+		uint32_t                    pipe_id;
+		uint32_t                    queue_id;
+
+		uint64_t                    tf_addr;
+		uint32_t                    tf_data;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__SET_SCHEDULING_CONFIG {
+	struct {
+		union MES_API_HEADER	header;
+		/* Grace period when preempting another priority band for this
+		 * priority band. The value for idle priority band is ignored,
+		 * as it never preempts other bands.
+		 */
+		uint64_t		grace_period_other_levels[AMD_PRIORITY_NUM_LEVELS];
+		/* Default quantum for scheduling across processes within
+		 * a priority band.
+		 */
+		uint64_t		process_quantum_for_level[AMD_PRIORITY_NUM_LEVELS];
+		/* Default grace period for processes that preempt each other
+		 * within a priority band.
+		 */
+		uint64_t		process_grace_period_same_level[AMD_PRIORITY_NUM_LEVELS];
+		/* For normal level this field specifies the target GPU
+		 * percentage in situations when it's starved by the high level.
+		 * Valid values are between 0 and 50, with the default being 10.
+		 */
+		uint32_t		normal_yield_percent;
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__PERFORM_YIELD {
+	struct {
+		union MES_API_HEADER	header;
+		uint32_t		dummy;
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__CHANGE_GANG_PRIORITY_LEVEL {
+	struct {
+		union MES_API_HEADER		header;
+		uint32_t			inprocess_gang_priority;
+		enum MES_AMD_PRIORITY_LEVEL	gang_global_priority_level;
+		uint64_t			gang_quantum;
+		uint64_t			gang_context_addr;
+		struct MES_API_STATUS		api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__SUSPEND {
+	struct {
+		union MES_API_HEADER	header;
+		/* false - suspend all gangs; true - specific gang */
+		struct {
+			uint32_t suspend_all_gangs	: 1;
+			uint32_t reserved		: 31;
+		};
+		/* gang_context_addr is valid only if suspend_all = false */
+		uint64_t		gang_context_addr;
+
+		uint64_t		suspend_fence_addr;
+		uint32_t		suspend_fence_value;
+
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__RESUME {
+	struct {
+		union MES_API_HEADER	header;
+		/* false - resume all gangs; true - specified gang */
+		struct {
+			uint32_t resume_all_gangs	: 1;
+			uint32_t reserved		: 31;
+		};
+		/* valid only if resume_all_gangs = false */
+		uint64_t		gang_context_addr;
+
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__RESET {
+	struct {
+		union MES_API_HEADER		header;
+
+		struct {
+			/* Only reset the queue given by doorbell_offset (not entire gang) */
+			uint32_t                reset_queue_only : 1;
+			/* Hang detection first then reset any queues that are hung */
+			uint32_t                hang_detect_then_reset : 1;
+			/* Only do hang detection (no reset) */
+			uint32_t                hang_detect_only : 1;
+			/* Rest HP and LP kernel queues not managed by MES */
+			uint32_t                reset_legacy_gfx : 1;
+			uint32_t                reserved : 28;
+		};
+
+		uint64_t			gang_context_addr;
+
+		/* valid only if reset_queue_only = true */
+		uint32_t			doorbell_offset;
+
+		/* valid only if hang_detect_then_reset = true */
+		uint64_t			doorbell_offset_addr;
+		enum MES_QUEUE_TYPE		queue_type;
+
+		/* valid only if reset_legacy_gfx = true */
+		uint32_t			pipe_id_lp;
+		uint32_t			queue_id_lp;
+		uint32_t			vmid_id_lp;
+		uint64_t			mqd_mc_addr_lp;
+		uint32_t			doorbell_offset_lp;
+		uint64_t			wptr_addr_lp;
+
+		uint32_t			pipe_id_hp;
+		uint32_t			queue_id_hp;
+		uint32_t			vmid_id_hp;
+		uint64_t			mqd_mc_addr_hp;
+		uint32_t			doorbell_offset_hp;
+		uint64_t			wptr_addr_hp;
+
+		struct MES_API_STATUS		api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__SET_LOGGING_BUFFER {
+	struct {
+		union MES_API_HEADER	header;
+		/* There are separate log buffers for each queue type */
+		enum MES_QUEUE_TYPE	log_type;
+		/* Log buffer GPU Address */
+		uint64_t		logging_buffer_addr;
+		/* number of entries in the log buffer */
+		uint32_t		number_of_entries;
+		/* Entry index at which CPU interrupt needs to be signalled */
+		uint32_t		interrupt_entry;
+
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__QUERY_MES_STATUS {
+	struct {
+		union MES_API_HEADER	header;
+		bool			mes_healthy; /* 0 - not healthy, 1 - healthy */
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__PROGRAM_GDS {
+	struct {
+		union MES_API_HEADER	header;
+		uint64_t		process_context_addr;
+		uint32_t		gds_base;
+		uint32_t		gds_size;
+		uint32_t		gws_base;
+		uint32_t		gws_size;
+		uint32_t		oa_mask;
+		struct MES_API_STATUS	api_status;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__SET_DEBUG_VMID {
+	struct {
+		union MES_API_HEADER	header;
+		struct MES_API_STATUS	api_status;
+		union {
+			struct {
+				uint32_t use_gds	: 1;
+				uint32_t operation      : 2;
+				uint32_t reserved       : 29;
+			} flags;
+			uint32_t	u32All;
+		};
+		uint32_t		reserved;
+		uint32_t		debug_vmid;
+		uint64_t		process_context_addr;
+		uint64_t		page_table_base_addr;
+		uint64_t		process_va_start;
+		uint64_t		process_va_end;
+		uint32_t		gds_base;
+		uint32_t		gds_size;
+		uint32_t		gws_base;
+		uint32_t		gws_size;
+		uint32_t		oa_mask;
+
+		/* output addr of the acquired vmid value */
+		uint64_t                output_addr;
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+enum MESAPI_MISC_OPCODE {
+	MESAPI_MISC__MODIFY_REG,
+	MESAPI_MISC__INV_GART,
+	MESAPI_MISC__QUERY_STATUS,
+	MESAPI_MISC__MAX,
+};
+
+enum MODIFY_REG_SUBCODE {
+	MODIFY_REG__OVERWRITE,
+	MODIFY_REG__RMW_OR,
+	MODIFY_REG__RMW_AND,
+	MODIFY_REG__MAX,
+};
+
+enum { MISC_DATA_MAX_SIZE_IN_DWORDS = 20 };
+
+struct MODIFY_REG {
+	enum MODIFY_REG_SUBCODE   subcode;
+	uint32_t                  reg_offset;
+	uint32_t                  reg_value;
+};
+
+struct INV_GART {
+	uint64_t                  inv_range_va_start;
+	uint64_t                  inv_range_size;
+};
+
+struct QUERY_STATUS {
+	uint32_t context_id;
+};
+
+union MESAPI__MISC {
+	struct {
+		union MES_API_HEADER	header;
+		enum MESAPI_MISC_OPCODE	opcode;
+		struct MES_API_STATUS	api_status;
+
+		union {
+			struct		MODIFY_REG modify_reg;
+			struct		INV_GART inv_gart;
+			struct		QUERY_STATUS query_status;
+			uint32_t	data[MISC_DATA_MAX_SIZE_IN_DWORDS];
+		};
+	};
+
+	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI__UPDATE_ROOT_PAGE_TABLE {
+	struct {
+		union MES_API_HEADER        header;
+		uint64_t                    page_table_base_addr;
+		uint64_t                    process_context_addr;
+		struct MES_API_STATUS       api_status;
+	};
+
+	uint32_t max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+union MESAPI_AMD_LOG {
+	struct {
+		union MES_API_HEADER        header;
+		uint64_t                    p_buffer_memory;
+		uint64_t                    p_buffer_size_used;
+		struct MES_API_STATUS       api_status;
+	};
+
+	uint32_t max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
+};
+
+#pragma pack(pop)
+#endif
-- 
2.35.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7370B6553E9
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Dec 2022 20:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC7710E216;
	Fri, 23 Dec 2022 19:37:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1103E10E223
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Dec 2022 19:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoqXsC94pkj/ITFfxTNDPNIXkCWDkMHNafiP6wHr5UtnWq/v8g6x4ceSA4vIulQcLgWbcA7/NbC0bDnO2cJDSe78J8QhMUsqMDvCGDFLMhcGRfcp3Ykaqa3zT7dKdNFVzMUrAwnkLSrof7ugLPa8EIb4wuzunE09sl16/SpbSGAk6iUMCFGBg1EYAosvQGH3hP4FuTt84Az4JPFvtrqYzn0OQv0GltYRiGPNsCx/bO+GJwUM+ML6k5ZDsO6z+HgEaxj3Aq3ImfiamDRk4ZHWicIFL3wVLFPOE1Ls9DnHrzivFqTFr0DXlzAKxpTG1wE4xu51FJgsF29okh8yySA6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhcw8zPdGn18lmH+jpkLMqDt1g8TQO6J7uhhjZtecZ0=;
 b=RS4WqXk08ZcXscKXHxtC+8aYiyKiby6/daNACFYLSR6eePFVTYzgu7ffzZSIqnLo6pxv4+WGDoEsGFVs/1pHftbwXiWCVmXcolVYJOb+vtLq7HTTrLNEB7traRXa79Vur6YNio5s8O1nbKXofHHUySKaf+kqNPFvWYb5ye4PxtsUG7hBd4z+pZ2j1dT9MzDh63McA4xY3FIoK2njGKPKjQn/SqL7Df9lsFyHR+80QLKIAnXAITTwNuevN36K1naXPep8QkQi7pdqSNAbhTJorGPSaOWJy/7vIlQnVevV29M4FPy5qtYM3i695L+Q9/IJzLCOMJBLGgBHqD+vgoIJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhcw8zPdGn18lmH+jpkLMqDt1g8TQO6J7uhhjZtecZ0=;
 b=uas9esYosQ3TlwLEPa++A1P21DyPvyDfH7bvq7IzguFnRXDmCbm0o0AaxRzL+IUnNfBYVDWfXEfe7HsiuR10jMnwZbjGINxhErubI7WwwtuSI2T87jJUlk2NeKIJp1xuzYFQZhcJQnIlq4Y0awmPAceKkNDia0jpgr3ziwYPsq0=
Received: from MW2PR2101CA0032.namprd21.prod.outlook.com (2603:10b6:302:1::45)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13; Fri, 23 Dec
 2022 19:37:30 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::22) by MW2PR2101CA0032.outlook.office365.com
 (2603:10b6:302:1::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.9 via Frontend
 Transport; Fri, 23 Dec 2022 19:37:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.14 via Frontend Transport; Fri, 23 Dec 2022 19:37:29 +0000
Received: from MUN-L-SHSHARMA.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 23 Dec
 2022 13:37:26 -0600
From: Shashank Sharma <shashank.sharma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [RFC 3/7] drm/amdgpu: Create MQD for userspace queue
Date: Fri, 23 Dec 2022 20:36:51 +0100
Message-ID: <20221223193655.1972-4-shashank.sharma@amd.com>
X-Mailer: git-send-email 2.38.0.windows.1
In-Reply-To: <20221223193655.1972-1-shashank.sharma@amd.com>
References: <20221223193655.1972-1-shashank.sharma@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 23aa4a7d-0306-441d-7e69-08dae51d210f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUmQ63h5rSIM/mWI4Cs94y+qPiLYjPVgQm50C7pzvooY/JblZEjmRdNpTYC7xhGwL7OVEvRiagdsGKp04AXoIF2cjiIz917fG3cxkDw5UdN82xl9i4v2FRdg+Jf9tzT7IIoTJ+39dYvQ90tG8AtYHxJovUSX2bZK8FApSUkeAOl43RTWqJnGZ3fecRQax0tH64x21IqjgHv627WfVO1o2bjW9tZZOFiLSPcli2icEgB7ibINtny/1ZL2W1XdXrIGlO2Cg3opRMn7tXKsHfyZCfmYiFZZaED00mv8T1QxWxb9IBDDygmlh4+jcN0UgjK7Y8b5E8Y5vefnHypGAMdY0orGXqofJI7zAV4JW4oZj7LTqhxnElxbOIy58m1kIPKrvcveMs3Yc2TtJZj2b88XhUT3CHSk03Q4Y39o8WKRgoUZ2Iw4SrJrkzGYCNL85E6q0gXIWmRS+KKvxB/syYOKbcM9wPBBkmA8s8+QDYHAVsugMDV8WKKPOdz8LgRqXI2XGTMfzC2DnGlRhyTaZjxxcceOtVAqt1V+7CmQRJaSy9VTnHibkG/jFpcW4SnSYltj+qlfWSdt/ZBwueIKV18Rwo4u0yZ+M9fplxNK4Oe1xVbXqhBc+qoZOD2Ntky2fso1lBG3bAYiBRrUbz2EmzsisIG2S1eTzG4fJ7WkKP5vwDxKcmW4s4SYxyfKDx5wYDYLcvKXDukfO59kloXDJXNw5ds5g7+0GNGBAnovAmRi9jg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(8936002)(5660300002)(66899015)(30864003)(6916009)(316002)(41300700001)(70206006)(70586007)(4326008)(8676002)(36756003)(478600001)(6666004)(81166007)(82740400003)(7696005)(356005)(82310400005)(26005)(186003)(16526019)(426003)(36860700001)(47076005)(44832011)(40460700003)(86362001)(40480700001)(2616005)(336012)(1076003)(83380400001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 19:37:29.6103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23aa4a7d-0306-441d-7e69-08dae51d210f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433
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
 Shashank Sharma <shashank.sharma@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, arvind.yadav@amd.com,
 arunpravin.paneerselvam@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Arvind Yadav <arvind.yadav@amd.com>

MQD describes the properies of a user queue to the HW, and allows it to
accurately configure the queue while mapping it in GPU HW. This patch
adds:
- A new header file which contains the MQD definition
- A new function which creates an MQD object and fills it with userqueue
  data

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Arvind Yadav <arvind.yadav@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 138 +++++
 .../amd/include/amdgpu_usermode_queue_mqd.h   | 544 ++++++++++++++++++
 2 files changed, 682 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_usermode_queue_mqd.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
index 3b6e8f75495c..a91cc304cb9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
@@ -25,7 +25,10 @@
 #include "amdgpu_vm.h"
 #include "amdgpu_mes.h"
 #include "amdgpu_usermode_queue.h"
+#include "amdgpu_usermode_queue_mqd.h"
 #include "soc15_common.h"
+#include "gc/gc_11_0_0_offset.h"
+#include "gc/gc_11_0_0_sh_mask.h"
 
 #define CHECK_ACCESS(a) (access_ok((const void __user *)a, sizeof(__u64)))
 
@@ -47,6 +50,134 @@ amdgpu_userqueue_remove_index(struct amdgpu_device *adev, struct amdgpu_usermode
     ida_simple_remove(&uqg->ida, queue->queue_id);
 }
 
+static void
+amdgpu_userqueue_setup_mqd(struct amdgpu_device *adev, struct amdgpu_usermode_queue *queue)
+{
+    struct amdgpu_usermode_queue_mqd *mqd = queue->mqd_cpu_ptr;
+    uint64_t hqd_gpu_addr, wb_gpu_addr;
+    uint32_t tmp;
+    uint32_t rb_bufsz;
+
+    /* set up gfx hqd wptr */
+    mqd->cp_gfx_hqd_wptr = 0;
+    mqd->cp_gfx_hqd_wptr_hi = 0;
+
+    /* set the pointer to the MQD */
+    mqd->cp_mqd_base_addr = queue->mqd_gpu_addr & 0xfffffffc;
+    mqd->cp_mqd_base_addr_hi = upper_32_bits(queue->mqd_gpu_addr);
+
+    /* set up mqd control */
+    tmp = RREG32_SOC15(GC, 0, regCP_GFX_MQD_CONTROL);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_MQD_CONTROL, VMID, 0);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_MQD_CONTROL, PRIV_STATE, 1);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_MQD_CONTROL, CACHE_POLICY, 0);
+    mqd->cp_gfx_mqd_control = tmp;
+
+    /* set up gfx_hqd_vimd with 0x0 to indicate the ring buffer's vmid */
+    tmp = RREG32_SOC15(GC, 0, regCP_GFX_HQD_VMID);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_HQD_VMID, VMID, 0);
+    mqd->cp_gfx_hqd_vmid = 0;
+
+    /* set up default queue priority level
+    * 0x0 = low priority, 0x1 = high priority */
+    tmp = RREG32_SOC15(GC, 0, regCP_GFX_HQD_QUEUE_PRIORITY);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_HQD_QUEUE_PRIORITY, PRIORITY_LEVEL, 0);
+    mqd->cp_gfx_hqd_queue_priority = tmp;
+
+    /* set up time quantum */
+    tmp = RREG32_SOC15(GC, 0, regCP_GFX_HQD_QUANTUM);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_HQD_QUANTUM, QUANTUM_EN, 1);
+    mqd->cp_gfx_hqd_quantum = tmp;
+
+    /* set up gfx hqd base. this is similar as CP_RB_BASE */
+    hqd_gpu_addr = queue->queue_gpu_addr >> 8;
+    mqd->cp_gfx_hqd_base = hqd_gpu_addr;
+    mqd->cp_gfx_hqd_base_hi = upper_32_bits(hqd_gpu_addr);
+
+    /* set up hqd_rptr_addr/_hi, similar as CP_RB_RPTR */
+    wb_gpu_addr = queue->rptr_gpu_addr;
+    mqd->cp_gfx_hqd_rptr_addr = wb_gpu_addr & 0xfffffffc;
+    mqd->cp_gfx_hqd_rptr_addr_hi =
+    upper_32_bits(wb_gpu_addr) & 0xffff;
+
+    /* set up rb_wptr_poll addr */
+    wb_gpu_addr = queue->wptr_gpu_addr;
+    mqd->cp_rb_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffffc;
+    mqd->cp_rb_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
+
+    /* set up the gfx_hqd_control, similar as CP_RB0_CNTL */
+    rb_bufsz = order_base_2(queue->queue_size / 4) - 1;
+    tmp = RREG32_SOC15(GC, 0, regCP_GFX_HQD_CNTL);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_HQD_CNTL, RB_BUFSZ, rb_bufsz);
+    tmp = REG_SET_FIELD(tmp, CP_GFX_HQD_CNTL, RB_BLKSZ, rb_bufsz - 2);
+#ifdef __BIG_ENDIAN
+    tmp = REG_SET_FIELD(tmp, CP_GFX_HQD_CNTL, BUF_SWAP, 1);
+#endif
+    mqd->cp_gfx_hqd_cntl = tmp;
+
+    /* set up cp_doorbell_control */
+    tmp = RREG32_SOC15(GC, 0, regCP_RB_DOORBELL_CONTROL);
+    if (queue->use_doorbell) {
+        tmp = REG_SET_FIELD(tmp, CP_RB_DOORBELL_CONTROL,
+                    DOORBELL_OFFSET, queue->doorbell_index);
+        tmp = REG_SET_FIELD(tmp, CP_RB_DOORBELL_CONTROL,
+                    DOORBELL_EN, 1);
+    } else {
+        tmp = REG_SET_FIELD(tmp, CP_RB_DOORBELL_CONTROL,
+                    DOORBELL_EN, 0);
+    }
+    mqd->cp_rb_doorbell_control = tmp;
+
+    /* reset read and write pointers, similar to CP_RB0_WPTR/_RPTR */
+    mqd->cp_gfx_hqd_rptr = RREG32_SOC15(GC, 0, regCP_GFX_HQD_RPTR);
+
+    /* activate the queue */
+    mqd->cp_gfx_hqd_active = 1;
+}
+
+static int
+amdgpu_userqueue_create_mqd(struct amdgpu_device *adev, struct amdgpu_usermode_queue *queue)
+{
+    int r;
+    int size = sizeof(struct amdgpu_usermode_queue_mqd);
+
+    r = amdgpu_bo_create_kernel(adev, size, PAGE_SIZE,
+                                AMDGPU_GEM_DOMAIN_VRAM,
+                                &queue->mqd_obj,
+                                &queue->mqd_gpu_addr,
+                                &queue->mqd_cpu_ptr);
+    if (r) {
+        DRM_ERROR("Failed to allocate bo for userqueue (%d)", r);
+        return r;
+    }
+
+    memset(queue->mqd_cpu_ptr, 0, size);
+    r = amdgpu_bo_reserve(queue->mqd_obj, false);
+    if (unlikely(r != 0)) {
+        DRM_ERROR("Failed to reserve mqd for userqueue (%d)", r);
+        goto free_mqd;
+    }
+
+    /* Fill MQD with userqueue data */
+    amdgpu_userqueue_setup_mqd(adev, queue);
+    amdgpu_bo_unreserve(queue->mqd_obj);
+    return 0;
+
+free_mqd:
+    amdgpu_bo_free_kernel(&queue->mqd_obj,
+			    &queue->mqd_gpu_addr,
+			    &queue->mqd_cpu_ptr);
+    return r;
+}
+
+static void
+amdgpu_userqueue_destroy_mqd(struct amdgpu_usermode_queue *queue)
+{
+    amdgpu_bo_free_kernel(&queue->mqd_obj,
+			    &queue->mqd_gpu_addr,
+			    &queue->mqd_cpu_ptr);
+}
+
 static int
 amdgpu_userqueue_validate_input(struct amdgpu_device *adev, struct drm_amdgpu_userq_mqd *mqd_in)
 {
@@ -120,6 +251,12 @@ int amdgpu_userqueue_create(struct amdgpu_device *adev, struct drm_file *filp,
     queue->flags = mqd_in->flags;
     queue->queue_id = amdgpu_userqueue_index(adev);
 
+    r = amdgpu_userqueue_create_mqd(adev, queue);
+    if (r < 0) {
+        DRM_ERROR("Failed to create mqd for queue\n");
+        goto free_queue;
+    }
+
     ctx->userq = queue;
     args->out.q_id = queue->queue_id;
     args->out.flags = 0;
@@ -141,6 +278,7 @@ void amdgpu_userqueue_destroy(struct amdgpu_device *adev, struct drm_file *filp,
     struct amdgpu_usermode_queue *queue = ctx->userq;
 
     mutex_lock(&adev->userq.userq_mutex);
+    amdgpu_userqueue_destroy_mqd(queue);
     amdgpu_userqueue_remove_index(adev, queue);
     ctx->userq = NULL;
     mutex_unlock(&adev->userq.userq_mutex);
diff --git a/drivers/gpu/drm/amd/include/amdgpu_usermode_queue_mqd.h b/drivers/gpu/drm/amd/include/amdgpu_usermode_queue_mqd.h
new file mode 100644
index 000000000000..d0a285708ba5
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/amdgpu_usermode_queue_mqd.h
@@ -0,0 +1,544 @@
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
+#ifndef AMDGPU_USERMODE_QUEUE_MQD_H_
+#define AMDGPU_USERMODE_QUEUE_MQD_H_
+
+/*MQD struct for usermode Queue*/
+struct amdgpu_usermode_queue_mqd
+{
+	uint32_t shadow_base_lo; // offset: 0  (0x0)
+	uint32_t shadow_base_hi; // offset: 1  (0x1)
+	uint32_t gds_bkup_base_lo ; // offset: 2  (0x2)
+	uint32_t gds_bkup_base_hi ; // offset: 3  (0x3)
+	uint32_t fw_work_area_base_lo; // offset: 4  (0x4)
+	uint32_t fw_work_area_base_hi; // offset: 5  (0x5)
+	uint32_t shadow_initialized; // offset: 6  (0x6)
+	uint32_t ib_vmid; // offset: 7  (0x7)
+	uint32_t reserved_8; // offset: 8  (0x8)
+	uint32_t reserved_9; // offset: 9  (0x9)
+	uint32_t reserved_10; // offset: 10  (0xA)
+	uint32_t reserved_11; // offset: 11  (0xB)
+	uint32_t reserved_12; // offset: 12  (0xC)
+	uint32_t reserved_13; // offset: 13  (0xD)
+	uint32_t reserved_14; // offset: 14  (0xE)
+	uint32_t reserved_15; // offset: 15  (0xF)
+	uint32_t reserved_16; // offset: 16  (0x10)
+	uint32_t reserved_17; // offset: 17  (0x11)
+	uint32_t reserved_18; // offset: 18  (0x12)
+	uint32_t reserved_19; // offset: 19  (0x13)
+	uint32_t reserved_20; // offset: 20  (0x14)
+	uint32_t reserved_21; // offset: 21  (0x15)
+	uint32_t reserved_22; // offset: 22  (0x16)
+	uint32_t reserved_23; // offset: 23  (0x17)
+	uint32_t reserved_24; // offset: 24  (0x18)
+	uint32_t reserved_25; // offset: 25  (0x19)
+	uint32_t reserved_26; // offset: 26  (0x1A)
+	uint32_t reserved_27; // offset: 27  (0x1B)
+	uint32_t reserved_28; // offset: 28  (0x1C)
+	uint32_t reserved_29; // offset: 29  (0x1D)
+	uint32_t reserved_30; // offset: 30  (0x1E)
+	uint32_t reserved_31; // offset: 31  (0x1F)
+	uint32_t reserved_32; // offset: 32  (0x20)
+	uint32_t reserved_33; // offset: 33  (0x21)
+	uint32_t reserved_34; // offset: 34  (0x22)
+	uint32_t reserved_35; // offset: 35  (0x23)
+	uint32_t reserved_36; // offset: 36  (0x24)
+	uint32_t reserved_37; // offset: 37  (0x25)
+	uint32_t reserved_38; // offset: 38  (0x26)
+	uint32_t reserved_39; // offset: 39  (0x27)
+	uint32_t reserved_40; // offset: 40  (0x28)
+	uint32_t reserved_41; // offset: 41  (0x29)
+	uint32_t reserved_42; // offset: 42  (0x2A)
+	uint32_t reserved_43; // offset: 43  (0x2B)
+	uint32_t reserved_44; // offset: 44  (0x2C)
+	uint32_t reserved_45; // offset: 45  (0x2D)
+	uint32_t reserved_46; // offset: 46  (0x2E)
+	uint32_t reserved_47; // offset: 47  (0x2F)
+	uint32_t reserved_48; // offset: 48  (0x30)
+	uint32_t reserved_49; // offset: 49  (0x31)
+	uint32_t reserved_50; // offset: 50  (0x32)
+	uint32_t reserved_51; // offset: 51  (0x33)
+	uint32_t reserved_52; // offset: 52  (0x34)
+	uint32_t reserved_53; // offset: 53  (0x35)
+	uint32_t reserved_54; // offset: 54  (0x36)
+	uint32_t reserved_55; // offset: 55  (0x37)
+	uint32_t reserved_56; // offset: 56  (0x38)
+	uint32_t reserved_57; // offset: 57  (0x39)
+	uint32_t reserved_58; // offset: 58  (0x3A)
+	uint32_t reserved_59; // offset: 59  (0x3B)
+	uint32_t reserved_60; // offset: 60  (0x3C)
+	uint32_t reserved_61; // offset: 61  (0x3D)
+	uint32_t reserved_62; // offset: 62  (0x3E)
+	uint32_t reserved_63; // offset: 63  (0x3F)
+	uint32_t reserved_64; // offset: 64  (0x40)
+	uint32_t reserved_65; // offset: 65  (0x41)
+	uint32_t reserved_66; // offset: 66  (0x42)
+	uint32_t reserved_67; // offset: 67  (0x43)
+	uint32_t reserved_68; // offset: 68  (0x44)
+	uint32_t reserved_69; // offset: 69  (0x45)
+	uint32_t reserved_70; // offset: 70  (0x46)
+	uint32_t reserved_71; // offset: 71  (0x47)
+	uint32_t reserved_72; // offset: 72  (0x48)
+	uint32_t reserved_73; // offset: 73  (0x49)
+	uint32_t reserved_74; // offset: 74  (0x4A)
+	uint32_t reserved_75; // offset: 75  (0x4B)
+	uint32_t reserved_76; // offset: 76  (0x4C)
+	uint32_t reserved_77; // offset: 77  (0x4D)
+	uint32_t reserved_78; // offset: 78  (0x4E)
+	uint32_t reserved_79; // offset: 79  (0x4F)
+	uint32_t reserved_80; // offset: 80  (0x50)
+	uint32_t reserved_81; // offset: 81  (0x51)
+	uint32_t reserved_82; // offset: 82  (0x52)
+	uint32_t reserved_83; // offset: 83  (0x53)
+	uint32_t checksum_lo; // offset: 84  (0x54)
+	uint32_t checksum_hi; // offset: 85  (0x55)
+	uint32_t cp_mqd_query_time_lo; // offset: 86  (0x56)
+	uint32_t cp_mqd_query_time_hi; // offset: 87  (0x57)
+	uint32_t reserved_88; // offset: 88  (0x58)
+	uint32_t reserved_89; // offset: 89  (0x59)
+	uint32_t reserved_90; // offset: 90  (0x5A)
+	uint32_t reserved_91; // offset: 91  (0x5B)
+	uint32_t cp_mqd_query_wave_count; // offset: 92  (0x5C)
+	uint32_t cp_mqd_query_gfx_hqd_rptr; // offset: 93  (0x5D)
+	uint32_t cp_mqd_query_gfx_hqd_wptr; // offset: 94  (0x5E)
+	uint32_t cp_mqd_query_gfx_hqd_offset; // offset: 95  (0x5F)
+	uint32_t reserved_96; // offset: 96  (0x60)
+	uint32_t reserved_97; // offset: 97  (0x61)
+	uint32_t reserved_98; // offset: 98  (0x62)
+	uint32_t reserved_99; // offset: 99  (0x63)
+	uint32_t reserved_100; // offset: 100  (0x64)
+	uint32_t reserved_101; // offset: 101  (0x65)
+	uint32_t reserved_102; // offset: 102  (0x66)
+	uint32_t reserved_103; // offset: 103  (0x67)
+	uint32_t task_shader_control_buf_addr_lo; // offset: 104  (0x68)
+	uint32_t task_shader_control_buf_addr_hi; // offset: 105  (0x69)
+	uint32_t task_shader_read_rptr_lo; // offset: 106  (0x6A)
+	uint32_t task_shader_read_rptr_hi; // offset: 107  (0x6B)
+	uint32_t task_shader_num_entries; // offset: 108  (0x6C)
+	uint32_t task_shader_num_entries_bits; // offset: 109  (0x6D)
+	uint32_t task_shader_ring_buffer_addr_lo; // offset: 110  (0x6E)
+	uint32_t task_shader_ring_buffer_addr_hi; // offset: 111  (0x6F)
+	uint32_t reserved_112; // offset: 112  (0x70)
+	uint32_t reserved_113; // offset: 113  (0x71)
+	uint32_t reserved_114; // offset: 114  (0x72)
+	uint32_t reserved_115; // offset: 115  (0x73)
+	uint32_t reserved_116; // offset: 116  (0x74)
+	uint32_t reserved_117; // offset: 117  (0x75)
+	uint32_t reserved_118; // offset: 118  (0x76)
+	uint32_t reserved_119; // offset: 119  (0x77)
+	uint32_t reserved_120; // offset: 120  (0x78)
+	uint32_t reserved_121; // offset: 121  (0x79)
+	uint32_t reserved_122; // offset: 122  (0x7A)
+	uint32_t reserved_123; // offset: 123  (0x7B)
+	uint32_t reserved_124; // offset: 124  (0x7C)
+	uint32_t reserved_125; // offset: 125  (0x7D)
+	uint32_t reserved_126; // offset: 126  (0x7E)
+	uint32_t reserved_127; // offset: 127  (0x7F)
+	uint32_t cp_mqd_base_addr; // offset: 128  (0x80)
+	uint32_t cp_mqd_base_addr_hi; // offset: 129  (0x81)
+	uint32_t cp_gfx_hqd_active; // offset: 130  (0x82)
+	uint32_t cp_gfx_hqd_vmid; // offset: 131  (0x83)
+	uint32_t reserved_131; // offset: 132  (0x84)
+	uint32_t reserved_132; // offset: 133  (0x85)
+	uint32_t cp_gfx_hqd_queue_priority; // offset: 134  (0x86)
+	uint32_t cp_gfx_hqd_quantum; // offset: 135  (0x87)
+	uint32_t cp_gfx_hqd_base; // offset: 136  (0x88)
+	uint32_t cp_gfx_hqd_base_hi; // offset: 137  (0x89)
+	uint32_t cp_gfx_hqd_rptr; // offset: 138  (0x8A)
+	uint32_t cp_gfx_hqd_rptr_addr; // offset: 139  (0x8B)
+	uint32_t cp_gfx_hqd_rptr_addr_hi; // offset: 140  (0x8C)
+	uint32_t cp_rb_wptr_poll_addr_lo; // offset: 141  (0x8D)
+	uint32_t cp_rb_wptr_poll_addr_hi; // offset: 142  (0x8E)
+	uint32_t cp_rb_doorbell_control; // offset: 143  (0x8F)
+	uint32_t cp_gfx_hqd_offset; // offset: 144  (0x90)
+	uint32_t cp_gfx_hqd_cntl; // offset: 145  (0x91)
+	uint32_t reserved_146; // offset: 146  (0x92)
+	uint32_t reserved_147; // offset: 147  (0x93)
+	uint32_t cp_gfx_hqd_csmd_rptr; // offset: 148  (0x94)
+	uint32_t cp_gfx_hqd_wptr; // offset: 149  (0x95)
+	uint32_t cp_gfx_hqd_wptr_hi; // offset: 150  (0x96)
+	uint32_t reserved_151; // offset: 151  (0x97)
+	uint32_t reserved_152; // offset: 152  (0x98)
+	uint32_t reserved_153; // offset: 153  (0x99)
+	uint32_t reserved_154; // offset: 154  (0x9A)
+	uint32_t reserved_155; // offset: 155  (0x9B)
+	uint32_t cp_gfx_hqd_mapped; // offset: 156  (0x9C)
+	uint32_t cp_gfx_hqd_que_mgr_control; // offset: 157  (0x9D)
+	uint32_t reserved_158; // offset: 158  (0x9E)
+	uint32_t reserved_159; // offset: 159  (0x9F)
+	uint32_t cp_gfx_hqd_hq_status0; // offset: 160  (0xA0)
+	uint32_t cp_gfx_hqd_hq_control0; // offset: 161  (0xA1)
+	uint32_t cp_gfx_mqd_control; // offset: 162  (0xA2)
+	uint32_t reserved_163; // offset: 163  (0xA3)
+	uint32_t reserved_164; // offset: 164  (0xA4)
+	uint32_t reserved_165; // offset: 165  (0xA5)
+	uint32_t reserved_166; // offset: 166  (0xA6)
+	uint32_t reserved_167; // offset: 167  (0xA7)
+	uint32_t reserved_168; // offset: 168  (0xA8)
+	uint32_t reserved_169; // offset: 169  (0xA9)
+	uint32_t cp_num_prim_needed_count0_lo; // offset: 170  (0xAA)
+	uint32_t cp_num_prim_needed_count0_hi; // offset: 171  (0xAB)
+	uint32_t cp_num_prim_needed_count1_lo; // offset: 172  (0xAC)
+	uint32_t cp_num_prim_needed_count1_hi; // offset: 173  (0xAD)
+	uint32_t cp_num_prim_needed_count2_lo; // offset: 174  (0xAE)
+	uint32_t cp_num_prim_needed_count2_hi; // offset: 175  (0xAF)
+	uint32_t cp_num_prim_needed_count3_lo; // offset: 176  (0xB0)
+	uint32_t cp_num_prim_needed_count3_hi; // offset: 177  (0xB1)
+	uint32_t cp_num_prim_written_count0_lo; // offset: 178  (0xB2)
+	uint32_t cp_num_prim_written_count0_hi; // offset: 179  (0xB3)
+	uint32_t cp_num_prim_written_count1_lo; // offset: 180  (0xB4)
+	uint32_t cp_num_prim_written_count1_hi; // offset: 181  (0xB5)
+	uint32_t cp_num_prim_written_count2_lo; // offset: 182  (0xB6)
+	uint32_t cp_num_prim_written_count2_hi; // offset: 183  (0xB7)
+	uint32_t cp_num_prim_written_count3_lo; // offset: 184  (0xB8)
+	uint32_t cp_num_prim_written_count3_hi; // offset: 185  (0xB9)
+	uint32_t reserved_186; // offset: 186  (0xBA)
+	uint32_t reserved_187; // offset: 187  (0xBB)
+	uint32_t reserved_188; // offset: 188  (0xBC)
+	uint32_t reserved_189; // offset: 189  (0xBD)
+	uint32_t reserved_190; // offset: 190  (0xBE)
+	uint32_t reserved_191; // offset: 191  (0xBF)
+	uint32_t reserved_192; // offset: 192  (0xC0)
+	uint32_t reserved_193; // offset: 193  (0xC1)
+	uint32_t reserved_194; // offset: 194  (0xC2)
+	uint32_t reserved_195; // offset: 195  (0xC3)
+	uint32_t reserved_196; // offset: 196  (0xC4)
+	uint32_t reserved_197; // offset: 197  (0xC5)
+	uint32_t reserved_198; // offset: 198  (0xC6)
+	uint32_t reserved_199; // offset: 199  (0xC7)
+	uint32_t reserved_200; // offset: 200  (0xC8)
+	uint32_t reserved_201; // offset: 201  (0xC9)
+	uint32_t reserved_202; // offset: 202  (0xCA)
+	uint32_t reserved_203; // offset: 203  (0xCB)
+	uint32_t reserved_204; // offset: 204  (0xCC)
+	uint32_t reserved_205; // offset: 205  (0xCD)
+	uint32_t reserved_206; // offset: 206  (0xCE)
+	uint32_t reserved_207; // offset: 207  (0xCF)
+	uint32_t reserved_208; // offset: 208  (0xD0)
+	uint32_t reserved_209; // offset: 209  (0xD1)
+	uint32_t reserved_210; // offset: 210  (0xD2)
+	uint32_t reserved_211; // offset: 211  (0xD3)
+	uint32_t reserved_212; // offset: 212  (0xD4)
+	uint32_t reserved_213; // offset: 213  (0xD5)
+	uint32_t reserved_214; // offset: 214  (0xD6)
+	uint32_t reserved_215; // offset: 215  (0xD7)
+	uint32_t reserved_216; // offset: 216  (0xD8)
+	uint32_t reserved_217; // offset: 217  (0xD9)
+	uint32_t reserved_218; // offset: 218  (0xDA)
+	uint32_t reserved_219; // offset: 219  (0xDB)
+	uint32_t reserved_220; // offset: 220  (0xDC)
+	uint32_t reserved_221; // offset: 221  (0xDD)
+	uint32_t reserved_222; // offset: 222  (0xDE)
+	uint32_t reserved_223; // offset: 223  (0xDF)
+	uint32_t reserved_224; // offset: 224  (0xE0)
+	uint32_t reserved_225; // offset: 225  (0xE1)
+	uint32_t reserved_226; // offset: 226  (0xE2)
+	uint32_t reserved_227; // offset: 227  (0xE3)
+	uint32_t reserved_228; // offset: 228  (0xE4)
+	uint32_t reserved_229; // offset: 229  (0xE5)
+	uint32_t reserved_230; // offset: 230  (0xE6)
+	uint32_t reserved_231; // offset: 231  (0xE7)
+	uint32_t reserved_232; // offset: 232  (0xE8)
+	uint32_t reserved_233; // offset: 233  (0xE9)
+	uint32_t reserved_234; // offset: 234  (0xEA)
+	uint32_t reserved_235; // offset: 235  (0xEB)
+	uint32_t reserved_236; // offset: 236  (0xEC)
+	uint32_t reserved_237; // offset: 237  (0xED)
+	uint32_t reserved_238; // offset: 238  (0xEE)
+	uint32_t reserved_239; // offset: 239  (0xEF)
+	uint32_t reserved_240; // offset: 240  (0xF0)
+	uint32_t reserved_241; // offset: 241  (0xF1)
+	uint32_t reserved_242; // offset: 242  (0xF2)
+	uint32_t reserved_243; // offset: 243  (0xF3)
+	uint32_t reserved_244; // offset: 244  (0xF4)
+	uint32_t reserved_245; // offset: 245  (0xF5)
+	uint32_t reserved_246; // offset: 246  (0xF6)
+	uint32_t reserved_247; // offset: 247  (0xF7)
+	uint32_t reserved_248; // offset: 248  (0xF8)
+	uint32_t reserved_249; // offset: 249  (0xF9)
+	uint32_t reserved_250; // offset: 250  (0xFA)
+	uint32_t reserved_251; // offset: 251  (0xFB)
+	uint32_t reserved_252; // offset: 252  (0xFC)
+	uint32_t reserved_253; // offset: 253  (0xFD)
+	uint32_t reserved_254; // offset: 254  (0xFE)
+	uint32_t reserved_255; // offset: 255  (0xFF)
+	uint32_t reserved_256; // offset: 256  (0x100)
+	uint32_t reserved_257; // offset: 257  (0x101)
+	uint32_t reserved_258; // offset: 258  (0x102)
+	uint32_t reserved_259; // offset: 259  (0x103)
+	uint32_t reserved_260; // offset: 260  (0x104)
+	uint32_t reserved_261; // offset: 261  (0x105)
+	uint32_t reserved_262; // offset: 262  (0x106)
+	uint32_t reserved_263; // offset: 263  (0x107)
+	uint32_t reserved_264; // offset: 264  (0x108)
+	uint32_t reserved_265; // offset: 265  (0x109)
+	uint32_t reserved_266; // offset: 266  (0x10A)
+	uint32_t reserved_267; // offset: 267  (0x10B)
+	uint32_t reserved_268; // offset: 268  (0x10C)
+	uint32_t reserved_269; // offset: 269  (0x10D)
+	uint32_t reserved_270; // offset: 270  (0x10E)
+	uint32_t reserved_271; // offset: 271  (0x10F)
+	uint32_t reserved_272; // offset: 272  (0x110)
+	uint32_t reserved_273; // offset: 273  (0x111)
+	uint32_t reserved_274; // offset: 274  (0x112)
+	uint32_t reserved_275; // offset: 275  (0x113)
+	uint32_t reserved_276; // offset: 276  (0x114)
+	uint32_t reserved_277; // offset: 277  (0x115)
+	uint32_t reserved_278; // offset: 278  (0x116)
+	uint32_t reserved_279; // offset: 279  (0x117)
+	uint32_t reserved_280; // offset: 280  (0x118)
+	uint32_t reserved_281; // offset: 281  (0x119)
+	uint32_t reserved_282; // offset: 282  (0x11A)
+	uint32_t reserved_283; // offset: 283  (0x11B)
+	uint32_t reserved_284; // offset: 284  (0x11C)
+	uint32_t reserved_285; // offset: 285  (0x11D)
+	uint32_t reserved_286; // offset: 286  (0x11E)
+	uint32_t reserved_287; // offset: 287  (0x11F)
+	uint32_t reserved_288; // offset: 288  (0x120)
+	uint32_t reserved_289; // offset: 289  (0x121)
+	uint32_t reserved_290; // offset: 290  (0x122)
+	uint32_t reserved_291; // offset: 291  (0x123)
+	uint32_t reserved_292; // offset: 292  (0x124)
+	uint32_t reserved_293; // offset: 293  (0x125)
+	uint32_t reserved_294; // offset: 294  (0x126)
+	uint32_t reserved_295; // offset: 295  (0x127)
+	uint32_t reserved_296; // offset: 296  (0x128)
+	uint32_t reserved_297; // offset: 297  (0x129)
+	uint32_t reserved_298; // offset: 298  (0x12A)
+	uint32_t reserved_299; // offset: 299  (0x12B)
+	uint32_t reserved_300; // offset: 300  (0x12C)
+	uint32_t reserved_301; // offset: 301  (0x12D)
+	uint32_t reserved_302; // offset: 302  (0x12E)
+	uint32_t reserved_303; // offset: 303  (0x12F)
+	uint32_t reserved_304; // offset: 304  (0x130)
+	uint32_t reserved_305; // offset: 305  (0x131)
+	uint32_t reserved_306; // offset: 306  (0x132)
+	uint32_t reserved_307; // offset: 307  (0x133)
+	uint32_t reserved_308; // offset: 308  (0x134)
+	uint32_t reserved_309; // offset: 309  (0x135)
+	uint32_t reserved_310; // offset: 310  (0x136)
+	uint32_t reserved_311; // offset: 311  (0x137)
+	uint32_t reserved_312; // offset: 312  (0x138)
+	uint32_t reserved_313; // offset: 313  (0x139)
+	uint32_t reserved_314; // offset: 314  (0x13A)
+	uint32_t reserved_315; // offset: 315  (0x13B)
+	uint32_t reserved_316; // offset: 316  (0x13C)
+	uint32_t reserved_317; // offset: 317  (0x13D)
+	uint32_t reserved_318; // offset: 318  (0x13E)
+	uint32_t reserved_319; // offset: 319  (0x13F)
+	uint32_t reserved_320; // offset: 320  (0x140)
+	uint32_t reserved_321; // offset: 321  (0x141)
+	uint32_t reserved_322; // offset: 322  (0x142)
+	uint32_t reserved_323; // offset: 323  (0x143)
+	uint32_t reserved_324; // offset: 324  (0x144)
+	uint32_t reserved_325; // offset: 325  (0x145)
+	uint32_t reserved_326; // offset: 326  (0x146)
+	uint32_t reserved_327; // offset: 327  (0x147)
+	uint32_t reserved_328; // offset: 328  (0x148)
+	uint32_t reserved_329; // offset: 329  (0x149)
+	uint32_t reserved_330; // offset: 330  (0x14A)
+	uint32_t reserved_331; // offset: 331  (0x14B)
+	uint32_t reserved_332; // offset: 332  (0x14C)
+	uint32_t reserved_333; // offset: 333  (0x14D)
+	uint32_t reserved_334; // offset: 334  (0x14E)
+	uint32_t reserved_335; // offset: 335  (0x14F)
+	uint32_t reserved_336; // offset: 336  (0x150)
+	uint32_t reserved_337; // offset: 337  (0x151)
+	uint32_t reserved_338; // offset: 338  (0x152)
+	uint32_t reserved_339; // offset: 339  (0x153)
+	uint32_t reserved_340; // offset: 340  (0x154)
+	uint32_t reserved_341; // offset: 341  (0x155)
+	uint32_t reserved_342; // offset: 342  (0x156)
+	uint32_t reserved_343; // offset: 343  (0x157)
+	uint32_t reserved_344; // offset: 344  (0x158)
+	uint32_t reserved_345; // offset: 345  (0x159)
+	uint32_t reserved_346; // offset: 346  (0x15A)
+	uint32_t reserved_347; // offset: 347  (0x15B)
+	uint32_t reserved_348; // offset: 348  (0x15C)
+	uint32_t reserved_349; // offset: 349  (0x15D)
+	uint32_t reserved_350; // offset: 350  (0x15E)
+	uint32_t reserved_351; // offset: 351  (0x15F)
+	uint32_t reserved_352; // offset: 352  (0x160)
+	uint32_t reserved_353; // offset: 353  (0x161)
+	uint32_t reserved_354; // offset: 354  (0x162)
+	uint32_t reserved_355; // offset: 355  (0x163)
+	uint32_t reserved_356; // offset: 356  (0x164)
+	uint32_t reserved_357; // offset: 357  (0x165)
+	uint32_t reserved_358; // offset: 358  (0x166)
+	uint32_t reserved_359; // offset: 359  (0x167)
+	uint32_t reserved_360; // offset: 360  (0x168)
+	uint32_t reserved_361; // offset: 361  (0x169)
+	uint32_t reserved_362; // offset: 362  (0x16A)
+	uint32_t reserved_363; // offset: 363  (0x16B)
+	uint32_t reserved_364; // offset: 364  (0x16C)
+	uint32_t reserved_365; // offset: 365  (0x16D)
+	uint32_t reserved_366; // offset: 366  (0x16E)
+	uint32_t reserved_367; // offset: 367  (0x16F)
+	uint32_t reserved_368; // offset: 368  (0x170)
+	uint32_t reserved_369; // offset: 369  (0x171)
+	uint32_t reserved_370; // offset: 370  (0x172)
+	uint32_t reserved_371; // offset: 371  (0x173)
+	uint32_t reserved_372; // offset: 372  (0x174)
+	uint32_t reserved_373; // offset: 373  (0x175)
+	uint32_t reserved_374; // offset: 374  (0x176)
+	uint32_t reserved_375; // offset: 375  (0x177)
+	uint32_t reserved_376; // offset: 376  (0x178)
+	uint32_t reserved_377; // offset: 377  (0x179)
+	uint32_t reserved_378; // offset: 378  (0x17A)
+	uint32_t reserved_379; // offset: 379  (0x17B)
+	uint32_t reserved_380; // offset: 380  (0x17C)
+	uint32_t reserved_381; // offset: 381  (0x17D)
+	uint32_t reserved_382; // offset: 382  (0x17E)
+	uint32_t reserved_383; // offset: 383  (0x17F)
+	uint32_t reserved_384; // offset: 384  (0x180)
+	uint32_t reserved_385; // offset: 385  (0x181)
+	uint32_t reserved_386; // offset: 386  (0x182)
+	uint32_t reserved_387; // offset: 387  (0x183)
+	uint32_t reserved_388; // offset: 388  (0x184)
+	uint32_t reserved_389; // offset: 389  (0x185)
+	uint32_t reserved_390; // offset: 390  (0x186)
+	uint32_t reserved_391; // offset: 391  (0x187)
+	uint32_t reserved_392; // offset: 392  (0x188)
+	uint32_t reserved_393; // offset: 393  (0x189)
+	uint32_t reserved_394; // offset: 394  (0x18A)
+	uint32_t reserved_395; // offset: 395  (0x18B)
+	uint32_t reserved_396; // offset: 396  (0x18C)
+	uint32_t reserved_397; // offset: 397  (0x18D)
+	uint32_t reserved_398; // offset: 398  (0x18E)
+	uint32_t reserved_399; // offset: 399  (0x18F)
+	uint32_t reserved_400; // offset: 400  (0x190)
+	uint32_t reserved_401; // offset: 401  (0x191)
+	uint32_t reserved_402; // offset: 402  (0x192)
+	uint32_t reserved_403; // offset: 403  (0x193)
+	uint32_t reserved_404; // offset: 404  (0x194)
+	uint32_t reserved_405; // offset: 405  (0x195)
+	uint32_t reserved_406; // offset: 406  (0x196)
+	uint32_t reserved_407; // offset: 407  (0x197)
+	uint32_t reserved_408; // offset: 408  (0x198)
+	uint32_t reserved_409; // offset: 409  (0x199)
+	uint32_t reserved_410; // offset: 410  (0x19A)
+	uint32_t reserved_411; // offset: 411  (0x19B)
+	uint32_t reserved_412; // offset: 412  (0x19C)
+	uint32_t reserved_413; // offset: 413  (0x19D)
+	uint32_t reserved_414; // offset: 414  (0x19E)
+	uint32_t reserved_415; // offset: 415  (0x19F)
+	uint32_t reserved_416; // offset: 416  (0x1A0)
+	uint32_t reserved_417; // offset: 417  (0x1A1)
+	uint32_t reserved_418; // offset: 418  (0x1A2)
+	uint32_t reserved_419; // offset: 419  (0x1A3)
+	uint32_t reserved_420; // offset: 420  (0x1A4)
+	uint32_t reserved_421; // offset: 421  (0x1A5)
+	uint32_t reserved_422; // offset: 422  (0x1A6)
+	uint32_t reserved_423; // offset: 423  (0x1A7)
+	uint32_t reserved_424; // offset: 424  (0x1A8)
+	uint32_t reserved_425; // offset: 425  (0x1A9)
+	uint32_t reserved_426; // offset: 426  (0x1AA)
+	uint32_t reserved_427; // offset: 427  (0x1AB)
+	uint32_t reserved_428; // offset: 428  (0x1AC)
+	uint32_t reserved_429; // offset: 429  (0x1AD)
+	uint32_t reserved_430; // offset: 430  (0x1AE)
+	uint32_t reserved_431; // offset: 431  (0x1AF)
+	uint32_t reserved_432; // offset: 432  (0x1B0)
+	uint32_t reserved_433; // offset: 433  (0x1B1)
+	uint32_t reserved_434; // offset: 434  (0x1B2)
+	uint32_t reserved_435; // offset: 435  (0x1B3)
+	uint32_t reserved_436; // offset: 436  (0x1B4)
+	uint32_t reserved_437; // offset: 437  (0x1B5)
+	uint32_t reserved_438; // offset: 438  (0x1B6)
+	uint32_t reserved_439; // offset: 439  (0x1B7)
+	uint32_t reserved_440; // offset: 440  (0x1B8)
+	uint32_t reserved_441; // offset: 441  (0x1B9)
+	uint32_t reserved_442; // offset: 442  (0x1BA)
+	uint32_t reserved_443; // offset: 443  (0x1BB)
+	uint32_t reserved_444; // offset: 444  (0x1BC)
+	uint32_t reserved_445; // offset: 445  (0x1BD)
+	uint32_t reserved_446; // offset: 446  (0x1BE)
+	uint32_t reserved_447; // offset: 447  (0x1BF)
+	uint32_t reserved_448; // offset: 448  (0x1C0)
+	uint32_t reserved_449; // offset: 449  (0x1C1)
+	uint32_t reserved_450; // offset: 450  (0x1C2)
+	uint32_t reserved_451; // offset: 451  (0x1C3)
+	uint32_t reserved_452; // offset: 452  (0x1C4)
+	uint32_t reserved_453; // offset: 453  (0x1C5)
+	uint32_t reserved_454; // offset: 454  (0x1C6)
+	uint32_t reserved_455; // offset: 455  (0x1C7)
+	uint32_t reserved_456; // offset: 456  (0x1C8)
+	uint32_t reserved_457; // offset: 457  (0x1C9)
+	uint32_t reserved_458; // offset: 458  (0x1CA)
+	uint32_t reserved_459; // offset: 459  (0x1CB)
+	uint32_t reserved_460; // offset: 460  (0x1CC)
+	uint32_t reserved_461; // offset: 461  (0x1CD)
+	uint32_t reserved_462; // offset: 462  (0x1CE)
+	uint32_t reserved_463; // offset: 463  (0x1CF)
+	uint32_t reserved_464; // offset: 464  (0x1D0)
+	uint32_t reserved_465; // offset: 465  (0x1D1)
+	uint32_t reserved_466; // offset: 466  (0x1D2)
+	uint32_t reserved_467; // offset: 467  (0x1D3)
+	uint32_t reserved_468; // offset: 468  (0x1D4)
+	uint32_t reserved_469; // offset: 469  (0x1D5)
+	uint32_t reserved_470; // offset: 470  (0x1D6)
+	uint32_t reserved_471; // offset: 471  (0x1D7)
+	uint32_t reserved_472; // offset: 472  (0x1D8)
+	uint32_t reserved_473; // offset: 473  (0x1D9)
+	uint32_t reserved_474; // offset: 474  (0x1DA)
+	uint32_t reserved_475; // offset: 475  (0x1DB)
+	uint32_t reserved_476; // offset: 476  (0x1DC)
+	uint32_t reserved_477; // offset: 477  (0x1DD)
+	uint32_t reserved_478; // offset: 478  (0x1DE)
+	uint32_t reserved_479; // offset: 479  (0x1DF)
+	uint32_t reserved_480; // offset: 480  (0x1E0)
+	uint32_t reserved_481; // offset: 481  (0x1E1)
+	uint32_t reserved_482; // offset: 482  (0x1E2)
+	uint32_t reserved_483; // offset: 483  (0x1E3)
+	uint32_t reserved_484; // offset: 484  (0x1E4)
+	uint32_t reserved_485; // offset: 485  (0x1E5)
+	uint32_t reserved_486; // offset: 486  (0x1E6)
+	uint32_t reserved_487; // offset: 487  (0x1E7)
+	uint32_t reserved_488; // offset: 488  (0x1E8)
+	uint32_t reserved_489; // offset: 489  (0x1E9)
+	uint32_t reserved_490; // offset: 490  (0x1EA)
+	uint32_t reserved_491; // offset: 491  (0x1EB)
+	uint32_t reserved_492; // offset: 492  (0x1EC)
+	uint32_t reserved_493; // offset: 493  (0x1ED)
+	uint32_t reserved_494; // offset: 494  (0x1EE)
+	uint32_t reserved_495; // offset: 495  (0x1EF)
+	uint32_t reserved_496; // offset: 496  (0x1F0)
+	uint32_t reserved_497; // offset: 497  (0x1F1)
+	uint32_t reserved_498; // offset: 498  (0x1F2)
+	uint32_t reserved_499; // offset: 499  (0x1F3)
+	uint32_t reserved_500; // offset: 500  (0x1F4)
+	uint32_t reserved_501; // offset: 501  (0x1F5)
+	uint32_t reserved_502; // offset: 502  (0x1F6)
+	uint32_t reserved_503; // offset: 503  (0x1F7)
+	uint32_t reserved_504; // offset: 504  (0x1F8)
+	uint32_t reserved_505; // offset: 505  (0x1F9)
+	uint32_t reserved_506; // offset: 506  (0x1FA)
+	uint32_t reserved_507; // offset: 507  (0x1FB)
+	uint32_t reserved_508; // offset: 508  (0x1FC)
+	uint32_t reserved_509; // offset: 509  (0x1FD)
+	uint32_t reserved_510; // offset: 510  (0x1FE)
+	uint32_t reserved_511; // offset: 511  (0x1FF)
+};
+
+#endif
\ No newline at end of file
-- 
2.34.1


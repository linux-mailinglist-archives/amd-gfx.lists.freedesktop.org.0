Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813E86CC56E
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Mar 2023 17:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF32B10E290;
	Tue, 28 Mar 2023 15:14:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E8A10E290
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Mar 2023 15:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3hW+ykzSLpc/DHuYUhKaCIlyb2i4OKrSeug2M4b2bisCGj14pKoNwWW147Ip4V5COvfrK5vP9AVlk8+Jr+u8OPbQXiqg4IuoH5p1oov88tnPEz4E22sLFZ5bCOo4b9NhUMJK/yFzSI8jjNk8nc6XUwVdtY1o7doyhmTlckV5WnfwpmNru107zyAkPxmb2H/WMRuzEvSNUJYys/HNhDmA4M8qTT/1jB9C8s7pBxofW2G1pSim/ouVUOOQ8OsihMYknUnsgsVp54LcvFas7SRePB9FWxSq5k8G/WWSC5hnt7SzO2PPxJ1p76a3bAnBhv92FQ8QNfPObNgw08q6WY7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UvVTqge1EdW1ume1tbvag+2lR+5o47Fv5lHHD0NnkE=;
 b=Fzt68C98JlAvwaRUH2TGlFVQH7My64ILzneNTsI+z15RLDgtxp4oMv8sWB6SbkU4NoUTia7Kr8OZ00obt2hso78c2Uuh66Punq8dV11gdHXkFiJ/h/purWG407fIhJQ3dlUKbIWJSBK9/hfIxKPR4F8WtPow77WsRmyHiZriW7VDXohO7Rw8dvgHVs04SMSL7MOnzqdyVr7343+S+g2AixHkZ7j4KEE77POVzfBLJoJxuoKx5PshqQQFVPvHiCKNZcv5cFpiXkOpbTX66Gmy+pRrj6q/sjj1n3VG252UtDi7FVFZCw3opX5HgtFOdn3rI9uLKX+NGQ2eZCMSvYUmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UvVTqge1EdW1ume1tbvag+2lR+5o47Fv5lHHD0NnkE=;
 b=AWd6GodvQ/uajS16YIkEXk/X33Dr/J5fx2Hk9kxc16VERn0VnJRfNTwjAhqKr4Rsr7swB3ferJijG9EK+rraghf+8+mqIyZKlFtzj/bnM9evumYWYH/8MoH0UntmJGAsNMhaxdVikkf2D2Kd47XeisLqQDikWKJo/brtC9ysWWg=
Received: from BN9PR03CA0071.namprd03.prod.outlook.com (2603:10b6:408:fc::16)
 by MN2PR12MB4407.namprd12.prod.outlook.com (2603:10b6:208:260::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:14:12 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::1) by BN9PR03CA0071.outlook.office365.com
 (2603:10b6:408:fc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Tue, 28 Mar 2023 15:14:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6254.9 via Frontend Transport; Tue, 28 Mar 2023 15:14:12 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 28 Mar
 2023 10:14:08 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/32] drm/amdkfd: Introduce kfd_node struct (v5)
Date: Tue, 28 Mar 2023 11:13:18 -0400
Message-ID: <20230328151344.1934291-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328151344.1934291-1-alexander.deucher@amd.com>
References: <20230328151344.1934291-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|MN2PR12MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: ae682153-f603-4629-1c8f-08db2f9f164d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rMRgsxcDUM3t9F0rw2UoC4Xkd/s45TjjEG9lDO0TrU727lVKc45KWbCHA6SeLRGDAmdBqp5h0TRq8SCbgnI5zMRxB7SAnLmb6aPPEWTdavdhhPHZOirgS1S96st3zhnfd/4juJUqHJR834S6U5DNhdhjQbQbQOC4tXZANJ+NsPSjKnxRj6gpZYh/qT4DuBX7b09mpTBzzWc+Bszg4z5JX1wcNWmnn8VUJCsERmDqev/y7hK8QjI1p3BzblORKhzc6iMqXfPopXZpSrjR542dzuF9w/7YMg8iHTV8jo51FupN86YNn11cV94VG9PaMJx6fQjUczSJ0I34CHHp9aBH0EnL8yG9+pT5WXE2Wnjwk/GEoMJqA5IXdJS9HULAlG6ICkSrkt5qvlDho7ygczGevQ50Xmq5yLcJm1z3R6Ft6G7ro4uF45e/p7hN4ed0zR9ea+YERe2cLGZrHT+OUUYKMIBSiXnyeInInMD/aliOCHfemEbkgaS/P2qpLsBtVAFQ9YGM0uRhDiLUQhggILDJtaH3vkrfYXJY9iVK7/b67nhbVsAsj+iqyCAeR//n4yF3o4pmqyMU+zGFoQX4VOSQQra/MqE5wk7+ubWGqAmpO75JOxwBhFvJ3WkNTHmf1Nuh3chTxc+JW+lmN2hrakE5TuVyNi4GEdafeHFl32NUCj+TaJ6adXZk2u7kS60gDF+EWK0qAd//KIwmZ7rrf6G+beZII6Gx+psdtcRyiJRpw1U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(316002)(54906003)(6916009)(4326008)(8676002)(16526019)(186003)(41300700001)(70586007)(70206006)(66899021)(2616005)(1076003)(26005)(478600001)(6666004)(5660300002)(30864003)(336012)(83380400001)(426003)(8936002)(47076005)(2906002)(40460700003)(36756003)(81166007)(36860700001)(82310400005)(86362001)(82740400003)(356005)(40480700001)(7696005)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:14:12.2890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae682153-f603-4629-1c8f-08db2f9f164d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4407
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Amber Lin <Amber.Lin@amd.com>, Felix
 Kuehling <Felix.Kuehling@amd.com>, Morris Zhang <Shiwu.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mukul Joshi <mukul.joshi@amd.com>

Introduce a new structure, kfd_node, which will now represent
a compute node. kfd_node is carved out of kfd_dev structure.
kfd_dev struct now will become the parent of kfd_node, and will
store common resources such as doorbells, GTT sub-alloctor etc.
kfd_node struct will store all resources specific to a compute
node, such as device queue manager, interrupt handling etc.

This is the first step in adding compute partition support in KFD.

v2: introduce kfd_node struct to gc v11 (Hawking)
v3: make reference to kfd_dev struct through kfd_node (Morris)
v4: use kfd_node instead for kfd isr/mqd functions (Morris)
v5: rebase (Alex)

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Tested-by: Amber Lin <Amber.Lin@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Morris Zhang <Shiwu.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   1 +
 .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  43 +--
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c         |  28 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.h         |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c      |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       | 258 +++++++++++-------
 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 100 +++----
 .../drm/amd/amdkfd/kfd_device_queue_manager.h |   4 +-
 .../amd/amdkfd/kfd_device_queue_manager_v9.c  |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c     |  14 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  12 +-
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c  |  12 +-
 .../gpu/drm/amd/amdkfd/kfd_int_process_v11.c  |   6 +-
 .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c   |  10 +-
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c    |  64 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |  22 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c |  18 +-
 drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c  |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  |   8 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  |   6 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |   8 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  18 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  26 +-
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   |  10 +-
 .../gpu/drm/amd/amdkfd/kfd_packet_manager.c   |   2 +-
 .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |   8 +-
 .../drm/amd/amdkfd/kfd_packet_manager_vi.c    |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         | 168 +++++++-----
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  54 ++--
 .../amd/amdkfd/kfd_process_queue_manager.c    |  20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c   |  40 +--
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h   |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c     |  56 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_topology.h     |   8 +-
 38 files changed, 574 insertions(+), 496 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e7403f8e4eba..f859e1d9af3e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -34,6 +34,7 @@
 #include "amdgpu_dma_buf.h"
 #include <uapi/linux/kfd_ioctl.h>
 #include "amdgpu_xgmi.h"
+#include "kfd_priv.h"
 #include "kfd_smi_events.h"
 
 /* Userptr restore delay, just long enough to allow consecutive VM
diff --git a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
index 5c8023cba196..4ebfff6b6c55 100644
--- a/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/cik_event_interrupt.c
@@ -26,7 +26,7 @@
 #include "amdgpu_amdkfd.h"
 #include "kfd_smi_events.h"
 
-static bool cik_event_interrupt_isr(struct kfd_dev *dev,
+static bool cik_event_interrupt_isr(struct kfd_node *dev,
 					const uint32_t *ih_ring_entry,
 					uint32_t *patched_ihre,
 					bool *patched_flag)
@@ -85,7 +85,7 @@ static bool cik_event_interrupt_isr(struct kfd_dev *dev,
 		!amdgpu_no_queue_eviction_on_vm_fault);
 }
 
-static void cik_event_interrupt_wq(struct kfd_dev *dev,
+static void cik_event_interrupt_wq(struct kfd_node *dev,
 					const uint32_t *ih_ring_entry)
 {
 	const struct cik_ih_ring_entry *ihre =
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 7228a3db63a2..8949dcd24f79 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -293,7 +293,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 					void *data)
 {
 	struct kfd_ioctl_create_queue_args *args = data;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	int err = 0;
 	unsigned int queue_id;
 	struct kfd_process_device *pdd;
@@ -328,7 +328,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 	}
 
 	if (!pdd->doorbell_index &&
-	    kfd_alloc_process_doorbells(dev, &pdd->doorbell_index) < 0) {
+	    kfd_alloc_process_doorbells(dev->kfd, &pdd->doorbell_index) < 0) {
 		err = -ENOMEM;
 		goto err_alloc_doorbells;
 	}
@@ -336,7 +336,7 @@ static int kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
 	/* Starting with GFX11, wptr BOs must be mapped to GART for MES to determine work
 	 * on unmapped queues for usermode queue oversubscription (no aggregated doorbell)
 	 */
-	if (dev->shared_resources.enable_mes &&
+	if (dev->kfd->shared_resources.enable_mes &&
 			((dev->adev->mes.sched_version & AMDGPU_MES_API_VERSION_MASK)
 			>> AMDGPU_MES_API_VERSION_SHIFT) >= 2) {
 		struct amdgpu_bo_va_mapping *wptr_mapping;
@@ -887,7 +887,7 @@ static int kfd_ioctl_set_scratch_backing_va(struct file *filep,
 {
 	struct kfd_ioctl_set_scratch_backing_va_args *args = data;
 	struct kfd_process_device *pdd;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	long err;
 
 	mutex_lock(&p->mutex);
@@ -1006,18 +1006,18 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
 	return ret;
 }
 
-bool kfd_dev_is_large_bar(struct kfd_dev *dev)
+bool kfd_dev_is_large_bar(struct kfd_node *dev)
 {
 	if (debug_largebar) {
 		pr_debug("Simulate large-bar allocation on non large-bar machine\n");
 		return true;
 	}
 
-	if (dev->use_iommu_v2)
+	if (dev->kfd->use_iommu_v2)
 		return false;
 
-	if (dev->local_mem_info.local_mem_size_private == 0 &&
-			dev->local_mem_info.local_mem_size_public > 0)
+	if (dev->kfd->local_mem_info.local_mem_size_private == 0 &&
+	    dev->kfd->local_mem_info.local_mem_size_public > 0)
 		return true;
 	return false;
 }
@@ -1041,7 +1041,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	struct kfd_ioctl_alloc_memory_of_gpu_args *args = data;
 	struct kfd_process_device *pdd;
 	void *mem;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	int idr_handle;
 	long err;
 	uint64_t offset = args->mmap_offset;
@@ -1105,7 +1105,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	}
 
 	if (flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
-		if (args->size != kfd_doorbell_process_slice(dev)) {
+		if (args->size != kfd_doorbell_process_slice(dev->kfd)) {
 			err = -EINVAL;
 			goto err_unlock;
 		}
@@ -1231,7 +1231,7 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 	struct kfd_ioctl_map_memory_to_gpu_args *args = data;
 	struct kfd_process_device *pdd, *peer_pdd;
 	void *mem;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	long err = 0;
 	int i;
 	uint32_t *devices_arr = NULL;
@@ -1405,7 +1405,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 		args->n_success = i+1;
 	}
 
-	flush_tlb = kfd_flush_tlb_after_unmap(pdd->dev);
+	flush_tlb = kfd_flush_tlb_after_unmap(pdd->dev->kfd);
 	if (flush_tlb) {
 		err = amdgpu_amdkfd_gpuvm_sync_memory(pdd->dev->adev,
 				(struct kgd_mem *) mem, true);
@@ -1445,7 +1445,7 @@ static int kfd_ioctl_alloc_queue_gws(struct file *filep,
 	int retval;
 	struct kfd_ioctl_alloc_queue_gws_args *args = data;
 	struct queue *q;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 
 	mutex_lock(&p->mutex);
 	q = pqm_get_user_queue(&p->pqm, args->queue_id);
@@ -1482,7 +1482,7 @@ static int kfd_ioctl_get_dmabuf_info(struct file *filep,
 		struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_get_dmabuf_info_args *args = data;
-	struct kfd_dev *dev = NULL;
+	struct kfd_node *dev = NULL;
 	struct amdgpu_device *dmabuf_adev;
 	void *metadata_buffer = NULL;
 	uint32_t flags;
@@ -1596,7 +1596,7 @@ static int kfd_ioctl_export_dmabuf(struct file *filep,
 	struct kfd_ioctl_export_dmabuf_args *args = data;
 	struct kfd_process_device *pdd;
 	struct dma_buf *dmabuf;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	void *mem;
 	int ret = 0;
 
@@ -2178,7 +2178,7 @@ static int criu_restore_devices(struct kfd_process *p,
 	}
 
 	for (i = 0; i < args->num_devices; i++) {
-		struct kfd_dev *dev;
+		struct kfd_node *dev;
 		struct kfd_process_device *pdd;
 		struct file *drm_file;
 
@@ -2240,7 +2240,7 @@ static int criu_restore_devices(struct kfd_process *p,
 		}
 
 		if (!pdd->doorbell_index &&
-		    kfd_alloc_process_doorbells(pdd->dev, &pdd->doorbell_index) < 0) {
+		    kfd_alloc_process_doorbells(pdd->dev->kfd, &pdd->doorbell_index) < 0) {
 			ret = -ENOMEM;
 			goto exit;
 		}
@@ -2268,7 +2268,8 @@ static int criu_restore_memory_of_gpu(struct kfd_process_device *pdd,
 	u64 offset;
 
 	if (bo_bucket->alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_DOORBELL) {
-		if (bo_bucket->size != kfd_doorbell_process_slice(pdd->dev))
+		if (bo_bucket->size !=
+				kfd_doorbell_process_slice(pdd->dev->kfd))
 			return -EINVAL;
 
 		offset = kfd_get_process_doorbells(pdd);
@@ -2350,7 +2351,7 @@ static int criu_restore_bo(struct kfd_process *p,
 
 	/* now map these BOs to GPU/s */
 	for (j = 0; j < p->n_pdds; j++) {
-		struct kfd_dev *peer;
+		struct kfd_node *peer;
 		struct kfd_process_device *peer_pdd;
 
 		if (!bo_priv->mapped_gpuids[j])
@@ -2947,7 +2948,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	return retcode;
 }
 
-static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
+static int kfd_mmio_mmap(struct kfd_node *dev, struct kfd_process *process,
 		      struct vm_area_struct *vma)
 {
 	phys_addr_t address;
@@ -2981,7 +2982,7 @@ static int kfd_mmio_mmap(struct kfd_dev *dev, struct kfd_process *process,
 static int kfd_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct kfd_process *process;
-	struct kfd_dev *dev = NULL;
+	struct kfd_node *dev = NULL;
 	unsigned long mmap_offset;
 	unsigned int gpu_id;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 475e47027354..f5aebba31e88 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -1405,7 +1405,7 @@ static int kfd_fill_gpu_cache_info_from_gfx_config(struct kfd_dev *kdev,
 	return i;
 }
 
-int kfd_get_gpu_cache_info(struct kfd_dev *kdev, struct kfd_gpu_cache_info **pcache_info)
+int kfd_get_gpu_cache_info(struct kfd_node *kdev, struct kfd_gpu_cache_info **pcache_info)
 {
 	int num_of_cache_types = 0;
 
@@ -1524,7 +1524,7 @@ int kfd_get_gpu_cache_info(struct kfd_dev *kdev, struct kfd_gpu_cache_info **pca
 		case IP_VERSION(11, 0, 3):
 		case IP_VERSION(11, 0, 4):
 			num_of_cache_types =
-				kfd_fill_gpu_cache_info_from_gfx_config(kdev, *pcache_info);
+				kfd_fill_gpu_cache_info_from_gfx_config(kdev->kfd, *pcache_info);
 			break;
 		default:
 			*pcache_info = dummy_cache_info;
@@ -1858,7 +1858,7 @@ static int kfd_create_vcrat_image_cpu(void *pcrat_image, size_t *size)
 }
 
 static int kfd_fill_gpu_memory_affinity(int *avail_size,
-		struct kfd_dev *kdev, uint8_t type, uint64_t size,
+		struct kfd_node *kdev, uint8_t type, uint64_t size,
 		struct crat_subtype_memory *sub_type_hdr,
 		uint32_t proximity_domain,
 		const struct kfd_local_mem_info *local_mem_info)
@@ -1887,7 +1887,7 @@ static int kfd_fill_gpu_memory_affinity(int *avail_size,
 }
 
 #ifdef CONFIG_ACPI_NUMA
-static void kfd_find_numa_node_in_srat(struct kfd_dev *kdev)
+static void kfd_find_numa_node_in_srat(struct kfd_node *kdev)
 {
 	struct acpi_table_header *table_header = NULL;
 	struct acpi_subtable_header *sub_header = NULL;
@@ -1982,7 +1982,7 @@ static void kfd_find_numa_node_in_srat(struct kfd_dev *kdev)
  *	Return 0 if successful else return -ve value
  */
 static int kfd_fill_gpu_direct_io_link_to_cpu(int *avail_size,
-			struct kfd_dev *kdev,
+			struct kfd_node *kdev,
 			struct crat_subtype_iolink *sub_type_hdr,
 			uint32_t proximity_domain)
 {
@@ -2044,8 +2044,8 @@ static int kfd_fill_gpu_direct_io_link_to_cpu(int *avail_size,
 }
 
 static int kfd_fill_gpu_xgmi_link_to_gpu(int *avail_size,
-			struct kfd_dev *kdev,
-			struct kfd_dev *peer_kdev,
+			struct kfd_node *kdev,
+			struct kfd_node *peer_kdev,
 			struct crat_subtype_iolink *sub_type_hdr,
 			uint32_t proximity_domain_from,
 			uint32_t proximity_domain_to)
@@ -2081,7 +2081,7 @@ static int kfd_fill_gpu_xgmi_link_to_gpu(int *avail_size,
  *		[OUT] actual size of data filled in crat_image
  */
 static int kfd_create_vcrat_image_gpu(void *pcrat_image,
-				      size_t *size, struct kfd_dev *kdev,
+				      size_t *size, struct kfd_node *kdev,
 				      uint32_t proximity_domain)
 {
 	struct crat_header *crat_table = (struct crat_header *)pcrat_image;
@@ -2153,7 +2153,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
 	/* Check if this node supports IOMMU. During parsing this flag will
 	 * translate to HSA_CAP_ATS_PRESENT
 	 */
-	if (!kfd_iommu_check_device(kdev))
+	if (!kfd_iommu_check_device(kdev->kfd))
 		cu->hsa_capability |= CRAT_CU_FLAGS_IOMMU_PRESENT;
 
 	crat_table->length += sub_type_hdr->length;
@@ -2164,7 +2164,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
 	 * report the total FB size (public+private) as a single
 	 * private heap.
 	 */
-	local_mem_info = kdev->local_mem_info;
+	local_mem_info = kdev->kfd->local_mem_info;
 	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
 			sub_type_hdr->length);
 
@@ -2216,12 +2216,12 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
 	 * (from other GPU to this GPU) will be added
 	 * in kfd_parse_subtype_iolink.
 	 */
-	if (kdev->hive_id) {
+	if (kdev->kfd->hive_id) {
 		for (nid = 0; nid < proximity_domain; ++nid) {
 			peer_dev = kfd_topology_device_by_proximity_domain_no_lock(nid);
 			if (!peer_dev->gpu)
 				continue;
-			if (peer_dev->gpu->hive_id != kdev->hive_id)
+			if (peer_dev->gpu->kfd->hive_id != kdev->kfd->hive_id)
 				continue;
 			sub_type_hdr = (typeof(sub_type_hdr))(
 				(char *)sub_type_hdr +
@@ -2255,12 +2255,12 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
  *		(COMPUTE_UNIT_CPU | COMPUTE_UNIT_GPU) - Create VCRAT for APU
  *			-- this option is not currently implemented.
  *			The assumption is that all AMD APUs will have CRAT
- *	@kdev: Valid kfd_device required if flags contain COMPUTE_UNIT_GPU
+ *	@kdev: Valid kfd_node required if flags contain COMPUTE_UNIT_GPU
  *
  *	Return 0 if successful else return -ve value
  */
 int kfd_create_crat_image_virtual(void **crat_image, size_t *size,
-				  int flags, struct kfd_dev *kdev,
+				  int flags, struct kfd_node *kdev,
 				  uint32_t proximity_domain)
 {
 	void *pcrat_image = NULL;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
index 8d1e8ba58dee..3d0e533b93b9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.h
@@ -293,7 +293,7 @@ struct crat_subtype_generic {
 
 #pragma pack()
 
-struct kfd_dev;
+struct kfd_node;
 
 /* Static table to describe GPU Cache information */
 struct kfd_gpu_cache_info {
@@ -305,14 +305,14 @@ struct kfd_gpu_cache_info {
 	 */
 	uint32_t	num_cu_shared;
 };
-int kfd_get_gpu_cache_info(struct kfd_dev *kdev, struct kfd_gpu_cache_info **pcache_info);
+int kfd_get_gpu_cache_info(struct kfd_node *kdev, struct kfd_gpu_cache_info **pcache_info);
 
 int kfd_create_crat_image_acpi(void **crat_image, size_t *size);
 void kfd_destroy_crat_image(void *crat_image);
 int kfd_parse_crat_table(void *crat_image, struct list_head *device_list,
 			 uint32_t proximity_domain);
 int kfd_create_crat_image_virtual(void **crat_image, size_t *size,
-				  int flags, struct kfd_dev *kdev,
+				  int flags, struct kfd_node *kdev,
 				  uint32_t proximity_domain);
 
 #endif /* KFD_CRAT_H_INCLUDED */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
index ad5a40a685ac..4a5a0a4e00f2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
@@ -43,7 +43,7 @@ static int kfd_debugfs_hang_hws_read(struct seq_file *m, void *data)
 static ssize_t kfd_debugfs_hang_hws_write(struct file *file,
 	const char __user *user_buf, size_t size, loff_t *ppos)
 {
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	char tmp[16];
 	uint32_t gpu_id;
 	int ret = -EINVAL;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 0ba5ce005380..b0231ee08ea3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -61,7 +61,7 @@ static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int buf_size,
 static void kfd_gtt_sa_fini(struct kfd_dev *kfd);
 
 static int kfd_resume_iommu(struct kfd_dev *kfd);
-static int kfd_resume(struct kfd_dev *kfd);
+static int kfd_resume(struct kfd_node *kfd);
 
 static void kfd_device_info_set_sdma_info(struct kfd_dev *kfd)
 {
@@ -433,8 +433,6 @@ struct kfd_dev *kgd2kfd_probe(struct amdgpu_device *adev, bool vf)
 	memset(&kfd->doorbell_available_index, 0,
 		sizeof(kfd->doorbell_available_index));
 
-	atomic_set(&kfd->sram_ecc_flag, 0);
-
 	ida_init(&kfd->doorbell_ida);
 
 	return kfd;
@@ -481,41 +479,106 @@ static void kfd_cwsr_init(struct kfd_dev *kfd)
 	}
 }
 
-static int kfd_gws_init(struct kfd_dev *kfd)
+static int kfd_gws_init(struct kfd_node *node)
 {
 	int ret = 0;
+	struct kfd_dev *kfd = node->kfd;
 
-	if (kfd->dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS)
+	if (node->dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS)
 		return 0;
 
-	if (hws_gws_support || (KFD_IS_SOC15(kfd) &&
-		((KFD_GC_VERSION(kfd) == IP_VERSION(9, 0, 1)
+	if (hws_gws_support || (KFD_IS_SOC15(node) &&
+		((KFD_GC_VERSION(node) == IP_VERSION(9, 0, 1)
 			&& kfd->mec2_fw_version >= 0x81b3) ||
-		(KFD_GC_VERSION(kfd) <= IP_VERSION(9, 4, 0)
+		(KFD_GC_VERSION(node) <= IP_VERSION(9, 4, 0)
 			&& kfd->mec2_fw_version >= 0x1b3)  ||
-		(KFD_GC_VERSION(kfd) == IP_VERSION(9, 4, 1)
+		(KFD_GC_VERSION(node) == IP_VERSION(9, 4, 1)
 			&& kfd->mec2_fw_version >= 0x30)   ||
-		(KFD_GC_VERSION(kfd) == IP_VERSION(9, 4, 2)
+		(KFD_GC_VERSION(node) == IP_VERSION(9, 4, 2)
 			&& kfd->mec2_fw_version >= 0x28) ||
-		(KFD_GC_VERSION(kfd) >= IP_VERSION(10, 3, 0)
-			&& KFD_GC_VERSION(kfd) < IP_VERSION(11, 0, 0)
+		(KFD_GC_VERSION(node) >= IP_VERSION(10, 3, 0)
+			&& KFD_GC_VERSION(node) < IP_VERSION(11, 0, 0)
 			&& kfd->mec2_fw_version >= 0x6b))))
-		ret = amdgpu_amdkfd_alloc_gws(kfd->adev,
-				kfd->adev->gds.gws_size, &kfd->gws);
+		ret = amdgpu_amdkfd_alloc_gws(node->adev,
+				node->adev->gds.gws_size, &node->gws);
 
 	return ret;
 }
 
-static void kfd_smi_init(struct kfd_dev *dev)
+static void kfd_smi_init(struct kfd_node *dev)
 {
 	INIT_LIST_HEAD(&dev->smi_clients);
 	spin_lock_init(&dev->smi_lock);
 }
 
+static int kfd_init_node(struct kfd_node *node)
+{
+	int err = -1;
+
+	if (kfd_interrupt_init(node)) {
+		dev_err(kfd_device, "Error initializing interrupts\n");
+		goto kfd_interrupt_error;
+	}
+
+	node->dqm = device_queue_manager_init(node);
+	if (!node->dqm) {
+		dev_err(kfd_device, "Error initializing queue manager\n");
+		goto device_queue_manager_error;
+	}
+
+	if (kfd_gws_init(node)) {
+		dev_err(kfd_device, "Could not allocate %d gws\n",
+			node->adev->gds.gws_size);
+		goto gws_error;
+	}
+
+	if (kfd_resume(node))
+		goto kfd_resume_error;
+
+	if (kfd_topology_add_device(node)) {
+		dev_err(kfd_device, "Error adding device to topology\n");
+		goto kfd_topology_add_device_error;
+	}
+
+	kfd_smi_init(node);
+
+	return 0;
+
+kfd_topology_add_device_error:
+kfd_resume_error:
+gws_error:
+	device_queue_manager_uninit(node->dqm);
+device_queue_manager_error:
+	kfd_interrupt_exit(node);
+kfd_interrupt_error:
+	if (node->gws)
+		amdgpu_amdkfd_free_gws(node->adev, node->gws);
+
+	/* Cleanup the node memory here */
+	kfree(node);
+	return err;
+}
+
+static void kfd_cleanup_node(struct kfd_dev *kfd)
+{
+	struct kfd_node *knode = kfd->node;
+
+	device_queue_manager_uninit(knode->dqm);
+	kfd_interrupt_exit(knode);
+	kfd_topology_remove_device(knode);
+	if (knode->gws)
+		amdgpu_amdkfd_free_gws(knode->adev, knode->gws);
+	kfree(knode);
+	kfd->node = NULL;
+}
+
 bool kgd2kfd_device_init(struct kfd_dev *kfd,
 			 const struct kgd2kfd_shared_resources *gpu_resources)
 {
 	unsigned int size, map_process_packet_size;
+	struct kfd_node *node;
+	uint32_t first_vmid_kfd, last_vmid_kfd, vmid_num_kfd;
+	unsigned int max_proc_per_quantum;
 
 	kfd->mec_fw_version = amdgpu_amdkfd_get_fw_version(kfd->adev,
 			KGD_ENGINE_MEC1);
@@ -525,10 +588,9 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 			KGD_ENGINE_SDMA1);
 	kfd->shared_resources = *gpu_resources;
 
-	kfd->vm_info.first_vmid_kfd = ffs(gpu_resources->compute_vmid_bitmap)-1;
-	kfd->vm_info.last_vmid_kfd = fls(gpu_resources->compute_vmid_bitmap)-1;
-	kfd->vm_info.vmid_num_kfd = kfd->vm_info.last_vmid_kfd
-			- kfd->vm_info.first_vmid_kfd + 1;
+	first_vmid_kfd = ffs(gpu_resources->compute_vmid_bitmap)-1;
+	last_vmid_kfd = fls(gpu_resources->compute_vmid_bitmap)-1;
+	vmid_num_kfd = last_vmid_kfd - first_vmid_kfd + 1;
 
 	/* Allow BIF to recode atomics to PCIe 3.0 AtomicOps.
 	 * 32 and 64-bit requests are possible and must be
@@ -549,9 +611,9 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 
 	/* Verify module parameters regarding mapped process number*/
 	if (hws_max_conc_proc >= 0)
-		kfd->max_proc_per_quantum = min((u32)hws_max_conc_proc, kfd->vm_info.vmid_num_kfd);
+		max_proc_per_quantum = min((u32)hws_max_conc_proc, vmid_num_kfd);
 	else
-		kfd->max_proc_per_quantum = kfd->vm_info.vmid_num_kfd;
+		max_proc_per_quantum = vmid_num_kfd;
 
 	/* calculate max size of mqds needed for queues */
 	size = max_num_of_queues_per_device *
@@ -601,26 +663,6 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 
 	kfd->noretry = kfd->adev->gmc.noretry;
 
-	if (kfd_interrupt_init(kfd)) {
-		dev_err(kfd_device, "Error initializing interrupts\n");
-		goto kfd_interrupt_error;
-	}
-
-	kfd->dqm = device_queue_manager_init(kfd);
-	if (!kfd->dqm) {
-		dev_err(kfd_device, "Error initializing queue manager\n");
-		goto device_queue_manager_error;
-	}
-
-	/* If supported on this device, allocate global GWS that is shared
-	 * by all KFD processes
-	 */
-	if (kfd_gws_init(kfd)) {
-		dev_err(kfd_device, "Could not allocate %d gws\n",
-			kfd->adev->gds.gws_size);
-		goto gws_error;
-	}
-
 	/* If CRAT is broken, won't set iommu enabled */
 	kfd_double_confirm_iommu_support(kfd);
 
@@ -634,46 +676,54 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 
 	svm_migrate_init(kfd->adev);
 
-	if (kfd_resume_iommu(kfd))
-		goto device_iommu_error;
-
-	if (kfd_resume(kfd))
-		goto kfd_resume_error;
-
-	amdgpu_amdkfd_get_local_mem_info(kfd->adev, &kfd->local_mem_info);
+	/* Allocate the KFD node */
+	node = kzalloc(sizeof(struct kfd_node), GFP_KERNEL);
+	if (!node) {
+		dev_err(kfd_device, "Error allocating KFD node\n");
+		goto node_alloc_error;
+	}
 
-	if (kfd_topology_add_device(kfd)) {
-		dev_err(kfd_device, "Error adding device to topology\n");
-		goto kfd_topology_add_device_error;
+	node->adev = kfd->adev;
+	node->kfd = kfd;
+	node->kfd2kgd = kfd->kfd2kgd;
+	node->vm_info.vmid_num_kfd = vmid_num_kfd;
+	node->vm_info.first_vmid_kfd = first_vmid_kfd;
+	node->vm_info.last_vmid_kfd = last_vmid_kfd;
+	node->max_proc_per_quantum = max_proc_per_quantum;
+	atomic_set(&node->sram_ecc_flag, 0);
+
+	/* Initialize the KFD node */
+	if (kfd_init_node(node)) {
+		dev_err(kfd_device, "Error initializing KFD node\n");
+		goto node_init_error;
 	}
+	kfd->node = node;
 
-	kfd_smi_init(kfd);
+	if (kfd_resume_iommu(kfd))
+		goto kfd_resume_iommu_error;
+
+	amdgpu_amdkfd_get_local_mem_info(kfd->adev, &kfd->local_mem_info);
 
 	kfd->init_complete = true;
 	dev_info(kfd_device, "added device %x:%x\n", kfd->adev->pdev->vendor,
 		 kfd->adev->pdev->device);
 
 	pr_debug("Starting kfd with the following scheduling policy %d\n",
-		kfd->dqm->sched_policy);
+		node->dqm->sched_policy);
 
 	goto out;
 
-kfd_topology_add_device_error:
-kfd_resume_error:
+kfd_resume_iommu_error:
+	kfd_cleanup_node(kfd);
+node_init_error:
+node_alloc_error:
 device_iommu_error:
-gws_error:
-	device_queue_manager_uninit(kfd->dqm);
-device_queue_manager_error:
-	kfd_interrupt_exit(kfd);
-kfd_interrupt_error:
 	kfd_doorbell_fini(kfd);
 kfd_doorbell_error:
 	kfd_gtt_sa_fini(kfd);
 kfd_gtt_sa_init_error:
 	amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
 alloc_gtt_mem_failure:
-	if (kfd->gws)
-		amdgpu_amdkfd_free_gws(kfd->adev, kfd->gws);
 	dev_err(kfd_device,
 		"device %x:%x NOT added due to errors\n",
 		kfd->adev->pdev->vendor, kfd->adev->pdev->device);
@@ -684,15 +734,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
 	if (kfd->init_complete) {
-		device_queue_manager_uninit(kfd->dqm);
-		kfd_interrupt_exit(kfd);
-		kfd_topology_remove_device(kfd);
+		kfd_cleanup_node(kfd);
 		kfd_doorbell_fini(kfd);
 		ida_destroy(&kfd->doorbell_ida);
 		kfd_gtt_sa_fini(kfd);
 		amdgpu_amdkfd_free_gtt_mem(kfd->adev, kfd->gtt_mem);
-		if (kfd->gws)
-			amdgpu_amdkfd_free_gws(kfd->adev, kfd->gws);
 	}
 
 	kfree(kfd);
@@ -700,16 +746,18 @@ void kgd2kfd_device_exit(struct kfd_dev *kfd)
 
 int kgd2kfd_pre_reset(struct kfd_dev *kfd)
 {
+	struct kfd_node *node = kfd->node;
+
 	if (!kfd->init_complete)
 		return 0;
 
-	kfd_smi_event_update_gpu_reset(kfd, false);
+	kfd_smi_event_update_gpu_reset(node, false);
 
-	kfd->dqm->ops.pre_reset(kfd->dqm);
+	node->dqm->ops.pre_reset(node->dqm);
 
 	kgd2kfd_suspend(kfd, false);
 
-	kfd_signal_reset_event(kfd);
+	kfd_signal_reset_event(node);
 	return 0;
 }
 
@@ -722,18 +770,19 @@ int kgd2kfd_pre_reset(struct kfd_dev *kfd)
 int kgd2kfd_post_reset(struct kfd_dev *kfd)
 {
 	int ret;
+	struct kfd_node *node = kfd->node;
 
 	if (!kfd->init_complete)
 		return 0;
 
-	ret = kfd_resume(kfd);
+	ret = kfd_resume(node);
 	if (ret)
 		return ret;
 	atomic_dec(&kfd_locked);
 
-	atomic_set(&kfd->sram_ecc_flag, 0);
+	atomic_set(&node->sram_ecc_flag, 0);
 
-	kfd_smi_event_update_gpu_reset(kfd, true);
+	kfd_smi_event_update_gpu_reset(node, true);
 
 	return 0;
 }
@@ -745,6 +794,8 @@ bool kfd_is_locked(void)
 
 void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
 {
+	struct kfd_node *node = kfd->node;
+
 	if (!kfd->init_complete)
 		return;
 
@@ -755,18 +806,19 @@ void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
 			kfd_suspend_all_processes();
 	}
 
-	kfd->dqm->ops.stop(kfd->dqm);
+	node->dqm->ops.stop(node->dqm);
 	kfd_iommu_suspend(kfd);
 }
 
 int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm)
 {
 	int ret, count;
+	struct kfd_node *node = kfd->node;
 
 	if (!kfd->init_complete)
 		return 0;
 
-	ret = kfd_resume(kfd);
+	ret = kfd_resume(node);
 	if (ret)
 		return ret;
 
@@ -801,15 +853,15 @@ static int kfd_resume_iommu(struct kfd_dev *kfd)
 	return err;
 }
 
-static int kfd_resume(struct kfd_dev *kfd)
+static int kfd_resume(struct kfd_node *node)
 {
 	int err = 0;
 
-	err = kfd->dqm->ops.start(kfd->dqm);
+	err = node->dqm->ops.start(node->dqm);
 	if (err)
 		dev_err(kfd_device,
 			"Error starting queue manager for device %x:%x\n",
-			kfd->adev->pdev->vendor, kfd->adev->pdev->device);
+			node->adev->pdev->vendor, node->adev->pdev->device);
 
 	return err;
 }
@@ -835,6 +887,7 @@ void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
 	uint32_t patched_ihre[KFD_MAX_RING_ENTRY_SIZE];
 	bool is_patched = false;
 	unsigned long flags;
+	struct kfd_node *node = kfd->node;
 
 	if (!kfd->init_complete)
 		return;
@@ -844,16 +897,16 @@ void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
 		return;
 	}
 
-	spin_lock_irqsave(&kfd->interrupt_lock, flags);
+	spin_lock_irqsave(&node->interrupt_lock, flags);
 
-	if (kfd->interrupts_active
-	    && interrupt_is_wanted(kfd, ih_ring_entry,
+	if (node->interrupts_active
+	    && interrupt_is_wanted(node, ih_ring_entry,
 				   patched_ihre, &is_patched)
-	    && enqueue_ih_ring_entry(kfd,
+	    && enqueue_ih_ring_entry(node,
 				     is_patched ? patched_ihre : ih_ring_entry))
-		kfd_queue_work(kfd->ih_wq, &kfd->interrupt_work);
+		kfd_queue_work(node->ih_wq, &node->interrupt_work);
 
-	spin_unlock_irqrestore(&kfd->interrupt_lock, flags);
+	spin_unlock_irqrestore(&node->interrupt_lock, flags);
 }
 
 int kgd2kfd_quiesce_mm(struct mm_struct *mm, uint32_t trigger)
@@ -991,10 +1044,11 @@ static inline uint32_t *kfd_gtt_sa_calc_cpu_addr(void *start_addr,
 	return (uint32_t *) ((uint64_t) start_addr + bit_num * chunk_size);
 }
 
-int kfd_gtt_sa_allocate(struct kfd_dev *kfd, unsigned int size,
+int kfd_gtt_sa_allocate(struct kfd_node *node, unsigned int size,
 			struct kfd_mem_obj **mem_obj)
 {
 	unsigned int found, start_search, cur_size;
+	struct kfd_dev *kfd = node->kfd;
 
 	if (size == 0)
 		return -EINVAL;
@@ -1094,8 +1148,10 @@ int kfd_gtt_sa_allocate(struct kfd_dev *kfd, unsigned int size,
 	return -ENOMEM;
 }
 
-int kfd_gtt_sa_free(struct kfd_dev *kfd, struct kfd_mem_obj *mem_obj)
+int kfd_gtt_sa_free(struct kfd_node *node, struct kfd_mem_obj *mem_obj)
 {
+	struct kfd_dev *kfd = node->kfd;
+
 	/* Act like kfree when trying to free a NULL object */
 	if (!mem_obj)
 		return 0;
@@ -1118,28 +1174,28 @@ int kfd_gtt_sa_free(struct kfd_dev *kfd, struct kfd_mem_obj *mem_obj)
 void kgd2kfd_set_sram_ecc_flag(struct kfd_dev *kfd)
 {
 	if (kfd)
-		atomic_inc(&kfd->sram_ecc_flag);
+		atomic_inc(&kfd->node->sram_ecc_flag);
 }
 
-void kfd_inc_compute_active(struct kfd_dev *kfd)
+void kfd_inc_compute_active(struct kfd_node *node)
 {
-	if (atomic_inc_return(&kfd->compute_profile) == 1)
-		amdgpu_amdkfd_set_compute_idle(kfd->adev, false);
+	if (atomic_inc_return(&node->kfd->compute_profile) == 1)
+		amdgpu_amdkfd_set_compute_idle(node->adev, false);
 }
 
-void kfd_dec_compute_active(struct kfd_dev *kfd)
+void kfd_dec_compute_active(struct kfd_node *node)
 {
-	int count = atomic_dec_return(&kfd->compute_profile);
+	int count = atomic_dec_return(&node->kfd->compute_profile);
 
 	if (count == 0)
-		amdgpu_amdkfd_set_compute_idle(kfd->adev, true);
+		amdgpu_amdkfd_set_compute_idle(node->adev, true);
 	WARN_ONCE(count < 0, "Compute profile ref. count error");
 }
 
 void kgd2kfd_smi_event_throttle(struct kfd_dev *kfd, uint64_t throttle_bitmask)
 {
 	if (kfd && kfd->init_complete)
-		kfd_smi_event_update_thermal_throttling(kfd, throttle_bitmask);
+		kfd_smi_event_update_thermal_throttling(kfd->node, throttle_bitmask);
 }
 
 /* kfd_get_num_sdma_engines returns the number of PCIe optimized SDMA and
@@ -1147,19 +1203,19 @@ void kgd2kfd_smi_event_throttle(struct kfd_dev *kfd, uint64_t throttle_bitmask)
  * When the device has more than two engines, we reserve two for PCIe to enable
  * full-duplex and the rest are used as XGMI.
  */
-unsigned int kfd_get_num_sdma_engines(struct kfd_dev *kdev)
+unsigned int kfd_get_num_sdma_engines(struct kfd_node *node)
 {
 	/* If XGMI is not supported, all SDMA engines are PCIe */
-	if (!kdev->adev->gmc.xgmi.supported)
-		return kdev->adev->sdma.num_instances;
+	if (!node->adev->gmc.xgmi.supported)
+		return node->adev->sdma.num_instances;
 
-	return min(kdev->adev->sdma.num_instances, 2);
+	return min(node->adev->sdma.num_instances, 2);
 }
 
-unsigned int kfd_get_num_xgmi_sdma_engines(struct kfd_dev *kdev)
+unsigned int kfd_get_num_xgmi_sdma_engines(struct kfd_node *node)
 {
 	/* After reserved for PCIe, the rest of engines are XGMI */
-	return kdev->adev->sdma.num_instances - kfd_get_num_sdma_engines(kdev);
+	return node->adev->sdma.num_instances - kfd_get_num_sdma_engines(node);
 }
 
 #if defined(CONFIG_DEBUG_FS)
@@ -1167,7 +1223,7 @@ unsigned int kfd_get_num_xgmi_sdma_engines(struct kfd_dev *kdev)
 /* This function will send a package to HIQ to hang the HWS
  * which will trigger a GPU reset and bring the HWS back to normal state
  */
-int kfd_debugfs_hang_hws(struct kfd_dev *dev)
+int kfd_debugfs_hang_hws(struct kfd_node *dev)
 {
 	if (dev->dqm->sched_policy != KFD_SCHED_POLICY_HWS) {
 		pr_err("HWS is not enabled");
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 7a95698d83f7..34977d89f01c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -74,31 +74,31 @@ enum KFD_MQD_TYPE get_mqd_type_from_queue_type(enum kfd_queue_type type)
 static bool is_pipe_enabled(struct device_queue_manager *dqm, int mec, int pipe)
 {
 	int i;
-	int pipe_offset = (mec * dqm->dev->shared_resources.num_pipe_per_mec
-		+ pipe) * dqm->dev->shared_resources.num_queue_per_pipe;
+	int pipe_offset = (mec * dqm->dev->kfd->shared_resources.num_pipe_per_mec
+		+ pipe) * dqm->dev->kfd->shared_resources.num_queue_per_pipe;
 
 	/* queue is available for KFD usage if bit is 1 */
-	for (i = 0; i <  dqm->dev->shared_resources.num_queue_per_pipe; ++i)
+	for (i = 0; i <  dqm->dev->kfd->shared_resources.num_queue_per_pipe; ++i)
 		if (test_bit(pipe_offset + i,
-			      dqm->dev->shared_resources.cp_queue_bitmap))
+			      dqm->dev->kfd->shared_resources.cp_queue_bitmap))
 			return true;
 	return false;
 }
 
 unsigned int get_cp_queues_num(struct device_queue_manager *dqm)
 {
-	return bitmap_weight(dqm->dev->shared_resources.cp_queue_bitmap,
+	return bitmap_weight(dqm->dev->kfd->shared_resources.cp_queue_bitmap,
 				KGD_MAX_QUEUES);
 }
 
 unsigned int get_queues_per_pipe(struct device_queue_manager *dqm)
 {
-	return dqm->dev->shared_resources.num_queue_per_pipe;
+	return dqm->dev->kfd->shared_resources.num_queue_per_pipe;
 }
 
 unsigned int get_pipes_per_mec(struct device_queue_manager *dqm)
 {
-	return dqm->dev->shared_resources.num_pipe_per_mec;
+	return dqm->dev->kfd->shared_resources.num_pipe_per_mec;
 }
 
 static unsigned int get_num_all_sdma_engines(struct device_queue_manager *dqm)
@@ -110,18 +110,18 @@ static unsigned int get_num_all_sdma_engines(struct device_queue_manager *dqm)
 unsigned int get_num_sdma_queues(struct device_queue_manager *dqm)
 {
 	return kfd_get_num_sdma_engines(dqm->dev) *
-		dqm->dev->device_info.num_sdma_queues_per_engine;
+		dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
 }
 
 unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm)
 {
 	return kfd_get_num_xgmi_sdma_engines(dqm->dev) *
-		dqm->dev->device_info.num_sdma_queues_per_engine;
+		dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
 }
 
 static inline uint64_t get_reserved_sdma_queues_bitmap(struct device_queue_manager *dqm)
 {
-	return dqm->dev->device_info.reserved_sdma_queues_bitmap;
+	return dqm->dev->kfd->device_info.reserved_sdma_queues_bitmap;
 }
 
 void program_sh_mem_settings(struct device_queue_manager *dqm,
@@ -330,7 +330,7 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 			     struct queue *q,
 			     uint32_t const *restore_id)
 {
-	struct kfd_dev *dev = qpd->dqm->dev;
+	struct kfd_node *dev = qpd->dqm->dev;
 
 	if (!KFD_IS_SOC15(dev)) {
 		/* On pre-SOC15 chips we need to use the queue ID to
@@ -349,7 +349,7 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 		 * for a SDMA engine is 512.
 		 */
 
-		uint32_t *idx_offset = dev->shared_resources.sdma_doorbell_idx;
+		uint32_t *idx_offset = dev->kfd->shared_resources.sdma_doorbell_idx;
 		uint32_t valid_id = idx_offset[q->properties.sdma_engine_id]
 						+ (q->properties.sdma_queue_id & 1)
 						* KFD_QUEUE_DOORBELL_MIRROR_OFFSET
@@ -382,7 +382,7 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 	}
 
 	q->properties.doorbell_off =
-		kfd_get_doorbell_dw_offset_in_bar(dev, qpd_to_pdd(qpd),
+		kfd_get_doorbell_dw_offset_in_bar(dev->kfd, qpd_to_pdd(qpd),
 					  q->doorbell_id);
 	return 0;
 }
@@ -391,7 +391,7 @@ static void deallocate_doorbell(struct qcm_process_device *qpd,
 				struct queue *q)
 {
 	unsigned int old;
-	struct kfd_dev *dev = qpd->dqm->dev;
+	struct kfd_node *dev = qpd->dqm->dev;
 
 	if (!KFD_IS_SOC15(dev) ||
 	    q->properties.type == KFD_QUEUE_TYPE_SDMA ||
@@ -441,7 +441,7 @@ static int allocate_vmid(struct device_queue_manager *dqm,
 
 	program_sh_mem_settings(dqm, qpd);
 
-	if (KFD_IS_SOC15(dqm->dev) && dqm->dev->cwsr_enabled)
+	if (KFD_IS_SOC15(dqm->dev) && dqm->dev->kfd->cwsr_enabled)
 		program_trap_handler_settings(dqm, qpd);
 
 	/* qpd->page_table_base is set earlier when register_process()
@@ -460,7 +460,7 @@ static int allocate_vmid(struct device_queue_manager *dqm,
 	return 0;
 }
 
-static int flush_texture_cache_nocpsch(struct kfd_dev *kdev,
+static int flush_texture_cache_nocpsch(struct kfd_node *kdev,
 				struct qcm_process_device *qpd)
 {
 	const struct packet_manager_funcs *pmf = qpd->dqm->packet_mgr.pmf;
@@ -661,7 +661,7 @@ static inline void deallocate_hqd(struct device_queue_manager *dqm,
 #define SQ_IND_CMD_CMD_KILL		0x00000003
 #define SQ_IND_CMD_MODE_BROADCAST	0x00000001
 
-static int dbgdev_wave_reset_wavefronts(struct kfd_dev *dev, struct kfd_process *p)
+static int dbgdev_wave_reset_wavefronts(struct kfd_node *dev, struct kfd_process *p)
 {
 	int status = 0;
 	unsigned int vmid;
@@ -837,7 +837,7 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 
 	/* Make sure the queue is unmapped before updating the MQD */
 	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) {
-		if (!dqm->dev->shared_resources.enable_mes)
+		if (!dqm->dev->kfd->shared_resources.enable_mes)
 			retval = unmap_queues_cpsch(dqm,
 						    KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
 		else if (prev_active)
@@ -858,7 +858,7 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 		}
 
 		retval = mqd_mgr->destroy_mqd(mqd_mgr, q->mqd,
-				(dqm->dev->cwsr_enabled ?
+				(dqm->dev->kfd->cwsr_enabled ?
 				 KFD_PREEMPT_TYPE_WAVEFRONT_SAVE :
 				 KFD_PREEMPT_TYPE_WAVEFRONT_DRAIN),
 				KFD_UNMAP_LATENCY_MS, q->pipe, q->queue);
@@ -895,7 +895,7 @@ static int update_queue(struct device_queue_manager *dqm, struct queue *q,
 	}
 
 	if (dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) {
-		if (!dqm->dev->shared_resources.enable_mes)
+		if (!dqm->dev->kfd->shared_resources.enable_mes)
 			retval = map_queues_cpsch(dqm);
 		else if (q->properties.is_active)
 			retval = add_queue_mes(dqm, q, &pdd->qpd);
@@ -951,7 +951,7 @@ static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
 			continue;
 
 		retval = mqd_mgr->destroy_mqd(mqd_mgr, q->mqd,
-				(dqm->dev->cwsr_enabled ?
+				(dqm->dev->kfd->cwsr_enabled ?
 				 KFD_PREEMPT_TYPE_WAVEFRONT_SAVE :
 				 KFD_PREEMPT_TYPE_WAVEFRONT_DRAIN),
 				KFD_UNMAP_LATENCY_MS, q->pipe, q->queue);
@@ -993,7 +993,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 		q->properties.is_active = false;
 		decrement_queue_count(dqm, qpd, q);
 
-		if (dqm->dev->shared_resources.enable_mes) {
+		if (dqm->dev->kfd->shared_resources.enable_mes) {
 			retval = remove_queue_mes(dqm, q, qpd);
 			if (retval) {
 				pr_err("Failed to evict queue %d\n",
@@ -1003,7 +1003,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
 		}
 	}
 	pdd->last_evict_timestamp = get_jiffies_64();
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		retval = execute_queues_cpsch(dqm,
 					      qpd->is_debug ?
 					      KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
@@ -1132,7 +1132,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 		q->properties.is_active = true;
 		increment_queue_count(dqm, &pdd->qpd, q);
 
-		if (dqm->dev->shared_resources.enable_mes) {
+		if (dqm->dev->kfd->shared_resources.enable_mes) {
 			retval = add_queue_mes(dqm, q, qpd);
 			if (retval) {
 				pr_err("Failed to restore queue %d\n",
@@ -1141,7 +1141,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 			}
 		}
 	}
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		retval = execute_queues_cpsch(dqm,
 					      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 	qpd->evicted = 0;
@@ -1282,7 +1282,7 @@ static int initialize_nocpsch(struct device_queue_manager *dqm)
 
 		for (queue = 0; queue < get_queues_per_pipe(dqm); queue++)
 			if (test_bit(pipe_offset + queue,
-				     dqm->dev->shared_resources.cp_queue_bitmap))
+				     dqm->dev->kfd->shared_resources.cp_queue_bitmap))
 				dqm->allocated_queues[pipe] |= 1 << queue;
 	}
 
@@ -1426,14 +1426,14 @@ static int set_sched_resources(struct device_queue_manager *dqm)
 	int i, mec;
 	struct scheduling_resources res;
 
-	res.vmid_mask = dqm->dev->shared_resources.compute_vmid_bitmap;
+	res.vmid_mask = dqm->dev->kfd->shared_resources.compute_vmid_bitmap;
 
 	res.queue_mask = 0;
 	for (i = 0; i < KGD_MAX_QUEUES; ++i) {
-		mec = (i / dqm->dev->shared_resources.num_queue_per_pipe)
-			/ dqm->dev->shared_resources.num_pipe_per_mec;
+		mec = (i / dqm->dev->kfd->shared_resources.num_queue_per_pipe)
+			/ dqm->dev->kfd->shared_resources.num_pipe_per_mec;
 
-		if (!test_bit(i, dqm->dev->shared_resources.cp_queue_bitmap))
+		if (!test_bit(i, dqm->dev->kfd->shared_resources.cp_queue_bitmap))
 			continue;
 
 		/* only acquire queues from the first MEC */
@@ -1489,7 +1489,7 @@ static int start_cpsch(struct device_queue_manager *dqm)
 
 	dqm_lock(dqm);
 
-	if (!dqm->dev->shared_resources.enable_mes) {
+	if (!dqm->dev->kfd->shared_resources.enable_mes) {
 		retval = pm_init(&dqm->packet_mgr, dqm);
 		if (retval)
 			goto fail_packet_manager_init;
@@ -1516,14 +1516,14 @@ static int start_cpsch(struct device_queue_manager *dqm)
 	dqm->is_hws_hang = false;
 	dqm->is_resetting = false;
 	dqm->sched_running = true;
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		execute_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 	dqm_unlock(dqm);
 
 	return 0;
 fail_allocate_vidmem:
 fail_set_sched_resources:
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		pm_uninit(&dqm->packet_mgr, false);
 fail_packet_manager_init:
 	dqm_unlock(dqm);
@@ -1541,7 +1541,7 @@ static int stop_cpsch(struct device_queue_manager *dqm)
 	}
 
 	if (!dqm->is_hws_hang) {
-		if (!dqm->dev->shared_resources.enable_mes)
+		if (!dqm->dev->kfd->shared_resources.enable_mes)
 			unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
 		else
 			remove_all_queues_mes(dqm);
@@ -1550,11 +1550,11 @@ static int stop_cpsch(struct device_queue_manager *dqm)
 	hanging = dqm->is_hws_hang || dqm->is_resetting;
 	dqm->sched_running = false;
 
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		pm_release_ib(&dqm->packet_mgr);
 
 	kfd_gtt_sa_free(dqm->dev, dqm->fence_mem);
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		pm_uninit(&dqm->packet_mgr, hanging);
 	dqm_unlock(dqm);
 
@@ -1673,7 +1673,7 @@ static int create_queue_cpsch(struct device_queue_manager *dqm, struct queue *q,
 	if (q->properties.is_active) {
 		increment_queue_count(dqm, qpd, q);
 
-		if (!dqm->dev->shared_resources.enable_mes)
+		if (!dqm->dev->kfd->shared_resources.enable_mes)
 			retval = execute_queues_cpsch(dqm,
 					KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
 		else
@@ -1893,7 +1893,7 @@ static int destroy_queue_cpsch(struct device_queue_manager *dqm,
 	list_del(&q->list);
 	qpd->queue_count--;
 	if (q->properties.is_active) {
-		if (!dqm->dev->shared_resources.enable_mes) {
+		if (!dqm->dev->kfd->shared_resources.enable_mes) {
 			decrement_queue_count(dqm, qpd, q);
 			retval = execute_queues_cpsch(dqm,
 						      KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
@@ -2056,7 +2056,7 @@ static int get_wave_state(struct device_queue_manager *dqm,
 	mqd_mgr = dqm->mqd_mgrs[KFD_MQD_TYPE_CP];
 
 	if (q->properties.type != KFD_QUEUE_TYPE_COMPUTE ||
-	    q->properties.is_active || !q->device->cwsr_enabled ||
+	    q->properties.is_active || !q->device->kfd->cwsr_enabled ||
 	    !mqd_mgr->get_wave_state) {
 		dqm_unlock(dqm);
 		return -EINVAL;
@@ -2105,7 +2105,7 @@ static int checkpoint_mqd(struct device_queue_manager *dqm,
 
 	dqm_lock(dqm);
 
-	if (q->properties.is_active || !q->device->cwsr_enabled) {
+	if (q->properties.is_active || !q->device->kfd->cwsr_enabled) {
 		r = -EINVAL;
 		goto dqm_unlock;
 	}
@@ -2158,7 +2158,7 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
 		if (q->properties.is_active) {
 			decrement_queue_count(dqm, qpd, q);
 
-			if (dqm->dev->shared_resources.enable_mes) {
+			if (dqm->dev->kfd->shared_resources.enable_mes) {
 				retval = remove_queue_mes(dqm, q, qpd);
 				if (retval)
 					pr_err("Failed to remove queue %d\n",
@@ -2180,7 +2180,7 @@ static int process_termination_cpsch(struct device_queue_manager *dqm,
 		}
 	}
 
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		retval = execute_queues_cpsch(dqm, filter, 0);
 
 	if ((!dqm->is_hws_hang) && (retval || qpd->reset_wavefronts)) {
@@ -2242,11 +2242,11 @@ static int init_mqd_managers(struct device_queue_manager *dqm)
 static int allocate_hiq_sdma_mqd(struct device_queue_manager *dqm)
 {
 	int retval;
-	struct kfd_dev *dev = dqm->dev;
+	struct kfd_node *dev = dqm->dev;
 	struct kfd_mem_obj *mem_obj = &dqm->hiq_sdma_mqd;
 	uint32_t size = dqm->mqd_mgrs[KFD_MQD_TYPE_SDMA]->mqd_size *
 		get_num_all_sdma_engines(dqm) *
-		dev->device_info.num_sdma_queues_per_engine +
+		dev->kfd->device_info.num_sdma_queues_per_engine +
 		dqm->mqd_mgrs[KFD_MQD_TYPE_HIQ]->mqd_size;
 
 	retval = amdgpu_amdkfd_alloc_gtt_mem(dev->adev, size,
@@ -2256,7 +2256,7 @@ static int allocate_hiq_sdma_mqd(struct device_queue_manager *dqm)
 	return retval;
 }
 
-struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
+struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
 {
 	struct device_queue_manager *dqm;
 
@@ -2373,7 +2373,7 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 	if (init_mqd_managers(dqm))
 		goto out_free;
 
-	if (!dev->shared_resources.enable_mes && allocate_hiq_sdma_mqd(dqm)) {
+	if (!dev->kfd->shared_resources.enable_mes && allocate_hiq_sdma_mqd(dqm)) {
 		pr_err("Failed to allocate hiq sdma mqd trunk buffer\n");
 		goto out_free;
 	}
@@ -2386,7 +2386,7 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev)
 	return NULL;
 }
 
-static void deallocate_hiq_sdma_mqd(struct kfd_dev *dev,
+static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
 				    struct kfd_mem_obj *mqd)
 {
 	WARN(!mqd, "No hiq sdma mqd trunk to free");
@@ -2397,7 +2397,7 @@ static void deallocate_hiq_sdma_mqd(struct kfd_dev *dev,
 void device_queue_manager_uninit(struct device_queue_manager *dqm)
 {
 	dqm->ops.uninitialize(dqm);
-	if (!dqm->dev->shared_resources.enable_mes)
+	if (!dqm->dev->kfd->shared_resources.enable_mes)
 		deallocate_hiq_sdma_mqd(dqm->dev, &dqm->hiq_sdma_mqd);
 	kfree(dqm);
 }
@@ -2479,7 +2479,7 @@ int dqm_debugfs_hqds(struct seq_file *m, void *data)
 
 		for (queue = 0; queue < get_queues_per_pipe(dqm); queue++) {
 			if (!test_bit(pipe_offset + queue,
-				      dqm->dev->shared_resources.cp_queue_bitmap))
+				      dqm->dev->kfd->shared_resources.cp_queue_bitmap))
 				continue;
 
 			r = dqm->dev->kfd2kgd->hqd_dump(
@@ -2497,7 +2497,7 @@ int dqm_debugfs_hqds(struct seq_file *m, void *data)
 
 	for (pipe = 0; pipe < get_num_all_sdma_engines(dqm); pipe++) {
 		for (queue = 0;
-		     queue < dqm->dev->device_info.num_sdma_queues_per_engine;
+		     queue < dqm->dev->kfd->device_info.num_sdma_queues_per_engine;
 		     queue++) {
 			r = dqm->dev->kfd2kgd->hqd_sdma_dump(
 				dqm->dev->adev, pipe, queue, &dump, &n_regs);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index a537b9ef3e16..e554a48f3054 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -207,7 +207,7 @@ struct device_queue_manager_asic_ops {
 				struct queue *q,
 				struct qcm_process_device *qpd);
 	struct mqd_manager *	(*mqd_manager_init)(enum KFD_MQD_TYPE type,
-				 struct kfd_dev *dev);
+				 struct kfd_node *dev);
 };
 
 /**
@@ -228,7 +228,7 @@ struct device_queue_manager {
 
 	struct mqd_manager	*mqd_mgrs[KFD_MQD_TYPE_MAX];
 	struct packet_manager	packet_mgr;
-	struct kfd_dev		*dev;
+	struct kfd_node		*dev;
 	struct mutex		lock_hidden; /* use dqm_lock/unlock(dqm) */
 	struct list_head	queues;
 	unsigned int		saved_flags;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
index 914d94679d73..8af643388768 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager_v9.c
@@ -60,10 +60,10 @@ static int update_qpd_v9(struct device_queue_manager *dqm,
 		qpd->sh_mem_config = SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
 					SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;
 
-		if (dqm->dev->noretry && !dqm->dev->use_iommu_v2)
+		if (dqm->dev->kfd->noretry && !dqm->dev->kfd->use_iommu_v2)
 			qpd->sh_mem_config |= 1 << SH_MEM_CONFIG__RETRY_DISABLE__SHIFT;
 
-		if (KFD_GC_VERSION(dqm->dev) == IP_VERSION(9, 4, 3))
+		if (KFD_GC_VERSION(dqm->dev->kfd) == IP_VERSION(9, 4, 3))
 			qpd->sh_mem_config |=
 				(1 << SH_MEM_CONFIG__F8_MODE__SHIFT);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
index 3ac599f74fea..e2cc1f3705c7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
@@ -138,7 +138,7 @@ void kfd_doorbell_fini(struct kfd_dev *kfd)
 		iounmap(kfd->doorbell_kernel_ptr);
 }
 
-int kfd_doorbell_mmap(struct kfd_dev *dev, struct kfd_process *process,
+int kfd_doorbell_mmap(struct kfd_node *dev, struct kfd_process *process,
 		      struct vm_area_struct *vma)
 {
 	phys_addr_t address;
@@ -148,7 +148,7 @@ int kfd_doorbell_mmap(struct kfd_dev *dev, struct kfd_process *process,
 	 * For simplicitly we only allow mapping of the entire doorbell
 	 * allocation of a single device & process.
 	 */
-	if (vma->vm_end - vma->vm_start != kfd_doorbell_process_slice(dev))
+	if (vma->vm_end - vma->vm_start != kfd_doorbell_process_slice(dev->kfd))
 		return -EINVAL;
 
 	pdd = kfd_get_process_device_data(dev, process);
@@ -170,13 +170,13 @@ int kfd_doorbell_mmap(struct kfd_dev *dev, struct kfd_process *process,
 		 "     vm_flags            == 0x%04lX\n"
 		 "     size                == 0x%04lX\n",
 		 (unsigned long long) vma->vm_start, address, vma->vm_flags,
-		 kfd_doorbell_process_slice(dev));
+		 kfd_doorbell_process_slice(dev->kfd));
 
 
 	return io_remap_pfn_range(vma,
 				vma->vm_start,
 				address >> PAGE_SHIFT,
-				kfd_doorbell_process_slice(dev),
+				kfd_doorbell_process_slice(dev->kfd),
 				vma->vm_page_prot);
 }
 
@@ -278,14 +278,14 @@ uint64_t kfd_get_number_elems(struct kfd_dev *kfd)
 phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd)
 {
 	if (!pdd->doorbell_index) {
-		int r = kfd_alloc_process_doorbells(pdd->dev,
+		int r = kfd_alloc_process_doorbells(pdd->dev->kfd,
 						    &pdd->doorbell_index);
 		if (r < 0)
 			return 0;
 	}
 
-	return pdd->dev->doorbell_base +
-		pdd->doorbell_index * kfd_doorbell_process_slice(pdd->dev);
+	return pdd->dev->kfd->doorbell_base +
+		pdd->doorbell_index * kfd_doorbell_process_slice(pdd->dev->kfd);
 }
 
 int kfd_alloc_process_doorbells(struct kfd_dev *kfd, unsigned int *doorbell_index)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index 2880ed96ac2e..c02e4e680237 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -348,7 +348,7 @@ static int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
 
 int kfd_kmap_event_page(struct kfd_process *p, uint64_t event_page_offset)
 {
-	struct kfd_dev *kfd;
+	struct kfd_node *kfd;
 	struct kfd_process_device *pdd;
 	void *mem, *kern_addr;
 	uint64_t size;
@@ -1125,7 +1125,7 @@ static void lookup_events_by_type_and_signal(struct kfd_process *p,
 }
 
 #ifdef KFD_SUPPORT_IOMMU_V2
-void kfd_signal_iommu_event(struct kfd_dev *dev, u32 pasid,
+void kfd_signal_iommu_event(struct kfd_node *dev, u32 pasid,
 		unsigned long address, bool is_write_requested,
 		bool is_execute_requested)
 {
@@ -1221,8 +1221,8 @@ void kfd_signal_hw_exception_event(u32 pasid)
 	kfd_unref_process(p);
 }
 
-void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
-				struct kfd_vm_fault_info *info)
+void kfd_signal_vm_fault_event(struct kfd_node *dev, u32 pasid,
+			       struct kfd_vm_fault_info *info)
 {
 	struct kfd_event *ev;
 	uint32_t id;
@@ -1269,7 +1269,7 @@ void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
 	kfd_unref_process(p);
 }
 
-void kfd_signal_reset_event(struct kfd_dev *dev)
+void kfd_signal_reset_event(struct kfd_node *dev)
 {
 	struct kfd_hsa_hw_exception_data hw_exception_data;
 	struct kfd_hsa_memory_exception_data memory_exception_data;
@@ -1325,7 +1325,7 @@ void kfd_signal_reset_event(struct kfd_dev *dev)
 	srcu_read_unlock(&kfd_processes_srcu, idx);
 }
 
-void kfd_signal_poison_consumed_event(struct kfd_dev *dev, u32 pasid)
+void kfd_signal_poison_consumed_event(struct kfd_node *dev, u32 pasid)
 {
 	struct kfd_process *p = kfd_lookup_process_by_pasid(pasid);
 	struct kfd_hsa_memory_exception_data memory_exception_data;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
index 8aebe408c544..da2ca00d79e5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -322,21 +322,21 @@ static void kfd_init_apertures_vi(struct kfd_process_device *pdd, uint8_t id)
 	pdd->lds_base = MAKE_LDS_APP_BASE_VI();
 	pdd->lds_limit = MAKE_LDS_APP_LIMIT(pdd->lds_base);
 
-	if (!pdd->dev->use_iommu_v2) {
+	if (!pdd->dev->kfd->use_iommu_v2) {
 		/* dGPUs: SVM aperture starting at 0
 		 * with small reserved space for kernel.
 		 * Set them to CANONICAL addresses.
 		 */
 		pdd->gpuvm_base = SVM_USER_BASE;
 		pdd->gpuvm_limit =
-			pdd->dev->shared_resources.gpuvm_size - 1;
+			pdd->dev->kfd->shared_resources.gpuvm_size - 1;
 	} else {
 		/* set them to non CANONICAL addresses, and no SVM is
 		 * allocated.
 		 */
 		pdd->gpuvm_base = MAKE_GPUVM_APP_BASE_VI(id + 1);
 		pdd->gpuvm_limit = MAKE_GPUVM_APP_LIMIT(pdd->gpuvm_base,
-				pdd->dev->shared_resources.gpuvm_size);
+				pdd->dev->kfd->shared_resources.gpuvm_size);
 	}
 
 	pdd->scratch_base = MAKE_SCRATCH_APP_BASE_VI();
@@ -356,7 +356,7 @@ static void kfd_init_apertures_v9(struct kfd_process_device *pdd, uint8_t id)
 	 */
 	pdd->gpuvm_base = SVM_USER_BASE;
 	pdd->gpuvm_limit =
-		pdd->dev->shared_resources.gpuvm_size - 1;
+		pdd->dev->kfd->shared_resources.gpuvm_size - 1;
 
 	pdd->scratch_base = MAKE_SCRATCH_APP_BASE_V9();
 	pdd->scratch_limit = MAKE_SCRATCH_APP_LIMIT(pdd->scratch_base);
@@ -365,7 +365,7 @@ static void kfd_init_apertures_v9(struct kfd_process_device *pdd, uint8_t id)
 int kfd_init_apertures(struct kfd_process *process)
 {
 	uint8_t id  = 0;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	struct kfd_process_device *pdd;
 
 	/*Iterating over all devices*/
@@ -417,7 +417,7 @@ int kfd_init_apertures(struct kfd_process *process)
 				}
 			}
 
-			if (!dev->use_iommu_v2) {
+			if (!dev->kfd->use_iommu_v2) {
 				/* dGPUs: the reserved space for kernel
 				 * before SVM
 				 */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
index 0d53f6067422..0f0fdea4cd8a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -187,7 +187,7 @@ static void print_sq_intr_info_error(uint32_t context_id0, uint32_t context_id1)
 		REG_GET_FIELD(context_id0, SQ_INTERRUPT_WORD_ERROR_CTXID1, WGP_ID));
 }
 
-static void event_interrupt_poison_consumption_v11(struct kfd_dev *dev,
+static void event_interrupt_poison_consumption_v11(struct kfd_node *dev,
 				uint16_t pasid, uint16_t source_id)
 {
 	int ret = -EINVAL;
@@ -225,7 +225,7 @@ static void event_interrupt_poison_consumption_v11(struct kfd_dev *dev,
 		amdgpu_amdkfd_ras_poison_consumption_handler(dev->adev, true);
 }
 
-static bool event_interrupt_isr_v11(struct kfd_dev *dev,
+static bool event_interrupt_isr_v11(struct kfd_node *dev,
 					const uint32_t *ih_ring_entry,
 					uint32_t *patched_ihre,
 					bool *patched_flag)
@@ -274,7 +274,7 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
 		  !amdgpu_no_queue_eviction_on_vm_fault);
 }
 
-static void event_interrupt_wq_v11(struct kfd_dev *dev,
+static void event_interrupt_wq_v11(struct kfd_node *dev,
 					const uint32_t *ih_ring_entry)
 {
 	uint16_t source_id, client_id, ring_id, pasid, vmid;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index 0b75a37b689b..861bccb1e9dc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -90,7 +90,7 @@ enum SQ_INTERRUPT_ERROR_TYPE {
 #define KFD_SQ_INT_DATA__ERR_TYPE_MASK 0xF00000
 #define KFD_SQ_INT_DATA__ERR_TYPE__SHIFT 20
 
-static void event_interrupt_poison_consumption_v9(struct kfd_dev *dev,
+static void event_interrupt_poison_consumption_v9(struct kfd_node *dev,
 				uint16_t pasid, uint16_t client_id)
 {
 	int old_poison, ret = -EINVAL;
@@ -160,7 +160,7 @@ static bool context_id_expected(struct kfd_dev *dev)
 	}
 }
 
-static bool event_interrupt_isr_v9(struct kfd_dev *dev,
+static bool event_interrupt_isr_v9(struct kfd_node *dev,
 					const uint32_t *ih_ring_entry,
 					uint32_t *patched_ihre,
 					bool *patched_flag)
@@ -206,7 +206,7 @@ static bool event_interrupt_isr_v9(struct kfd_dev *dev,
 
 		*patched_flag = true;
 		memcpy(patched_ihre, ih_ring_entry,
-				dev->device_info.ih_ring_entry_size);
+				dev->kfd->device_info.ih_ring_entry_size);
 
 		pasid = dev->dqm->vmid_pasid[vmid];
 
@@ -235,7 +235,7 @@ static bool event_interrupt_isr_v9(struct kfd_dev *dev,
 		uint32_t context_id =
 			SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
 
-		if (context_id == 0 && context_id_expected(dev))
+		if (context_id == 0 && context_id_expected(dev->kfd))
 			return false;
 	}
 
@@ -253,7 +253,7 @@ static bool event_interrupt_isr_v9(struct kfd_dev *dev,
 		!amdgpu_no_queue_eviction_on_vm_fault);
 }
 
-static void event_interrupt_wq_v9(struct kfd_dev *dev,
+static void event_interrupt_wq_v9(struct kfd_node *dev,
 					const uint32_t *ih_ring_entry)
 {
 	uint16_t source_id, client_id, pasid, vmid;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
index 34772fe74296..dd3c43c1ad70 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
@@ -50,29 +50,29 @@
 
 static void interrupt_wq(struct work_struct *);
 
-int kfd_interrupt_init(struct kfd_dev *kfd)
+int kfd_interrupt_init(struct kfd_node *node)
 {
 	int r;
 
-	r = kfifo_alloc(&kfd->ih_fifo,
-		KFD_IH_NUM_ENTRIES * kfd->device_info.ih_ring_entry_size,
+	r = kfifo_alloc(&node->ih_fifo,
+		KFD_IH_NUM_ENTRIES * node->kfd->device_info.ih_ring_entry_size,
 		GFP_KERNEL);
 	if (r) {
-		dev_err(kfd->adev->dev, "Failed to allocate IH fifo\n");
+		dev_err(node->adev->dev, "Failed to allocate IH fifo\n");
 		return r;
 	}
 
-	kfd->ih_wq = alloc_workqueue("KFD IH", WQ_HIGHPRI, 1);
-	if (unlikely(!kfd->ih_wq)) {
-		kfifo_free(&kfd->ih_fifo);
-		dev_err(kfd->adev->dev, "Failed to allocate KFD IH workqueue\n");
+	node->ih_wq = alloc_workqueue("KFD IH", WQ_HIGHPRI, 1);
+	if (unlikely(!node->ih_wq)) {
+		kfifo_free(&node->ih_fifo);
+		dev_err(node->adev->dev, "Failed to allocate KFD IH workqueue\n");
 		return -ENOMEM;
 	}
-	spin_lock_init(&kfd->interrupt_lock);
+	spin_lock_init(&node->interrupt_lock);
 
-	INIT_WORK(&kfd->interrupt_work, interrupt_wq);
+	INIT_WORK(&node->interrupt_work, interrupt_wq);
 
-	kfd->interrupts_active = true;
+	node->interrupts_active = true;
 
 	/*
 	 * After this function returns, the interrupt will be enabled. This
@@ -84,7 +84,7 @@ int kfd_interrupt_init(struct kfd_dev *kfd)
 	return 0;
 }
 
-void kfd_interrupt_exit(struct kfd_dev *kfd)
+void kfd_interrupt_exit(struct kfd_node *node)
 {
 	/*
 	 * Stop the interrupt handler from writing to the ring and scheduling
@@ -93,31 +93,31 @@ void kfd_interrupt_exit(struct kfd_dev *kfd)
 	 */
 	unsigned long flags;
 
-	spin_lock_irqsave(&kfd->interrupt_lock, flags);
-	kfd->interrupts_active = false;
-	spin_unlock_irqrestore(&kfd->interrupt_lock, flags);
+	spin_lock_irqsave(&node->interrupt_lock, flags);
+	node->interrupts_active = false;
+	spin_unlock_irqrestore(&node->interrupt_lock, flags);
 
 	/*
 	 * flush_work ensures that there are no outstanding
 	 * work-queue items that will access interrupt_ring. New work items
 	 * can't be created because we stopped interrupt handling above.
 	 */
-	flush_workqueue(kfd->ih_wq);
+	flush_workqueue(node->ih_wq);
 
-	kfifo_free(&kfd->ih_fifo);
+	kfifo_free(&node->ih_fifo);
 }
 
 /*
  * Assumption: single reader/writer. This function is not re-entrant
  */
-bool enqueue_ih_ring_entry(struct kfd_dev *kfd,	const void *ih_ring_entry)
+bool enqueue_ih_ring_entry(struct kfd_node *node, const void *ih_ring_entry)
 {
 	int count;
 
-	count = kfifo_in(&kfd->ih_fifo, ih_ring_entry,
-				kfd->device_info.ih_ring_entry_size);
-	if (count != kfd->device_info.ih_ring_entry_size) {
-		dev_dbg_ratelimited(kfd->adev->dev,
+	count = kfifo_in(&node->ih_fifo, ih_ring_entry,
+				node->kfd->device_info.ih_ring_entry_size);
+	if (count != node->kfd->device_info.ih_ring_entry_size) {
+		dev_dbg_ratelimited(node->adev->dev,
 			"Interrupt ring overflow, dropping interrupt %d\n",
 			count);
 		return false;
@@ -129,32 +129,32 @@ bool enqueue_ih_ring_entry(struct kfd_dev *kfd,	const void *ih_ring_entry)
 /*
  * Assumption: single reader/writer. This function is not re-entrant
  */
-static bool dequeue_ih_ring_entry(struct kfd_dev *kfd, void *ih_ring_entry)
+static bool dequeue_ih_ring_entry(struct kfd_node *node, void *ih_ring_entry)
 {
 	int count;
 
-	count = kfifo_out(&kfd->ih_fifo, ih_ring_entry,
-				kfd->device_info.ih_ring_entry_size);
+	count = kfifo_out(&node->ih_fifo, ih_ring_entry,
+				node->kfd->device_info.ih_ring_entry_size);
 
-	WARN_ON(count && count != kfd->device_info.ih_ring_entry_size);
+	WARN_ON(count && count != node->kfd->device_info.ih_ring_entry_size);
 
-	return count == kfd->device_info.ih_ring_entry_size;
+	return count == node->kfd->device_info.ih_ring_entry_size;
 }
 
 static void interrupt_wq(struct work_struct *work)
 {
-	struct kfd_dev *dev = container_of(work, struct kfd_dev,
+	struct kfd_node *dev = container_of(work, struct kfd_node,
 						interrupt_work);
 	uint32_t ih_ring_entry[KFD_MAX_RING_ENTRY_SIZE];
 	unsigned long start_jiffies = jiffies;
 
-	if (dev->device_info.ih_ring_entry_size > sizeof(ih_ring_entry)) {
+	if (dev->kfd->device_info.ih_ring_entry_size > sizeof(ih_ring_entry)) {
 		dev_err_once(dev->adev->dev, "Ring entry too small\n");
 		return;
 	}
 
 	while (dequeue_ih_ring_entry(dev, ih_ring_entry)) {
-		dev->device_info.event_interrupt_class->interrupt_wq(dev,
+		dev->kfd->device_info.event_interrupt_class->interrupt_wq(dev,
 								ih_ring_entry);
 		if (time_is_before_jiffies(start_jiffies + HZ)) {
 			/* If we spent more than a second processing signals,
@@ -166,14 +166,14 @@ static void interrupt_wq(struct work_struct *work)
 	}
 }
 
-bool interrupt_is_wanted(struct kfd_dev *dev,
+bool interrupt_is_wanted(struct kfd_node *dev,
 			const uint32_t *ih_ring_entry,
 			uint32_t *patched_ihre, bool *flag)
 {
 	/* integer and bitwise OR so there is no boolean short-circuiting */
 	unsigned int wanted = 0;
 
-	wanted |= dev->device_info.event_interrupt_class->interrupt_isr(dev,
+	wanted |= dev->kfd->device_info.event_interrupt_class->interrupt_isr(dev,
 					 ih_ring_entry, patched_ihre, flag);
 
 	return wanted != 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
index ec1bf611624e..6eee9a0944f3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_iommu.c
@@ -109,11 +109,11 @@ int kfd_iommu_device_init(struct kfd_dev *kfd)
  */
 int kfd_iommu_bind_process_to_device(struct kfd_process_device *pdd)
 {
-	struct kfd_dev *dev = pdd->dev;
+	struct kfd_node *dev = pdd->dev;
 	struct kfd_process *p = pdd->process;
 	int err;
 
-	if (!dev->use_iommu_v2 || pdd->bound == PDD_BOUND)
+	if (!dev->kfd->use_iommu_v2 || pdd->bound == PDD_BOUND)
 		return 0;
 
 	if (unlikely(pdd->bound == PDD_BOUND_SUSPENDED)) {
@@ -146,7 +146,7 @@ void kfd_iommu_unbind_process(struct kfd_process *p)
 /* Callback for process shutdown invoked by the IOMMU driver */
 static void iommu_pasid_shutdown_callback(struct pci_dev *pdev, u32 pasid)
 {
-	struct kfd_dev *dev = kfd_device_by_pci_dev(pdev);
+	struct kfd_node *dev = kfd_device_by_pci_dev(pdev);
 	struct kfd_process *p;
 	struct kfd_process_device *pdd;
 
@@ -182,7 +182,7 @@ static void iommu_pasid_shutdown_callback(struct pci_dev *pdev, u32 pasid)
 static int iommu_invalid_ppr_cb(struct pci_dev *pdev, u32 pasid,
 				unsigned long address, u16 flags)
 {
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 
 	dev_warn_ratelimited(kfd_device,
 			"Invalid PPR device %x:%x.%x pasid 0x%x address 0x%lX flags 0x%X",
@@ -205,7 +205,7 @@ static int iommu_invalid_ppr_cb(struct pci_dev *pdev, u32 pasid,
  * Bind processes do the device that have been temporarily unbound
  * (PDD_BOUND_SUSPENDED) in kfd_unbind_processes_from_device.
  */
-static int kfd_bind_processes_to_device(struct kfd_dev *kfd)
+static int kfd_bind_processes_to_device(struct kfd_node *knode)
 {
 	struct kfd_process_device *pdd;
 	struct kfd_process *p;
@@ -216,14 +216,14 @@ static int kfd_bind_processes_to_device(struct kfd_dev *kfd)
 
 	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
 		mutex_lock(&p->mutex);
-		pdd = kfd_get_process_device_data(kfd, p);
+		pdd = kfd_get_process_device_data(knode, p);
 
 		if (WARN_ON(!pdd) || pdd->bound != PDD_BOUND_SUSPENDED) {
 			mutex_unlock(&p->mutex);
 			continue;
 		}
 
-		err = amd_iommu_bind_pasid(kfd->adev->pdev, p->pasid,
+		err = amd_iommu_bind_pasid(knode->adev->pdev, p->pasid,
 				p->lead_thread);
 		if (err < 0) {
 			pr_err("Unexpected pasid 0x%x binding failure\n",
@@ -246,7 +246,7 @@ static int kfd_bind_processes_to_device(struct kfd_dev *kfd)
  * processes will be restored to PDD_BOUND state in
  * kfd_bind_processes_to_device.
  */
-static void kfd_unbind_processes_from_device(struct kfd_dev *kfd)
+static void kfd_unbind_processes_from_device(struct kfd_node *knode)
 {
 	struct kfd_process_device *pdd;
 	struct kfd_process *p;
@@ -256,7 +256,7 @@ static void kfd_unbind_processes_from_device(struct kfd_dev *kfd)
 
 	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
 		mutex_lock(&p->mutex);
-		pdd = kfd_get_process_device_data(kfd, p);
+		pdd = kfd_get_process_device_data(knode, p);
 
 		if (WARN_ON(!pdd)) {
 			mutex_unlock(&p->mutex);
@@ -281,7 +281,7 @@ void kfd_iommu_suspend(struct kfd_dev *kfd)
 	if (!kfd->use_iommu_v2)
 		return;
 
-	kfd_unbind_processes_from_device(kfd);
+	kfd_unbind_processes_from_device(kfd->node);
 
 	amd_iommu_set_invalidate_ctx_cb(kfd->adev->pdev, NULL);
 	amd_iommu_set_invalid_ppr_cb(kfd->adev->pdev, NULL);
@@ -312,7 +312,7 @@ int kfd_iommu_resume(struct kfd_dev *kfd)
 	amd_iommu_set_invalid_ppr_cb(kfd->adev->pdev,
 				     iommu_invalid_ppr_cb);
 
-	err = kfd_bind_processes_to_device(kfd);
+	err = kfd_bind_processes_to_device(kfd->node);
 	if (err) {
 		amd_iommu_set_invalidate_ctx_cb(kfd->adev->pdev, NULL);
 		amd_iommu_set_invalid_ppr_cb(kfd->adev->pdev, NULL);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
index bcf7bc3302c9..1bea629c49ca 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c
@@ -38,7 +38,7 @@
 /* Initialize a kernel queue, including allocations of GART memory
  * needed for the queue.
  */
-static bool kq_initialize(struct kernel_queue *kq, struct kfd_dev *dev,
+static bool kq_initialize(struct kernel_queue *kq, struct kfd_node *dev,
 		enum kfd_queue_type type, unsigned int queue_size)
 {
 	struct queue_properties prop;
@@ -75,7 +75,7 @@ static bool kq_initialize(struct kernel_queue *kq, struct kfd_dev *dev,
 	if (!kq->mqd_mgr)
 		return false;
 
-	prop.doorbell_ptr = kfd_get_kernel_doorbell(dev, &prop.doorbell_off);
+	prop.doorbell_ptr = kfd_get_kernel_doorbell(dev->kfd, &prop.doorbell_off);
 
 	if (!prop.doorbell_ptr) {
 		pr_err("Failed to initialize doorbell");
@@ -112,7 +112,7 @@ static bool kq_initialize(struct kernel_queue *kq, struct kfd_dev *dev,
 	kq->rptr_kernel = kq->rptr_mem->cpu_ptr;
 	kq->rptr_gpu_addr = kq->rptr_mem->gpu_addr;
 
-	retval = kfd_gtt_sa_allocate(dev, dev->device_info.doorbell_size,
+	retval = kfd_gtt_sa_allocate(dev, dev->kfd->device_info.doorbell_size,
 					&kq->wptr_mem);
 
 	if (retval != 0)
@@ -189,7 +189,7 @@ static bool kq_initialize(struct kernel_queue *kq, struct kfd_dev *dev,
 err_eop_allocate_vidmem:
 	kfd_gtt_sa_free(dev, kq->pq);
 err_pq_allocate_vidmem:
-	kfd_release_kernel_doorbell(dev, prop.doorbell_ptr);
+	kfd_release_kernel_doorbell(dev->kfd, prop.doorbell_ptr);
 err_get_kernel_doorbell:
 	return false;
 
@@ -220,7 +220,7 @@ static void kq_uninitialize(struct kernel_queue *kq, bool hanging)
 	kfd_gtt_sa_free(kq->dev, kq->eop_mem);
 
 	kfd_gtt_sa_free(kq->dev, kq->pq);
-	kfd_release_kernel_doorbell(kq->dev,
+	kfd_release_kernel_doorbell(kq->dev->kfd,
 					kq->queue->properties.doorbell_ptr);
 	uninit_queue(kq->queue);
 }
@@ -298,7 +298,7 @@ void kq_submit_packet(struct kernel_queue *kq)
 	}
 	pr_debug("\n");
 #endif
-	if (kq->dev->device_info.doorbell_size == 8) {
+	if (kq->dev->kfd->device_info.doorbell_size == 8) {
 		*kq->wptr64_kernel = kq->pending_wptr64;
 		write_kernel_doorbell64(kq->queue->properties.doorbell_ptr,
 					kq->pending_wptr64);
@@ -311,7 +311,7 @@ void kq_submit_packet(struct kernel_queue *kq)
 
 void kq_rollback_packet(struct kernel_queue *kq)
 {
-	if (kq->dev->device_info.doorbell_size == 8) {
+	if (kq->dev->kfd->device_info.doorbell_size == 8) {
 		kq->pending_wptr64 = *kq->wptr64_kernel;
 		kq->pending_wptr = *kq->wptr_kernel %
 			(kq->queue->properties.queue_size / 4);
@@ -320,7 +320,7 @@ void kq_rollback_packet(struct kernel_queue *kq)
 	}
 }
 
-struct kernel_queue *kernel_queue_init(struct kfd_dev *dev,
+struct kernel_queue *kernel_queue_init(struct kfd_node *dev,
 					enum kfd_queue_type type)
 {
 	struct kernel_queue *kq;
@@ -345,7 +345,7 @@ void kernel_queue_uninit(struct kernel_queue *kq, bool hanging)
 }
 
 /* FIXME: Can this test be removed? */
-static __attribute__((unused)) void test_kq(struct kfd_dev *dev)
+static __attribute__((unused)) void test_kq(struct kfd_node *dev)
 {
 	struct kernel_queue *kq;
 	uint32_t *buffer, i;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h
index 383202fd1ea2..9a6244430845 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.h
@@ -53,7 +53,7 @@ void kq_rollback_packet(struct kernel_queue *kq);
 
 struct kernel_queue {
 	/* data */
-	struct kfd_dev		*dev;
+	struct kfd_node		*dev;
 	struct mqd_manager	*mqd_mgr;
 	struct queue		*queue;
 	uint64_t		pending_wptr64;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 54933903bcb8..1e187677c90a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -423,7 +423,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
 				      start >> PAGE_SHIFT, end >> PAGE_SHIFT,
-				      0, adev->kfd.dev->id, prange->prefetch_loc,
+				      0, adev->kfd.dev->node->id, prange->prefetch_loc,
 				      prange->preferred_loc, trigger);
 
 	r = migrate_vma_setup(&migrate);
@@ -456,7 +456,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	kfd_smi_event_migration_end(adev->kfd.dev, p->lead_thread->pid,
 				    start >> PAGE_SHIFT, end >> PAGE_SHIFT,
-				    0, adev->kfd.dev->id, trigger);
+				    0, adev->kfd.dev->node->id, trigger);
 
 	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
 	svm_range_free_dma_mappings(prange);
@@ -701,7 +701,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
 				      start >> PAGE_SHIFT, end >> PAGE_SHIFT,
-				      adev->kfd.dev->id, 0, prange->prefetch_loc,
+				      adev->kfd.dev->node->id, 0, prange->prefetch_loc,
 				      prange->preferred_loc, trigger);
 
 	r = migrate_vma_setup(&migrate);
@@ -737,7 +737,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
 
 	kfd_smi_event_migration_end(adev->kfd.dev, p->lead_thread->pid,
 				    start >> PAGE_SHIFT, end >> PAGE_SHIFT,
-				    adev->kfd.dev->id, 0, trigger);
+				    adev->kfd.dev->node->id, 0, trigger);
 
 	svm_range_dma_unmap(adev->dev, scratch, 0, npages);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 623ccd227b7d..61f6dd68c84b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -46,7 +46,7 @@ int pipe_priority_map[] = {
 	KFD_PIPE_PRIORITY_CS_HIGH
 };
 
-struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_dev *dev, struct queue_properties *q)
+struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct queue_properties *q)
 {
 	struct kfd_mem_obj *mqd_mem_obj = NULL;
 
@@ -61,7 +61,7 @@ struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_dev *dev, struct queue_propertie
 	return mqd_mem_obj;
 }
 
-struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_dev *dev,
+struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_node *dev,
 					struct queue_properties *q)
 {
 	struct kfd_mem_obj *mqd_mem_obj = NULL;
@@ -72,7 +72,7 @@ struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_dev *dev,
 		return NULL;
 
 	offset = (q->sdma_engine_id *
-		dev->device_info.num_sdma_queues_per_engine +
+		dev->kfd->device_info.num_sdma_queues_per_engine +
 		q->sdma_queue_id) *
 		dev->dqm->mqd_mgrs[KFD_MQD_TYPE_SDMA]->mqd_size;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index 57f900ccaa10..46fc3f273d0d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -68,7 +68,7 @@
  */
 extern int pipe_priority_map[];
 struct mqd_manager {
-	struct kfd_mem_obj*	(*allocate_mqd)(struct kfd_dev *kfd,
+	struct kfd_mem_obj*	(*allocate_mqd)(struct kfd_node *kfd,
 		struct queue_properties *q);
 
 	void	(*init_mqd)(struct mqd_manager *mm, void **mqd,
@@ -121,14 +121,14 @@ struct mqd_manager {
 	uint32_t (*read_doorbell_id)(void *mqd);
 
 	struct mutex	mqd_mutex;
-	struct kfd_dev	*dev;
+	struct kfd_node	*dev;
 	uint32_t mqd_size;
 };
 
-struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_dev *dev,
+struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev,
 				struct queue_properties *q);
 
-struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_dev *dev,
+struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_node *dev,
 					struct queue_properties *q);
 void free_mqd_hiq_sdma(struct mqd_manager *mm, void *mqd,
 				struct kfd_mem_obj *mqd_mem_obj);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 4889865c725c..03e04d5e5a11 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -74,7 +74,7 @@ static void set_priority(struct cik_mqd *m, struct queue_properties *q)
 	m->cp_hqd_queue_priority = q->priority;
 }
 
-static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
+static struct kfd_mem_obj *allocate_mqd(struct kfd_node *kfd,
 					struct queue_properties *q)
 {
 	struct kfd_mem_obj *mqd_mem_obj;
@@ -390,7 +390,7 @@ static int debugfs_show_mqd_sdma(struct seq_file *m, void *data)
 
 
 struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev)
+		struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
@@ -470,7 +470,7 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 }
 
 struct mqd_manager *mqd_manager_init_cik_hawaii(enum KFD_MQD_TYPE type,
-			struct kfd_dev *dev)
+			struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index d3e2b6a599a4..7a93be0ebb19 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -74,7 +74,7 @@ static void set_priority(struct v10_compute_mqd *m, struct queue_properties *q)
 	m->cp_hqd_queue_priority = q->priority;
 }
 
-static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
+static struct kfd_mem_obj *allocate_mqd(struct kfd_node *kfd,
 		struct queue_properties *q)
 {
 	struct kfd_mem_obj *mqd_mem_obj;
@@ -122,7 +122,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
 	}
 
-	if (mm->dev->cwsr_enabled) {
+	if (mm->dev->kfd->cwsr_enabled) {
 		m->cp_hqd_persistent_state |=
 			(1 << CP_HQD_PERSISTENT_STATE__QSWITCH_MODE__SHIFT);
 		m->cp_hqd_ctx_save_base_addr_lo =
@@ -210,7 +210,7 @@ static void update_mqd(struct mqd_manager *mm, void *mqd,
 		m->cp_hqd_pq_doorbell_control |=
 			1 << CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_BIF_DROP__SHIFT;
 	}
-	if (mm->dev->cwsr_enabled)
+	if (mm->dev->kfd->cwsr_enabled)
 		m->cp_hqd_ctx_save_control = 0;
 
 	update_cu_mask(mm, mqd, minfo);
@@ -405,7 +405,7 @@ static int debugfs_show_mqd_sdma(struct seq_file *m, void *data)
 #endif
 
 struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev)
+		struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 4a9af800b1f1..65dba460d041 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -81,7 +81,7 @@ static void set_priority(struct v11_compute_mqd *m, struct queue_properties *q)
 	m->cp_hqd_queue_priority = q->priority;
 }
 
-static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
+static struct kfd_mem_obj *allocate_mqd(struct kfd_node *node,
 		struct queue_properties *q)
 {
 	struct kfd_mem_obj *mqd_mem_obj;
@@ -91,12 +91,12 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
 	 * MES write to areas beyond MQD size. So allocate
 	 * 1 PAGE_SIZE memory for MQD is MES is enabled.
 	 */
-	if (kfd->shared_resources.enable_mes)
+	if (node->kfd->shared_resources.enable_mes)
 		size = PAGE_SIZE;
 	else
 		size = sizeof(struct v11_compute_mqd);
 
-	if (kfd_gtt_sa_allocate(kfd, size, &mqd_mem_obj))
+	if (kfd_gtt_sa_allocate(node, size, &mqd_mem_obj))
 		return NULL;
 
 	return mqd_mem_obj;
@@ -113,7 +113,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 	m = (struct v11_compute_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
 
-	if (mm->dev->shared_resources.enable_mes)
+	if (mm->dev->kfd->shared_resources.enable_mes)
 		size = PAGE_SIZE;
 	else
 		size = sizeof(struct v11_compute_mqd);
@@ -148,7 +148,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
 	}
 
-	if (mm->dev->cwsr_enabled) {
+	if (mm->dev->kfd->cwsr_enabled) {
 		m->cp_hqd_persistent_state |=
 			(1 << CP_HQD_PERSISTENT_STATE__QSWITCH_MODE__SHIFT);
 		m->cp_hqd_ctx_save_base_addr_lo =
@@ -236,7 +236,7 @@ static void update_mqd(struct mqd_manager *mm, void *mqd,
 		m->cp_hqd_pq_doorbell_control |=
 			1 << CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_BIF_DROP__SHIFT;
 	}
-	if (mm->dev->cwsr_enabled)
+	if (mm->dev->kfd->cwsr_enabled)
 		m->cp_hqd_ctx_save_control = 0;
 
 	update_cu_mask(mm, mqd, minfo);
@@ -312,7 +312,7 @@ static void init_mqd_sdma(struct mqd_manager *mm, void **mqd,
 
 	m = (struct v11_sdma_mqd *) mqd_mem_obj->cpu_ptr;
 
-	if (mm->dev->shared_resources.enable_mes)
+	if (mm->dev->kfd->shared_resources.enable_mes)
 		size = PAGE_SIZE;
 	else
 		size = sizeof(struct v11_sdma_mqd);
@@ -376,7 +376,7 @@ static int debugfs_show_mqd_sdma(struct seq_file *m, void *data)
 #endif
 
 struct mqd_manager *mqd_manager_init_v11(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev)
+		struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
@@ -452,7 +452,7 @@ struct mqd_manager *mqd_manager_init_v11(enum KFD_MQD_TYPE type,
 		 * To allocate SDMA MQDs by generic functions
 		 * when MES is enabled.
 		 */
-		if (dev->shared_resources.enable_mes) {
+		if (dev->kfd->shared_resources.enable_mes) {
 			mqd->allocate_mqd = allocate_mqd;
 			mqd->free_mqd = kfd_free_mqd_cp;
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index c5e29fdad1e5..007453e271d9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -83,7 +83,7 @@ static void set_priority(struct v9_mqd *m, struct queue_properties *q)
 	m->cp_hqd_queue_priority = q->priority;
 }
 
-static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
+static struct kfd_mem_obj *allocate_mqd(struct kfd_node *node,
 		struct queue_properties *q)
 {
 	int retval;
@@ -105,18 +105,18 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
 	 * pass a special bo flag AMDGPU_GEM_CREATE_CP_MQD_GFX9 to instruct
 	 * amdgpu memory functions to do so.
 	 */
-	if (kfd->cwsr_enabled && (q->type == KFD_QUEUE_TYPE_COMPUTE)) {
+	if (node->kfd->cwsr_enabled && (q->type == KFD_QUEUE_TYPE_COMPUTE)) {
 		mqd_mem_obj = kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
 		if (!mqd_mem_obj)
 			return NULL;
-		retval = amdgpu_amdkfd_alloc_gtt_mem(kfd->adev,
+		retval = amdgpu_amdkfd_alloc_gtt_mem(node->adev,
 			ALIGN(q->ctl_stack_size, PAGE_SIZE) +
 				ALIGN(sizeof(struct v9_mqd), PAGE_SIZE),
 			&(mqd_mem_obj->gtt_mem),
 			&(mqd_mem_obj->gpu_addr),
 			(void *)&(mqd_mem_obj->cpu_ptr), true);
 	} else {
-		retval = kfd_gtt_sa_allocate(kfd, sizeof(struct v9_mqd),
+		retval = kfd_gtt_sa_allocate(node, sizeof(struct v9_mqd),
 				&mqd_mem_obj);
 	}
 
@@ -135,7 +135,6 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 {
 	uint64_t addr;
 	struct v9_mqd *m;
-	struct amdgpu_device *adev = (struct amdgpu_device *)mm->dev->adev;
 
 	m = (struct v9_mqd *) mqd_mem_obj->cpu_ptr;
 	addr = mqd_mem_obj->gpu_addr;
@@ -168,7 +167,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 	if (q->format == KFD_QUEUE_FORMAT_AQL) {
 		m->cp_hqd_aql_control =
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) {
+		if (KFD_GC_VERSION(mm->dev) == IP_VERSION(9, 4, 3)) {
 			/* On GC 9.4.3, DW 41 is re-purposed as
 			 * compute_tg_chunk_size.
 			 * TODO: review this setting when active CUs in the
@@ -178,7 +177,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 		}
 	} else {
 		/* PM4 queue */
-		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 3)) {
+		if (KFD_GC_VERSION(mm->dev) == IP_VERSION(9, 4, 3)) {
 			m->compute_static_thread_mgmt_se6 = 0;
 			/* TODO: program pm4_target_xcc */
 		}
@@ -189,7 +188,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			(1 << COMPUTE_PGM_RSRC2__TRAP_PRESENT__SHIFT);
 	}
 
-	if (mm->dev->cwsr_enabled && q->ctx_save_restore_area_address) {
+	if (mm->dev->kfd->cwsr_enabled && q->ctx_save_restore_area_address) {
 		m->cp_hqd_persistent_state |=
 			(1 << CP_HQD_PERSISTENT_STATE__QSWITCH_MODE__SHIFT);
 		m->cp_hqd_ctx_save_base_addr_lo =
@@ -224,7 +223,6 @@ static void update_mqd(struct mqd_manager *mm, void *mqd,
 			struct queue_properties *q,
 			struct mqd_update_info *minfo)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)mm->dev->adev;
 	struct v9_mqd *m;
 
 	m = get_mqd(mqd);
@@ -274,13 +272,13 @@ static void update_mqd(struct mqd_manager *mm, void *mqd,
 				2 << CP_HQD_PQ_CONTROL__SLOT_BASED_WPTR__SHIFT |
 				1 << CP_HQD_PQ_CONTROL__QUEUE_FULL_EN__SHIFT |
 				1 << CP_HQD_PQ_CONTROL__WPP_CLAMP_EN__SHIFT;
-		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 3))
-			 m->cp_hqd_pq_control |=
-				 CP_HQD_PQ_CONTROL__NO_UPDATE_RPTR_MASK;
+		if (KFD_GC_VERSION(mm->dev) != IP_VERSION(9, 4, 3))
+			m->cp_hqd_pq_control |=
+				CP_HQD_PQ_CONTROL__NO_UPDATE_RPTR_MASK;
 		m->cp_hqd_pq_doorbell_control |= 1 <<
 			CP_HQD_PQ_DOORBELL_CONTROL__DOORBELL_BIF_DROP__SHIFT;
 	}
-	if (mm->dev->cwsr_enabled && q->ctx_save_restore_area_address)
+	if (mm->dev->kfd->cwsr_enabled && q->ctx_save_restore_area_address)
 		m->cp_hqd_ctx_save_control = 0;
 
 	update_cu_mask(mm, mqd, minfo);
@@ -486,7 +484,7 @@ static int debugfs_show_mqd_sdma(struct seq_file *m, void *data)
 #endif
 
 struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev)
+		struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index 530ba6f5b57e..f6b4a5686dcb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -77,7 +77,7 @@ static void set_priority(struct vi_mqd *m, struct queue_properties *q)
 	m->cp_hqd_queue_priority = q->priority;
 }
 
-static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
+static struct kfd_mem_obj *allocate_mqd(struct kfd_node *kfd,
 					struct queue_properties *q)
 {
 	struct kfd_mem_obj *mqd_mem_obj;
@@ -136,7 +136,7 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			(1 << COMPUTE_PGM_RSRC2__TRAP_PRESENT__SHIFT);
 	}
 
-	if (mm->dev->cwsr_enabled && q->ctx_save_restore_area_address) {
+	if (mm->dev->kfd->cwsr_enabled && q->ctx_save_restore_area_address) {
 		m->cp_hqd_persistent_state |=
 			(1 << CP_HQD_PERSISTENT_STATE__QSWITCH_MODE__SHIFT);
 		m->cp_hqd_ctx_save_base_addr_lo =
@@ -227,7 +227,7 @@ static void __update_mqd(struct mqd_manager *mm, void *mqd,
 				2 << CP_HQD_PQ_CONTROL__SLOT_BASED_WPTR__SHIFT;
 	}
 
-	if (mm->dev->cwsr_enabled && q->ctx_save_restore_area_address)
+	if (mm->dev->kfd->cwsr_enabled && q->ctx_save_restore_area_address)
 		m->cp_hqd_ctx_save_control =
 			atc_bit << CP_HQD_CTX_SAVE_CONTROL__ATC__SHIFT |
 			mtype << CP_HQD_CTX_SAVE_CONTROL__MTYPE__SHIFT;
@@ -446,7 +446,7 @@ static int debugfs_show_mqd_sdma(struct seq_file *m, void *data)
 #endif
 
 struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev)
+		struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
@@ -528,7 +528,7 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 }
 
 struct mqd_manager *mqd_manager_init_vi_tonga(enum KFD_MQD_TYPE type,
-			struct kfd_dev *dev)
+			struct kfd_node *dev)
 {
 	struct mqd_manager *mqd;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
index f612325241aa..2f54172e9175 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
@@ -45,7 +45,7 @@ static void pm_calc_rlib_size(struct packet_manager *pm,
 	unsigned int process_count, queue_count, compute_queue_count, gws_queue_count;
 	unsigned int map_queue_size;
 	unsigned int max_proc_per_quantum = 1;
-	struct kfd_dev *dev = pm->dqm->dev;
+	struct kfd_node *dev = pm->dqm->dev;
 
 	process_count = pm->dqm->processes_count;
 	queue_count = pm->dqm->active_queue_count;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 18250845a989..54d7d4665ad2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -119,7 +119,7 @@ static int pm_runlist_v9(struct packet_manager *pm, uint32_t *buffer,
 	struct pm4_mes_runlist *packet;
 
 	int concurrent_proc_cnt = 0;
-	struct kfd_dev *kfd = pm->dqm->dev;
+	struct kfd_node *kfd = pm->dqm->dev;
 
 	/* Determine the number of processes to map together to HW:
 	 * it can not exceed the number of VMIDs available to the
@@ -220,7 +220,8 @@ static int pm_map_queues_v9(struct packet_manager *pm, uint32_t *buffer,
 	case KFD_QUEUE_TYPE_SDMA:
 	case KFD_QUEUE_TYPE_SDMA_XGMI:
 		use_static = false; /* no static queues under SDMA */
-		if (q->properties.sdma_engine_id < 2 && !pm_use_ext_eng(q->device))
+		if (q->properties.sdma_engine_id < 2 &&
+		    !pm_use_ext_eng(q->device->kfd))
 			packet->bitfields2.engine_sel = q->properties.sdma_engine_id +
 				engine_sel__mes_map_queues__sdma0_vi;
 		else {
@@ -263,7 +264,8 @@ static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
 	packet->header.u32All = pm_build_pm4_header(IT_UNMAP_QUEUES,
 					sizeof(struct pm4_mes_unmap_queues));
 
-	packet->bitfields2.extended_engine_sel = pm_use_ext_eng(pm->dqm->dev) ?
+	packet->bitfields2.extended_engine_sel =
+				pm_use_ext_eng(pm->dqm->dev->kfd) ?
 		extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel :
 		extended_engine_sel__mes_unmap_queues__legacy_engine_sel;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c
index 4f951eaa6ee8..faf4772ed317 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_vi.c
@@ -77,7 +77,7 @@ static int pm_runlist_vi(struct packet_manager *pm, uint32_t *buffer,
 {
 	struct pm4_mes_runlist *packet;
 	int concurrent_proc_cnt = 0;
-	struct kfd_dev *kfd = pm->dqm->dev;
+	struct kfd_node *kfd = pm->dqm->dev;
 
 	if (WARN_ON(!ib))
 		return -EFAULT;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 94a438956868..fdb97e5d0c01 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -210,11 +210,13 @@ enum cache_policy {
 	((KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2)) ||	\
 	 (KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 3)))
 
+struct kfd_node;
+
 struct kfd_event_interrupt_class {
-	bool (*interrupt_isr)(struct kfd_dev *dev,
+	bool (*interrupt_isr)(struct kfd_node *dev,
 			const uint32_t *ih_ring_entry, uint32_t *patched_ihre,
 			bool *patched_flag);
-	void (*interrupt_wq)(struct kfd_dev *dev,
+	void (*interrupt_wq)(struct kfd_node *dev,
 			const uint32_t *ih_ring_entry);
 };
 
@@ -236,8 +238,8 @@ struct kfd_device_info {
 	uint64_t reserved_sdma_queues_bitmap;
 };
 
-unsigned int kfd_get_num_sdma_engines(struct kfd_dev *kdev);
-unsigned int kfd_get_num_xgmi_sdma_engines(struct kfd_dev *kdev);
+unsigned int kfd_get_num_sdma_engines(struct kfd_node *kdev);
+unsigned int kfd_get_num_xgmi_sdma_engines(struct kfd_node *kdev);
 
 struct kfd_mem_obj {
 	uint32_t range_start;
@@ -253,13 +255,59 @@ struct kfd_vmid_info {
 	uint32_t vmid_num_kfd;
 };
 
+struct kfd_dev;
+
+struct kfd_node {
+	struct amdgpu_device *adev;     /* Duplicated here along with keeping
+					 * a copy in kfd_dev to save a hop
+					 */
+	const struct kfd2kgd_calls *kfd2kgd; /* Duplicated here along with
+					      * keeping a copy in kfd_dev to
+					      * save a hop
+					      */
+	struct kfd_vmid_info vm_info;
+	unsigned int id;                /* topology stub index */
+	/* Interrupts */
+	struct kfifo ih_fifo;
+	struct workqueue_struct *ih_wq;
+	struct work_struct interrupt_work;
+	spinlock_t interrupt_lock;
+
+	/*
+	 * Interrupts of interest to KFD are copied
+	 * from the HW ring into a SW ring.
+	 */
+	bool interrupts_active;
+
+	/* QCM Device instance */
+	struct device_queue_manager *dqm;
+
+	/* Global GWS resource shared between processes */
+	void *gws;
+	bool gws_debug_workaround;
+
+	/* Clients watching SMI events */
+	struct list_head smi_clients;
+	spinlock_t smi_lock;
+	uint32_t reset_seq_num;
+
+	/* SRAM ECC flag */
+	atomic_t sram_ecc_flag;
+
+	/*spm process id */
+	unsigned int spm_pasid;
+
+	/* Maximum process number mapped to HW scheduler */
+	unsigned int max_proc_per_quantum;
+
+	struct kfd_dev *kfd;
+};
+
 struct kfd_dev {
 	struct amdgpu_device *adev;
 
 	struct kfd_device_info device_info;
 
-	unsigned int id;		/* topology stub index */
-
 	phys_addr_t doorbell_base;	/* Start of actual doorbells used by
 					 * KFD. It is aligned for mapping
 					 * into user mode
@@ -274,7 +322,6 @@ struct kfd_dev {
 					   */
 
 	struct kgd2kfd_shared_resources shared_resources;
-	struct kfd_vmid_info vm_info;
 	struct kfd_local_mem_info local_mem_info;
 
 	const struct kfd2kgd_calls *kfd2kgd;
@@ -290,30 +337,13 @@ struct kfd_dev {
 	unsigned int gtt_sa_chunk_size;
 	unsigned int gtt_sa_num_of_chunks;
 
-	/* Interrupts */
-	struct kfifo ih_fifo;
-	struct workqueue_struct *ih_wq;
-	struct work_struct interrupt_work;
-	spinlock_t interrupt_lock;
-
-	/* QCM Device instance */
-	struct device_queue_manager *dqm;
-
 	bool init_complete;
-	/*
-	 * Interrupts of interest to KFD are copied
-	 * from the HW ring into a SW ring.
-	 */
-	bool interrupts_active;
 
 	/* Firmware versions */
 	uint16_t mec_fw_version;
 	uint16_t mec2_fw_version;
 	uint16_t sdma_fw_version;
 
-	/* Maximum process number mapped to HW scheduler */
-	unsigned int max_proc_per_quantum;
-
 	/* CWSR */
 	bool cwsr_enabled;
 	const void *cwsr_isa;
@@ -327,21 +357,9 @@ struct kfd_dev {
 	/* Use IOMMU v2 flag */
 	bool use_iommu_v2;
 
-	/* SRAM ECC flag */
-	atomic_t sram_ecc_flag;
-
 	/* Compute Profile ref. count */
 	atomic_t compute_profile;
 
-	/* Global GWS resource shared between processes */
-	void *gws;
-
-	/* Clients watching SMI events */
-	struct list_head smi_clients;
-	spinlock_t smi_lock;
-
-	uint32_t reset_seq_num;
-
 	struct ida doorbell_ida;
 	unsigned int max_doorbell_slices;
 
@@ -349,6 +367,8 @@ struct kfd_dev {
 
 	/* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
 	struct dev_pagemap pgmap;
+
+	struct kfd_node *node;
 };
 
 enum kfd_mempool {
@@ -563,7 +583,7 @@ struct queue {
 	unsigned int doorbell_id;
 
 	struct kfd_process	*process;
-	struct kfd_dev		*device;
+	struct kfd_node		*device;
 	void *gws;
 
 	/* procfs */
@@ -697,7 +717,7 @@ enum kfd_pdd_bound {
 /* Data that is per-process-per device. */
 struct kfd_process_device {
 	/* The device that owns this data. */
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 
 	/* The process that owns this kfd_process_device. */
 	struct kfd_process *process;
@@ -925,7 +945,7 @@ struct amdkfd_ioctl_desc {
 	unsigned int cmd_drv;
 	const char *name;
 };
-bool kfd_dev_is_large_bar(struct kfd_dev *dev);
+bool kfd_dev_is_large_bar(struct kfd_node *dev);
 
 int kfd_process_create_wq(void);
 void kfd_process_destroy_wq(void);
@@ -961,16 +981,16 @@ int kfd_process_get_user_gpu_id(struct kfd_process *p, uint32_t actual_gpu_id);
 
 int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 			       struct file *drm_file);
-struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
+struct kfd_process_device *kfd_bind_process_to_device(struct kfd_node *dev,
 						struct kfd_process *p);
-struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
+struct kfd_process_device *kfd_get_process_device_data(struct kfd_node *dev,
 							struct kfd_process *p);
-struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
+struct kfd_process_device *kfd_create_process_device_data(struct kfd_node *dev,
 							struct kfd_process *p);
 
 bool kfd_process_xnack_mode(struct kfd_process *p, bool supported);
 
-int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
+int kfd_reserved_mem_mmap(struct kfd_node *dev, struct kfd_process *process,
 			  struct vm_area_struct *vma);
 
 /* KFD process API for creating and translating handles */
@@ -994,7 +1014,7 @@ void kfd_pasid_free(u32 pasid);
 size_t kfd_doorbell_process_slice(struct kfd_dev *kfd);
 int kfd_doorbell_init(struct kfd_dev *kfd);
 void kfd_doorbell_fini(struct kfd_dev *kfd);
-int kfd_doorbell_mmap(struct kfd_dev *dev, struct kfd_process *process,
+int kfd_doorbell_mmap(struct kfd_node *dev, struct kfd_process *process,
 		      struct vm_area_struct *vma);
 void __iomem *kfd_get_kernel_doorbell(struct kfd_dev *kfd,
 					unsigned int *doorbell_off);
@@ -1012,10 +1032,10 @@ void kfd_free_process_doorbells(struct kfd_dev *kfd,
 				unsigned int doorbell_index);
 /* GTT Sub-Allocator */
 
-int kfd_gtt_sa_allocate(struct kfd_dev *kfd, unsigned int size,
+int kfd_gtt_sa_allocate(struct kfd_node *node, unsigned int size,
 			struct kfd_mem_obj **mem_obj);
 
-int kfd_gtt_sa_free(struct kfd_dev *kfd, struct kfd_mem_obj *mem_obj);
+int kfd_gtt_sa_free(struct kfd_node *node, struct kfd_mem_obj *mem_obj);
 
 extern struct device *kfd_device;
 
@@ -1028,25 +1048,25 @@ void kfd_procfs_del_queue(struct queue *q);
 /* Topology */
 int kfd_topology_init(void);
 void kfd_topology_shutdown(void);
-int kfd_topology_add_device(struct kfd_dev *gpu);
-int kfd_topology_remove_device(struct kfd_dev *gpu);
+int kfd_topology_add_device(struct kfd_node *gpu);
+int kfd_topology_remove_device(struct kfd_node *gpu);
 struct kfd_topology_device *kfd_topology_device_by_proximity_domain(
 						uint32_t proximity_domain);
 struct kfd_topology_device *kfd_topology_device_by_proximity_domain_no_lock(
 						uint32_t proximity_domain);
 struct kfd_topology_device *kfd_topology_device_by_id(uint32_t gpu_id);
-struct kfd_dev *kfd_device_by_id(uint32_t gpu_id);
-struct kfd_dev *kfd_device_by_pci_dev(const struct pci_dev *pdev);
-struct kfd_dev *kfd_device_by_adev(const struct amdgpu_device *adev);
-int kfd_topology_enum_kfd_devices(uint8_t idx, struct kfd_dev **kdev);
+struct kfd_node *kfd_device_by_id(uint32_t gpu_id);
+struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev);
+struct kfd_node *kfd_device_by_adev(const struct amdgpu_device *adev);
+int kfd_topology_enum_kfd_devices(uint8_t idx, struct kfd_node **kdev);
 int kfd_numa_node_to_apic_id(int numa_node_id);
 void kfd_double_confirm_iommu_support(struct kfd_dev *gpu);
 
 /* Interrupts */
-int kfd_interrupt_init(struct kfd_dev *dev);
-void kfd_interrupt_exit(struct kfd_dev *dev);
-bool enqueue_ih_ring_entry(struct kfd_dev *kfd,	const void *ih_ring_entry);
-bool interrupt_is_wanted(struct kfd_dev *dev,
+int kfd_interrupt_init(struct kfd_node *dev);
+void kfd_interrupt_exit(struct kfd_node *dev);
+bool enqueue_ih_ring_entry(struct kfd_node *kfd, const void *ih_ring_entry);
+bool interrupt_is_wanted(struct kfd_node *dev,
 				const uint32_t *ih_ring_entry,
 				uint32_t *patched_ihre, bool *flag);
 
@@ -1174,22 +1194,22 @@ void print_queue_properties(struct queue_properties *q);
 void print_queue(struct queue *q);
 
 struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
+		struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_cik_hawaii(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
+		struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
+		struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_vi_tonga(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
+		struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
+		struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
+		struct kfd_node *dev);
 struct mqd_manager *mqd_manager_init_v11(enum KFD_MQD_TYPE type,
-		struct kfd_dev *dev);
-struct device_queue_manager *device_queue_manager_init(struct kfd_dev *dev);
+		struct kfd_node *dev);
+struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev);
 void device_queue_manager_uninit(struct device_queue_manager *dqm);
-struct kernel_queue *kernel_queue_init(struct kfd_dev *dev,
+struct kernel_queue *kernel_queue_init(struct kfd_node *dev,
 					enum kfd_queue_type type);
 void kernel_queue_uninit(struct kernel_queue *kq, bool hanging);
 int kfd_dqm_evict_pasid(struct device_queue_manager *dqm, u32 pasid);
@@ -1206,7 +1226,7 @@ void kfd_process_dequeue_from_all_devices(struct kfd_process *p);
 int pqm_init(struct process_queue_manager *pqm, struct kfd_process *p);
 void pqm_uninit(struct process_queue_manager *pqm);
 int pqm_create_queue(struct process_queue_manager *pqm,
-			    struct kfd_dev *dev,
+			    struct kfd_node *dev,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
@@ -1323,7 +1343,7 @@ int kfd_wait_on_events(struct kfd_process *p,
 		       uint32_t *wait_result);
 void kfd_signal_event_interrupt(u32 pasid, uint32_t partial_id,
 				uint32_t valid_id_bits);
-void kfd_signal_iommu_event(struct kfd_dev *dev,
+void kfd_signal_iommu_event(struct kfd_node *dev,
 			    u32 pasid, unsigned long address,
 			    bool is_write_requested, bool is_execute_requested);
 void kfd_signal_hw_exception_event(u32 pasid);
@@ -1339,12 +1359,12 @@ int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 int kfd_get_num_events(struct kfd_process *p);
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
 
-void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
+void kfd_signal_vm_fault_event(struct kfd_node *dev, u32 pasid,
 				struct kfd_vm_fault_info *info);
 
-void kfd_signal_reset_event(struct kfd_dev *dev);
+void kfd_signal_reset_event(struct kfd_node *dev);
 
-void kfd_signal_poison_consumed_event(struct kfd_dev *dev, u32 pasid);
+void kfd_signal_poison_consumed_event(struct kfd_node *dev, u32 pasid);
 
 void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type);
 
@@ -1359,12 +1379,12 @@ static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
 bool kfd_is_locked(void);
 
 /* Compute profile */
-void kfd_inc_compute_active(struct kfd_dev *dev);
-void kfd_dec_compute_active(struct kfd_dev *dev);
+void kfd_inc_compute_active(struct kfd_node *dev);
+void kfd_dec_compute_active(struct kfd_node *dev);
 
 /* Cgroup Support */
 /* Check with device cgroup if @kfd device is accessible */
-static inline int kfd_devcgroup_check_permission(struct kfd_dev *kfd)
+static inline int kfd_devcgroup_check_permission(struct kfd_node *kfd)
 {
 #if defined(CONFIG_CGROUP_DEVICE) || defined(CONFIG_CGROUP_BPF)
 	struct drm_device *ddev = adev_to_drm(kfd->adev);
@@ -1389,7 +1409,7 @@ int dqm_debugfs_hqds(struct seq_file *m, void *data);
 int kfd_debugfs_rls_by_device(struct seq_file *m, void *data);
 int pm_debugfs_runlist(struct seq_file *m, void *data);
 
-int kfd_debugfs_hang_hws(struct kfd_dev *dev);
+int kfd_debugfs_hang_hws(struct kfd_node *dev);
 int pm_debugfs_hang_hws(struct packet_manager *pm);
 int dqm_debugfs_hang_hws(struct device_queue_manager *dqm);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 95cc63d9f578..d96f7dadde0d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -269,7 +269,7 @@ static int kfd_get_cu_occupancy(struct attribute *attr, char *buffer)
 	int cu_cnt;
 	int wave_cnt;
 	int max_waves_per_cu;
-	struct kfd_dev *dev = NULL;
+	struct kfd_node *dev = NULL;
 	struct kfd_process *proc = NULL;
 	struct kfd_process_device *pdd = NULL;
 
@@ -691,7 +691,7 @@ void kfd_process_destroy_wq(void)
 static void kfd_process_free_gpuvm(struct kgd_mem *mem,
 			struct kfd_process_device *pdd, void **kptr)
 {
-	struct kfd_dev *dev = pdd->dev;
+	struct kfd_node *dev = pdd->dev;
 
 	if (kptr && *kptr) {
 		amdgpu_amdkfd_gpuvm_unmap_gtt_bo_from_kernel(mem);
@@ -713,7 +713,7 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 				   uint64_t gpu_va, uint32_t size,
 				   uint32_t flags, struct kgd_mem **mem, void **kptr)
 {
-	struct kfd_dev *kdev = pdd->dev;
+	struct kfd_node *kdev = pdd->dev;
 	int err;
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev->adev, gpu_va, size,
@@ -982,7 +982,7 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 static void kfd_process_kunmap_signal_bo(struct kfd_process *p)
 {
 	struct kfd_process_device *pdd;
-	struct kfd_dev *kdev;
+	struct kfd_node *kdev;
 	void *mem;
 
 	kdev = kfd_device_by_id(GET_GPU_ID(p->signal_handle));
@@ -1040,9 +1040,9 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		bitmap_free(pdd->qpd.doorbell_bitmap);
 		idr_destroy(&pdd->alloc_idr);
 
-		kfd_free_process_doorbells(pdd->dev, pdd->doorbell_index);
+		kfd_free_process_doorbells(pdd->dev->kfd, pdd->doorbell_index);
 
-		if (pdd->dev->shared_resources.enable_mes)
+		if (pdd->dev->kfd->shared_resources.enable_mes)
 			amdgpu_amdkfd_free_gtt_mem(pdd->dev->adev,
 						   pdd->proc_ctx_bo);
 		/*
@@ -1259,10 +1259,10 @@ static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 	int i;
 
 	for (i = 0; i < p->n_pdds; i++) {
-		struct kfd_dev *dev = p->pdds[i]->dev;
+		struct kfd_node *dev = p->pdds[i]->dev;
 		struct qcm_process_device *qpd = &p->pdds[i]->qpd;
 
-		if (!dev->cwsr_enabled || qpd->cwsr_kaddr || qpd->cwsr_base)
+		if (!dev->kfd->cwsr_enabled || qpd->cwsr_kaddr || qpd->cwsr_base)
 			continue;
 
 		offset = KFD_MMAP_TYPE_RESERVED_MEM | KFD_MMAP_GPU_ID(dev->id);
@@ -1279,7 +1279,7 @@ static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 			return err;
 		}
 
-		memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
+		memcpy(qpd->cwsr_kaddr, dev->kfd->cwsr_isa, dev->kfd->cwsr_isa_size);
 
 		qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 		pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
@@ -1291,7 +1291,7 @@ static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
 
 static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 {
-	struct kfd_dev *dev = pdd->dev;
+	struct kfd_node *dev = pdd->dev;
 	struct qcm_process_device *qpd = &pdd->qpd;
 	uint32_t flags = KFD_IOC_ALLOC_MEM_FLAGS_GTT
 			| KFD_IOC_ALLOC_MEM_FLAGS_NO_SUBSTITUTE
@@ -1300,7 +1300,7 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 	void *kaddr;
 	int ret;
 
-	if (!dev->cwsr_enabled || qpd->cwsr_kaddr || !qpd->cwsr_base)
+	if (!dev->kfd->cwsr_enabled || qpd->cwsr_kaddr || !qpd->cwsr_base)
 		return 0;
 
 	/* cwsr_base is only set for dGPU */
@@ -1313,7 +1313,7 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 	qpd->cwsr_kaddr = kaddr;
 	qpd->tba_addr = qpd->cwsr_base;
 
-	memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
+	memcpy(qpd->cwsr_kaddr, dev->kfd->cwsr_isa, dev->kfd->cwsr_isa_size);
 
 	qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
 	pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
@@ -1324,10 +1324,10 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 
 static void kfd_process_device_destroy_cwsr_dgpu(struct kfd_process_device *pdd)
 {
-	struct kfd_dev *dev = pdd->dev;
+	struct kfd_node *dev = pdd->dev;
 	struct qcm_process_device *qpd = &pdd->qpd;
 
-	if (!dev->cwsr_enabled || !qpd->cwsr_kaddr || !qpd->cwsr_base)
+	if (!dev->kfd->cwsr_enabled || !qpd->cwsr_kaddr || !qpd->cwsr_base)
 		return;
 
 	kfd_process_free_gpuvm(qpd->cwsr_mem, pdd, &qpd->cwsr_kaddr);
@@ -1371,7 +1371,7 @@ bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
 	 * support retry.
 	 */
 	for (i = 0; i < p->n_pdds; i++) {
-		struct kfd_dev *dev = p->pdds[i]->dev;
+		struct kfd_node *dev = p->pdds[i]->dev;
 
 		/* Only consider GFXv9 and higher GPUs. Older GPUs don't
 		 * support the SVM APIs and don't need to be considered
@@ -1394,7 +1394,7 @@ bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
 		if (KFD_GC_VERSION(dev) >= IP_VERSION(10, 1, 1))
 			return false;
 
-		if (dev->noretry)
+		if (dev->kfd->noretry)
 			return false;
 	}
 
@@ -1528,7 +1528,7 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
 	return 0;
 }
 
-struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
+struct kfd_process_device *kfd_get_process_device_data(struct kfd_node *dev,
 							struct kfd_process *p)
 {
 	int i;
@@ -1540,7 +1540,7 @@ struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 	return NULL;
 }
 
-struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
+struct kfd_process_device *kfd_create_process_device_data(struct kfd_node *dev,
 							struct kfd_process *p)
 {
 	struct kfd_process_device *pdd = NULL;
@@ -1552,7 +1552,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	if (!pdd)
 		return NULL;
 
-	if (init_doorbell_bitmap(&pdd->qpd, dev)) {
+	if (init_doorbell_bitmap(&pdd->qpd, dev->kfd)) {
 		pr_err("Failed to init doorbell for process\n");
 		goto err_free_pdd;
 	}
@@ -1573,7 +1573,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
 	pdd->user_gpu_id = dev->id;
 	atomic64_set(&pdd->evict_duration_counter, 0);
 
-	if (dev->shared_resources.enable_mes) {
+	if (dev->kfd->shared_resources.enable_mes) {
 		retval = amdgpu_amdkfd_alloc_gtt_mem(dev->adev,
 						AMDGPU_MES_PROC_CTX_SIZE,
 						&pdd->proc_ctx_bo,
@@ -1619,7 +1619,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	struct amdgpu_fpriv *drv_priv;
 	struct amdgpu_vm *avm;
 	struct kfd_process *p;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	int ret;
 
 	if (!drm_file)
@@ -1679,7 +1679,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
  *
  * Assumes that the process lock is held.
  */
-struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
+struct kfd_process_device *kfd_bind_process_to_device(struct kfd_node *dev,
 							struct kfd_process *p)
 {
 	struct kfd_process_device *pdd;
@@ -1811,7 +1811,7 @@ int kfd_process_evict_queues(struct kfd_process *p, uint32_t trigger)
 	for (i = 0; i < p->n_pdds; i++) {
 		struct kfd_process_device *pdd = p->pdds[i];
 
-		kfd_smi_event_queue_eviction(pdd->dev, p->lead_thread->pid,
+		kfd_smi_event_queue_eviction(pdd->dev->kfd, p->lead_thread->pid,
 					     trigger);
 
 		r = pdd->dev->dqm->ops.evict_process_queues(pdd->dev->dqm,
@@ -1839,7 +1839,7 @@ int kfd_process_evict_queues(struct kfd_process *p, uint32_t trigger)
 		if (n_evicted == 0)
 			break;
 
-		kfd_smi_event_queue_restore(pdd->dev, p->lead_thread->pid);
+		kfd_smi_event_queue_restore(pdd->dev->kfd, p->lead_thread->pid);
 
 		if (pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
 							      &pdd->qpd))
@@ -1860,7 +1860,7 @@ int kfd_process_restore_queues(struct kfd_process *p)
 	for (i = 0; i < p->n_pdds; i++) {
 		struct kfd_process_device *pdd = p->pdds[i];
 
-		kfd_smi_event_queue_restore(pdd->dev, p->lead_thread->pid);
+		kfd_smi_event_queue_restore(pdd->dev->kfd, p->lead_thread->pid);
 
 		r = pdd->dev->dqm->ops.restore_process_queues(pdd->dev->dqm,
 							      &pdd->qpd);
@@ -2016,7 +2016,7 @@ int kfd_resume_all_processes(void)
 	return ret;
 }
 
-int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
+int kfd_reserved_mem_mmap(struct kfd_node *dev, struct kfd_process *process,
 			  struct vm_area_struct *vma)
 {
 	struct kfd_process_device *pdd;
@@ -2051,7 +2051,7 @@ void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type)
 {
 	struct amdgpu_vm *vm = drm_priv_to_vm(pdd->drm_priv);
 	uint64_t tlb_seq = amdgpu_vm_tlb_seq(vm);
-	struct kfd_dev *dev = pdd->dev;
+	struct kfd_node *dev = pdd->dev;
 
 	/*
 	 * It can be that we race and lose here, but that is extremely unlikely
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 4236539d9f93..5602498e713f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -81,7 +81,7 @@ static int find_available_queue_slot(struct process_queue_manager *pqm,
 
 void kfd_process_dequeue_from_device(struct kfd_process_device *pdd)
 {
-	struct kfd_dev *dev = pdd->dev;
+	struct kfd_node *dev = pdd->dev;
 
 	if (pdd->already_dequeued)
 		return;
@@ -93,7 +93,7 @@ void kfd_process_dequeue_from_device(struct kfd_process_device *pdd)
 int pqm_set_gws(struct process_queue_manager *pqm, unsigned int qid,
 			void *gws)
 {
-	struct kfd_dev *dev = NULL;
+	struct kfd_node *dev = NULL;
 	struct process_queue_node *pqn;
 	struct kfd_process_device *pdd;
 	struct kgd_mem *mem = NULL;
@@ -178,7 +178,7 @@ void pqm_uninit(struct process_queue_manager *pqm)
 }
 
 static int init_user_queue(struct process_queue_manager *pqm,
-				struct kfd_dev *dev, struct queue **q,
+				struct kfd_node *dev, struct queue **q,
 				struct queue_properties *q_properties,
 				struct file *f, struct amdgpu_bo *wptr_bo,
 				unsigned int qid)
@@ -199,7 +199,7 @@ static int init_user_queue(struct process_queue_manager *pqm,
 	(*q)->device = dev;
 	(*q)->process = pqm->process;
 
-	if (dev->shared_resources.enable_mes) {
+	if (dev->kfd->shared_resources.enable_mes) {
 		retval = amdgpu_amdkfd_alloc_gtt_mem(dev->adev,
 						AMDGPU_MES_GANG_CTX_SIZE,
 						&(*q)->gang_ctx_bo,
@@ -224,7 +224,7 @@ static int init_user_queue(struct process_queue_manager *pqm,
 }
 
 int pqm_create_queue(struct process_queue_manager *pqm,
-			    struct kfd_dev *dev,
+			    struct kfd_node *dev,
 			    struct file *f,
 			    struct queue_properties *properties,
 			    unsigned int *qid,
@@ -258,7 +258,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 	 * Hence we also check the type as well
 	 */
 	if ((pdd->qpd.is_debug) || (type == KFD_QUEUE_TYPE_DIQ))
-		max_queues = dev->device_info.max_no_of_hqd/2;
+		max_queues = dev->kfd->device_info.max_no_of_hqd/2;
 
 	if (pdd->qpd.queue_count >= max_queues)
 		return -ENOSPC;
@@ -354,7 +354,7 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 		 */
 		*p_doorbell_offset_in_process =
 			(q->properties.doorbell_off * sizeof(uint32_t)) &
-			(kfd_doorbell_process_slice(dev) - 1);
+			(kfd_doorbell_process_slice(dev->kfd) - 1);
 
 	pr_debug("PQM After DQM create queue\n");
 
@@ -387,7 +387,7 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
 	struct process_queue_node *pqn;
 	struct kfd_process_device *pdd;
 	struct device_queue_manager *dqm;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	int retval;
 
 	dqm = NULL;
@@ -439,7 +439,7 @@ int pqm_destroy_queue(struct process_queue_manager *pqm, unsigned int qid)
 			pdd->qpd.num_gws = 0;
 		}
 
-		if (dev->shared_resources.enable_mes) {
+		if (dev->kfd->shared_resources.enable_mes) {
 			amdgpu_amdkfd_free_gtt_mem(dev->adev,
 						   pqn->q->gang_ctx_bo);
 			if (pqn->q->wptr_bo)
@@ -859,7 +859,7 @@ int kfd_criu_restore_queue(struct kfd_process *p,
 	}
 
 	if (!pdd->doorbell_index &&
-	    kfd_alloc_process_doorbells(pdd->dev, &pdd->doorbell_index) < 0) {
+	    kfd_alloc_process_doorbells(pdd->dev->kfd, &pdd->doorbell_index) < 0) {
 		ret = -ENOMEM;
 		goto exit;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index 0472b56de245..a0bf6558f4ac 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -36,7 +36,7 @@ struct kfd_smi_client {
 	wait_queue_head_t wait_queue;
 	/* events enabled */
 	uint64_t events;
-	struct kfd_dev *dev;
+	struct kfd_node *dev;
 	spinlock_t lock;
 	struct rcu_head rcu;
 	pid_t pid;
@@ -149,7 +149,7 @@ static void kfd_smi_ev_client_free(struct rcu_head *p)
 static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
 {
 	struct kfd_smi_client *client = filep->private_data;
-	struct kfd_dev *dev = client->dev;
+	struct kfd_node *dev = client->dev;
 
 	spin_lock(&dev->smi_lock);
 	list_del_rcu(&client->list);
@@ -171,7 +171,7 @@ static bool kfd_smi_ev_enabled(pid_t pid, struct kfd_smi_client *client,
 	return events & KFD_SMI_EVENT_MASK_FROM_INDEX(event);
 }
 
-static void add_event_to_kfifo(pid_t pid, struct kfd_dev *dev,
+static void add_event_to_kfifo(pid_t pid, struct kfd_node *dev,
 			       unsigned int smi_event, char *event_msg, int len)
 {
 	struct kfd_smi_client *client;
@@ -196,7 +196,7 @@ static void add_event_to_kfifo(pid_t pid, struct kfd_dev *dev,
 }
 
 __printf(4, 5)
-static void kfd_smi_event_add(pid_t pid, struct kfd_dev *dev,
+static void kfd_smi_event_add(pid_t pid, struct kfd_node *dev,
 			      unsigned int event, char *fmt, ...)
 {
 	char fifo_in[KFD_SMI_EVENT_MSG_SIZE];
@@ -215,7 +215,7 @@ static void kfd_smi_event_add(pid_t pid, struct kfd_dev *dev,
 	add_event_to_kfifo(pid, dev, event, fifo_in, len);
 }
 
-void kfd_smi_event_update_gpu_reset(struct kfd_dev *dev, bool post_reset)
+void kfd_smi_event_update_gpu_reset(struct kfd_node *dev, bool post_reset)
 {
 	unsigned int event;
 
@@ -228,7 +228,7 @@ void kfd_smi_event_update_gpu_reset(struct kfd_dev *dev, bool post_reset)
 	kfd_smi_event_add(0, dev, event, "%x\n", dev->reset_seq_num);
 }
 
-void kfd_smi_event_update_thermal_throttling(struct kfd_dev *dev,
+void kfd_smi_event_update_thermal_throttling(struct kfd_node *dev,
 					     uint64_t throttle_bitmask)
 {
 	kfd_smi_event_add(0, dev, KFD_SMI_EVENT_THERMAL_THROTTLE, "%llx:%llx\n",
@@ -236,7 +236,7 @@ void kfd_smi_event_update_thermal_throttling(struct kfd_dev *dev,
 			  amdgpu_dpm_get_thermal_throttling_counter(dev->adev));
 }
 
-void kfd_smi_event_update_vmfault(struct kfd_dev *dev, uint16_t pasid)
+void kfd_smi_event_update_vmfault(struct kfd_node *dev, uint16_t pasid)
 {
 	struct amdgpu_task_info task_info;
 
@@ -254,17 +254,17 @@ void kfd_smi_event_page_fault_start(struct kfd_dev *dev, pid_t pid,
 				    unsigned long address, bool write_fault,
 				    ktime_t ts)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_PAGE_FAULT_START,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_PAGE_FAULT_START,
 			  "%lld -%d @%lx(%x) %c\n", ktime_to_ns(ts), pid,
-			  address, dev->id, write_fault ? 'W' : 'R');
+			  address, dev->node->id, write_fault ? 'W' : 'R');
 }
 
 void kfd_smi_event_page_fault_end(struct kfd_dev *dev, pid_t pid,
 				  unsigned long address, bool migration)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_PAGE_FAULT_END,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_PAGE_FAULT_END,
 			  "%lld -%d @%lx(%x) %c\n", ktime_get_boottime_ns(),
-			  pid, address, dev->id, migration ? 'M' : 'U');
+			  pid, address, dev->node->id, migration ? 'M' : 'U');
 }
 
 void kfd_smi_event_migration_start(struct kfd_dev *dev, pid_t pid,
@@ -273,7 +273,7 @@ void kfd_smi_event_migration_start(struct kfd_dev *dev, pid_t pid,
 				   uint32_t prefetch_loc, uint32_t preferred_loc,
 				   uint32_t trigger)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_MIGRATE_START,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_MIGRATE_START,
 			  "%lld -%d @%lx(%lx) %x->%x %x:%x %d\n",
 			  ktime_get_boottime_ns(), pid, start, end - start,
 			  from, to, prefetch_loc, preferred_loc, trigger);
@@ -283,7 +283,7 @@ void kfd_smi_event_migration_end(struct kfd_dev *dev, pid_t pid,
 				 unsigned long start, unsigned long end,
 				 uint32_t from, uint32_t to, uint32_t trigger)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_MIGRATE_END,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_MIGRATE_END,
 			  "%lld -%d @%lx(%lx) %x->%x %d\n",
 			  ktime_get_boottime_ns(), pid, start, end - start,
 			  from, to, trigger);
@@ -292,16 +292,16 @@ void kfd_smi_event_migration_end(struct kfd_dev *dev, pid_t pid,
 void kfd_smi_event_queue_eviction(struct kfd_dev *dev, pid_t pid,
 				  uint32_t trigger)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_QUEUE_EVICTION,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_QUEUE_EVICTION,
 			  "%lld -%d %x %d\n", ktime_get_boottime_ns(), pid,
-			  dev->id, trigger);
+			  dev->node->id, trigger);
 }
 
 void kfd_smi_event_queue_restore(struct kfd_dev *dev, pid_t pid)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_QUEUE_RESTORE,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_QUEUE_RESTORE,
 			  "%lld -%d %x\n", ktime_get_boottime_ns(), pid,
-			  dev->id);
+			  dev->node->id);
 }
 
 void kfd_smi_event_queue_restore_rescheduled(struct mm_struct *mm)
@@ -328,12 +328,12 @@ void kfd_smi_event_unmap_from_gpu(struct kfd_dev *dev, pid_t pid,
 				  unsigned long address, unsigned long last,
 				  uint32_t trigger)
 {
-	kfd_smi_event_add(pid, dev, KFD_SMI_EVENT_UNMAP_FROM_GPU,
+	kfd_smi_event_add(pid, dev->node, KFD_SMI_EVENT_UNMAP_FROM_GPU,
 			  "%lld -%d @%lx(%lx) %x %d\n", ktime_get_boottime_ns(),
-			  pid, address, last - address + 1, dev->id, trigger);
+			  pid, address, last - address + 1, dev->node->id, trigger);
 }
 
-int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
+int kfd_smi_event_open(struct kfd_node *dev, uint32_t *fd)
 {
 	struct kfd_smi_client *client;
 	int ret;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
index 76fe4e0ec2d2..59cd089f80d1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.h
@@ -24,11 +24,11 @@
 #ifndef KFD_SMI_EVENTS_H_INCLUDED
 #define KFD_SMI_EVENTS_H_INCLUDED
 
-int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd);
-void kfd_smi_event_update_vmfault(struct kfd_dev *dev, uint16_t pasid);
-void kfd_smi_event_update_thermal_throttling(struct kfd_dev *dev,
+int kfd_smi_event_open(struct kfd_node *dev, uint32_t *fd);
+void kfd_smi_event_update_vmfault(struct kfd_node *dev, uint16_t pasid);
+void kfd_smi_event_update_thermal_throttling(struct kfd_node *dev,
 					     uint64_t throttle_bitmask);
-void kfd_smi_event_update_gpu_reset(struct kfd_dev *dev, bool post_reset);
+void kfd_smi_event_update_gpu_reset(struct kfd_node *dev, bool post_reset);
 void kfd_smi_event_page_fault_start(struct kfd_dev *dev, pid_t pid,
 				    unsigned long address, bool write_fault,
 				    ktime_t ts);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b94d2c1422ad..9f0932d0c93f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1263,7 +1263,7 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
 			return -EINVAL;
 		}
 
-		kfd_smi_event_unmap_from_gpu(pdd->dev, p->lead_thread->pid,
+		kfd_smi_event_unmap_from_gpu(pdd->dev->kfd, p->lead_thread->pid,
 					     start, last, trigger);
 
 		r = svm_range_unmap_from_gpu(pdd->dev->adev,
@@ -3072,7 +3072,7 @@ int svm_range_list_init(struct kfd_process *p)
 	spin_lock_init(&svms->deferred_list_lock);
 
 	for (i = 0; i < p->n_pdds; i++)
-		if (KFD_IS_SVM_API_SUPPORTED(p->pdds[i]->dev))
+		if (KFD_IS_SVM_API_SUPPORTED(p->pdds[i]->dev->kfd))
 			bitmap_set(svms->bitmap_supported, i, 1);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 8e4124dcb6e4..06a11186d947 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -96,7 +96,7 @@ struct kfd_topology_device *kfd_topology_device_by_id(uint32_t gpu_id)
 	return ret;
 }
 
-struct kfd_dev *kfd_device_by_id(uint32_t gpu_id)
+struct kfd_node *kfd_device_by_id(uint32_t gpu_id)
 {
 	struct kfd_topology_device *top_dev;
 
@@ -107,10 +107,10 @@ struct kfd_dev *kfd_device_by_id(uint32_t gpu_id)
 	return top_dev->gpu;
 }
 
-struct kfd_dev *kfd_device_by_pci_dev(const struct pci_dev *pdev)
+struct kfd_node *kfd_device_by_pci_dev(const struct pci_dev *pdev)
 {
 	struct kfd_topology_device *top_dev;
-	struct kfd_dev *device = NULL;
+	struct kfd_node *device = NULL;
 
 	down_read(&topology_lock);
 
@@ -125,10 +125,10 @@ struct kfd_dev *kfd_device_by_pci_dev(const struct pci_dev *pdev)
 	return device;
 }
 
-struct kfd_dev *kfd_device_by_adev(const struct amdgpu_device *adev)
+struct kfd_node *kfd_device_by_adev(const struct amdgpu_device *adev)
 {
 	struct kfd_topology_device *top_dev;
-	struct kfd_dev *device = NULL;
+	struct kfd_node *device = NULL;
 
 	down_read(&topology_lock);
 
@@ -526,7 +526,7 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
 
 	if (dev->gpu) {
 		log_max_watch_addr =
-			__ilog2_u32(dev->gpu->device_info.num_of_watch_points);
+			__ilog2_u32(dev->gpu->kfd->device_info.num_of_watch_points);
 
 		if (log_max_watch_addr) {
 			dev->node_props.capability |=
@@ -548,11 +548,11 @@ static ssize_t node_show(struct kobject *kobj, struct attribute *attr,
 		sysfs_show_64bit_prop(buffer, offs, "local_mem_size", 0ULL);
 
 		sysfs_show_32bit_prop(buffer, offs, "fw_version",
-				      dev->gpu->mec_fw_version);
+				      dev->gpu->kfd->mec_fw_version);
 		sysfs_show_32bit_prop(buffer, offs, "capability",
 				      dev->node_props.capability);
 		sysfs_show_32bit_prop(buffer, offs, "sdma_fw_version",
-				      dev->gpu->sdma_fw_version);
+				      dev->gpu->kfd->sdma_fw_version);
 		sysfs_show_64bit_prop(buffer, offs, "unique_id",
 				      dev->gpu->adev->unique_id);
 
@@ -1157,7 +1157,7 @@ void kfd_topology_shutdown(void)
 	up_write(&topology_lock);
 }
 
-static uint32_t kfd_generate_gpu_id(struct kfd_dev *gpu)
+static uint32_t kfd_generate_gpu_id(struct kfd_node *gpu)
 {
 	uint32_t hashout;
 	uint32_t buf[7];
@@ -1167,8 +1167,8 @@ static uint32_t kfd_generate_gpu_id(struct kfd_dev *gpu)
 	if (!gpu)
 		return 0;
 
-	local_mem_size = gpu->local_mem_info.local_mem_size_private +
-			gpu->local_mem_info.local_mem_size_public;
+	local_mem_size = gpu->kfd->local_mem_info.local_mem_size_private +
+			gpu->kfd->local_mem_info.local_mem_size_public;
 	buf[0] = gpu->adev->pdev->devfn;
 	buf[1] = gpu->adev->pdev->subsystem_vendor |
 		(gpu->adev->pdev->subsystem_device << 16);
@@ -1188,7 +1188,7 @@ static uint32_t kfd_generate_gpu_id(struct kfd_dev *gpu)
  *		list then return NULL. This means a new topology device has to
  *		be created for this GPU.
  */
-static struct kfd_topology_device *kfd_assign_gpu(struct kfd_dev *gpu)
+static struct kfd_topology_device *kfd_assign_gpu(struct kfd_node *gpu)
 {
 	struct kfd_topology_device *dev;
 	struct kfd_topology_device *out_dev = NULL;
@@ -1201,7 +1201,7 @@ static struct kfd_topology_device *kfd_assign_gpu(struct kfd_dev *gpu)
 		/* Discrete GPUs need their own topology device list
 		 * entries. Don't assign them to CPU/APU nodes.
 		 */
-		if (!gpu->use_iommu_v2 &&
+		if (!gpu->kfd->use_iommu_v2 &&
 		    dev->node_props.cpu_cores_count)
 			continue;
 
@@ -1275,7 +1275,7 @@ static void kfd_set_iolink_no_atomics(struct kfd_topology_device *dev,
 				CRAT_IOLINK_FLAGS_NO_ATOMICS_64_BIT;
 	/* set gpu (dev) flags. */
 	} else {
-		if (!dev->gpu->pci_atomic_requested ||
+		if (!dev->gpu->kfd->pci_atomic_requested ||
 				dev->gpu->adev->asic_type == CHIP_HAWAII)
 			link->flags |= CRAT_IOLINK_FLAGS_NO_ATOMICS_32_BIT |
 				CRAT_IOLINK_FLAGS_NO_ATOMICS_64_BIT;
@@ -1569,8 +1569,8 @@ static int kfd_dev_create_p2p_links(void)
 		if (dev == new_dev)
 			break;
 		if (!dev->gpu || !dev->gpu->adev ||
-		    (dev->gpu->hive_id &&
-		     dev->gpu->hive_id == new_dev->gpu->hive_id))
+		    (dev->gpu->kfd->hive_id &&
+		     dev->gpu->kfd->hive_id == new_dev->gpu->kfd->hive_id))
 			goto next;
 
 		/* check if node(s) is/are peer accessible in one direction or bi-direction */
@@ -1590,7 +1590,6 @@ static int kfd_dev_create_p2p_links(void)
 	return ret;
 }
 
-
 /* Helper function. See kfd_fill_gpu_cache_info for parameter description */
 static int fill_in_l1_pcache(struct kfd_cache_properties **props_ext,
 				struct kfd_gpu_cache_info *pcache_info,
@@ -1723,7 +1722,7 @@ static int fill_in_l2_l3_pcache(struct kfd_cache_properties **props_ext,
 /* kfd_fill_cache_non_crat_info - Fill GPU cache info using kfd_gpu_cache_info
  * tables
  */
-static void kfd_fill_cache_non_crat_info(struct kfd_topology_device *dev, struct kfd_dev *kdev)
+static void kfd_fill_cache_non_crat_info(struct kfd_topology_device *dev, struct kfd_node *kdev)
 {
 	struct kfd_gpu_cache_info *pcache_info = NULL;
 	int i, j, k;
@@ -1805,7 +1804,7 @@ static void kfd_fill_cache_non_crat_info(struct kfd_topology_device *dev, struct
 	pr_debug("Added [%d] GPU cache entries\n", num_of_entries);
 }
 
-static int kfd_topology_add_device_locked(struct kfd_dev *gpu, uint32_t gpu_id,
+static int kfd_topology_add_device_locked(struct kfd_node *gpu, uint32_t gpu_id,
 					  struct kfd_topology_device **dev)
 {
 	int proximity_domain = ++topology_crat_proximity_domain;
@@ -1865,7 +1864,7 @@ static int kfd_topology_add_device_locked(struct kfd_dev *gpu, uint32_t gpu_id,
 	return res;
 }
 
-int kfd_topology_add_device(struct kfd_dev *gpu)
+int kfd_topology_add_device(struct kfd_node *gpu)
 {
 	uint32_t gpu_id;
 	struct kfd_topology_device *dev;
@@ -1916,7 +1915,8 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	dev->node_props.simd_arrays_per_engine =
 		cu_info.num_shader_arrays_per_engine;
 
-	dev->node_props.gfx_target_version = gpu->device_info.gfx_target_version;
+	dev->node_props.gfx_target_version =
+				gpu->kfd->device_info.gfx_target_version;
 	dev->node_props.vendor_id = gpu->adev->pdev->vendor;
 	dev->node_props.device_id = gpu->adev->pdev->device;
 	dev->node_props.capability |=
@@ -1929,15 +1929,15 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	dev->node_props.max_engine_clk_ccompute =
 		cpufreq_quick_get_max(0) / 1000;
 	dev->node_props.drm_render_minor =
-		gpu->shared_resources.drm_render_minor;
+		gpu->kfd->shared_resources.drm_render_minor;
 
-	dev->node_props.hive_id = gpu->hive_id;
+	dev->node_props.hive_id = gpu->kfd->hive_id;
 	dev->node_props.num_sdma_engines = kfd_get_num_sdma_engines(gpu);
 	dev->node_props.num_sdma_xgmi_engines =
 					kfd_get_num_xgmi_sdma_engines(gpu);
 	dev->node_props.num_sdma_queues_per_engine =
-				gpu->device_info.num_sdma_queues_per_engine -
-				gpu->device_info.num_reserved_sdma_queues_per_engine;
+				gpu->kfd->device_info.num_sdma_queues_per_engine -
+				gpu->kfd->device_info.num_reserved_sdma_queues_per_engine;
 	dev->node_props.num_gws = (dev->gpu->gws &&
 		dev->gpu->dqm->sched_policy != KFD_SCHED_POLICY_NO_HWS) ?
 		dev->gpu->adev->gds.gws_size : 0;
@@ -1979,7 +1979,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
 	 * Overwrite ATS capability according to needs_iommu_device to fix
 	 * potential missing corresponding bit in CRAT of BIOS.
 	 */
-	if (dev->gpu->use_iommu_v2)
+	if (dev->gpu->kfd->use_iommu_v2)
 		dev->node_props.capability |= HSA_CAP_ATS_PRESENT;
 	else
 		dev->node_props.capability &= ~HSA_CAP_ATS_PRESENT;
@@ -2079,7 +2079,7 @@ static void kfd_topology_update_io_links(int proximity_domain)
 	}
 }
 
-int kfd_topology_remove_device(struct kfd_dev *gpu)
+int kfd_topology_remove_device(struct kfd_node *gpu)
 {
 	struct kfd_topology_device *dev, *tmp;
 	uint32_t gpu_id;
@@ -2119,7 +2119,7 @@ int kfd_topology_remove_device(struct kfd_dev *gpu)
  * Return -	0: On success (@kdev will be NULL for non GPU nodes)
  *		-1: If end of list
  */
-int kfd_topology_enum_kfd_devices(uint8_t idx, struct kfd_dev **kdev)
+int kfd_topology_enum_kfd_devices(uint8_t idx, struct kfd_node **kdev)
 {
 
 	struct kfd_topology_device *top_dev;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
index fca30d00a9bb..3b8afb6aba79 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
@@ -75,7 +75,7 @@ struct kfd_mem_properties {
 	uint32_t		flags;
 	uint32_t		width;
 	uint32_t		mem_clk_max;
-	struct kfd_dev		*gpu;
+	struct kfd_node		*gpu;
 	struct kobject		*kobj;
 	struct attribute	attr;
 };
@@ -93,7 +93,7 @@ struct kfd_cache_properties {
 	uint32_t		cache_latency;
 	uint32_t		cache_type;
 	uint8_t			sibling_map[CACHE_SIBLINGMAP_SIZE];
-	struct kfd_dev		*gpu;
+	struct kfd_node		*gpu;
 	struct kobject		*kobj;
 	struct attribute	attr;
 	uint32_t		sibling_map_size;
@@ -113,7 +113,7 @@ struct kfd_iolink_properties {
 	uint32_t		max_bandwidth;
 	uint32_t		rec_transfer_size;
 	uint32_t		flags;
-	struct kfd_dev		*gpu;
+	struct kfd_node		*gpu;
 	struct kobject		*kobj;
 	struct attribute	attr;
 };
@@ -135,7 +135,7 @@ struct kfd_topology_device {
 	struct list_head		io_link_props;
 	struct list_head		p2p_link_props;
 	struct list_head		perf_props;
-	struct kfd_dev			*gpu;
+	struct kfd_node			*gpu;
 	struct kobject			*kobj_node;
 	struct kobject			*kobj_mem;
 	struct kobject			*kobj_cache;
-- 
2.39.2


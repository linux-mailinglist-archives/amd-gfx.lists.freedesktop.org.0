Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0239515336
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Apr 2022 20:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9187F10F8AC;
	Fri, 29 Apr 2022 18:02:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C9E10F899
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Apr 2022 18:02:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOi+fPlC79rdTRbG3ke7uC4+NT3B6uOBX4slcwZ3BsJ3ZILe2vKu/t7LNlxv3RjXxyF+GSGFrbPmvOX4DMTPB6c1aCK7qEYFBpImKzkgthKgJ/khXElVhTJZ4KLITJpYgWuhtcKGQDNSpFJWH4fkWNNDFfJ26KXJNcDd3W25J0ZHg34MRmnVteOojp3CGA12QR1do+HFaxs6FRGdxtPRqXHAH85QsGFB5Zs+RI3j6KRcUPynS2qEn8ZUdNnH5cVd+QmnCsk6cY+DE9SMXT7iR5W4FYAOkjCcdIecbyNFKhtKFf9uJR6gGUlvQcWb7KTzcOmKYQdF0zNO0sUysg10Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIpx7otn4xab4cfYRYre4gtJQwjg9fG1KGJoKA6m4yE=;
 b=GVgmUxSmsTbLm6fCL2nqSj8Iimj1YNDN+fHWQp4p2ld/QfUGAhUa8LE7mf6qqKzXEEbNj7s1+x7HjbaifEjoEULfKEiADDHBTQjRkrRcUYmyM0L23iOfPwkOFOHJOomG1PGMuOas27h0S+F4lIt1vHU1tVHrB4BlSDCRPR6/7OmASjNWHGrwdJKQ9NDMSFQ/j2O6ikZpFtetgdBFL5UrAfNjjRjYqql8xXX3y7CvlKQkdU24MJyznAlRVNgYsGVGXY/4SU1EFjOGk4rEi+jTH3CTZrhWA76u1zu0kl+T2ONlRSBZG5jFqBkOnbktw48Wc07gWsYHJ7L5FAK6MFsZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIpx7otn4xab4cfYRYre4gtJQwjg9fG1KGJoKA6m4yE=;
 b=n1COaM7YFG16YIK/72tTtC2e0nwLCiqh9HQL2gUZAfp9dUqW3cc4Ddr4JTJVV4glf4VQ216QgihN5MVlpg7tuKQ469VeqBibMB1xXYJyJF0g0cjrn5jPx2Ir5SVxw5Wq0luABJ232HBTCEQ+DX1IbTKBbGdJJeqi09NfmrmP+DY=
Received: from MW2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:907::29) by
 MWHPR1201MB0222.namprd12.prod.outlook.com (2603:10b6:301:54::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 18:02:50 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::38) by MW2PR16CA0016.outlook.office365.com
 (2603:10b6:907::29) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.5206.12 via Frontend Transport; Fri, 29 Apr 2022 18:02:49 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 29 Apr
 2022 13:02:47 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/29] drm/amdgpu: add mes unmap legacy queue routine
Date: Fri, 29 Apr 2022 14:02:15 -0400
Message-ID: <20220429180226.536084-19-alexander.deucher@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4331d660-e1c0-41cd-79d8-08da2a0a7963
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0222:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0222C53AF5DADB866AAAB59CF7FC9@MWHPR1201MB0222.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Es0yweqH+Uv1qnSK7g9rDl12LWtrDxAloMc7APjjbCwMj2AxlIgxHCceLeW62Pep0K8CNzRu2r1SqjXSS/HMMXNeoIMZb+Ov3x+bpLQcFD/qFZvTxacwwtUqspoROTadpi72VvkJZPp8aMaHNNPo3Ct5QSFUIdbJl4bJ6+pDYMPdeGOO/vl8pvOCBn3qSAd6vpYrb7UkqkrsrFG7VYXrwFpy06MzTE5ORLfv+Jynonohy0WdDAu9CQrKqgyfUJmUocBK9WnxoXNCcHEAzVlqBvVMoZkGH7mGmL2glIvRsc6PJ2H1rW1iLsaZvUnAS8MfPDymbiyNMOaw90BBwHoAUxKrriYACt0Czx0L59P9eCwxaumd9wmxo8sMNYr+xv4Pv9x4z64zPivd3nHEAMDgaj2V98J6OBRKRL6NYrDKcYO7ALEi9zeyqjhDzF/SRmWqgItxB3o5X9x3FUo4U+dBU+nThWd3w+9m4BxJnZmTeA5TWSNq/mN6xzyEoELVcixqHEvwHLl3TXilX7Lp9MOe/STUxXtQHH4k5B5eBpP3twcHTUvaUCnk324UYh4m8WZT/9hnsJdSgvBdMp+rBNUu1JmNI9DbeQEubZTOvHmNLqHMHF6AgQe5U78qem5K3rEInCDtiRo/KPfamGe5LaMiGHSFhsw+nVJdpoSs06oxO0PAq7DluDrsYnqUFvmSOd1OGp3RDzB8Pj1WvCLen7jNLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(316002)(47076005)(6666004)(508600001)(8676002)(86362001)(40460700003)(70586007)(356005)(81166007)(36860700001)(70206006)(54906003)(6916009)(426003)(5660300002)(336012)(2906002)(7696005)(36756003)(30864003)(26005)(82310400005)(83380400001)(186003)(16526019)(1076003)(8936002)(2616005)(36900700001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 18:02:49.9073 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4331d660-e1c0-41cd-79d8-08da2a0a7963
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0222
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

For mes kiq has been taken over by mes sched, drv can't directly
use mes kiq to unmap queues. drv has to use mes sched api to
unmap legacy queue.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       | 335 +++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h       |  85 ++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |   6 +
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |   7 +-
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        |  69 +++-
 .../drm/amd/{amdgpu => include}/mes_api_def.h | 167 +++++++--
 7 files changed, 526 insertions(+), 151 deletions(-)
 rename drivers/gpu/drm/amd/{amdgpu => include}/mes_api_def.h (68%)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 40df1e04d682..5d6b04fc6206 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -367,7 +367,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 
 	/* create MQD for KIQ */
 	ring = &adev->gfx.kiq.ring;
-	if (!ring->mqd_obj) {
+	if (!adev->enable_mes_kiq && !ring->mqd_obj) {
 		/* originaly the KIQ MQD is put in GTT domain, but for SRIOV VRAM domain is a must
 		 * otherwise hypervisor trigger SAVE_VF fail after driver unloaded which mean MQD
 		 * deallocated and gart_unbind, to strict diverage we decide to use VRAM domain for
@@ -464,7 +464,7 @@ int amdgpu_gfx_disable_kcq(struct amdgpu_device *adev)
 {
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
 	struct amdgpu_ring *kiq_ring = &kiq->ring;
-	int i, r;
+	int i, r = 0;
 
 	if (!kiq->pmf || !kiq->pmf->kiq_unmap_queues)
 		return -EINVAL;
@@ -479,7 +479,9 @@ int amdgpu_gfx_disable_kcq(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gfx.num_compute_rings; i++)
 		kiq->pmf->kiq_unmap_queues(kiq_ring, &adev->gfx.compute_ring[i],
 					   RESET_QUEUES, 0, 0);
-	r = amdgpu_ring_test_helper(kiq_ring);
+
+	if (adev->gfx.kiq.ring.sched.ready)
+		r = amdgpu_ring_test_helper(kiq_ring);
 	spin_unlock(&adev->gfx.kiq.ring_lock);
 
 	return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 5be30bf68b0c..72bafba1c470 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -150,7 +150,7 @@ int amdgpu_mes_init(struct amdgpu_device *adev)
 	idr_init(&adev->mes.queue_id_idr);
 	ida_init(&adev->mes.doorbell_ida);
 	spin_lock_init(&adev->mes.queue_id_lock);
-	mutex_init(&adev->mes.mutex);
+	mutex_init(&adev->mes.mutex_hidden);
 
 	adev->mes.total_max_queue = AMDGPU_FENCE_MES_QUEUE_ID_MASK;
 	adev->mes.vmid_mask_mmhub = 0xffffff00;
@@ -166,8 +166,12 @@ int amdgpu_mes_init(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MES_MAX_GFX_PIPES; i++)
 		adev->mes.gfx_hqd_mask[i] = i ? 0 : 0xfffffffe;
 
-	for (i = 0; i < AMDGPU_MES_MAX_SDMA_PIPES; i++)
-		adev->mes.sdma_hqd_mask[i] = i ? 0 : 0x3fc;
+	for (i = 0; i < AMDGPU_MES_MAX_SDMA_PIPES; i++) {
+		if (adev->ip_versions[SDMA0_HWIP][0] < IP_VERSION(6, 0, 0))
+			adev->mes.sdma_hqd_mask[i] = i ? 0 : 0x3fc;
+		else
+			adev->mes.sdma_hqd_mask[i] = 0xfc;
+	}
 
 	for (i = 0; i < AMDGPU_MES_PRIORITY_NUM_LEVELS; i++)
 		adev->mes.agreegated_doorbells[i] = 0xffffffff;
@@ -207,7 +211,7 @@ int amdgpu_mes_init(struct amdgpu_device *adev)
 	idr_destroy(&adev->mes.gang_id_idr);
 	idr_destroy(&adev->mes.queue_id_idr);
 	ida_destroy(&adev->mes.doorbell_ida);
-	mutex_destroy(&adev->mes.mutex);
+	mutex_destroy(&adev->mes.mutex_hidden);
 	return r;
 }
 
@@ -219,7 +223,14 @@ void amdgpu_mes_fini(struct amdgpu_device *adev)
 	idr_destroy(&adev->mes.gang_id_idr);
 	idr_destroy(&adev->mes.queue_id_idr);
 	ida_destroy(&adev->mes.doorbell_ida);
-	mutex_destroy(&adev->mes.mutex);
+	mutex_destroy(&adev->mes.mutex_hidden);
+}
+
+static void amdgpu_mes_queue_free_mqd(struct amdgpu_mes_queue *q)
+{
+	amdgpu_bo_free_kernel(&q->mqd_obj,
+			      &q->mqd_gpu_addr,
+			      &q->mqd_cpu_ptr);
 }
 
 int amdgpu_mes_create_process(struct amdgpu_device *adev, int pasid,
@@ -228,13 +239,10 @@ int amdgpu_mes_create_process(struct amdgpu_device *adev, int pasid,
 	struct amdgpu_mes_process *process;
 	int r;
 
-	mutex_lock(&adev->mes.mutex);
-
 	/* allocate the mes process buffer */
 	process = kzalloc(sizeof(struct amdgpu_mes_process), GFP_KERNEL);
 	if (!process) {
 		DRM_ERROR("no more memory to create mes process\n");
-		mutex_unlock(&adev->mes.mutex);
 		return -ENOMEM;
 	}
 
@@ -244,18 +252,9 @@ int amdgpu_mes_create_process(struct amdgpu_device *adev, int pasid,
 	if (!process->doorbell_bitmap) {
 		DRM_ERROR("failed to allocate doorbell bitmap\n");
 		kfree(process);
-		mutex_unlock(&adev->mes.mutex);
 		return -ENOMEM;
 	}
 
-	/* add the mes process to idr list */
-	r = idr_alloc(&adev->mes.pasid_idr, process, pasid, pasid + 1,
-		      GFP_KERNEL);
-	if (r < 0) {
-		DRM_ERROR("failed to lock pasid=%d\n", pasid);
-		goto clean_up_memory;
-	}
-
 	/* allocate the process context bo and map it */
 	r = amdgpu_bo_create_kernel(adev, AMDGPU_MES_PROC_CTX_SIZE, PAGE_SIZE,
 				    AMDGPU_GEM_DOMAIN_GTT,
@@ -264,15 +263,29 @@ int amdgpu_mes_create_process(struct amdgpu_device *adev, int pasid,
 				    &process->proc_ctx_cpu_ptr);
 	if (r) {
 		DRM_ERROR("failed to allocate process context bo\n");
-		goto clean_up_pasid;
+		goto clean_up_memory;
 	}
 	memset(process->proc_ctx_cpu_ptr, 0, AMDGPU_MES_PROC_CTX_SIZE);
 
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
+
+	/* add the mes process to idr list */
+	r = idr_alloc(&adev->mes.pasid_idr, process, pasid, pasid + 1,
+		      GFP_KERNEL);
+	if (r < 0) {
+		DRM_ERROR("failed to lock pasid=%d\n", pasid);
+		goto clean_up_ctx;
+	}
+
 	/* allocate the starting doorbell index of the process */
 	r = amdgpu_mes_alloc_process_doorbells(adev, &process->doorbell_index);
 	if (r < 0) {
 		DRM_ERROR("failed to allocate doorbell for process\n");
-		goto clean_up_ctx;
+		goto clean_up_pasid;
 	}
 
 	DRM_DEBUG("process doorbell index = %d\n", process->doorbell_index);
@@ -283,19 +296,19 @@ int amdgpu_mes_create_process(struct amdgpu_device *adev, int pasid,
 	process->process_quantum = adev->mes.default_process_quantum;
 	process->pd_gpu_addr = amdgpu_bo_gpu_offset(vm->root.bo);
 
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 	return 0;
 
+clean_up_pasid:
+	idr_remove(&adev->mes.pasid_idr, pasid);
+	amdgpu_mes_unlock(&adev->mes);
 clean_up_ctx:
 	amdgpu_bo_free_kernel(&process->proc_ctx_bo,
 			      &process->proc_ctx_gpu_addr,
 			      &process->proc_ctx_cpu_ptr);
-clean_up_pasid:
-	idr_remove(&adev->mes.pasid_idr, pasid);
 clean_up_memory:
 	kfree(process->doorbell_bitmap);
 	kfree(process);
-	mutex_unlock(&adev->mes.mutex);
 	return r;
 }
 
@@ -308,18 +321,21 @@ void amdgpu_mes_destroy_process(struct amdgpu_device *adev, int pasid)
 	unsigned long flags;
 	int r;
 
-	mutex_lock(&adev->mes.mutex);
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
 
 	process = idr_find(&adev->mes.pasid_idr, pasid);
 	if (!process) {
 		DRM_WARN("pasid %d doesn't exist\n", pasid);
-		mutex_unlock(&adev->mes.mutex);
+		amdgpu_mes_unlock(&adev->mes);
 		return;
 	}
 
-	/* free all gangs in the process */
+	/* Remove all queues from hardware */
 	list_for_each_entry_safe(gang, tmp1, &process->gang_list, list) {
-		/* free all queues in the gang */
 		list_for_each_entry_safe(queue, tmp2, &gang->queue_list, list) {
 			spin_lock_irqsave(&adev->mes.queue_id_lock, flags);
 			idr_remove(&adev->mes.queue_id_idr, queue->queue_id);
@@ -332,29 +348,35 @@ void amdgpu_mes_destroy_process(struct amdgpu_device *adev, int pasid)
 							     &queue_input);
 			if (r)
 				DRM_WARN("failed to remove hardware queue\n");
+		}
+
+		idr_remove(&adev->mes.gang_id_idr, gang->gang_id);
+	}
 
+	amdgpu_mes_free_process_doorbells(adev, process->doorbell_index);
+	idr_remove(&adev->mes.pasid_idr, pasid);
+	amdgpu_mes_unlock(&adev->mes);
+
+	/* free all memory allocated by the process */
+	list_for_each_entry_safe(gang, tmp1, &process->gang_list, list) {
+		/* free all queues in the gang */
+		list_for_each_entry_safe(queue, tmp2, &gang->queue_list, list) {
+			amdgpu_mes_queue_free_mqd(queue);
 			list_del(&queue->list);
 			kfree(queue);
 		}
-
-		idr_remove(&adev->mes.gang_id_idr, gang->gang_id);
 		amdgpu_bo_free_kernel(&gang->gang_ctx_bo,
 				      &gang->gang_ctx_gpu_addr,
 				      &gang->gang_ctx_cpu_ptr);
 		list_del(&gang->list);
 		kfree(gang);
-	}
 
-	amdgpu_mes_free_process_doorbells(adev, process->doorbell_index);
-
-	idr_remove(&adev->mes.pasid_idr, pasid);
+	}
 	amdgpu_bo_free_kernel(&process->proc_ctx_bo,
 			      &process->proc_ctx_gpu_addr,
 			      &process->proc_ctx_cpu_ptr);
 	kfree(process->doorbell_bitmap);
 	kfree(process);
-
-	mutex_unlock(&adev->mes.mutex);
 }
 
 int amdgpu_mes_add_gang(struct amdgpu_device *adev, int pasid,
@@ -365,34 +387,12 @@ int amdgpu_mes_add_gang(struct amdgpu_device *adev, int pasid,
 	struct amdgpu_mes_gang *gang;
 	int r;
 
-	mutex_lock(&adev->mes.mutex);
-
-	process = idr_find(&adev->mes.pasid_idr, pasid);
-	if (!process) {
-		DRM_ERROR("pasid %d doesn't exist\n", pasid);
-		mutex_unlock(&adev->mes.mutex);
-		return -EINVAL;
-	}
-
 	/* allocate the mes gang buffer */
 	gang = kzalloc(sizeof(struct amdgpu_mes_gang), GFP_KERNEL);
 	if (!gang) {
-		mutex_unlock(&adev->mes.mutex);
 		return -ENOMEM;
 	}
 
-	/* add the mes gang to idr list */
-	r = idr_alloc(&adev->mes.gang_id_idr, gang, 1, 0,
-		      GFP_KERNEL);
-	if (r < 0) {
-		kfree(gang);
-		mutex_unlock(&adev->mes.mutex);
-		return r;
-	}
-
-	gang->gang_id = r;
-	*gang_id = r;
-
 	/* allocate the gang context bo and map it to cpu space */
 	r = amdgpu_bo_create_kernel(adev, AMDGPU_MES_GANG_CTX_SIZE, PAGE_SIZE,
 				    AMDGPU_GEM_DOMAIN_GTT,
@@ -401,10 +401,34 @@ int amdgpu_mes_add_gang(struct amdgpu_device *adev, int pasid,
 				    &gang->gang_ctx_cpu_ptr);
 	if (r) {
 		DRM_ERROR("failed to allocate process context bo\n");
-		goto clean_up;
+		goto clean_up_mem;
 	}
 	memset(gang->gang_ctx_cpu_ptr, 0, AMDGPU_MES_GANG_CTX_SIZE);
 
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
+
+	process = idr_find(&adev->mes.pasid_idr, pasid);
+	if (!process) {
+		DRM_ERROR("pasid %d doesn't exist\n", pasid);
+		r = -EINVAL;
+		goto clean_up_ctx;
+	}
+
+	/* add the mes gang to idr list */
+	r = idr_alloc(&adev->mes.gang_id_idr, gang, 1, 0,
+		      GFP_KERNEL);
+	if (r < 0) {
+		DRM_ERROR("failed to allocate idr for gang\n");
+		goto clean_up_ctx;
+	}
+
+	gang->gang_id = r;
+	*gang_id = r;
+
 	INIT_LIST_HEAD(&gang->queue_list);
 	gang->process = process;
 	gang->priority = gprops->priority;
@@ -414,13 +438,16 @@ int amdgpu_mes_add_gang(struct amdgpu_device *adev, int pasid,
 	gang->inprocess_gang_priority = gprops->inprocess_gang_priority;
 	list_add_tail(&gang->list, &process->gang_list);
 
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 	return 0;
 
-clean_up:
-	idr_remove(&adev->mes.gang_id_idr, gang->gang_id);
+clean_up_ctx:
+	amdgpu_mes_unlock(&adev->mes);
+	amdgpu_bo_free_kernel(&gang->gang_ctx_bo,
+			      &gang->gang_ctx_gpu_addr,
+			      &gang->gang_ctx_cpu_ptr);
+clean_up_mem:
 	kfree(gang);
-	mutex_unlock(&adev->mes.mutex);
 	return r;
 }
 
@@ -428,29 +455,35 @@ int amdgpu_mes_remove_gang(struct amdgpu_device *adev, int gang_id)
 {
 	struct amdgpu_mes_gang *gang;
 
-	mutex_lock(&adev->mes.mutex);
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
 
 	gang = idr_find(&adev->mes.gang_id_idr, gang_id);
 	if (!gang) {
 		DRM_ERROR("gang id %d doesn't exist\n", gang_id);
-		mutex_unlock(&adev->mes.mutex);
+		amdgpu_mes_unlock(&adev->mes);
 		return -EINVAL;
 	}
 
 	if (!list_empty(&gang->queue_list)) {
 		DRM_ERROR("queue list is not empty\n");
-		mutex_unlock(&adev->mes.mutex);
+		amdgpu_mes_unlock(&adev->mes);
 		return -EBUSY;
 	}
 
 	idr_remove(&adev->mes.gang_id_idr, gang->gang_id);
+	list_del(&gang->list);
+	amdgpu_mes_unlock(&adev->mes);
+
 	amdgpu_bo_free_kernel(&gang->gang_ctx_bo,
 			      &gang->gang_ctx_gpu_addr,
 			      &gang->gang_ctx_cpu_ptr);
-	list_del(&gang->list);
+
 	kfree(gang);
 
-	mutex_unlock(&adev->mes.mutex);
 	return 0;
 }
 
@@ -462,7 +495,11 @@ int amdgpu_mes_suspend(struct amdgpu_device *adev)
 	struct mes_suspend_gang_input input;
 	int r, pasid;
 
-	mutex_lock(&adev->mes.mutex);
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
 
 	idp = &adev->mes.pasid_idr;
 
@@ -475,7 +512,7 @@ int amdgpu_mes_suspend(struct amdgpu_device *adev)
 		}
 	}
 
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 	return 0;
 }
 
@@ -487,7 +524,11 @@ int amdgpu_mes_resume(struct amdgpu_device *adev)
 	struct mes_resume_gang_input input;
 	int r, pasid;
 
-	mutex_lock(&adev->mes.mutex);
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
 
 	idp = &adev->mes.pasid_idr;
 
@@ -500,17 +541,16 @@ int amdgpu_mes_resume(struct amdgpu_device *adev)
 		}
 	}
 
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 	return 0;
 }
 
-static int amdgpu_mes_queue_init_mqd(struct amdgpu_device *adev,
+static int amdgpu_mes_queue_alloc_mqd(struct amdgpu_device *adev,
 				     struct amdgpu_mes_queue *q,
 				     struct amdgpu_mes_queue_properties *p)
 {
 	struct amdgpu_mqd *mqd_mgr = &adev->mqds[p->queue_type];
 	u32 mqd_size = mqd_mgr->mqd_size;
-	struct amdgpu_mqd_prop mqd_prop = {0};
 	int r;
 
 	r = amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
@@ -523,6 +563,26 @@ static int amdgpu_mes_queue_init_mqd(struct amdgpu_device *adev,
 	}
 	memset(q->mqd_cpu_ptr, 0, mqd_size);
 
+	r = amdgpu_bo_reserve(q->mqd_obj, false);
+	if (unlikely(r != 0))
+		goto clean_up;
+
+	return 0;
+
+clean_up:
+	amdgpu_bo_free_kernel(&q->mqd_obj,
+			      &q->mqd_gpu_addr,
+			      &q->mqd_cpu_ptr);
+	return r;
+}
+
+static void amdgpu_mes_queue_init_mqd(struct amdgpu_device *adev,
+				     struct amdgpu_mes_queue *q,
+				     struct amdgpu_mes_queue_properties *p)
+{
+	struct amdgpu_mqd *mqd_mgr = &adev->mqds[p->queue_type];
+	struct amdgpu_mqd_prop mqd_prop = {0};
+
 	mqd_prop.mqd_gpu_addr = q->mqd_gpu_addr;
 	mqd_prop.hqd_base_gpu_addr = p->hqd_base_gpu_addr;
 	mqd_prop.rptr_gpu_addr = p->rptr_gpu_addr;
@@ -535,27 +595,9 @@ static int amdgpu_mes_queue_init_mqd(struct amdgpu_device *adev,
 	mqd_prop.hqd_queue_priority = p->hqd_queue_priority;
 	mqd_prop.hqd_active = false;
 
-	r = amdgpu_bo_reserve(q->mqd_obj, false);
-	if (unlikely(r != 0))
-		goto clean_up;
-
 	mqd_mgr->init_mqd(adev, q->mqd_cpu_ptr, &mqd_prop);
 
 	amdgpu_bo_unreserve(q->mqd_obj);
-	return 0;
-
-clean_up:
-	amdgpu_bo_free_kernel(&q->mqd_obj,
-			      &q->mqd_gpu_addr,
-			      &q->mqd_cpu_ptr);
-	return r;
-}
-
-static void amdgpu_mes_queue_free_mqd(struct amdgpu_mes_queue *q)
-{
-	amdgpu_bo_free_kernel(&q->mqd_obj,
-			      &q->mqd_gpu_addr,
-			      &q->mqd_cpu_ptr);
 }
 
 int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
@@ -568,29 +610,38 @@ int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
 	unsigned long flags;
 	int r;
 
-	mutex_lock(&adev->mes.mutex);
-
-	gang = idr_find(&adev->mes.gang_id_idr, gang_id);
-	if (!gang) {
-		DRM_ERROR("gang id %d doesn't exist\n", gang_id);
-		mutex_unlock(&adev->mes.mutex);
-		return -EINVAL;
-	}
-
 	/* allocate the mes queue buffer */
 	queue = kzalloc(sizeof(struct amdgpu_mes_queue), GFP_KERNEL);
 	if (!queue) {
-		mutex_unlock(&adev->mes.mutex);
+		DRM_ERROR("Failed to allocate memory for queue\n");
 		return -ENOMEM;
 	}
 
+	/* Allocate the queue mqd */
+	r = amdgpu_mes_queue_alloc_mqd(adev, queue, qprops);
+	if (r)
+		goto clean_up_memory;
+
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
+
+	gang = idr_find(&adev->mes.gang_id_idr, gang_id);
+	if (!gang) {
+		DRM_ERROR("gang id %d doesn't exist\n", gang_id);
+		r = -EINVAL;
+		goto clean_up_mqd;
+	}
+
 	/* add the mes gang to idr list */
 	spin_lock_irqsave(&adev->mes.queue_id_lock, flags);
 	r = idr_alloc(&adev->mes.queue_id_idr, queue, 1, 0,
 		      GFP_ATOMIC);
 	if (r < 0) {
 		spin_unlock_irqrestore(&adev->mes.queue_id_lock, flags);
-		goto clean_up_memory;
+		goto clean_up_mqd;
 	}
 	spin_unlock_irqrestore(&adev->mes.queue_id_lock, flags);
 	*queue_id = queue->queue_id = r;
@@ -603,13 +654,15 @@ int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
 		goto clean_up_queue_id;
 
 	/* initialize the queue mqd */
-	r = amdgpu_mes_queue_init_mqd(adev, queue, qprops);
-	if (r)
-		goto clean_up_doorbell;
+	amdgpu_mes_queue_init_mqd(adev, queue, qprops);
 
 	/* add hw queue to mes */
 	queue_input.process_id = gang->process->pasid;
-	queue_input.page_table_base_addr = gang->process->pd_gpu_addr;
+
+	queue_input.page_table_base_addr =
+		adev->vm_manager.vram_base_offset + gang->process->pd_gpu_addr -
+		adev->gmc.vram_start;
+
 	queue_input.process_va_start = 0;
 	queue_input.process_va_end =
 		(adev->vm_manager.max_pfn - 1) << AMDGPU_GPU_PAGE_SHIFT;
@@ -629,7 +682,7 @@ int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
 	if (r) {
 		DRM_ERROR("failed to add hardware queue to MES, doorbell=0x%llx\n",
 			  qprops->doorbell_off);
-		goto clean_up_mqd;
+		goto clean_up_doorbell;
 	}
 
 	DRM_DEBUG("MES hw queue was added, pasid=%d, gang id=%d, "
@@ -645,11 +698,9 @@ int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
 	queue->gang = gang;
 	list_add_tail(&queue->list, &gang->queue_list);
 
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 	return 0;
 
-clean_up_mqd:
-	amdgpu_mes_queue_free_mqd(queue);
 clean_up_doorbell:
 	amdgpu_mes_queue_doorbell_free(adev, gang->process,
 				       qprops->doorbell_off);
@@ -657,9 +708,11 @@ int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
 	spin_lock_irqsave(&adev->mes.queue_id_lock, flags);
 	idr_remove(&adev->mes.queue_id_idr, queue->queue_id);
 	spin_unlock_irqrestore(&adev->mes.queue_id_lock, flags);
+clean_up_mqd:
+	amdgpu_mes_unlock(&adev->mes);
+	amdgpu_mes_queue_free_mqd(queue);
 clean_up_memory:
 	kfree(queue);
-	mutex_unlock(&adev->mes.mutex);
 	return r;
 }
 
@@ -671,7 +724,11 @@ int amdgpu_mes_remove_hw_queue(struct amdgpu_device *adev, int queue_id)
 	struct mes_remove_queue_input queue_input;
 	int r;
 
-	mutex_lock(&adev->mes.mutex);
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
 
 	/* remove the mes gang from idr list */
 	spin_lock_irqsave(&adev->mes.queue_id_lock, flags);
@@ -679,7 +736,7 @@ int amdgpu_mes_remove_hw_queue(struct amdgpu_device *adev, int queue_id)
 	queue = idr_find(&adev->mes.queue_id_idr, queue_id);
 	if (!queue) {
 		spin_unlock_irqrestore(&adev->mes.queue_id_lock, flags);
-		mutex_unlock(&adev->mes.mutex);
+		amdgpu_mes_unlock(&adev->mes);
 		DRM_ERROR("queue id %d doesn't exist\n", queue_id);
 		return -EINVAL;
 	}
@@ -699,15 +756,42 @@ int amdgpu_mes_remove_hw_queue(struct amdgpu_device *adev, int queue_id)
 		DRM_ERROR("failed to remove hardware queue, queue id = %d\n",
 			  queue_id);
 
-	amdgpu_mes_queue_free_mqd(queue);
 	list_del(&queue->list);
 	amdgpu_mes_queue_doorbell_free(adev, gang->process,
 				       queue->doorbell_off);
+	amdgpu_mes_unlock(&adev->mes);
+
+	amdgpu_mes_queue_free_mqd(queue);
 	kfree(queue);
-	mutex_unlock(&adev->mes.mutex);
 	return 0;
 }
 
+int amdgpu_mes_unmap_legacy_queue(struct amdgpu_device *adev,
+				  struct amdgpu_ring *ring,
+				  enum amdgpu_unmap_queues_action action,
+				  u64 gpu_addr, u64 seq)
+{
+	struct mes_unmap_legacy_queue_input queue_input;
+	int r;
+
+	amdgpu_mes_lock(&adev->mes);
+
+	queue_input.action = action;
+	queue_input.queue_type = ring->funcs->type;
+	queue_input.doorbell_offset = ring->doorbell_index;
+	queue_input.pipe_id = ring->pipe;
+	queue_input.queue_id = ring->queue;
+	queue_input.trail_fence_addr = gpu_addr;
+	queue_input.trail_fence_data = seq;
+
+	r = adev->mes.funcs->unmap_legacy_queue(&adev->mes, &queue_input);
+	if (r)
+		DRM_ERROR("failed to unmap legacy queue\n");
+
+	amdgpu_mes_unlock(&adev->mes);
+	return r;
+}
+
 static void
 amdgpu_mes_ring_to_queue_props(struct amdgpu_device *adev,
 			       struct amdgpu_ring *ring,
@@ -771,18 +855,22 @@ int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
 	struct amdgpu_mes_queue_properties qprops = {0};
 	int r, queue_id, pasid;
 
-	mutex_lock(&adev->mes.mutex);
+	/*
+	 * Avoid taking any other locks under MES lock to avoid circular
+	 * lock dependencies.
+	 */
+	amdgpu_mes_lock(&adev->mes);
 	gang = idr_find(&adev->mes.gang_id_idr, gang_id);
 	if (!gang) {
 		DRM_ERROR("gang id %d doesn't exist\n", gang_id);
-		mutex_unlock(&adev->mes.mutex);
+		amdgpu_mes_unlock(&adev->mes);
 		return -EINVAL;
 	}
 	pasid = gang->process->pasid;
 
 	ring = kzalloc(sizeof(struct amdgpu_ring), GFP_KERNEL);
 	if (!ring) {
-		mutex_unlock(&adev->mes.mutex);
+		amdgpu_mes_unlock(&adev->mes);
 		return -ENOMEM;
 	}
 
@@ -823,7 +911,7 @@ int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
 
 	dma_fence_wait(gang->process->vm->last_update, false);
 	dma_fence_wait(ctx_data->meta_data_va->last_pt_update, false);
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 
 	r = amdgpu_mes_add_hw_queue(adev, gang_id, &qprops, &queue_id);
 	if (r)
@@ -850,7 +938,7 @@ int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
 	amdgpu_ring_fini(ring);
 clean_up_memory:
 	kfree(ring);
-	mutex_unlock(&adev->mes.mutex);
+	amdgpu_mes_unlock(&adev->mes);
 	return r;
 }
 
@@ -1086,9 +1174,10 @@ int amdgpu_mes_self_test(struct amdgpu_device *adev)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(queue_types); i++) {
-		/* On sienna cichlid+, fw hasn't supported to map sdma queue. */
-		if (adev->asic_type >= CHIP_SIENNA_CICHLID &&
-		    i == AMDGPU_RING_TYPE_SDMA)
+		/* On GFX v10.3, fw hasn't supported to map sdma queue. */
+		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0) &&
+		    adev->ip_versions[GC_HWIP][0] < IP_VERSION(11, 0, 0) &&
+		    queue_types[i][0] == AMDGPU_RING_TYPE_SDMA)
 			continue;
 
 		r = amdgpu_mes_test_create_gang_and_queues(adev, pasid,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
index ba039984e431..19963be9e61a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h
@@ -55,7 +55,7 @@ enum admgpu_mes_pipe {
 struct amdgpu_mes {
 	struct amdgpu_device            *adev;
 
-	struct mutex                    mutex;
+	struct mutex                    mutex_hidden;
 
 	struct idr                      pasid_idr;
 	struct idr                      gang_id_idr;
@@ -108,9 +108,11 @@ struct amdgpu_mes {
 	uint32_t			query_status_fence_offs;
 	uint64_t			query_status_fence_gpu_addr;
 	uint64_t			*query_status_fence_ptr;
+	uint32_t			saved_flags;
 
 	/* initialize kiq pipe */
 	int                             (*kiq_hw_init)(struct amdgpu_device *adev);
+	int                             (*kiq_hw_fini)(struct amdgpu_device *adev);
 
 	/* ip specific functions */
 	const struct amdgpu_mes_funcs   *funcs;
@@ -197,6 +199,10 @@ struct mes_add_queue_input {
 	uint64_t	wptr_addr;
 	uint32_t	queue_type;
 	uint32_t	paging;
+	uint32_t        gws_base;
+	uint32_t        gws_size;
+	uint64_t	tba_addr;
+	uint64_t	tma_addr;
 };
 
 struct mes_remove_queue_input {
@@ -204,6 +210,16 @@ struct mes_remove_queue_input {
 	uint64_t	gang_context_addr;
 };
 
+struct mes_unmap_legacy_queue_input {
+	enum amdgpu_unmap_queues_action    action;
+	uint32_t                           queue_type;
+	uint32_t                           doorbell_offset;
+	uint32_t                           pipe_id;
+	uint32_t                           queue_id;
+	uint64_t                           trail_fence_addr;
+	uint64_t                           trail_fence_data;
+};
+
 struct mes_suspend_gang_input {
 	bool		suspend_all_gangs;
 	uint64_t	gang_context_addr;
@@ -223,6 +239,9 @@ struct amdgpu_mes_funcs {
 	int (*remove_hw_queue)(struct amdgpu_mes *mes,
 			       struct mes_remove_queue_input *input);
 
+	int (*unmap_legacy_queue)(struct amdgpu_mes *mes,
+				  struct mes_unmap_legacy_queue_input *input);
+
 	int (*suspend_gang)(struct amdgpu_mes *mes,
 			    struct mes_suspend_gang_input *input);
 
@@ -231,6 +250,7 @@ struct amdgpu_mes_funcs {
 };
 
 #define amdgpu_mes_kiq_hw_init(adev) (adev)->mes.kiq_hw_init((adev))
+#define amdgpu_mes_kiq_hw_fini(adev) (adev)->mes.kiq_hw_fini((adev))
 
 int amdgpu_mes_ctx_get_offs(struct amdgpu_ring *ring, unsigned int id_offs);
 
@@ -254,6 +274,11 @@ int amdgpu_mes_add_hw_queue(struct amdgpu_device *adev, int gang_id,
 			    int *queue_id);
 int amdgpu_mes_remove_hw_queue(struct amdgpu_device *adev, int queue_id);
 
+int amdgpu_mes_unmap_legacy_queue(struct amdgpu_device *adev,
+				  struct amdgpu_ring *ring,
+				  enum amdgpu_unmap_queues_action action,
+				  u64 gpu_addr, u64 seq);
+
 int amdgpu_mes_add_ring(struct amdgpu_device *adev, int gang_id,
 			int queue_type, int idx,
 			struct amdgpu_mes_ctx_data *ctx_data,
@@ -279,4 +304,62 @@ unsigned int amdgpu_mes_get_doorbell_dw_offset_in_bar(
 					uint32_t doorbell_index,
 					unsigned int doorbell_id);
 int amdgpu_mes_doorbell_process_slice(struct amdgpu_device *adev);
+
+/*
+ * MES lock can be taken in MMU notifiers.
+ *
+ * A bit more detail about why to set no-FS reclaim with MES lock:
+ *
+ * The purpose of the MMU notifier is to stop GPU access to memory so
+ * that the Linux VM subsystem can move pages around safely. This is
+ * done by preempting user mode queues for the affected process. When
+ * MES is used, MES lock needs to be taken to preempt the queues.
+ *
+ * The MMU notifier callback entry point in the driver is
+ * amdgpu_mn_invalidate_range_start_hsa. The relevant call chain from
+ * there is:
+ * amdgpu_amdkfd_evict_userptr -> kgd2kfd_quiesce_mm ->
+ * kfd_process_evict_queues -> pdd->dev->dqm->ops.evict_process_queues
+ *
+ * The last part of the chain is a function pointer where we take the
+ * MES lock.
+ *
+ * The problem with taking locks in the MMU notifier is, that MMU
+ * notifiers can be called in reclaim-FS context. That's where the
+ * kernel frees up pages to make room for new page allocations under
+ * memory pressure. While we are running in reclaim-FS context, we must
+ * not trigger another memory reclaim operation because that would
+ * recursively reenter the reclaim code and cause a deadlock. The
+ * memalloc_nofs_save/restore calls guarantee that.
+ *
+ * In addition we also need to avoid lock dependencies on other locks taken
+ * under the MES lock, for example reservation locks. Here is a possible
+ * scenario of a deadlock:
+ * Thread A: takes and holds reservation lock | triggers reclaim-FS |
+ * MMU notifier | blocks trying to take MES lock
+ * Thread B: takes and holds MES lock | blocks trying to take reservation lock
+ *
+ * In this scenario Thread B gets involved in a deadlock even without
+ * triggering a reclaim-FS operation itself.
+ * To fix this and break the lock dependency chain you'd need to either:
+ * 1. protect reservation locks with memalloc_nofs_save/restore, or
+ * 2. avoid taking reservation locks under the MES lock.
+ *
+ * Reservation locks are taken all over the kernel in different subsystems, we
+ * have no control over them and their lock dependencies.So the only workable
+ * solution is to avoid taking other locks under the MES lock.
+ * As a result, make sure no reclaim-FS happens while holding this lock anywhere
+ * to prevent deadlocks when an MMU notifier runs in reclaim-FS context.
+ */
+static inline void amdgpu_mes_lock(struct amdgpu_mes *mes)
+{
+	mutex_lock(&mes->mutex_hidden);
+	mes->saved_flags = memalloc_noreclaim_save();
+}
+
+static inline void amdgpu_mes_unlock(struct amdgpu_mes *mes)
+{
+	memalloc_noreclaim_restore(mes->saved_flags);
+	mutex_unlock(&mes->mutex_hidden);
+}
 #endif /* __AMDGPU_MES_H__ */
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 9042e0b480ce..3c4f2a94ad9f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -3551,8 +3551,14 @@ static void gfx10_kiq_unmap_queues(struct amdgpu_ring *kiq_ring,
 				   enum amdgpu_unmap_queues_action action,
 				   u64 gpu_addr, u64 seq)
 {
+	struct amdgpu_device *adev = kiq_ring->adev;
 	uint32_t eng_sel = ring->funcs->type == AMDGPU_RING_TYPE_GFX ? 4 : 0;
 
+	if (!adev->gfx.kiq.ring.sched.ready) {
+		amdgpu_mes_unmap_legacy_queue(adev, ring, action, gpu_addr, seq);
+		return;
+	}
+
 	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_UNMAP_QUEUES, 4));
 	amdgpu_ring_write(kiq_ring, /* Q_sel: 0, vmid: 0, engine: 0, num_Q: 1 */
 			  PACKET3_UNMAP_QUEUES_ACTION(action) |
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
index b80b5f70ecf1..61db2a378008 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
@@ -274,7 +274,7 @@ static void gmc_v11_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	/* For SRIOV run time, driver shouldn't access the register through MMIO
 	 * Directly use kiq to do the vm invalidation instead
 	 */
-	if (adev->gfx.kiq.ring.sched.ready &&
+	if (adev->gfx.kiq.ring.sched.ready && !adev->enable_mes &&
 	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev))) {
 		struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 		const unsigned eng = 17;
@@ -411,6 +411,10 @@ static void gmc_v11_0_emit_pasid_mapping(struct amdgpu_ring *ring, unsigned vmid
 	struct amdgpu_device *adev = ring->adev;
 	uint32_t reg;
 
+	/* MES fw manages IH_VMID_x_LUT updating */
+	if (ring->is_mes_queue)
+		return;
+
 	if (ring->funcs->vmhub == AMDGPU_GFXHUB_0)
 		reg = SOC15_REG_OFFSET(OSSSYS, 0, regIH_VMID_0_LUT) + vmid;
 	else
@@ -803,6 +807,7 @@ static int gmc_v11_0_gart_enable(struct amdgpu_device *adev)
 	}
 
 	amdgpu_gtt_mgr_recover(&adev->mman.gtt_mgr);
+
 	r = adev->mmhub.funcs->gart_enable(adev);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 622aa17b18e7..030a92b3a0da 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -133,6 +133,8 @@ static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
 {
 	struct amdgpu_device *adev = mes->adev;
 	union MESAPI__ADD_QUEUE mes_add_queue_pkt;
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB_0];
+	uint32_t vm_cntx_cntl = hub->vm_cntx_cntl;
 
 	memset(&mes_add_queue_pkt, 0, sizeof(mes_add_queue_pkt));
 
@@ -141,8 +143,7 @@ static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
 	mes_add_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
 
 	mes_add_queue_pkt.process_id = input->process_id;
-	mes_add_queue_pkt.page_table_base_addr =
-		input->page_table_base_addr - adev->gmc.vram_start;
+	mes_add_queue_pkt.page_table_base_addr = input->page_table_base_addr;
 	mes_add_queue_pkt.process_va_start = input->process_va_start;
 	mes_add_queue_pkt.process_va_end = input->process_va_end;
 	mes_add_queue_pkt.process_quantum = input->process_quantum;
@@ -159,6 +160,10 @@ static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
 	mes_add_queue_pkt.queue_type =
 		convert_to_mes_queue_type(input->queue_type);
 	mes_add_queue_pkt.paging = input->paging;
+	mes_add_queue_pkt.vm_context_cntl = vm_cntx_cntl;
+	mes_add_queue_pkt.gws_base = input->gws_base;
+	mes_add_queue_pkt.gws_size = input->gws_size;
+	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
 
 	mes_add_queue_pkt.api_status.api_completion_fence_addr =
 		mes->ring.fence_drv.gpu_addr;
@@ -192,6 +197,44 @@ static int mes_v10_1_remove_hw_queue(struct amdgpu_mes *mes,
 			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt));
 }
 
+static int mes_v10_1_unmap_legacy_queue(struct amdgpu_mes *mes,
+				 struct mes_unmap_legacy_queue_input *input)
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
+	return mes_v10_1_submit_pkt_and_poll_completion(mes,
+			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt));
+}
+
 static int mes_v10_1_suspend_gang(struct amdgpu_mes *mes,
 				  struct mes_suspend_gang_input *input)
 {
@@ -254,9 +297,21 @@ static int mes_v10_1_set_hw_resources(struct amdgpu_mes *mes)
 		mes_set_hw_res_pkt.sdma_hqd_mask[i] = mes->sdma_hqd_mask[i];
 
 	for (i = 0; i < AMD_PRIORITY_NUM_LEVELS; i++)
-		mes_set_hw_res_pkt.agreegated_doorbells[i] =
+		mes_set_hw_res_pkt.aggregated_doorbells[i] =
 			mes->agreegated_doorbells[i];
 
+	for (i = 0; i < 5; i++) {
+		mes_set_hw_res_pkt.gc_base[i] = adev->reg_offset[GC_HWIP][0][i];
+		mes_set_hw_res_pkt.mmhub_base[i] =
+			adev->reg_offset[MMHUB_HWIP][0][i];
+		mes_set_hw_res_pkt.osssys_base[i] =
+			adev->reg_offset[OSSSYS_HWIP][0][i];
+	}
+
+	mes_set_hw_res_pkt.disable_reset = 1;
+	mes_set_hw_res_pkt.disable_mes_log = 1;
+	mes_set_hw_res_pkt.use_different_vmid_compute = 1;
+
 	mes_set_hw_res_pkt.api_status.api_completion_fence_addr =
 		mes->ring.fence_drv.gpu_addr;
 	mes_set_hw_res_pkt.api_status.api_completion_fence_value =
@@ -269,6 +324,7 @@ static int mes_v10_1_set_hw_resources(struct amdgpu_mes *mes)
 static const struct amdgpu_mes_funcs mes_v10_1_funcs = {
 	.add_hw_queue = mes_v10_1_add_hw_queue,
 	.remove_hw_queue = mes_v10_1_remove_hw_queue,
+	.unmap_legacy_queue = mes_v10_1_unmap_legacy_queue,
 	.suspend_gang = mes_v10_1_suspend_gang,
 	.resume_gang = mes_v10_1_resume_gang,
 };
@@ -1097,6 +1153,13 @@ static int mes_v10_1_hw_init(void *handle)
 		goto failure;
 	}
 
+	/*
+	 * Disable KIQ ring usage from the driver once MES is enabled.
+	 * MES uses KIQ ring exclusively so driver cannot access KIQ ring
+	 * with MES enabled.
+	 */
+	adev->gfx.kiq.ring.sched.ready = false;
+
 	return 0;
 
 failure:
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_api_def.h b/drivers/gpu/drm/amd/include/mes_api_def.h
similarity index 68%
rename from drivers/gpu/drm/amd/amdgpu/mes_api_def.h
rename to drivers/gpu/drm/amd/include/mes_api_def.h
index 3f4fca5fd1da..b2a8503feec0 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_api_def.h
+++ b/drivers/gpu/drm/amd/include/mes_api_def.h
@@ -59,6 +59,8 @@ enum MES_SCH_API_OPCODE {
 	MES_SCH_API_PROGRAM_GDS			= 12,
 	MES_SCH_API_SET_DEBUG_VMID		= 13,
 	MES_SCH_API_MISC			= 14,
+	MES_SCH_API_UPDATE_ROOT_PAGE_TABLE      = 15,
+	MES_SCH_API_AMD_LOG                     = 16,
 	MES_SCH_API_MAX				= 0xFF
 };
 
@@ -116,7 +118,12 @@ enum { MAX_VMID_GCHUB = 16 };
 enum { MAX_VMID_MMHUB = 16 };
 
 enum MES_LOG_OPERATION {
-	MES_LOG_OPERATION_CONTEXT_STATE_CHANGE = 0
+	MES_LOG_OPERATION_CONTEXT_STATE_CHANGE = 0,
+	MES_LOG_OPERATION_QUEUE_NEW_WORK = 1,
+	MES_LOG_OPERATION_QUEUE_UNWAIT_SYNC_OBJECT = 2,
+	MES_LOG_OPERATION_QUEUE_NO_MORE_WORK = 3,
+	MES_LOG_OPERATION_QUEUE_WAIT_SYNC_OBJECT = 4,
+	MES_LOG_OPERATION_QUEUE_INVALID = 0xF,
 };
 
 enum MES_LOG_CONTEXT_STATE {
@@ -124,6 +131,7 @@ enum MES_LOG_CONTEXT_STATE {
 	MES_LOG_CONTEXT_STATE_RUNNING		= 1,
 	MES_LOG_CONTEXT_STATE_READY		= 2,
 	MES_LOG_CONTEXT_STATE_READY_STANDBY	= 3,
+	MES_LOG_CONTEXT_STATE_INVALID           = 0xF,
 };
 
 struct MES_LOG_CONTEXT_STATE_CHANGE {
@@ -131,6 +139,26 @@ struct MES_LOG_CONTEXT_STATE_CHANGE {
 	enum MES_LOG_CONTEXT_STATE	new_context_state;
 };
 
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
 struct MES_LOG_ENTRY_HEADER {
 	uint32_t	first_free_entry_index;
 	uint32_t	wraparound_count;
@@ -143,8 +171,12 @@ struct MES_LOG_ENTRY_DATA {
 	uint32_t	operation_type; /* operation_type is of MES_LOG_OPERATION type */
 	uint32_t	reserved_operation_type_bits;
 	union {
-		struct MES_LOG_CONTEXT_STATE_CHANGE	context_state_change;
-		uint64_t				reserved_operation_data[2];
+		struct MES_LOG_CONTEXT_STATE_CHANGE     context_state_change;
+		struct MES_LOG_QUEUE_NEW_WORK           queue_new_work;
+		struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT queue_unwait_sync_object;
+		struct MES_LOG_QUEUE_NO_MORE_WORK       queue_no_more_work;
+		struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT   queue_wait_sync_object;
+		uint64_t                                all[2];
 	};
 };
 
@@ -153,6 +185,10 @@ struct MES_LOG_BUFFER {
 	struct MES_LOG_ENTRY_DATA	entries[1];
 };
 
+enum MES_SWIP_TO_HWIP_DEF {
+	MES_MAX_HWIP_SEGMENT = 6,
+};
+
 union MESAPI_SET_HW_RESOURCES {
 	struct {
 		union MES_API_HEADER	header;
@@ -163,14 +199,26 @@ union MESAPI_SET_HW_RESOURCES {
 		uint32_t		compute_hqd_mask[MAX_COMPUTE_PIPES];
 		uint32_t		gfx_hqd_mask[MAX_GFX_PIPES];
 		uint32_t		sdma_hqd_mask[MAX_SDMA_PIPES];
-		uint32_t		agreegated_doorbells[AMD_PRIORITY_NUM_LEVELS];
+		uint32_t		aggregated_doorbells[AMD_PRIORITY_NUM_LEVELS];
 		uint64_t		g_sch_ctx_gpu_mc_ptr;
 		uint64_t		query_status_fence_gpu_mc_ptr;
+		uint32_t		gc_base[MES_MAX_HWIP_SEGMENT];
+		uint32_t		mmhub_base[MES_MAX_HWIP_SEGMENT];
+		uint32_t		osssys_base[MES_MAX_HWIP_SEGMENT];
 		struct MES_API_STATUS	api_status;
 		union {
 			struct {
 				uint32_t disable_reset	: 1;
-				uint32_t reserved	: 31;
+				uint32_t use_different_vmid_compute : 1;
+				uint32_t disable_mes_log   : 1;
+				uint32_t apply_mmhub_pgvm_invalidate_ack_loss_wa : 1;
+				uint32_t apply_grbm_remote_register_dummy_read_wa : 1;
+				uint32_t second_gfx_pipe_enabled : 1;
+				uint32_t enable_level_process_quantum_check : 1;
+				uint32_t apply_cwsr_program_all_vmid_sq_shader_tba_registers_wa : 1;
+				uint32_t enable_mqd_active_poll : 1;
+				uint32_t disable_timer_int : 1;
+				uint32_t reserved	: 22;
 			};
 			uint32_t	uint32_t_all;
 		};
@@ -195,12 +243,16 @@ union MESAPI__ADD_QUEUE {
 		uint32_t			doorbell_offset;
 		uint64_t			mqd_addr;
 		uint64_t			wptr_addr;
+		uint64_t                        h_context;
+		uint64_t                        h_queue;
 		enum MES_QUEUE_TYPE		queue_type;
 		uint32_t			gds_base;
 		uint32_t			gds_size;
 		uint32_t			gws_base;
 		uint32_t			gws_size;
 		uint32_t			oa_mask;
+		uint64_t                        trap_handler_addr;
+		uint32_t                        vm_context_cntl;
 
 		struct {
 			uint32_t paging			: 1;
@@ -208,7 +260,8 @@ union MESAPI__ADD_QUEUE {
 			uint32_t program_gds		: 1;
 			uint32_t is_gang_suspended	: 1;
 			uint32_t is_tmz_queue		: 1;
-			uint32_t reserved		: 24;
+			uint32_t map_kiq_utility_queue  : 1;
+			uint32_t reserved		: 23;
 		};
 		struct MES_API_STATUS		api_status;
 	};
@@ -223,10 +276,18 @@ union MESAPI__REMOVE_QUEUE {
 		uint64_t		gang_context_addr;
 
 		struct {
-			uint32_t unmap_legacy_gfx_queue	: 1;
-			uint32_t reserved		: 31;
+			uint32_t unmap_legacy_gfx_queue   : 1;
+			uint32_t unmap_kiq_utility_queue  : 1;
+			uint32_t preempt_legacy_gfx_queue : 1;
+			uint32_t reserved                 : 29;
 		};
-		struct MES_API_STATUS	api_status;
+		struct MES_API_STATUS	    api_status;
+
+		uint32_t                    pipe_id;
+		uint32_t                    queue_id;
+
+		uint64_t                    tf_addr;
+		uint32_t                    tf_data;
 	};
 
 	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
@@ -321,16 +382,45 @@ union MESAPI__RESUME {
 
 union MESAPI__RESET {
 	struct {
-		union MES_API_HEADER	header;
+		union MES_API_HEADER		header;
 
 		struct {
-			uint32_t reset_queue	: 1;
-			uint32_t reserved	: 31;
+			/* Only reset the queue given by doorbell_offset (not entire gang) */
+			uint32_t                reset_queue_only : 1;
+			/* Hang detection first then reset any queues that are hung */
+			uint32_t                hang_detect_then_reset : 1;
+			/* Only do hang detection (no reset) */
+			uint32_t                hang_detect_only : 1;
+			/* Rest HP and LP kernel queues not managed by MES */
+			uint32_t                reset_legacy_gfx : 1;
+			uint32_t                reserved : 28;
 		};
 
-		uint64_t		gang_context_addr;
-		uint32_t		doorbell_offset; /* valid only if reset_queue = true */
-		struct MES_API_STATUS	api_status;
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
 	};
 
 	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
@@ -408,6 +498,8 @@ union MESAPI__SET_DEBUG_VMID {
 
 enum MESAPI_MISC_OPCODE {
 	MESAPI_MISC__MODIFY_REG,
+	MESAPI_MISC__INV_GART,
+	MESAPI_MISC__QUERY_STATUS,
 	MESAPI_MISC__MAX,
 };
 
@@ -420,6 +512,21 @@ enum MODIFY_REG_SUBCODE {
 
 enum { MISC_DATA_MAX_SIZE_IN_DWORDS = 20 };
 
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
 union MESAPI__MISC {
 	struct {
 		union MES_API_HEADER	header;
@@ -427,11 +534,9 @@ union MESAPI__MISC {
 		struct MES_API_STATUS	api_status;
 
 		union {
-			struct {
-				enum MODIFY_REG_SUBCODE	subcode;
-				uint32_t		reg_offset;
-				uint32_t		reg_value;
-			} modify_reg;
+			struct		MODIFY_REG modify_reg;
+			struct		INV_GART inv_gart;
+			struct		QUERY_STATUS query_status;
 			uint32_t	data[MISC_DATA_MAX_SIZE_IN_DWORDS];
 		};
 	};
@@ -439,5 +544,27 @@ union MESAPI__MISC {
 	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
 };
 
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
 #pragma pack(pop)
 #endif
-- 
2.35.1


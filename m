Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995C43E5173
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Aug 2021 05:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490F89E2B;
	Tue, 10 Aug 2021 03:23:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE8D89E2B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Aug 2021 03:23:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TArv57H6Sg5TYo0sipyKjRS3Q3JTAj6C1OWQmJ3IBl61PPY/Cdl5ohgLyxn1NNU5nkyBFtqvyRZlskyJ2Q/IN12tYJrngpUmbc4ftRWqRqd8q64QoeEfqntXJ+kJkTKF6Iv2SrB+jzW9W29Z4sOU0xI4wZpIR4D6odntqDrRib+9wvSQZCAX4BuAq1/5HrYCJAiJ38orwKJLCuXFhTuka3YzAvtfLXFjMlUZfJdExfBkh4pqGH2HKbeIB8ZZ+r1tNaXF+MLRWeXtxwGSIlo0W7LJ+FhavifqYU61BSkagEvWA0uq/nSZwX4Q+VCqhu22kvJWT5REBK3CmegPkUYX6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAbZUEMkthQeVVKCjUQyy6K4O6se1ZhD7J0cP9g66MI=;
 b=WnnnWZPhpzDadtO1GNP5P6+/XkzSXKBUhkoTnXnD0XifLmrAYf0vkYCezYvhyzHR4pqJAtYHs1q+uerOdyNVyO3CrtqWjA93w2FJBw8SVRlsBPWuwyXo4etDEbg1gU/GPMQnuYAYsTE7Z/pFQCMOkrVnQCex50VjTbNdBuc5G0C0TwHExPYSF9LqO8L3/QKkpMj7OA0+xn8gErcwRNeH9g3UpvQMjz1AaB7Hv7jqj3ChkH4rP/mtGl7tnHqzcRyFkf7JbKg39crv7JJ+Pa+o+oi+8SbaaqwoO99Ci6LcQ2r2YLi3zx+skDemzlhx1WPHhiCCR/gjCaleDWk1Cf557g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAbZUEMkthQeVVKCjUQyy6K4O6se1ZhD7J0cP9g66MI=;
 b=cI7CBOL6u+jSe83kFgg5ncO9NkcF/sMi+F+ZO17QJvjC2CF6V98LqOd9G21rc57IIPdzwouU+pVF4i3x8eb83l+ZPBeyFveh2pB4Th45Pu/f9eQ8a5/U9A5pCJ1yLQtb5zQ6aCrO/VXJAU991SiKZuh3sQNPoTH4X3NIz+/5/cM=
Received: from MW4PR04CA0044.namprd04.prod.outlook.com (2603:10b6:303:6a::19)
 by BN6PR12MB1666.namprd12.prod.outlook.com (2603:10b6:405:3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Tue, 10 Aug
 2021 03:23:54 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::ac) by MW4PR04CA0044.outlook.office365.com
 (2603:10b6:303:6a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Tue, 10 Aug 2021 03:23:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Tue, 10 Aug 2021 03:23:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 9 Aug
 2021 22:23:52 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 9 Aug
 2021 22:23:52 -0500
Received: from wayne-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Mon, 9 Aug 2021 22:23:50 -0500
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <monk.liu@amd.com>, <christian.koenig@amd.com>,
 <Andrey.Grodzovsky@amd.com>, Jack Zhang <Jack.Zhang1@amd.com>, Jingwen Chen
 <Jingwen.Chen2@amd.com>, Jack Zhang <Jack.Zhang7@hotmail.com>
Subject: [PATCH v4] drm/amd/amdgpu embed hw_fence into amdgpu_job
Date: Tue, 10 Aug 2021 11:22:54 +0800
Message-ID: <20210810032253.102933-1-Jingwen.Chen2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 348442b8-e3a0-4e3a-a8d2-08d95bae47c2
X-MS-TrafficTypeDiagnostic: BN6PR12MB1666:
X-Microsoft-Antispam-PRVS: <BN6PR12MB166652EFC0D56D31B631B070B7F79@BN6PR12MB1666.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGUo9t3JOd5QPxzkYwYqed8equi7hvXuT7Zoy4hshSGgFSXrJ4pwPH3T0QwoWJOtbODyRWyeQ5Arn/B5JilRcXnRIgm2zq5r+08k3HE4edAJF+imp1dR8YdkQCmC9sDNw0DrW7UKHCxHu3xmybwOaKK3THDWvx6x4WIgeRDH6c3utnfT7OXD1rlrSJXNxNg2unc12u2nilKyFpE1X8J/YVHtE4ztZ6FZZSrFPDCH/n8EVS1/hqK50ZhPuIFqZYpjJNe4aG7/jhUhOWKMC42YVEFO39bdZvM5j1QY84dSeJPY76umrUtZArvftrHvlebPJhvHTCTl06BZPRvsc8qs3ibBfwzGmIWMwaxAzcI4kJNiiKZwuKPhIviMxlngeA/PWrDHfnUCpXManGOqcqTsejTjXuSPKxNo3Cpw0MQxJyymjqCkMraeBHmAQqMgdeb+64VAOJVmW7sz/wkKvo9MPpoXClaps+8Du5SwAtCzG5a1wniEHdvOULWcHyXVlqg6KfMtTLhc1/Yz6uRzvKjgU09G7jUYOZX6c3Pt+e40Cr02O+/lgAM+d4tgjUY2LFsJ4cKOwjcGBUmwwrrac40K0NqLE0ZgpvYA0VbU2eDcYaq/tYs7HDjFKNRwj0Yh8OK/ylCg+c/5r2+yvEgUP2B3abF5ylvGZ1U41InXQhwFhNpqdo6l+7fKJrzhBR4S7qthrRDjJk6A/O9LhpHbj8sGOdv+OHoaGT8D4qDpI/4GnFcOzfuZnoJLzIdLQFAhJ2Be
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(2906002)(336012)(26005)(30864003)(70586007)(478600001)(81166007)(426003)(316002)(54906003)(45080400002)(83380400001)(186003)(356005)(8936002)(1076003)(8676002)(5660300002)(32650700002)(82310400003)(6916009)(4326008)(34020700004)(36756003)(82740400003)(70206006)(7696005)(36860700001)(86362001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 03:23:53.4373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348442b8-e3a0-4e3a-a8d2-08d95bae47c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1666
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

From: Jack Zhang <Jack.Zhang1@amd.com>

Why: Previously hw fence is alloced separately with job.
It caused historical lifetime issues and corner cases.
The ideal situation is to take fence to manage both job
and fence's lifetime, and simplify the design of gpu-scheduler.

How:
We propose to embed hw_fence into amdgpu_job.
1. We cover the normal job submission by this method.
2. For ib_test, and submit without a parent job keep the
legacy way to create a hw fence separately.
v2:
use AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT to show that the fence is
embeded in a job.
v3:
remove redundant variable ring in amdgpu_job
v4:
add tdr sequence support for this feature. Add a job_run_counter to
indicate whether this job is a resubmit job.

Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Signed-off-by: Jack Zhang <Jack.Zhang7@hotmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c  |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 12 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c   | 73 ++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     | 39 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h    |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  2 +-
 9 files changed, 108 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 7b46ba551cb2..3003ee1c9487 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -714,7 +714,6 @@ int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
 	ret = dma_fence_wait(f, false);
 
 err_ib_sched:
-	dma_fence_put(f);
 	amdgpu_job_free(job);
 err:
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 536005bff24a..277128846dd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1414,7 +1414,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
 			continue;
 		}
 		job = to_amdgpu_job(s_job);
-		if (preempted && job->fence == fence)
+		if (preempted && (&job->hw_fence) == fence)
 			/* mark the job as preempted */
 			job->preemption_status |= AMDGPU_IB_PREEMPTED;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 9e53ff851496..ade2fa07a50a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4447,7 +4447,7 @@ int amdgpu_device_mode1_reset(struct amdgpu_device *adev)
 int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 				 struct amdgpu_reset_context *reset_context)
 {
-	int i, r = 0;
+	int i, j, r = 0;
 	struct amdgpu_job *job = NULL;
 	bool need_full_reset =
 		test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
@@ -4471,6 +4471,16 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 		if (!ring || !ring->sched.thread)
 			continue;
 
+		/*clear job fence from fence drv to avoid force_completion
+		 *leave NULL and vm flush fence in fence drv */
+		for (j = 0; j <= ring->fence_drv.num_fences_mask; j ++) {
+			struct dma_fence *old,**ptr;
+			ptr = &ring->fence_drv.fences[j];
+			old = rcu_dereference_protected(*ptr, 1);
+			if (old && test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &old->flags)) {
+				RCU_INIT_POINTER(*ptr, NULL);
+			}
+		}
 		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
 		amdgpu_fence_driver_force_completion(ring);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 7495911516c2..a8302e324110 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -129,30 +129,50 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
  *
  * @ring: ring the fence is associated with
  * @f: resulting fence object
+ * @job: job the fence is embeded in
  * @flags: flags to pass into the subordinate .emit_fence() call
  *
  * Emits a fence command on the requested ring (all asics).
  * Returns 0 on success, -ENOMEM on failure.
  */
-int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
+int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amdgpu_job *job,
 		      unsigned flags)
 {
 	struct amdgpu_device *adev = ring->adev;
-	struct amdgpu_fence *fence;
+	struct dma_fence *fence;
+	struct amdgpu_fence *am_fence;
 	struct dma_fence __rcu **ptr;
 	uint32_t seq;
 	int r;
 
-	fence = kmem_cache_alloc(amdgpu_fence_slab, GFP_KERNEL);
-	if (fence == NULL)
-		return -ENOMEM;
+	if (job == NULL) {
+		/* create a sperate hw fence */
+		am_fence = kmem_cache_alloc(amdgpu_fence_slab, GFP_ATOMIC);
+		if (am_fence == NULL)
+			return -ENOMEM;
+		fence = &am_fence->base;
+		am_fence->ring = ring;
+	} else {
+		/* take use of job-embedded fence */
+		fence = &job->hw_fence;
+	}
 
 	seq = ++ring->fence_drv.sync_seq;
-	fence->ring = ring;
-	dma_fence_init(&fence->base, &amdgpu_fence_ops,
-		       &ring->fence_drv.lock,
-		       adev->fence_context + ring->idx,
-		       seq);
+	if (job != NULL && job->job_run_counter) {
+		/* reinit seq for resubmitted jobs */
+		fence->seqno = seq;
+	} else {
+		dma_fence_init(fence, &amdgpu_fence_ops,
+				&ring->fence_drv.lock,
+				adev->fence_context + ring->idx,
+				seq);
+	}
+
+	if (job != NULL) {
+		/* mark this fence has a parent job */
+		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
+	}
+
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
 			       seq, flags | AMDGPU_FENCE_FLAG_INT);
 	pm_runtime_get_noresume(adev_to_drm(adev)->dev);
@@ -175,9 +195,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
 	/* This function can't be called concurrently anyway, otherwise
 	 * emitting the fence would mess up the hardware ring buffer.
 	 */
-	rcu_assign_pointer(*ptr, dma_fence_get(&fence->base));
+	rcu_assign_pointer(*ptr, dma_fence_get(fence));
 
-	*f = &fence->base;
+	*f = fence;
 
 	return 0;
 }
@@ -621,8 +641,16 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
 
 static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
 {
-	struct amdgpu_fence *fence = to_amdgpu_fence(f);
-	return (const char *)fence->ring->name;
+	struct amdgpu_ring *ring;
+
+	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
+		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
+
+		ring = to_amdgpu_ring(job->base.sched);
+	} else {
+		ring = to_amdgpu_fence(f)->ring;
+	}
+	return (const char *)ring->name;
 }
 
 /**
@@ -656,8 +684,20 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
 static void amdgpu_fence_free(struct rcu_head *rcu)
 {
 	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
-	struct amdgpu_fence *fence = to_amdgpu_fence(f);
-	kmem_cache_free(amdgpu_fence_slab, fence);
+
+	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
+	/* free job if fence has a parent job */
+		struct amdgpu_job *job;
+
+		job = container_of(f, struct amdgpu_job, hw_fence);
+		kfree(job);
+	} else {
+	/* free fence_slab if it's separated fence*/
+		struct amdgpu_fence *fence;
+
+		fence = to_amdgpu_fence(f);
+		kmem_cache_free(amdgpu_fence_slab, fence);
+	}
 }
 
 /**
@@ -680,6 +720,7 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
 	.release = amdgpu_fence_release,
 };
 
+
 /*
  * Fence debugfs
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index ec65ab0ddf89..c076a6b9a5a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -262,7 +262,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 				       fence_flags | AMDGPU_FENCE_FLAG_64BIT);
 	}
 
-	r = amdgpu_fence_emit(ring, f, fence_flags);
+	r = amdgpu_fence_emit(ring, f, job, fence_flags);
 	if (r) {
 		dev_err(adev->dev, "failed to emit fence (%d)\n", r);
 		if (job && job->vmid)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index d33e6d97cc89..7da9c1855bd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -127,11 +127,16 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
 	struct dma_fence *f;
+	struct dma_fence *hw_fence;
 	unsigned i;
 
-	/* use sched fence if available */
-	f = job->base.s_fence ? &job->base.s_fence->finished : job->fence;
+	if (job->hw_fence.ops == NULL)
+		hw_fence = job->external_hw_fence;
+	else
+		hw_fence = &job->hw_fence;
 
+	/* use sched fence if available */
+	f = job->base.s_fence ? &job->base.s_fence->finished : hw_fence;
 	for (i = 0; i < job->num_ibs; ++i)
 		amdgpu_ib_free(ring->adev, &job->ibs[i], f);
 }
@@ -142,20 +147,27 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 
 	drm_sched_job_cleanup(s_job);
 
-	dma_fence_put(job->fence);
 	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->sched_sync);
-	kfree(job);
+
+    /* only put the hw fence if has embedded fence */
+	if (job->hw_fence.ops != NULL)
+		dma_fence_put(&job->hw_fence);
+	else
+		kfree(job);
 }
 
 void amdgpu_job_free(struct amdgpu_job *job)
 {
 	amdgpu_job_free_resources(job);
-
-	dma_fence_put(job->fence);
 	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->sched_sync);
-	kfree(job);
+
+	/* only put the hw fence if has embedded fence */
+	if (job->hw_fence.ops != NULL)
+		dma_fence_put(&job->hw_fence);
+	else
+		kfree(job);
 }
 
 int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
@@ -184,11 +196,14 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
 
 	job->base.sched = &ring->sched;
 	r = amdgpu_ib_schedule(ring, job->num_ibs, job->ibs, NULL, fence);
-	job->fence = dma_fence_get(*fence);
+	/* record external_hw_fence for direct submit */
+	job->external_hw_fence = dma_fence_get(*fence);
 	if (r)
 		return r;
 
 	amdgpu_job_free(job);
+	dma_fence_put(*fence);
+
 	return 0;
 }
 
@@ -246,10 +261,12 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 		if (r)
 			DRM_ERROR("Error scheduling IBs (%d)\n", r);
 	}
-	/* if gpu reset, hw fence will be replaced here */
-	dma_fence_put(job->fence);
-	job->fence = dma_fence_get(fence);
 
+	if (!job->job_run_counter)
+		dma_fence_get(fence);
+	else if (finished->error < 0)
+		dma_fence_put(&job->hw_fence);
+	job->job_run_counter ++;
 	amdgpu_job_free_resources(job);
 
 	fence = r ? ERR_PTR(r) : fence;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 81caac9b958a..9e65730193b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -46,7 +46,8 @@ struct amdgpu_job {
 	struct amdgpu_sync	sync;
 	struct amdgpu_sync	sched_sync;
 	struct amdgpu_ib	*ibs;
-	struct dma_fence	*fence; /* the hw fence */
+	struct dma_fence	hw_fence;
+	struct dma_fence	*external_hw_fence;
 	uint32_t		preamble_status;
 	uint32_t                preemption_status;
 	uint32_t		num_ibs;
@@ -62,6 +63,9 @@ struct amdgpu_job {
 	/* user fence handling */
 	uint64_t		uf_addr;
 	uint64_t		uf_sequence;
+
+	/* job_run_counter >= 1 means a resubmit job */
+	uint32_t		job_run_counter;
 };
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 9c11ced4312c..03d4b29a76d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -48,6 +48,9 @@
 #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
 #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
 
+/* fence flag bit to indicate the face is embeded in job*/
+#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
+
 #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
 
 #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
@@ -118,7 +121,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev);
 void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev);
 int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev);
 void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev);
-int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **fence,
+int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **fence, struct amdgpu_job *job,
 		      unsigned flags);
 int amdgpu_fence_emit_polling(struct amdgpu_ring *ring, uint32_t *s,
 			      uint32_t timeout);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 2a88ed5d983b..2af8860d74cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1218,7 +1218,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 		amdgpu_gmc_emit_pasid_mapping(ring, job->vmid, job->pasid);
 
 	if (vm_flush_needed || pasid_mapping_needed) {
-		r = amdgpu_fence_emit(ring, &fence, 0);
+		r = amdgpu_fence_emit(ring, &fence, NULL, 0);
 		if (r)
 			return r;
 	}
-- 
2.25.1


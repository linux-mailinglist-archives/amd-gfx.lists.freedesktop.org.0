Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AAEA1C922
	for <lists+amd-gfx@lfdr.de>; Sun, 26 Jan 2025 15:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB5310E3FD;
	Sun, 26 Jan 2025 14:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e84pl3ES";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B2710E3FD;
 Sun, 26 Jan 2025 14:55:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BF775C3ED2;
 Sun, 26 Jan 2025 14:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2A6C4CEE2;
 Sun, 26 Jan 2025 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737903352;
 bh=ly/BdMUaVxNlKvJsf6GwQTYCCYOjN30/2pIEhO5hXnI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e84pl3ESw23lyBNAll0IwGfYPgZYtppc0G56cWpkB58kZlyM3wu5z8QniWdwmXMwu
 DyXFIIUUockybDuIGL4OhZziDIeiPInIN05KQD6edU86vaJ77z3ten47BqJ/NreEAs
 iyOLMIbp9qtVxZvs4KplIS29RiGz1cwXXWphUlq2TpDNHDr/xN6WYkAVyoqmmdIloF
 FJTaW56WcAsEpkCtM3bC0BDG5o/EGWIN33TY3ajkX5JcSweuacHXUsYgiaWDNEOwF/
 n7CPOg8s00IcbbtI53uNCVCkT6ndXJwTegr6PKi0/HC2SSs/j8I/qRngRpD5yc6+eS
 vY3j9n7XBFcXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 22/31] drm/amdkfd: Queue interrupt work to
 different CPU
Date: Sun, 26 Jan 2025 09:54:38 -0500
Message-Id: <20250126145448.930220-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126145448.930220-1-sashal@kernel.org>
References: <20250126145448.930220-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit
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

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 34db5a32617d102e8042151bb87590e43c97132e ]

For CPX mode, each KFD node has interrupt worker to process ih_fifo to
send events to user space. Currently all interrupt workers of same adev
queue to same CPU, all workers execution are actually serialized and
this cause KFD ih_fifo overflow when CPU usage is high.

Use per-GPU unbounded highpri queue with number of workers equals to
number of partitions, let queue_work select the next CPU round robin
among the local CPUs of same NUMA.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 25 ++++++++--------------
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c | 25 ++++++++--------------
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h      |  3 ++-
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index b05be24531e18..d350c7ce35b3d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -637,6 +637,14 @@ static void kfd_cleanup_nodes(struct kfd_dev *kfd, unsigned int num_nodes)
 	struct kfd_node *knode;
 	unsigned int i;
 
+	/*
+	 * flush_work ensures that there are no outstanding
+	 * work-queue items that will access interrupt_ring. New work items
+	 * can't be created because we stopped interrupt handling above.
+	 */
+	flush_workqueue(kfd->ih_wq);
+	destroy_workqueue(kfd->ih_wq);
+
 	for (i = 0; i < num_nodes; i++) {
 		knode = kfd->nodes[i];
 		device_queue_manager_uninit(knode->dqm);
@@ -1058,21 +1066,6 @@ static int kfd_resume(struct kfd_node *node)
 	return err;
 }
 
-static inline void kfd_queue_work(struct workqueue_struct *wq,
-				  struct work_struct *work)
-{
-	int cpu, new_cpu;
-
-	cpu = new_cpu = smp_processor_id();
-	do {
-		new_cpu = cpumask_next(new_cpu, cpu_online_mask) % nr_cpu_ids;
-		if (cpu_to_node(new_cpu) == numa_node_id())
-			break;
-	} while (cpu != new_cpu);
-
-	queue_work_on(new_cpu, wq, work);
-}
-
 /* This is called directly from KGD at ISR. */
 void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
 {
@@ -1098,7 +1091,7 @@ void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
 			    	patched_ihre, &is_patched)
 		    && enqueue_ih_ring_entry(node,
 			    	is_patched ? patched_ihre : ih_ring_entry)) {
-			kfd_queue_work(node->ih_wq, &node->interrupt_work);
+			queue_work(node->kfd->ih_wq, &node->interrupt_work);
 			spin_unlock_irqrestore(&node->interrupt_lock, flags);
 			return;
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
index 9b6b6e8825934..15b4b70cf1997 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
@@ -62,11 +62,14 @@ int kfd_interrupt_init(struct kfd_node *node)
 		return r;
 	}
 
-	node->ih_wq = alloc_workqueue("KFD IH", WQ_HIGHPRI, 1);
-	if (unlikely(!node->ih_wq)) {
-		kfifo_free(&node->ih_fifo);
-		dev_err(node->adev->dev, "Failed to allocate KFD IH workqueue\n");
-		return -ENOMEM;
+	if (!node->kfd->ih_wq) {
+		node->kfd->ih_wq = alloc_workqueue("KFD IH", WQ_HIGHPRI | WQ_UNBOUND,
+						   node->kfd->num_nodes);
+		if (unlikely(!node->kfd->ih_wq)) {
+			kfifo_free(&node->ih_fifo);
+			dev_err(node->adev->dev, "Failed to allocate KFD IH workqueue\n");
+			return -ENOMEM;
+		}
 	}
 	spin_lock_init(&node->interrupt_lock);
 
@@ -96,16 +99,6 @@ void kfd_interrupt_exit(struct kfd_node *node)
 	spin_lock_irqsave(&node->interrupt_lock, flags);
 	node->interrupts_active = false;
 	spin_unlock_irqrestore(&node->interrupt_lock, flags);
-
-	/*
-	 * flush_work ensures that there are no outstanding
-	 * work-queue items that will access interrupt_ring. New work items
-	 * can't be created because we stopped interrupt handling above.
-	 */
-	flush_workqueue(node->ih_wq);
-
-	destroy_workqueue(node->ih_wq);
-
 	kfifo_free(&node->ih_fifo);
 }
 
@@ -162,7 +155,7 @@ static void interrupt_wq(struct work_struct *work)
 			/* If we spent more than a second processing signals,
 			 * reschedule the worker to avoid soft-lockup warnings
 			 */
-			queue_work(dev->ih_wq, &dev->interrupt_work);
+			queue_work(dev->kfd->ih_wq, &dev->interrupt_work);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 26e48fdc87289..75523f30cd38b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -273,7 +273,6 @@ struct kfd_node {
 
 	/* Interrupts */
 	struct kfifo ih_fifo;
-	struct workqueue_struct *ih_wq;
 	struct work_struct interrupt_work;
 	spinlock_t interrupt_lock;
 
@@ -366,6 +365,8 @@ struct kfd_dev {
 	struct kfd_node *nodes[MAX_KFD_NODES];
 	unsigned int num_nodes;
 
+	struct workqueue_struct *ih_wq;
+
 	/* Kernel doorbells for KFD device */
 	struct amdgpu_bo *doorbells;
 
-- 
2.39.5


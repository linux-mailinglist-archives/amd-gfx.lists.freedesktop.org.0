Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC2A76EFE
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Mar 2025 22:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CD410E49E;
	Mon, 31 Mar 2025 20:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="OiVTAjmx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A714910E48C;
 Mon, 31 Mar 2025 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ceKaUV/FxdqKMnIqH0Vy8k/ncnnX8NLn+J50U/AxWlY=; b=OiVTAjmxHYpCUuHVmSsMHFgkVg
 v+Wwgl6FDRiRRN/wyl/I7zNgqojtInoIqfDG1yg8oqmUceztz1M6xcXS9/ziNR7jBxzTkfE3gFKhz
 RD9iLIDem1dszdFUSOwVKrssKyH0gIEOIZFBcHtJYfTGNsHhVOpUIaZQaBhPDh0Zfr+xr0SLerQZd
 SkiNUL5K+aJeZScs7mQFFUjVmPV6TcsoDfIuQNSYxnoh/ReOkItGV+vq5otQtiPM26sAWadnbLTTj
 18BW903LvV4Il2mt1LArLa0cYMZlVpKeksBxpZWMqSztVm97DiUy29ToNb4VfHkFMrV/nU+2Q29VO
 xotiB2FA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZe-009M4C-Uv; Mon, 31 Mar 2025 22:17:35 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 12/14] drm/sched: Embed run queue singleton into the scheduler
Date: Mon, 31 Mar 2025 21:17:03 +0100
Message-ID: <20250331201705.60663-13-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Now that the run queue to scheduler relationship is always 1:1 we can
embed it (the run queue) directly in the scheduler struct and save on
some allocation error handling code and such.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |  8 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |  8 ++---
 drivers/gpu/drm/scheduler/sched_entity.c    | 34 +++++++++------------
 drivers/gpu/drm/scheduler/sched_fence.c     |  2 +-
 drivers/gpu/drm/scheduler/sched_internal.h  |  6 ++--
 drivers/gpu/drm/scheduler/sched_main.c      | 31 +++----------------
 drivers/gpu/drm/scheduler/sched_rq.c        | 18 +++++------
 include/drm/gpu_scheduler.h                 |  5 +--
 12 files changed, 59 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 82df06a72ee0..e18e180bf32c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1108,7 +1108,8 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (p->gang_size > 1 && !adev->vm_manager.concurrent_flush) {
 		for (i = 0; i < p->gang_size; ++i) {
 			struct drm_sched_entity *entity = p->entities[i];
-			struct drm_gpu_scheduler *sched = entity->rq->sched;
+			struct drm_gpu_scheduler *sched =
+				container_of(entity->rq, typeof(*sched), rq);
 			struct amdgpu_ring *ring = to_amdgpu_ring(sched);
 
 			if (amdgpu_vmid_uses_reserved(vm, ring->vm_hub))
@@ -1236,7 +1237,8 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	sched = p->gang_leader->base.entity->rq->sched;
+	sched = container_of(p->gang_leader->base.entity->rq, typeof(*sched),
+			     rq);
 	while ((fence = amdgpu_sync_get_fence(&p->sync))) {
 		struct drm_sched_fence *s_fence = to_drm_sched_fence(fence);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 9440af58073b..e3d4f7503738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -359,7 +359,9 @@ static struct dma_fence *
 amdgpu_job_prepare_job(struct drm_sched_job *sched_job,
 		      struct drm_sched_entity *s_entity)
 {
-	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
+	struct drm_gpu_scheduler *sched =
+		container_of(s_entity->rq, typeof(*sched), rq);
+	struct amdgpu_ring *ring = to_amdgpu_ring(sched);
 	struct amdgpu_job *job = to_amdgpu_job(sched_job);
 	struct dma_fence *fence;
 	int r;
@@ -459,7 +461,7 @@ drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
 
 void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 {
-	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_rq *rq = &sched->rq;
 	struct drm_sched_entity *s_entity;
 	struct drm_sched_job *s_job;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index ce6b9ba967ff..d6872baeba1e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -85,7 +85,10 @@ struct amdgpu_job {
 
 static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
 {
-	return to_amdgpu_ring(job->base.entity->rq->sched);
+	struct drm_gpu_scheduler *sched =
+		container_of(job->base.entity->rq, typeof(*sched), rq);
+
+	return to_amdgpu_ring(sched);
 }
 
 int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 11dd2e0f7979..197d20a37afb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -145,6 +145,7 @@ TRACE_EVENT(amdgpu_cs,
 		     struct amdgpu_ib *ib),
 	    TP_ARGS(p, job, ib),
 	    TP_STRUCT__entry(
+			     __field(struct drm_gpu_scheduler *, sched)
 			     __field(struct amdgpu_bo_list *, bo_list)
 			     __field(u32, ring)
 			     __field(u32, dw)
@@ -152,11 +153,14 @@ TRACE_EVENT(amdgpu_cs,
 			     ),
 
 	    TP_fast_assign(
+			   __entry->sched = container_of(job->base.entity->rq,
+							 typeof(*__entry->sched),
+							 rq);
 			   __entry->bo_list = p->bo_list;
-			   __entry->ring = to_amdgpu_ring(job->base.entity->rq->sched)->idx;
+			   __entry->ring = to_amdgpu_ring(__entry->sched)->idx;
 			   __entry->dw = ib->length_dw;
 			   __entry->fences = amdgpu_fence_count_emitted(
-				to_amdgpu_ring(job->base.entity->rq->sched));
+				to_amdgpu_ring(__entry->sched));
 			   ),
 	    TP_printk("bo_list=%p, ring=%u, dw=%u, fences=%u",
 		      __entry->bo_list, __entry->ring, __entry->dw,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 46d9fb433ab2..42f2bfb30af1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -105,13 +105,13 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 				 struct dma_fence **fence)
 {
+	struct drm_gpu_scheduler *sched =
+		container_of(p->vm->delayed.rq, typeof(*sched), rq);
+	struct amdgpu_ring *ring =
+		container_of(sched, struct amdgpu_ring, sched);
 	struct amdgpu_ib *ib = p->job->ibs;
-	struct amdgpu_ring *ring;
 	struct dma_fence *f;
 
-	ring = container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
-			    sched);
-
 	WARN_ON(ib->length_dw == 0);
 	amdgpu_ring_pad_ib(ring, ib);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index 23b6f7a4aa4a..ab132dae8183 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@ -420,15 +420,15 @@ int amdgpu_xcp_open_device(struct amdgpu_device *adev,
 void amdgpu_xcp_release_sched(struct amdgpu_device *adev,
 				  struct amdgpu_ctx_entity *entity)
 {
-	struct drm_gpu_scheduler *sched;
-	struct amdgpu_ring *ring;
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->entity.rq, typeof(*sched), rq);
 
 	if (!adev->xcp_mgr)
 		return;
 
-	sched = entity->entity.rq->sched;
 	if (drm_sched_wqueue_ready(sched)) {
-		ring = to_amdgpu_ring(entity->entity.rq->sched);
+		struct amdgpu_ring *ring = to_amdgpu_ring(sched);
+
 		atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
 	}
 }
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f61fec1cd155..c6ed0d1642f3 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -76,19 +76,12 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	 * is initialized itself.
 	 */
 	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
+	if (num_sched_list) {
+		entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
+		entity->rq = &sched_list[0]->rq;
+	}
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
-
-	if (num_sched_list && !sched_list[0]->rq) {
-		/* Since every entry covered by num_sched_list
-		 * should be non-NULL and therefore we warn drivers
-		 * not to do this and to fix their DRM calling order.
-		 */
-		pr_warn("%s: called with uninitialized scheduler\n", __func__);
-	} else if (num_sched_list) {
-		entity->rq = sched_list[0]->rq;
-	}
-
 	init_completion(&entity->entity_idle);
 
 	/* We start in an idle state. */
@@ -275,7 +268,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	if (!entity->rq)
 		return 0;
 
-	sched = entity->rq->sched;
+	sched = container_of(entity->rq, typeof(*sched), rq);
 	/**
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
@@ -366,9 +359,11 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 {
 	struct drm_sched_entity *entity =
 		container_of(cb, struct drm_sched_entity, cb);
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->rq, typeof(*sched), rq);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(sched);
 }
 
 /**
@@ -415,7 +410,8 @@ drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->rq, typeof(*sched), rq);
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -554,7 +550,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->rq : NULL;
+	rq = sched ? &sched->rq : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
@@ -577,11 +573,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first;
+	struct drm_gpu_scheduler *sched =
+		container_of(entity->rq, typeof(*sched), rq);
 	ktime_t submit_ts;
+	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
-	atomic_inc(entity->rq->sched->score);
+	atomic_inc(sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -594,8 +592,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 	/* first job wakes up scheduler */
 	if (first) {
-		struct drm_gpu_scheduler *sched;
-
 		submit_ts = __drm_sched_entity_get_job_deadline(entity,
 								submit_ts);
 		sched = drm_sched_rq_add_entity(entity, submit_ts);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index e971528504a5..bb48e690862d 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = entity->rq->sched;
+	fence->sched = container_of(entity->rq, typeof(*fence->sched), rq);
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 4b3fc4a098bb..f50e54bfaccc 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -6,11 +6,9 @@
 
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 
-void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_rq *rq);
+void drm_sched_rq_init(struct drm_gpu_scheduler *sched);
 struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
-			   struct drm_sched_rq *rq);
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched);
 struct drm_gpu_scheduler *
 drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8aaa6a0dcc70..4c52953a01a3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -578,7 +578,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 
 	BUG_ON(!entity);
 	drm_sched_entity_select_rq(entity);
-	sched = entity->rq->sched;
+	sched = container_of(entity->rq, typeof(*sched), rq);
 
 	job->sched = sched;
 	job->s_priority = entity->priority;
@@ -924,7 +924,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
 
 	while (!READ_ONCE(sched->pause_submit)) {
 		/* Find entity with a ready job */
-		entity = drm_sched_rq_select_entity(sched, sched->rq);
+		entity = drm_sched_rq_select_entity(sched);
 		if (!entity)
 			break;	/* No more work */
 
@@ -1003,15 +1003,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
-	if (sched->rq) {
-		/* Not an error, but warn anyway so drivers can
-		 * fine-tune their DRM calling order, and return all
-		 * is good.
-		 */
-		dev_warn(sched->dev, "%s: scheduler already initialized!\n", __func__);
-		return 0;
-	}
-
 	if (args->submit_wq) {
 		sched->submit_wq = args->submit_wq;
 		sched->own_submit_wq = false;
@@ -1029,11 +1020,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 		sched->own_submit_wq = true;
 	}
 
-	sched->rq = kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
-	if (!sched->rq)
-		goto Out_check_own;
-
-	drm_sched_rq_init(sched, sched->rq);
+	drm_sched_rq_init(sched);
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
@@ -1048,12 +1035,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ready = true;
 	return 0;
-
-Out_check_own:
-	if (sched->own_submit_wq)
-		destroy_workqueue(sched->submit_wq);
-	dev_err(sched->dev, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
-	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_sched_init);
 
@@ -1081,7 +1062,7 @@ EXPORT_SYMBOL(drm_sched_init);
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
 
-	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_rq *rq = &sched->rq;
 	struct drm_sched_entity *s_entity;
 
 	drm_sched_wqueue_stop(sched);
@@ -1105,8 +1086,6 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
-	kfree(sched->rq);
-	sched->rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1123,7 +1102,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 {
 	struct drm_gpu_scheduler *sched = bad->sched;
 	struct drm_sched_entity *entity, *tmp;
-	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_rq *rq = &sched->rq;
 
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 735bcb194c03..4b142a4c89d1 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -52,17 +52,16 @@ static void drm_sched_rq_update_tree_locked(struct drm_sched_entity *entity,
  * drm_sched_rq_init - initialize a given run queue struct
  *
  * @sched: scheduler instance to associate with this run queue
- * @rq: scheduler run queue
  *
  * Initializes a scheduler runqueue.
  */
-void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_rq *rq)
+void drm_sched_rq_init(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_rq *rq = &sched->rq;
+
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
-	rq->sched = sched;
 }
 
 /**
@@ -91,8 +90,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 	}
 
 	rq = entity->rq;
+	sched = container_of(rq, typeof(*sched), rq);
 	spin_lock(&rq->lock);
-	sched = rq->sched;
 
 	if (list_empty(&entity->list)) {
 		atomic_inc(sched->score);
@@ -118,6 +117,8 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	struct drm_gpu_scheduler *sched = container_of(rq, typeof(*sched), rq);
+
 	lockdep_assert_held(&entity->lock);
 
 	if (list_empty(&entity->list))
@@ -125,7 +126,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 
 	spin_lock(&rq->lock);
 
-	atomic_dec(rq->sched->score);
+	atomic_dec(sched->score);
 	list_del_init(&entity->list);
 
 	drm_sched_rq_remove_tree_locked(entity, rq);
@@ -160,17 +161,16 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
  * drm_sched_rq_select_entity - Select an entity which provides a job to run
  *
  * @sched: the gpu scheduler
- * @rq: scheduler run queue to check.
  *
  * Find oldest waiting ready entity.
  *
  * Return an entity if one is found or NULL if no ready entity was found.
  */
 struct drm_sched_entity *
-drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
-			   struct drm_sched_rq *rq)
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_entity *entity = NULL;
+	struct drm_sched_rq *rq = &sched->rq;
 	struct rb_node *rb;
 
 	spin_lock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index cd2a119f6da1..1e1dd16a0d9a 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -238,7 +238,6 @@ struct drm_sched_entity {
 /**
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
- * @sched: the scheduler to which this rq belongs to.
  * @lock: protects @entities, @rb_tree_root and @rr_deadline.
  * @entities: list of the entities to be scheduled.
  * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
@@ -248,8 +247,6 @@ struct drm_sched_entity {
  * the next entity to emit commands from.
  */
 struct drm_sched_rq {
-	struct drm_gpu_scheduler	*sched;
-
 	spinlock_t			lock;
 	/* Following members are protected by the @lock: */
 	ktime_t				rr_deadline;
@@ -550,7 +547,7 @@ struct drm_gpu_scheduler {
 	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq             *rq;
+	struct drm_sched_rq             rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
-- 
2.48.0


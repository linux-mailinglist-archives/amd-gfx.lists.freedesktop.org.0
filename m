Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67CA76EF3
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Mar 2025 22:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635710E488;
	Mon, 31 Mar 2025 20:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pLAyLA9W";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397B210E488;
 Mon, 31 Mar 2025 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FQlBf1OK9ZAjInW9UebcgJTtfP/hw9X/N1b9B4bVXms=; b=pLAyLA9WyBGysnV1Nje0jsL7lI
 3MLiErustzpnQXRdYij0Y+jf6oc4bOHMxL9g3ufjyeQ2GA/AcRI+dkgr8t3cQc9cW5zy4WLJJKRgF
 bGBVUYEPCr9EPsGtcBwS5PIy122T6gRiDeu5WcH6o0CyIX5yeA6A+ym47mdjPZfZAyHFU5mQOYXhL
 E3xwp6ioGxu2tmrQD7Y756bMepsk5PJiGvqfGNCwxqTpJoDL9CzIq7dv5UOw6acYx//25FFPlW2nk
 m6FUDuw4PvLVsAtuRsmKGZCpcDqGu6/YVAAadBlMyXlpZk2Emkzj/3mlFXs82gH9tgDM/XiQUsA1a
 85GWo2Uw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZd-009M3v-Em; Mon, 31 Mar 2025 22:17:33 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 10/14] drm/sched: Remove FIFO and RR and simplify to a single
 run queue
Date: Mon, 31 Mar 2025 21:17:01 +0100
Message-ID: <20250331201705.60663-11-tvrtko.ursulin@igalia.com>
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

If the new deadline policy is at least as good as FIFO and we can afford
to remove round-robin, we can simplify the scheduler code by making the
scheduler to run queue relationship always 1:1 and remove some code.

Also, now that the FIFO policy is gone the tree of entities is not a FIFO
tree any more so rename it to just the tree.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  23 ++--
 drivers/gpu/drm/scheduler/sched_entity.c   |  30 +----
 drivers/gpu/drm/scheduler/sched_internal.h |   7 --
 drivers/gpu/drm/scheduler/sched_main.c     | 133 +++++----------------
 drivers/gpu/drm/scheduler/sched_rq.c       |  32 ++---
 include/drm/gpu_scheduler.h                |   6 +-
 6 files changed, 54 insertions(+), 177 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index acb21fc8b3ce..9440af58073b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -459,25 +459,22 @@ drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
 
 void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_entity *s_entity;
 	struct drm_sched_job *s_job;
-	struct drm_sched_entity *s_entity = NULL;
-	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		struct drm_sched_rq *rq = sched->sched_rq[i];
-		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list) {
-			while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
-				struct drm_sched_fence *s_fence = s_job->s_fence;
+	spin_lock(&rq->lock);
+	list_for_each_entry(s_entity, &rq->entities, list) {
+		while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
+			struct drm_sched_fence *s_fence = s_job->s_fence;
 
-				dma_fence_signal(&s_fence->scheduled);
-				dma_fence_set_error(&s_fence->finished, -EHWPOISON);
-				dma_fence_signal(&s_fence->finished);
-			}
+			dma_fence_signal(&s_fence->scheduled);
+			dma_fence_set_error(&s_fence->finished, -EHWPOISON);
+			dma_fence_signal(&s_fence->finished);
 		}
-		spin_unlock(&rq->lock);
 	}
+	spin_unlock(&rq->lock);
 
 	/* Signal all jobs already scheduled to HW */
 	list_for_each_entry(s_job, &sched->pending_list, list) {
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index f4930b44f50d..f61fec1cd155 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -70,8 +70,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
-	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_DEADLINE ?
-			      DRM_SCHED_PRIORITY_KERNEL : priority;
 	/*
 	 * It's perfectly valid to initialize an entity without having a valid
 	 * scheduler attached. It's just not valid to use the scheduler before it
@@ -81,30 +79,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if (num_sched_list && !sched_list[0]->sched_rq) {
+	if (num_sched_list && !sched_list[0]->rq) {
 		/* Since every entry covered by num_sched_list
 		 * should be non-NULL and therefore we warn drivers
 		 * not to do this and to fix their DRM calling order.
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		enum drm_sched_priority p = entity->priority;
-
-		/*
-		 * The "priority" of an entity cannot exceed the number of
-		 * run-queues of a scheduler. Protect against num_rqs being 0,
-		 * by converting to signed. Choose the lowest priority
-		 * available.
-		 */
-		if (p >= sched_list[0]->num_user_rqs) {
-			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
-				p, sched_list[0]->num_user_rqs);
-			p = max_t(s32,
-				 (s32)sched_list[0]->num_user_rqs - 1,
-				 (s32)DRM_SCHED_PRIORITY_KERNEL);
-			entity->priority = p;
-		}
-		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
+		entity->rq = sched_list[0]->rq;
 	}
 
 	init_completion(&entity->entity_idle);
@@ -572,7 +554,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
+	rq = sched ? sched->rq : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
@@ -614,10 +596,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	if (first) {
 		struct drm_gpu_scheduler *sched;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
-			submit_ts = __drm_sched_entity_get_job_deadline(entity,
-									submit_ts);
-
+		submit_ts = __drm_sched_entity_get_job_deadline(entity,
+								submit_ts);
 		sched = drm_sched_rq_add_entity(entity, submit_ts);
 		if (sched)
 			drm_sched_wakeup(sched);
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index a81bf25569cd..fc0f05ce06af 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -4,13 +4,6 @@
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
 
-/* Used to choose between FIFO and RR job-scheduling */
-extern int drm_sched_policy;
-
-#define DRM_SCHED_POLICY_RR	  0
-#define DRM_SCHED_POLICY_FIFO	  1
-#define DRM_SCHED_POLICY_DEADLINE 2
-
 bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 			 struct drm_sched_entity *entity);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cfe6bc728271..b35450c45e7b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -89,15 +89,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
 };
 #endif
 
-int drm_sched_policy = DRM_SCHED_POLICY_DEADLINE;
-
-/**
- * DOC: sched_policy (int)
- * Used to override default entities scheduling policy in a run queue.
- */
-MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_DEADLINE) " = Virtual deadline (default).");
-module_param_named(sched_policy, drm_sched_policy, int, 0444);
-
 static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
@@ -839,34 +830,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 	drm_sched_run_job_queue(sched);
 }
 
-/**
- * drm_sched_select_entity - Select next entity to process
- *
- * @sched: scheduler instance
- *
- * Return an entity to process or NULL if none are found.
- *
- * Note, that we break out of the for-loop when "entity" is non-null, which can
- * also be an error-pointer--this assures we don't process lower priority
- * run-queues. See comments in the respectively called functions.
- */
-static struct drm_sched_entity *
-drm_sched_select_entity(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_entity *entity = NULL;
-	int i;
-
-	/* Start with the highest priority.
-	 */
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
-		if (entity)
-			break;
-	}
-
-	return IS_ERR(entity) ? NULL : entity;
-}
-
 /**
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
@@ -989,8 +952,8 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	int r;
 
 	/* Find entity with a ready job */
-	entity = drm_sched_select_entity(sched);
-	if (!entity)
+	entity = drm_sched_rq_select_entity(sched, sched->rq);
+	if (IS_ERR_OR_NULL(entity))
 		return;	/* No more work */
 
 	sched_job = drm_sched_entity_pop_job(entity);
@@ -1042,8 +1005,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_args *args)
 {
-	int i;
-
 	sched->ops = args->ops;
 	sched->credit_limit = args->credit_limit;
 	sched->name = args->name;
@@ -1053,13 +1014,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
-	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
-		/* This is a gross violation--tell drivers what the  problem is.
-		 */
-		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
-			__func__);
-		return -EINVAL;
-	} else if (sched->sched_rq) {
+	if (sched->rq) {
 		/* Not an error, but warn anyway so drivers can
 		 * fine-tune their DRM calling order, and return all
 		 * is good.
@@ -1085,21 +1040,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 		sched->own_submit_wq = true;
 	}
 
-	sched->num_user_rqs = args->num_rqs;
-	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_DEADLINE ?
-			 args->num_rqs : 1;
-	sched->sched_rq = kmalloc_array(sched->num_rqs,
-					sizeof(*sched->sched_rq),
-					GFP_KERNEL | __GFP_ZERO);
-	if (!sched->sched_rq)
+	sched->rq = kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
+	if (!sched->rq)
 		goto Out_check_own;
 
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
-		if (!sched->sched_rq[i])
-			goto Out_unroll;
-		drm_sched_rq_init(sched, sched->sched_rq[i]);
-	}
+	drm_sched_rq_init(sched, sched->rq);
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
@@ -1114,12 +1059,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ready = true;
 	return 0;
-Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
-		kfree(sched->sched_rq[i]);
 
-	kfree(sched->sched_rq);
-	sched->sched_rq = NULL;
 Out_check_own:
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
@@ -1151,25 +1091,21 @@ EXPORT_SYMBOL(drm_sched_init);
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
+
+	struct drm_sched_rq *rq = sched->rq;
 	struct drm_sched_entity *s_entity;
-	int i;
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		struct drm_sched_rq *rq = sched->sched_rq[i];
-
-		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
-			/*
-			 * Prevents reinsertion and marks job_queue as idle,
-			 * it will be removed from the rq in drm_sched_entity_fini()
-			 * eventually
-			 */
-			s_entity->stopped = true;
-		spin_unlock(&rq->lock);
-		kfree(sched->sched_rq[i]);
-	}
+	spin_lock(&rq->lock);
+	list_for_each_entry(s_entity, &rq->entities, list)
+		/*
+		 * Prevents reinsertion and marks job_queue as idle,
+		 * it will be removed from the rq in drm_sched_entity_fini()
+		 * eventually
+		 */
+		s_entity->stopped = true;
+	spin_unlock(&rq->lock);
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
 	wake_up_all(&sched->job_scheduled);
@@ -1180,8 +1116,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
-	kfree(sched->sched_rq);
-	sched->sched_rq = NULL;
+	kfree(sched->rq);
+	sched->rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1196,35 +1132,28 @@ EXPORT_SYMBOL(drm_sched_fini);
  */
 void drm_sched_increase_karma(struct drm_sched_job *bad)
 {
-	int i;
-	struct drm_sched_entity *tmp;
-	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
+	struct drm_sched_entity *entity, *tmp;
+	struct drm_sched_rq *rq = sched->rq;
 
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
 	 */
-	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
-		atomic_inc(&bad->karma);
+	if (bad->s_priority == DRM_SCHED_PRIORITY_KERNEL)
+		return;
 
-		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-			struct drm_sched_rq *rq = sched->sched_rq[i];
+	atomic_inc(&bad->karma);
 
-			spin_lock(&rq->lock);
-			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
-				if (bad->s_fence->scheduled.context ==
-				    entity->fence_context) {
-					if (entity->guilty)
-						atomic_set(entity->guilty, 1);
-					break;
-				}
-			}
-			spin_unlock(&rq->lock);
-			if (&entity->list != &rq->entities)
-				break;
+	spin_lock(&rq->lock);
+	list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
+		if (bad->s_fence->scheduled.context == entity->fence_context) {
+			if (entity->guilty)
+				atomic_set(entity->guilty, 1);
+			break;
 		}
 	}
+	spin_unlock(&rq->lock);
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
 
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index dc643f69da4d..21ee96a37895 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -16,7 +16,7 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
 	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
 }
 
-static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+static void drm_sched_rq_remove_tree_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq)
 {
 	lockdep_assert_held(&entity->lock);
@@ -28,7 +28,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 	}
 }
 
-static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+static void drm_sched_rq_update_tree_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq,
 					    ktime_t ts)
 {
@@ -40,7 +40,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 	lockdep_assert_held(&entity->lock);
 	lockdep_assert_held(&rq->lock);
 
-	drm_sched_rq_remove_fifo_locked(entity, rq);
+	drm_sched_rq_remove_tree_locked(entity, rq);
 
 	entity->oldest_job_waiting = ts;
 
@@ -65,16 +65,6 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 	rq->sched = sched;
 }
 
-static ktime_t
-drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
-{
-	lockdep_assert_held(&rq->lock);
-
-	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
-
-	return rq->rr_deadline;
-}
-
 /**
  * drm_sched_rq_add_entity - add an entity
  *
@@ -109,9 +99,7 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 		list_add_tail(&entity->list, &rq->entities);
 	}
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
-		ts = drm_sched_rq_get_rr_deadline(rq);
-	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+	drm_sched_rq_update_tree_locked(entity, rq, ts);
 
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
@@ -140,7 +128,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
 
-	drm_sched_rq_remove_fifo_locked(entity, rq);
+	drm_sched_rq_remove_tree_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
@@ -159,17 +147,11 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	if (!next_job)
 		return;
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
-		ts = drm_sched_entity_get_job_deadline(entity, next_job);
-	else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		ts = next_job->submit_ts;
-	else
-		ts = drm_sched_rq_get_rr_deadline(rq);
-
+	ts = drm_sched_entity_get_job_deadline(entity, next_job);
 	spin_lock(&entity->lock);
 	rq = entity->rq;
 	spin_lock(&rq->lock);
-	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+	drm_sched_rq_update_tree_locked(entity, rq, ts);
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f0fbd95bb39b..cd2a119f6da1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -147,8 +147,6 @@ struct drm_sched_entity {
 	 */
 	struct spsc_queue		job_queue;
 
-	enum drm_sched_priority         rq_priority;
-
 	/**
 	 * @fence_seq:
 	 *
@@ -552,9 +550,7 @@ struct drm_gpu_scheduler {
 	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
-	u32                             num_rqs;
-	u32                             num_user_rqs;
-	struct drm_sched_rq             **sched_rq;
+	struct drm_sched_rq             *rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
-- 
2.48.0


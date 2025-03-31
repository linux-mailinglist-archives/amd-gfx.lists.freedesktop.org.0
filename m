Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF08A76F02
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Mar 2025 22:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D853810E4A3;
	Mon, 31 Mar 2025 20:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iV190+93";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001810E488;
 Mon, 31 Mar 2025 20:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UN8uS2rpcpUOHt1KpjEPD6+h7CnxA/QDfUGO4PwAjV4=; b=iV190+93m92Hl6KTSlfgCA8UxN
 Qrj8GTOPFmduHjfNQrk1VQKFxXiU8PERsAIYhuvNDOP5Ra5kqLqPHNDlgCx7k5wvQVe3voZBbWcAt
 7Ux9fc8nJR6mp7lbsVoeWhCSvlsTecB3JPqQgyrm8qjxbYp9dNVZ5Dpu6tLrPHnauwTTt0Jh6QLR/
 GkW5MdN7T52Ri/9tFWWhmwQ7OHbCri9iK/tw7PNTEg4pHJ0qC8Da++5nxI+H3O/NcK+cYKR+k/dio
 aQPnXWwrVFs+VrZWUmKadWKxKfw8sCFpuvWr/NVCIG935XiBQZHK4M4fhRO6fLufnP5HgstgRGCUa
 jOE5ntfg==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tzLZe-009M44-6b; Mon, 31 Mar 2025 22:17:34 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v3 11/14] drm/sched: Queue all free credits in one worker
 invocation
Date: Mon, 31 Mar 2025 21:17:02 +0100
Message-ID: <20250331201705.60663-12-tvrtko.ursulin@igalia.com>
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

There is no reason to queue just a single job if scheduler can take more
and re-queue the worker to queue more. We can simply feed the hardware
with as much as it can take in one go and hopefully win some latency.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_internal.h |   2 -
 drivers/gpu/drm/scheduler/sched_main.c     | 127 ++++++++++-----------
 drivers/gpu/drm/scheduler/sched_rq.c       |  17 +--
 3 files changed, 61 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index fc0f05ce06af..4b3fc4a098bb 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -4,8 +4,6 @@
 #define _DRM_GPU_SCHEDULER_INTERNAL_H_
 
 
-bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-			 struct drm_sched_entity *entity);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 
 void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index b35450c45e7b..8aaa6a0dcc70 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -100,35 +100,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 	return credits;
 }
 
-/**
- * drm_sched_can_queue -- Can we queue more to the hardware?
- * @sched: scheduler instance
- * @entity: the scheduler entity
- *
- * Return true if we can push at least one more job from @entity, false
- * otherwise.
- */
-bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-			 struct drm_sched_entity *entity)
-{
-	struct drm_sched_job *s_job;
-
-	s_job = drm_sched_entity_queue_peek(entity);
-	if (!s_job)
-		return false;
-
-	/* If a job exceeds the credit limit, truncate it to the credit limit
-	 * itself to guarantee forward progress.
-	 */
-	if (s_job->credits > sched->credit_limit) {
-		dev_WARN(sched->dev,
-			 "Jobs may not exceed the credit limit, truncate.\n");
-		s_job->credits = sched->credit_limit;
-	}
-
-	return drm_sched_available_credits(sched) >= s_job->credits;
-}
-
 /**
  * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
@@ -945,54 +916,72 @@ static void drm_sched_run_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
+	u32 job_credits, submitted_credits = 0;
 	struct drm_sched_entity *entity;
-	struct dma_fence *fence;
 	struct drm_sched_fence *s_fence;
 	struct drm_sched_job *sched_job;
-	int r;
+	struct dma_fence *fence;
 
-	/* Find entity with a ready job */
-	entity = drm_sched_rq_select_entity(sched, sched->rq);
-	if (IS_ERR_OR_NULL(entity))
-		return;	/* No more work */
+	while (!READ_ONCE(sched->pause_submit)) {
+		/* Find entity with a ready job */
+		entity = drm_sched_rq_select_entity(sched, sched->rq);
+		if (!entity)
+			break;	/* No more work */
+
+		/*
+		 * If a job exceeds the credit limit truncate it to guarantee
+		 * forward progress.
+		 */
+		sched_job = drm_sched_entity_queue_peek(entity);
+		job_credits = sched_job->credits;
+		if (dev_WARN_ONCE(sched->dev, job_credits > sched->credit_limit,
+				  "Jobs may not exceed the credit limit, truncating.\n"))
+			job_credits = sched_job->credits = sched->credit_limit;
+
+		if (job_credits > drm_sched_available_credits(sched)) {
+			complete_all(&entity->entity_idle);
+			break;
+		}
+
+		sched_job = drm_sched_entity_pop_job(entity);
+		if (!sched_job) {
+			/* Top entity is not yet runnable after all */
+			complete_all(&entity->entity_idle);
+			continue;
+		}
+
+		s_fence = sched_job->s_fence;
+		drm_sched_job_begin(sched_job);
+		trace_drm_run_job(sched_job, entity);
+		submitted_credits += job_credits;
+		atomic_add(job_credits, &sched->credit_count);
+
+		fence = sched->ops->run_job(sched_job);
+		drm_sched_fence_scheduled(s_fence, fence);
+
+		if (!IS_ERR_OR_NULL(fence)) {
+			int r;
+
+			/* Drop for original kref_init of the fence */
+			dma_fence_put(fence);
+
+			r = dma_fence_add_callback(fence, &sched_job->cb,
+						   drm_sched_job_done_cb);
+			if (r == -ENOENT)
+				drm_sched_job_done(sched_job, fence->error);
+			else if (r)
+				DRM_DEV_ERROR(sched->dev,
+					      "fence add callback failed (%d)\n", r);
+		} else {
+			drm_sched_job_done(sched_job, IS_ERR(fence) ?
+						      PTR_ERR(fence) : 0);
+		}
 
-	sched_job = drm_sched_entity_pop_job(entity);
-	if (!sched_job) {
 		complete_all(&entity->entity_idle);
-		drm_sched_run_job_queue(sched);
-		return;
 	}
 
-	s_fence = sched_job->s_fence;
-
-	atomic_add(sched_job->credits, &sched->credit_count);
-	drm_sched_job_begin(sched_job);
-
-	trace_drm_run_job(sched_job, entity);
-	/*
-	 * The run_job() callback must by definition return a fence whose
-	 * refcount has been incremented for the scheduler already.
-	 */
-	fence = sched->ops->run_job(sched_job);
-	complete_all(&entity->entity_idle);
-	drm_sched_fence_scheduled(s_fence, fence);
-
-	if (!IS_ERR_OR_NULL(fence)) {
-		r = dma_fence_add_callback(fence, &sched_job->cb,
-					   drm_sched_job_done_cb);
-		if (r == -ENOENT)
-			drm_sched_job_done(sched_job, fence->error);
-		else if (r)
-			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
-
-		dma_fence_put(fence);
-	} else {
-		drm_sched_job_done(sched_job, IS_ERR(fence) ?
-				   PTR_ERR(fence) : 0);
-	}
-
-	wake_up(&sched->job_scheduled);
-	drm_sched_run_job_queue(sched);
+	if (submitted_credits)
+		wake_up(&sched->job_scheduled);
 }
 
 /**
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 21ee96a37895..735bcb194c03 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -164,9 +164,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
  *
  * Find oldest waiting ready entity.
  *
- * Return an entity if one is found; return an error-pointer (!NULL) if an
- * entity was ready, but the scheduler had insufficient credits to accommodate
- * its job; return NULL, if no ready entity was found.
+ * Return an entity if one is found or NULL if no ready entity was found.
  */
 struct drm_sched_entity *
 drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
@@ -185,17 +183,8 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 	}
 	spin_unlock(&rq->lock);
 
-	if (!entity)
-		return NULL;
-
-	/*
-	 * If scheduler cannot take more jobs signal the caller to not consider
-	 * lower priority queues.
-	 */
-	if (!drm_sched_can_queue(sched, entity))
-		return ERR_PTR(-ENOSPC);
-
-	reinit_completion(&entity->entity_idle);
+	if (entity)
+		reinit_completion(&entity->entity_idle);
 
 	return entity;
 }
-- 
2.48.0


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85413C560
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2020 15:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111696EAB0;
	Wed, 15 Jan 2020 14:15:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A656EAB0
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 14:15:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so15847608wrl.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MKmba5mHXDcHITG/MvJbjgz1AZHvjKaFjUvNK/xlzI=;
 b=WiWk+2c+rl+3QJS6yrv1Cjs7oWQM+nd+MlVY4ot5nfNX3cAA+RtJ3udNY8lW/fhkBh
 skLy92cwfUPyvwKCjhj6gdf9IS0alwIqcHoihSg+AigaECH9Wy/t9J7MfRa7GwecraWU
 nM2xnZNTQuasPVzzK9LDZBulGgqjOOD/GE/6UOwkWN9GfSbDvyEu+Ef+LcFc2+udepTh
 aI2SxYmhoTFe/WKx7vc0Hcf/LuOm+dX5oC3AsYEdsOYkvP8jbLhWVGY7nRaz8edgiwjA
 Vh0HrtoUnDlFlV/uUAU7ub+xJsNCEp3mq+Jn4BaR1a/bqwYkHG0LAKOi5XxaVUVg/OrE
 GApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8MKmba5mHXDcHITG/MvJbjgz1AZHvjKaFjUvNK/xlzI=;
 b=CAdY54odw4YFDAWqq86W66b3pWHMUoXArz5Yyx5MoTqWk1ttTubFAKSXh8ass39tC3
 qO7mr8buhmFS425/kZ7w3SKEjpbeIqv27F5qWj1Pqd3NwIc/p+2dt7pek6S3eloLsn95
 dOzI9BRxPNkLdVERqumUsKNbMcGSmMAoHllEcamHR4uO2wWFIfaC5nYEhYIPaaN4ZW6L
 H/h9wjpCdN0OiLAF439aif7sQVpRKrd7hkxIg+kNiJrv/I4ox+HmuAubBZZBMf254jtW
 AHo09Zv/NfsJdyFUnt9MYdhdx61v5W+UBjxYrXeHs+slwkkGy6PykRiV8UJfA8skwGkW
 u/yw==
X-Gm-Message-State: APjAAAWTgTW/PoOkb7Uptnzs08p/RfiZ0LbT4taNpzOAFPmcVMKWpunV
 vr+Q1UDhDb0OrUoebakq4zfSUxgCahQEtw==
X-Google-Smtp-Source: APXvYqwn6a5kABygpZSdEmBIQlhcX+hruRcenH/+9JDb7ptEF/beWaDTdznlckJnFSTo5tycNAvlzw==
X-Received: by 2002:a5d:670a:: with SMTP id o10mr32588010wru.227.1579097704830; 
 Wed, 15 Jan 2020 06:15:04 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2BBB00033A7193FF097830.dip0.t-ipconnect.de.
 [2003:c5:8f2b:bb00:33a:7193:ff09:7830])
 by smtp.gmail.com with ESMTPSA id x11sm25369597wre.68.2020.01.15.06.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 06:15:04 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: improve job distribution with multiple queues
Date: Wed, 15 Jan 2020 15:16:32 +0100
Message-Id: <20200115141632.4928-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: alexander.deucher@amd.com, kenny.ho@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com, pierre-eric.pelloux-prayer@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This patch uses score based logic to select a new rq for better
loadbalance between multiple rq/scheds instead of num_jobs.

Below are test results after running amdgpu_test from mesa drm

Before this patch:

sched_name     num of many times it got scheduled
=========      ==================================
sdma0          314
sdma1          32
comp_1.0.0     56
comp_1.0.1     0
comp_1.1.0     0
comp_1.1.1     0
comp_1.2.0     0
comp_1.2.1     0
comp_1.3.0     0
comp_1.3.1     0
After this patch:

sched_name     num of many times it got scheduled
=========      ==================================
sdma0          218
sdma1          211
comp_1.0.0     39
comp_1.0.1     9
comp_1.1.0     12
comp_1.1.1     0
comp_1.2.0     12
comp_1.2.1     0
comp_1.3.0     12
comp_1.3.1     0

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 9 ++++-----
 drivers/gpu/drm/scheduler/sched_main.c   | 5 +++--
 include/drm/gpu_scheduler.h              | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 2e3a058fc239..7120eeec1a9b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -130,7 +130,7 @@ static struct drm_sched_rq *
 drm_sched_entity_get_free_sched(struct drm_sched_entity *entity)
 {
 	struct drm_sched_rq *rq = NULL;
-	unsigned int min_jobs = UINT_MAX, num_jobs;
+	unsigned int min_score = UINT_MAX, num_score;
 	int i;
 
 	for (i = 0; i < entity->num_sched_list; ++i) {
@@ -141,9 +141,9 @@ drm_sched_entity_get_free_sched(struct drm_sched_entity *entity)
 			continue;
 		}
 
-		num_jobs = atomic_read(&sched->num_jobs);
-		if (num_jobs < min_jobs) {
-			min_jobs = num_jobs;
+		num_score = atomic_read(&sched->score);
+		if (num_score < min_score) {
+			min_score = num_score;
 			rq = &entity->sched_list[i]->sched_rq[entity->priority];
 		}
 	}
@@ -498,7 +498,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
 	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
-	atomic_inc(&entity->rq->sched->num_jobs);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3fad5876a13f..f58a0e04ef2b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -92,6 +92,7 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 	if (!list_empty(&entity->list))
 		return;
 	spin_lock(&rq->lock);
+	atomic_inc(&rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
 	spin_unlock(&rq->lock);
 }
@@ -110,6 +111,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (list_empty(&entity->list))
 		return;
 	spin_lock(&rq->lock);
+	atomic_dec(&rq->sched->score);
 	list_del_init(&entity->list);
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
@@ -655,7 +657,6 @@ static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb)
 	struct drm_gpu_scheduler *sched = s_fence->sched;
 
 	atomic_dec(&sched->hw_rq_count);
-	atomic_dec(&sched->num_jobs);
 
 	trace_drm_sched_process_job(s_fence);
 
@@ -830,7 +831,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	atomic_set(&sched->num_jobs, 0);
+	atomic_set(&sched->score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 
 	/* Each scheduler will run on a seperate kernel thread */
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 96a1a1b7526e..eda58b22cf76 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -261,7 +261,7 @@ struct drm_sched_backend_ops {
  * @job_list_lock: lock to protect the ring_mirror_list.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
  *              guilty and it will be considered for scheduling further.
- * @num_jobs: the number of jobs in queue in the scheduler
+ * @score: score to help loadbalancer pick a most idle sched
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  *
@@ -282,8 +282,8 @@ struct drm_gpu_scheduler {
 	struct list_head		ring_mirror_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
-	atomic_t                        num_jobs;
-	bool			ready;
+	atomic_t                        score;
+	bool				ready;
 	bool				free_guilty;
 };
 
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF34BD3900
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Oct 2025 16:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3E310E478;
	Mon, 13 Oct 2025 14:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHVkt8mK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ABE10E472
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:12 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6399706fd3cso6316547a12.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366111; x=1760970911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGHkg4CzQO0ckbxvGrx3lYkCFuMHAvq3/CVgfYTONxg=;
 b=DHVkt8mKXyfQQbtmtjkXPZ+A4RhoHXfsDpFqhmggCMv4WupFav9BYxh4D03Z1nTxoQ
 2FPtm5p9calJCq0UiZCBLpZ00eXvUChFmr3sUKFrV2o8cje2dY9BHcCU3briXk6YTr4y
 wjGOfl32ptLelenSck1/r1khh8B1iBCOUnbOcrGQJvDGWHFJgHXTFPjMEIECQZZuYeFy
 rBzK0EwLg5lXNUJ867ycXW+lHRM3QfTX9U2ILUyrp3v+nWndGsOjpTNnY0+7E1B1Q1Te
 h2Y+3Um00SjtkZqsv9jVF9+mswvJ7hrPLYNiu4ZnY5b3KB6eRsQdDaM5apJYli9fRgix
 JbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366111; x=1760970911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QGHkg4CzQO0ckbxvGrx3lYkCFuMHAvq3/CVgfYTONxg=;
 b=JXVhtcfGK4nPFOG6R5L66soaXqRXPUgRDCxMxm1KBttk9FENl7amewjXbiogEGYW/R
 hC4/iefXgFl6WBDDEXCtXYMxtuWPWhbr7H94kzKvaRHdi9bxca7Fbg3yyfqapiOhqY9l
 6wmFLU9taHgHQ1QjQ+ZKQxabaYU1157cifvv4lXZ8MX7RkYKRwWxLcA3Z+Sp2LorbOA5
 rWEKHT6vpb7VY1+3qZ7Xm+eEvCVdLpPibFAg/2MnyNsMBqxzEzWJvWPwFAwqURnZX2li
 doy69xePFXaht2bFF5F/uZqCSBkP6L0EJ1lI6G2NtFExXl+aaiC3AilwxizTMLO/EZpZ
 Tsww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwawnO33LJxFDGtoDYQCLj7tcD54zD9S1SUG3NazYrDhGKsEowf5O0VYmjEoDXZJjbehiTOQ34@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx3KW10+iR3tafngzbagib8WWbyImnbu5AwJAYEQLtGSBaS9g9
 ZbNd5kC72lRgNonGCUEtN2Qe1P2WZi5dt1FTCzuXYGRsvKsHTOdzKGT1
X-Gm-Gg: ASbGncuwbjdgxaEekw21/B/GcP/Mhif4KNv0W+GKk7YyVF08Diu3WzwCb3beliKTpYI
 vmYxAehYwht8gckfEpaK3owsC8hoT83z1PGwb4V7RrA7JyJ5j0jFq7u+HdM3XPra+yWRndOwVs1
 70r/ZWjTwoxYk0z3MuxecRz0JOvZ48QsroyRaYrWqrx2TOwaef2uprc77dOA1sKKHjptm0Gi9Ra
 ZLXLxS1Egxo9BlCXZjLqzc/FH2m7fEhnoKpfSd6V4bvJbPYK0yo/rIv1VbtzfwOP1cTcM3sMU8T
 sSB1v7FbSvpC8uH1gFngvx9VVT9vFkpBv+jd1KeY2a2CZKaob34ZCfWHrnLHhrR1Oac2RFIRuK9
 s6wFz+31fVyah5BJudKBMWl0NuIlnyXt0xQS571UwzIXitMxM2AthgT0=
X-Google-Smtp-Source: AGHT+IFrNoq8xL3ZHlvsw6ON2Yc9FPU5zGsMHl3vFaEK54U+eSoLlYiwIMQrMyFsTHfTQU+mlJpg+Q==
X-Received: by 2002:a17:907:2d8c:b0:b45:592f:74ac with SMTP id
 a640c23a62f3a-b50ac1c644bmr2203947966b.38.1760366111282; 
 Mon, 13 Oct 2025 07:35:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/15] drm/sched: use inline locks for the drm-sched-fence
Date: Mon, 13 Oct 2025 15:48:36 +0200
Message-ID: <20251013143502.1655-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 11 +++++------
 include/drm/gpu_scheduler.h             |  4 ----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 9391d6f0dc01..7a94e03341cb 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -156,19 +156,19 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
 	struct dma_fence *parent;
 	unsigned long flags;
 
-	spin_lock_irqsave(&fence->lock, flags);
+	dma_fence_lock(f, flags);
 
 	/* If we already have an earlier deadline, keep it: */
 	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
 	    ktime_before(fence->deadline, deadline)) {
-		spin_unlock_irqrestore(&fence->lock, flags);
+		dma_fence_unlock(f, flags);
 		return;
 	}
 
 	fence->deadline = deadline;
 	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
 
-	spin_unlock_irqrestore(&fence->lock, flags);
+	dma_fence_unlock(f, flags);
 
 	/*
 	 * smp_load_aquire() to ensure that if we are racing another
@@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 
 	fence->owner = owner;
 	fence->drm_client_id = drm_client_id;
-	spin_lock_init(&fence->lock);
 
 	return fence;
 }
@@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
-		       &fence->lock, entity->fence_context, seq);
+		       NULL, entity->fence_context, seq);
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
-		       &fence->lock, entity->fence_context + 1, seq);
+		       NULL, entity->fence_context + 1, seq);
 }
 
 module_init(drm_sched_fence_slab_init);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e62a7214e052..4478164ea174 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -297,10 +297,6 @@ struct drm_sched_fence {
          * belongs to.
          */
 	struct drm_gpu_scheduler	*sched;
-        /**
-         * @lock: the lock used by the scheduled and the finished fences.
-         */
-	spinlock_t			lock;
         /**
          * @owner: job owner for debugging
          */
-- 
2.43.0


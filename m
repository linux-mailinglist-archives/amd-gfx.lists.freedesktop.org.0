Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1115AD29E
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Sep 2022 14:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD3710E382;
	Mon,  5 Sep 2022 12:32:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B0A10E364
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Sep 2022 12:32:45 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r4so11163820edi.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 05 Sep 2022 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=P8amNQm9/41M+qRqeZPKryOIaYVkHhP+lUnw2p3sxEM=;
 b=YfPaaPkBq+EfXcQVFaE8TrCvr8Au2b+AIARopdtL6OcdZigkSTvZV6XMGxCVcQQhdc
 JlKktP8BSvR2JzWZlD00vLXY8KixXJpwG6RU0zaKfuOAmYKe5dj4ylm1U9btfTdcRA4R
 yFnmgM4z+DC78JB9rTA0bH0tg89LToP3HbJPm4G3ir8mWQD2ismp+E9E/XlU6kSNhFUm
 HPafPnzl2vUUOjoBrnxntCBH3JHzC3HCBXigLFNCduDP/2FxowNJ1aOanc4lGAGn1c5j
 SJ3aemEh2vFktm4UJD3fqdbJ2VzFF90iFCf+XUCHe6jFLZpHtETyxvIojxwga3I2anDE
 20mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P8amNQm9/41M+qRqeZPKryOIaYVkHhP+lUnw2p3sxEM=;
 b=EY8z/uK/oYd4t8lSwA9zO6YjhrHfhOH0IdX765b5PN8JvrI1ubU3Ju7fcBudImiWIL
 Jk91TlK2UaCcA0Mg7jF54LqQaqMC0ZwBCi/pU34T9lVBAskRE30Ssp5n22jb1revwGOD
 dFQbZ7k701zkAbUvjiwyVK7bQpUaxIlQ8t8gr/8tAJRHOqhnYQbc2dFg9yO00Pt+9S4y
 YuTXxAD3ETrX8VOpY2YPOz49PhZ3pfEtstSX+Dl8a05vprc2VCq1U237KTThlVJT5t8O
 Qu/fbuk33wREaUmFG/6rKIyvP96012EykvX7WAlk01zim4Qy+N04RvMIA9+/aT0qHKK7
 VGog==
X-Gm-Message-State: ACgBeo14tgWFGaeny9XHkAqg9e6jEacma88o3UGMvTzu1cIvRU6GDihn
 TjwA8r8x7mVnVeKlWsKVJPJ5uVdnhCHUmQ==
X-Google-Smtp-Source: AA6agR6NvK+AP1Q9paNnU0CRl9Uuqa5jc47LhzNL+iQyVQ/dMoj3Qqw9f+KkqWjgx3rjDAOSPWYiSw==
X-Received: by 2002:a05:6402:2791:b0:448:763c:666f with SMTP id
 b17-20020a056402279100b00448763c666fmr30885185ede.36.1662381163380; 
 Mon, 05 Sep 2022 05:32:43 -0700 (PDT)
Received: from able.fritz.box (p4fc20f4e.dip0.t-ipconnect.de. [79.194.15.78])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a17090632c600b0073c0b87ba34sm4970341ejk.198.2022.09.05.05.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 05:32:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	Ruijing.Dong@amd.com
Subject: [PATCH 10/12] drm/amdgpu: add gang submit backend v2
Date: Mon,  5 Sep 2022 14:32:30 +0200
Message-Id: <20220905123232.2809-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905123232.2809-1-christian.koenig@amd.com>
References: <20220905123232.2809-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Allows submitting jobs as gang which needs to run on multiple
engines at the same time.

Basic idea is that we have a global gang submit fence representing when the
gang leader is finally pushed to run on the hardware last.

Jobs submitted as gang are never re-submitted in case of a GPU reset since this
won't work and will just deadlock the hardware immediately again.

v2: fix logic inversion, improve documentation, fix rcu

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 35 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 28 +++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h    |  3 ++
 4 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 79bb6fd83094..ae9371b172e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -885,6 +885,7 @@ struct amdgpu_device {
 	u64				fence_context;
 	unsigned			num_rings;
 	struct amdgpu_ring		*rings[AMDGPU_MAX_RINGS];
+	struct dma_fence __rcu		*gang_submit;
 	bool				ib_pool_ready;
 	struct amdgpu_sa_manager	ib_pools[AMDGPU_IB_POOL_MAX];
 	struct amdgpu_sched		gpu_sched[AMDGPU_HW_IP_NUM][AMDGPU_RING_PRIO_MAX];
@@ -1294,6 +1295,8 @@ u32 amdgpu_device_pcie_port_rreg(struct amdgpu_device *adev,
 				u32 reg);
 void amdgpu_device_pcie_port_wreg(struct amdgpu_device *adev,
 				u32 reg, u32 v);
+struct dma_fence *amdgpu_device_switch_gang(struct amdgpu_device *adev,
+					    struct dma_fence *gang);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index d7eb23b8d692..172095122cc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3501,6 +3501,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->gmc.gart_size = 512 * 1024 * 1024;
 	adev->accel_working = false;
 	adev->num_rings = 0;
+	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
 	adev->mman.buffer_funcs = NULL;
 	adev->mman.buffer_funcs_ring = NULL;
 	adev->vm_manager.vm_pte_funcs = NULL;
@@ -3983,6 +3984,7 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	release_firmware(adev->firmware.gpu_info_fw);
 	adev->firmware.gpu_info_fw = NULL;
 	adev->accel_working = false;
+	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
 
 	amdgpu_reset_fini(adev);
 
@@ -5916,3 +5918,36 @@ void amdgpu_device_pcie_port_wreg(struct amdgpu_device *adev,
 	(void)RREG32(data);
 	spin_unlock_irqrestore(&adev->pcie_idx_lock, flags);
 }
+
+/**
+ * amdgpu_device_switch_gang - switch to a new gang
+ * @adev: amdgpu_device pointer
+ * @gang: the gang to switch to
+ *
+ * Try to switch to a new gang.
+ * Returns: NULL if we switched to the new gang or a reference to the current
+ * gang leader.
+ */
+struct dma_fence *amdgpu_device_switch_gang(struct amdgpu_device *adev,
+					    struct dma_fence *gang)
+{
+	struct dma_fence *old = NULL;
+
+	do {
+		dma_fence_put(old);
+		rcu_read_lock();
+		old = dma_fence_get_rcu_safe(&adev->gang_submit);
+		rcu_read_unlock();
+
+		if (old == gang)
+			break;
+
+		if (!dma_fence_is_signaled(old))
+			return old;
+
+	} while (cmpxchg((struct dma_fence __force **)&adev->gang_submit,
+			 old, gang) != old);
+
+	dma_fence_put(old);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 37dc5ee4153d..6f6708caf0e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -173,11 +173,29 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 	dma_fence_put(&job->hw_fence);
 }
 
+void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
+				struct amdgpu_job *leader)
+{
+	struct dma_fence *fence = &leader->base.s_fence->scheduled;
+
+	WARN_ON(job->gang_submit);
+
+	/*
+	 * Don't add a reference when we are the gang leader to avoid circle
+	 * dependency.
+	 */
+	if (job != leader)
+		dma_fence_get(fence);
+	job->gang_submit = fence;
+}
+
 void amdgpu_job_free(struct amdgpu_job *job)
 {
 	amdgpu_job_free_resources(job);
 	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->sched_sync);
+	if (job->gang_submit != &job->base.s_fence->scheduled)
+		dma_fence_put(job->gang_submit);
 
 	dma_fence_put(&job->hw_fence);
 }
@@ -244,12 +262,16 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
 		fence = amdgpu_sync_get_fence(&job->sync);
 	}
 
+	if (!fence && job->gang_submit)
+		fence = amdgpu_device_switch_gang(ring->adev, job->gang_submit);
+
 	return fence;
 }
 
 static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(sched_job->sched);
+	struct amdgpu_device *adev = ring->adev;
 	struct dma_fence *fence = NULL, *finished;
 	struct amdgpu_job *job;
 	int r = 0;
@@ -261,8 +283,10 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 
 	trace_amdgpu_sched_run_job(job);
 
-	if (job->vram_lost_counter != atomic_read(&ring->adev->vram_lost_counter))
-		dma_fence_set_error(finished, -ECANCELED);/* skip IB as well if VRAM lost */
+	/* Skip job if VRAM is lost and never resubmit gangs */
+	if (job->vram_lost_counter != atomic_read(&adev->vram_lost_counter) ||
+	    (job->job_run_counter && job->gang_submit))
+		dma_fence_set_error(finished, -ECANCELED);
 
 	if (finished->error < 0) {
 		DRM_INFO("Skip scheduling IBs!\n");
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 866d35bbe073..ab7b150e5d50 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -50,6 +50,7 @@ struct amdgpu_job {
 	struct amdgpu_sync	sync;
 	struct amdgpu_sync	sched_sync;
 	struct dma_fence	hw_fence;
+	struct dma_fence	*gang_submit;
 	uint32_t		preamble_status;
 	uint32_t                preemption_status;
 	bool                    vm_needs_flush;
@@ -84,6 +85,8 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
 void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
 void amdgpu_job_free_resources(struct amdgpu_job *job);
+void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
+				struct amdgpu_job *leader);
 void amdgpu_job_free(struct amdgpu_job *job);
 int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 		      void *owner, struct dma_fence **f);
-- 
2.25.1


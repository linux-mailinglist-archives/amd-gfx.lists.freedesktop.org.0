Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3315FEACD
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Oct 2022 10:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C36A10EA9C;
	Fri, 14 Oct 2022 08:46:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0073D10E176;
 Fri, 14 Oct 2022 08:46:51 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u21so5893521edi.9;
 Fri, 14 Oct 2022 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDuSVAlvuTCAKFGbPyqRyyPcXaOWPLpnGDJ74BqErGQ=;
 b=dL/MeLa2zEw6+4Dc5v3WZxEOLDDi45lgkw+DOA1NP9SAkopWWaNe9aGCYsGhp4aynJ
 lUt5hfTrgVuK8vWgBQKYUuRkDcqBzOG992aH5bPQEhWBKqg5TPL6Cg549MZfxoIgjjlm
 TTLX5niVqoplUDN3oPQMGIQFRdF52U8EDSAMD+KlTQQXpebIoNkyHPrlrF5Ck77NBUSu
 Y9DwtCrRgBmfXaBPUyf3r6lqEKdMLRYsJOM3bLDS7CtN9eZHQOBarKCJ/4ph21sw/S4q
 eIY3UqpY+sOUlaRQjdHsyIvcGOv2/6b/wiUnEDyAKjDNwq37/wct60bJyZMbLwWlD0rp
 MS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDuSVAlvuTCAKFGbPyqRyyPcXaOWPLpnGDJ74BqErGQ=;
 b=L4vBq+gqRn4hvRtQlRxVjGLkbK2yta+ppYG8eyq4xYhD0wuNat32MjSy/qVgkerYvW
 8hhUlVf3YLRYK/dnZO9LDdsMukUJwUuDZPvCGG5ABmuj+NoJbjYPr/Bmh+WQK2MKW2PZ
 FrtLxAa/d4MZmbGLCma+BeqlLi1E+O4ykEOlr3LA/9n60yd+eGFKXXEaTDTyKt/wYin9
 FyU9/3g5XEVS+D8WdgzrpTJEeaC30zyA3ojpf7MbZt0Z2YnDtoMnqDr3kmXo1Nesp245
 XEWtO0fYRtXOS6ZbrwwIuehqzLFXh66aTbO8/BElAylnNBq/bL2gRdFF65iGlmk+a3da
 fBqA==
X-Gm-Message-State: ACrzQf28LPRTI5NtjPPi4HgkGubDFNk4aOhPftxHaZoSyfxruqX127u0
 rYEbnvBI8kR+RtWuG9FFS58=
X-Google-Smtp-Source: AMsMyM4YLm206HLlrolyzPp7wcR11T5VXsZB8kZR1OzIVeJfM3MzS/LMJTW5OgZ4pm87kO00srISIQ==
X-Received: by 2002:a05:6402:2489:b0:454:11de:7698 with SMTP id
 q9-20020a056402248900b0045411de7698mr3430658eda.214.1665737211458; 
 Fri, 14 Oct 2022 01:46:51 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 06/13] drm/amdgpu: cleanup scheduler job initialization
Date: Fri, 14 Oct 2022 10:46:34 +0200
Message-Id: <20221014084641.128280-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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

Init the DRM scheduler base class while allocating the job.

This makes the whole handling much more cleaner.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     | 44 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 14 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  7 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 56 +++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  9 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 13 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     | 22 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 61 +++++++++++----------
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c      | 12 ++--
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  8 +--
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       | 14 +++--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    | 17 ++----
 14 files changed, 137 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 0561812aa0a4..046d466b4ee4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -673,7 +673,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
 		goto err;
 	}
 
-	ret = amdgpu_job_alloc(adev, 1, &job, NULL);
+	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1bbd39b3b0fc..aa6f6c428dbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -291,12 +291,8 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		return -EINVAL;
 
 	for (i = 0; i < p->gang_size; ++i) {
-		ret = amdgpu_job_alloc(p->adev, num_ibs[i], &p->jobs[i], vm);
-		if (ret)
-			goto free_all_kdata;
-
-		ret = drm_sched_job_init(&p->jobs[i]->base, p->entities[i],
-					 &fpriv->vm);
+		ret = amdgpu_job_alloc(p->adev, vm, p->entities[i], vm,
+				       num_ibs[i], &p->jobs[i]);
 		if (ret)
 			goto free_all_kdata;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index e187dc0ab898..5c69461ab3e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -88,8 +88,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
-int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
-		     struct amdgpu_job **job, struct amdgpu_vm *vm)
+int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		     struct drm_sched_entity *entity, void *owner,
+		     unsigned num_ibs, struct amdgpu_job **job)
 {
 	if (num_ibs == 0)
 		return -EINVAL;
@@ -110,23 +111,30 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
 	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
 	(*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
 
-	return 0;
+	if (!entity)
+		return 0;
+
+	return drm_sched_job_init(&(*job)->base, entity, owner);
 }
 
-int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
-		enum amdgpu_ib_pool_type pool_type,
-		struct amdgpu_job **job)
+int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
+			     struct drm_sched_entity *entity, void *owner,
+			     unsigned size, enum amdgpu_ib_pool_type pool_type,
+			     struct amdgpu_job **job)
 {
 	int r;
 
-	r = amdgpu_job_alloc(adev, 1, job, NULL);
+	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
 	if (r)
 		return r;
 
 	(*job)->num_ibs = 1;
 	r = amdgpu_ib_get(adev, NULL, size, pool_type, &(*job)->ibs[0]);
-	if (r)
+	if (r) {
+		if (entity)
+			drm_sched_job_cleanup(&(*job)->base);
 		kfree(*job);
+	}
 
 	return r;
 }
@@ -190,6 +198,9 @@ void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
 
 void amdgpu_job_free(struct amdgpu_job *job)
 {
+	if (job->base.entity)
+		drm_sched_job_cleanup(&job->base);
+
 	amdgpu_job_free_resources(job);
 	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->sched_sync);
@@ -202,25 +213,16 @@ void amdgpu_job_free(struct amdgpu_job *job)
 		dma_fence_put(&job->hw_fence);
 }
 
-int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
-		      void *owner, struct dma_fence **f)
+struct dma_fence *amdgpu_job_submit(struct amdgpu_job *job)
 {
-	int r;
-
-	if (!f)
-		return -EINVAL;
-
-	r = drm_sched_job_init(&job->base, entity, owner);
-	if (r)
-		return r;
+	struct dma_fence *f;
 
 	drm_sched_job_arm(&job->base);
-
-	*f = dma_fence_get(&job->base.s_fence->finished);
+	f = dma_fence_get(&job->base.s_fence->finished);
 	amdgpu_job_free_resources(job);
 	drm_sched_entity_push_job(&job->base);
 
-	return 0;
+	return f;
 }
 
 int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index ab7b150e5d50..f099210c386a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -78,18 +78,20 @@ static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
 	return to_amdgpu_ring(job->base.entity->rq->sched);
 }
 
-int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
-		     struct amdgpu_job **job, struct amdgpu_vm *vm);
-int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
-		enum amdgpu_ib_pool_type pool, struct amdgpu_job **job);
+int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		     struct drm_sched_entity *entity, void *owner,
+		     unsigned num_ibs, struct amdgpu_job **job);
+int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
+			     struct drm_sched_entity *entity, void *owner,
+			     unsigned size, enum amdgpu_ib_pool_type pool_type,
+			     struct amdgpu_job **job);
 void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
 			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
 void amdgpu_job_free_resources(struct amdgpu_job *job);
 void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
 				struct amdgpu_job *leader);
 void amdgpu_job_free(struct amdgpu_job *job);
-int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
-		      void *owner, struct dma_fence **f);
+struct dma_fence *amdgpu_job_submit(struct amdgpu_job *job);
 int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
 			     struct dma_fence **fence);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 518eb0e40d32..de182bfcf85f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -150,14 +150,15 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
 	const unsigned ib_size_dw = 16;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
+				     AMDGPU_IB_POOL_DIRECT, &job);
 	if (r)
 		return r;
 
 	ib = &job->ibs[0];
 
-	ib->ptr[0] = PACKETJ(adev->jpeg.internal.jpeg_pitch, 0, 0, PACKETJ_TYPE0);
+	ib->ptr[0] = PACKETJ(adev->jpeg.internal.jpeg_pitch, 0, 0,
+			     PACKETJ_TYPE0);
 	ib->ptr[1] = 0xDEADBEEF;
 	for (i = 2; i < 16; i += 2) {
 		ib->ptr[i] = PACKETJ(0, 0, 0, PACKETJ_TYPE6);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f898e870d157..30edb05e0d25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -189,7 +189,6 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	struct amdgpu_device *adev = ring->adev;
 	unsigned offset, num_pages, num_dw, num_bytes;
 	uint64_t src_addr, dst_addr;
-	struct dma_fence *fence;
 	struct amdgpu_job *job;
 	void *cpu_addr;
 	uint64_t flags;
@@ -229,7 +228,9 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED, &job);
 	if (r)
 		return r;
@@ -269,18 +270,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 		}
 	}
 
-	r = amdgpu_job_submit(job, &adev->mman.entity,
-			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
-	if (r)
-		goto error_free;
-
-	dma_fence_put(fence);
-
-	return r;
-
-error_free:
-	amdgpu_job_free(job);
-	return r;
+	dma_fence_put(amdgpu_job_submit(job));
+	return 0;
 }
 
 /**
@@ -1432,7 +1423,8 @@ static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,
 }
 
 static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
-					unsigned long offset, void *buf, int len, int write)
+					unsigned long offset, void *buf,
+					int len, int write)
 {
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
@@ -1456,26 +1448,27 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 		memcpy(adev->mman.sdma_access_ptr, buf, len);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4, AMDGPU_IB_POOL_DELAYED, &job);
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
+				     &job);
 	if (r)
 		goto out;
 
 	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
-	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) + src_mm.start;
+	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
+		src_mm.start;
 	dst_addr = amdgpu_bo_gpu_offset(adev->mman.sdma_access_bo);
 	if (write)
 		swap(src_addr, dst_addr);
 
-	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr, PAGE_SIZE, false);
+	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
+				PAGE_SIZE, false);
 
 	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
-	r = amdgpu_job_submit(job, &adev->mman.entity, AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
-	if (r) {
-		amdgpu_job_free(job);
-		goto out;
-	}
+	fence = amdgpu_job_submit(job);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
 		r = -ETIMEDOUT;
@@ -1974,7 +1967,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 		AMDGPU_IB_POOL_DELAYED;
 	int r;
 
-	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4, pool, job);
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     num_dw * 4, pool, job);
 	if (r)
 		return r;
 
@@ -2033,8 +2028,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	if (direct_submit)
 		r = amdgpu_job_submit_direct(job, ring, fence);
 	else
-		r = amdgpu_job_submit(job, &adev->mman.entity,
-				      AMDGPU_FENCE_OWNER_UNDEFINED, fence);
+		*fence = amdgpu_job_submit(job);
 	if (r)
 		goto error_free;
 
@@ -2079,16 +2073,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
-	r = amdgpu_job_submit(job, &adev->mman.entity,
-			      AMDGPU_FENCE_OWNER_UNDEFINED, fence);
-	if (r)
-		goto error_free;
-
+	*fence = amdgpu_job_submit(job);
 	return 0;
-
-error_free:
-	amdgpu_job_free(job);
-	return r;
 }
 
 int amdgpu_fill_buffer(struct amdgpu_bo *bo,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6eac649499d3..8baddf79635b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1132,7 +1132,9 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 	unsigned offset_idx = 0;
 	unsigned offset[3] = { UVD_BASE_SI, 0, 0 };
 
-	r = amdgpu_job_alloc_with_ib(adev, 64, direct ? AMDGPU_IB_POOL_DIRECT :
+	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     64, direct ? AMDGPU_IB_POOL_DIRECT :
 				     AMDGPU_IB_POOL_DELAYED, &job);
 	if (r)
 		return r;
@@ -1181,10 +1183,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 		if (r)
 			goto err_free;
 
-		r = amdgpu_job_submit(job, &adev->uvd.entity,
-				      AMDGPU_FENCE_OWNER_UNDEFINED, &f);
-		if (r)
-			goto err_free;
+		f = amdgpu_job_submit(job);
 	}
 
 	amdgpu_bo_reserve(bo, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 02cb3a12dd76..b239e874f2d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -450,8 +450,10 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 	uint64_t addr;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-				     AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
+				     &job);
 	if (r)
 		return r;
 
@@ -538,7 +540,9 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 	struct dma_fence *f = NULL;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
+	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     ib_size_dw * 4,
 				     direct ? AMDGPU_IB_POOL_DIRECT :
 				     AMDGPU_IB_POOL_DELAYED, &job);
 	if (r)
@@ -570,8 +574,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 	if (direct)
 		r = amdgpu_job_submit_direct(job, ring, &f);
 	else
-		r = amdgpu_job_submit(job, &ring->adev->vce.entity,
-				      AMDGPU_FENCE_OWNER_UNDEFINED, &f);
+		f = amdgpu_job_submit(job);
 	if (r)
 		goto err;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 0b52af415b28..965b7755cb88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -600,15 +600,16 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
 				   struct amdgpu_ib *ib_msg,
 				   struct dma_fence **fence)
 {
+	uint64_t addr = AMDGPU_GPU_PAGE_ALIGN(ib_msg->gpu_addr);
 	struct amdgpu_device *adev = ring->adev;
 	struct dma_fence *f = NULL;
 	struct amdgpu_job *job;
 	struct amdgpu_ib *ib;
-	uint64_t addr = AMDGPU_GPU_PAGE_ALIGN(ib_msg->gpu_addr);
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(adev, 64,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
+				     64, AMDGPU_IB_POOL_DIRECT,
+				     &job);
 	if (r)
 		goto err;
 
@@ -787,8 +788,9 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
 	if (sq)
 		ib_size_dw += 8;
 
-	r = amdgpu_job_alloc_with_ib(adev, ib_size_dw * 4,
-				AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
+				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
+				     &job);
 	if (r)
 		goto err;
 
@@ -916,8 +918,9 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
 	if (sq)
 		ib_size_dw += 8;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
+				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
+				     &job);
 	if (r)
 		return r;
 
@@ -982,8 +985,9 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
 	if (sq)
 		ib_size_dw += 8;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
+				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
+				     &job);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 69e105fa41f6..126364882d09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -47,6 +47,32 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
 	return r;
 }
 
+/* Allocate a new job for @count PTE updates */
+static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
+				    unsigned int count)
+{
+	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
+		: AMDGPU_IB_POOL_DELAYED;
+	struct drm_sched_entity *entity = p->immediate ? &p->vm->immediate
+		: &p->vm->delayed;
+	unsigned int ndw;
+	int r;
+
+	/* estimate how many dw we need */
+	ndw = AMDGPU_VM_SDMA_MIN_NUM_DW;
+	if (p->pages_addr)
+		ndw += count * 2;
+	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
+
+	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
+				     ndw * 4, pool, &p->job);
+	if (r)
+		return r;
+
+	p->num_dw_left = ndw;
+	return 0;
+}
+
 /**
  * amdgpu_vm_sdma_prepare - prepare SDMA command submission
  *
@@ -61,17 +87,12 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 				  struct dma_resv *resv,
 				  enum amdgpu_sync_mode sync_mode)
 {
-	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
-		: AMDGPU_IB_POOL_DELAYED;
-	unsigned int ndw = AMDGPU_VM_SDMA_MIN_NUM_DW;
 	int r;
 
-	r = amdgpu_job_alloc_with_ib(p->adev, ndw * 4, pool, &p->job);
+	r = amdgpu_vm_sdma_alloc_job(p, 0);
 	if (r)
 		return r;
 
-	p->num_dw_left = ndw;
-
 	if (!resv)
 		return 0;
 
@@ -91,20 +112,16 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 				 struct dma_fence **fence)
 {
 	struct amdgpu_ib *ib = p->job->ibs;
-	struct drm_sched_entity *entity;
 	struct amdgpu_ring *ring;
 	struct dma_fence *f;
-	int r;
 
-	entity = p->immediate ? &p->vm->immediate : &p->vm->delayed;
-	ring = container_of(entity->rq->sched, struct amdgpu_ring, sched);
+	ring = container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
+			    sched);
 
 	WARN_ON(ib->length_dw == 0);
 	amdgpu_ring_pad_ib(ring, ib);
 	WARN_ON(ib->length_dw > p->num_dw_left);
-	r = amdgpu_job_submit(p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
-	if (r)
-		goto error;
+	f = amdgpu_job_submit(p->job);
 
 	if (p->unlocked) {
 		struct dma_fence *tmp = dma_fence_get(f);
@@ -127,10 +144,6 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 	}
 	dma_fence_put(f);
 	return 0;
-
-error:
-	amdgpu_job_free(p->job);
-	return r;
 }
 
 /**
@@ -210,8 +223,6 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 				 uint64_t flags)
 {
 	struct amdgpu_bo *bo = &vmbo->bo;
-	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
-		: AMDGPU_IB_POOL_DELAYED;
 	struct dma_resv_iter cursor;
 	unsigned int i, ndw, nptes;
 	struct dma_fence *fence;
@@ -238,19 +249,9 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 			if (r)
 				return r;
 
-			/* estimate how many dw we need */
-			ndw = 32;
-			if (p->pages_addr)
-				ndw += count * 2;
-			ndw = max(ndw, AMDGPU_VM_SDMA_MIN_NUM_DW);
-			ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
-
-			r = amdgpu_job_alloc_with_ib(p->adev, ndw * 4, pool,
-						     &p->job);
+			r = amdgpu_vm_sdma_alloc_job(p, count);
 			if (r)
 				return r;
-
-			p->num_dw_left = ndw;
 		}
 
 		if (!p->pages_addr) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index f513e2c2e964..657e53708248 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -371,7 +371,9 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself.
 	 */
-	r = amdgpu_job_alloc_with_ib(adev, 16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
+	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
 				     &job);
 	if (r)
 		goto error_alloc;
@@ -380,10 +382,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->vm_needs_flush = true;
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	r = amdgpu_job_submit(job, &adev->mman.entity,
-			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
-	if (r)
-		goto error_submit;
+	fence = amdgpu_job_submit(job);
 
 	mutex_unlock(&adev->mman.gtt_window_lock);
 
@@ -392,9 +391,6 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 
 	return;
 
-error_submit:
-	amdgpu_job_free(job);
-
 error_alloc:
 	mutex_unlock(&adev->mman.gtt_window_lock);
 	DRM_ERROR("Error flushing GPU TLB using the SDMA (%d)!\n", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 375c440957dc..5fe872f4bea7 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -216,8 +216,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
 	uint64_t addr;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
+				     AMDGPU_IB_POOL_DIRECT, &job);
 	if (r)
 		return r;
 
@@ -280,8 +280,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
 	uint64_t addr;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
+				     AMDGPU_IB_POOL_DIRECT, &job);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
index e668b3baa8c6..1c0210de8455 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -213,7 +213,8 @@ static int uvd_v7_0_enc_ring_test_ring(struct amdgpu_ring *ring)
  *
  * Open up a stream for HW test
  */
-static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
+static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring,
+				       uint32_t handle,
 				       struct amdgpu_bo *bo,
 				       struct dma_fence **fence)
 {
@@ -224,8 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
 	uint64_t addr;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
+				     AMDGPU_IB_POOL_DIRECT, &job);
 	if (r)
 		return r;
 
@@ -276,7 +277,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
  *
  * Close up a stream for HW test or if userspace failed to do so
  */
-static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
+static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
+					uint32_t handle,
 					struct amdgpu_bo *bo,
 					struct dma_fence **fence)
 {
@@ -287,8 +289,8 @@ static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handl
 	uint64_t addr;
 	int i, r;
 
-	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
-					AMDGPU_IB_POOL_DIRECT, &job);
+	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
+				     AMDGPU_IB_POOL_DIRECT, &job);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dd56d7678876..cd2909d0ad26 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -65,8 +65,11 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, uint64_t npages,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8;
 
-	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
-				     AMDGPU_IB_POOL_DELAYED, &job);
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
+				     AMDGPU_FENCE_OWNER_UNDEFINED,
+				     num_dw * 4 + num_bytes,
+				     AMDGPU_IB_POOL_DELAYED,
+				     &job);
 	if (r)
 		return r;
 
@@ -89,18 +92,10 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, uint64_t npages,
 	cpu_addr = &job->ibs[0].ptr[num_dw];
 
 	amdgpu_gart_map(adev, 0, npages, addr, pte_flags, cpu_addr);
-	r = amdgpu_job_submit(job, &adev->mman.entity,
-			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
-	if (r)
-		goto error_free;
-
+	fence = amdgpu_job_submit(job);
 	dma_fence_put(fence);
 
 	return r;
-
-error_free:
-	amdgpu_job_free(job);
-	return r;
 }
 
 /**
-- 
2.25.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074D16AC00
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Feb 2020 17:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B926E5BB;
	Mon, 24 Feb 2020 16:46:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66236E5B4
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Feb 2020 16:46:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s144so290253wme.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Feb 2020 08:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9KMJlNaf94iiVh8lmR2dMd5QLlvvc9zpJE58yF3ggg=;
 b=kYPcYQb1Zoudpt/fE7MeFmz10+GC/UTo3tWMw8mtYVvsQcMcpBnbQIxL1CjUZk11yJ
 4Id8+6xmpugaUNzKipA60WrlbmRg4xBdQ6rQWgF5wCl34bqgt7rNJrRr8W7a8OMRN6cJ
 5YElPa+S5iYJ/uC/NcTzPCZCG+EtzDJ+bJE2Rr/qBbeB1A6ZhTC8WahsZD0kI5TuPQ2r
 H/4DNDuVb0UJvuZCNua9ieS8b8z4v7YH2fPrZlwjf9M86DR8X2G1Q/r0Ds57WwmvQsdL
 bptqNasT5cOwliCTtEwPQ/Z08BMrt7NParrDIy4Fi19v0MStaoRjNmroI5vI8oMzmVMv
 UE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K9KMJlNaf94iiVh8lmR2dMd5QLlvvc9zpJE58yF3ggg=;
 b=FBP+kfJElRPTwkfZq2oyThFfeKHFFFA1U7DB4jVixOaQ5a64kM0cd1U+7pZXHPGHtl
 JUoexGFHkKmijeLqT6fXE6iS9BOkLClVhoo/pYTdzJrZWRhPA2mcMVDc8TXGPXIXnViZ
 hjihQEvyJ05DPr2WK6AEqESCYhwpGDQO99XHQeGupfSMibryVLxNE31Fg5VEAlYym9y4
 7D+gkX9WwOQaJ9Tgnb+cDRCZo877avoR8aRi5OA212ZyXPT/QOJtnzba8w2vFKEP2nUy
 1HEG87xIYihl2FSRp/trWq+DjltWRZGbJ89qoEmkNYpyxfANPSK7/x15d0TyJFtxqKc6
 bKPg==
X-Gm-Message-State: APjAAAUU1KfVoGyWT4vP3fLX9wm93i1gIcE0Dgyvr5nfRz/PVxlaA+qC
 16SAtbigH4+U2EBa2cMTYHnTLwvNbfFVwA==
X-Google-Smtp-Source: APXvYqwvqptfvUNYFCcr3LFnKOd77TyWiUzWS0hr7LP9/uJH/pW7MrUz5x1vNFxuGRg0CZsVsJr01Q==
X-Received: by 2002:a7b:cd8c:: with SMTP id y12mr21967003wmj.23.1582562805959; 
 Mon, 24 Feb 2020 08:46:45 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F431E007B60635B4CE4ED05.dip0.t-ipconnect.de.
 [2003:c5:8f43:1e00:7b60:635b:4ce4:ed05])
 by smtp.gmail.com with ESMTPSA id f207sm19807227wme.9.2020.02.24.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 08:46:45 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 1/1] drm/amdgpu: wait for sched to become ready on job
 submit
Date: Mon, 24 Feb 2020 17:49:39 +0100
Message-Id: <20200224164939.4598-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
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
Cc: alexander.deucher@amd.com, nirmoy.das@amd.com, christian.koenig@amd.com,
 Monk.Liu@amd.com, Dennis.Li@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On reset, amdgpu can set a drm sched's ready status to false temporarily. drm job
init will fail if all of the drm scheds are not ready for a HW IP. This patch tries to make
kernel's internal drm job submit handle, amdgpu_job_submit() a bit more fault tolerant.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     | 35 +++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |  5 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c      |  2 +-
 7 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index d42be880a236..0745df80112f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -139,7 +139,38 @@ void amdgpu_job_free(struct amdgpu_job *job)
 	kfree(job);
 }
 
-int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
+static int amdgpu_job_try_init(struct amdgpu_device *adev,
+			       struct drm_sched_job *base,
+			       struct drm_sched_entity *entity,
+			       void *owner)
+{
+	int r, i;
+
+	r = drm_sched_job_init(base, entity, owner);
+	if (r == -ENOENT) {
+		/* retry till we come out of reset phase */
+		while (!mutex_trylock(&adev->lock_reset))
+			msleep(10);
+		/* retry for a second for the sched to get ready*/
+		for (i = 0; i < 100; i++) {
+			msleep(10);
+			r = drm_sched_job_init(base, entity, owner);
+			if (r == -ENOENT)
+				continue;
+		}
+
+		mutex_unlock(&adev->lock_reset);
+		/* If after all these we failed to initialize a job
+		 * it means the IP is unrecoverable */
+		if (r == -ENOENT)
+			return -ENODEV;
+	}
+
+	return r;
+}
+
+int amdgpu_job_submit(struct amdgpu_device *adev,struct amdgpu_job *job,
+		      struct drm_sched_entity *entity,
 		      void *owner, struct dma_fence **f)
 {
 	enum drm_sched_priority priority;
@@ -149,7 +180,7 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 	if (!f)
 		return -EINVAL;
 
-	r = drm_sched_job_init(&job->base, entity, owner);
+	r = amdgpu_job_try_init(adev, &job->base, entity, owner);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 2e2110dddb76..fed87e96cacc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -70,8 +70,9 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
 
 void amdgpu_job_free_resources(struct amdgpu_job *job);
 void amdgpu_job_free(struct amdgpu_job *job);
-int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
-		      void *owner, struct dma_fence **f);
+int amdgpu_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job,
+		      struct drm_sched_entity *entity, void *owner,
+		      struct dma_fence **f);
 int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
 			     struct dma_fence **fence);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 660867cf2597..adfde07eb75f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2066,7 +2066,7 @@ static int amdgpu_map_buffer(struct ttm_buffer_object *bo,
 	if (r)
 		goto error_free;
 
-	r = amdgpu_job_submit(job, &adev->mman.entity,
+	r = amdgpu_job_submit(adev, job, &adev->mman.entity,
 			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
 	if (r)
 		goto error_free;
@@ -2137,7 +2137,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 	if (direct_submit)
 		r = amdgpu_job_submit_direct(job, ring, fence);
 	else
-		r = amdgpu_job_submit(job, &adev->mman.entity,
+		r = amdgpu_job_submit(adev, job, &adev->mman.entity,
 				      AMDGPU_FENCE_OWNER_UNDEFINED, fence);
 	if (r)
 		goto error_free;
@@ -2231,7 +2231,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
-	r = amdgpu_job_submit(job, &adev->mman.entity,
+	r = amdgpu_job_submit(adev, job, &adev->mman.entity,
 			      AMDGPU_FENCE_OWNER_UNDEFINED, fence);
 	if (r)
 		goto error_free;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 5fd32ad1c575..8ff97b24914e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1104,7 +1104,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 		if (r)
 			goto err_free;
 
-		r = amdgpu_job_submit(job, &adev->uvd.entity,
+		r = amdgpu_job_submit(adev, job, &adev->uvd.entity,
 				      AMDGPU_FENCE_OWNER_UNDEFINED, &f);
 		if (r)
 			goto err_free;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 59ddba137946..e721d3367783 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -554,7 +554,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 	if (direct)
 		r = amdgpu_job_submit_direct(job, ring, &f);
 	else
-		r = amdgpu_job_submit(job, &ring->adev->vce.entity,
+		r = amdgpu_job_submit(ring->adev, job, &ring->adev->vce.entity,
 				      AMDGPU_FENCE_OWNER_UNDEFINED, &f);
 	if (r)
 		goto err;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 4cc7881f438c..b536962c22d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -100,7 +100,7 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
 	WARN_ON(ib->length_dw == 0);
 	amdgpu_ring_pad_ib(ring, ib);
 	WARN_ON(ib->length_dw > p->num_dw_left);
-	r = amdgpu_job_submit(p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
+	r = amdgpu_job_submit(p->adev, p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
 	if (r)
 		goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 9775eca6fe43..a4aaa2a1f878 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -377,7 +377,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->vm_needs_flush = true;
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
-	r = amdgpu_job_submit(job, &adev->mman.entity,
+	r = amdgpu_job_submit(adev, job, &adev->mman.entity,
 			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
 	if (r)
 		goto error_submit;
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952E1757A6
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 10:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECE76E23B;
	Mon,  2 Mar 2020 09:49:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09E56E23B
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 09:49:25 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so11706193wrt.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 01:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L7+LsgcknLXNmABnZZ6lhzy3SW0CscXekb1MkONLDFw=;
 b=PCC2UMtd2k+hPhMDrMF5dQ8yEXo38aX1fPZCIqCNrov3AOAh2+HBommW/wZRrswXYj
 l8YBqr7qP0WfflcNAsmEjf/cR/g6NMrqQY9uxUf8xMro+ZbeLpWamtn168eRozkLk4z1
 uyW3o7flpwA8JPl8mxzNQ8KoBeoWjlc7ojZilmJwu8t9F+9EyuaESpW8J//zafuVLqQx
 PDu/7cPF0ghZXCq1R5ofxUgIp4KtFBanSNY+TGNj/kpMHJQJGVyWHfsHfQkxwyLoNQMT
 oDRc1S6S4Rtj2fpNcqpfWnyugbpuFPlpPst6bjDAs5xaxhYR3SeylztFFvUQH1janjpn
 DwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L7+LsgcknLXNmABnZZ6lhzy3SW0CscXekb1MkONLDFw=;
 b=Hk5tgex4fnQMEHswYzx9AUyTjqaqrfnFnc4PYmNNwIfrOXVhNUNYM33KzTqXTPsM+H
 8JbuOYfIixP7vnzN96GXc1AkefsPzOA6HcgBpj/veu2T1vwoHySwd5wylFEYUiHIuU3g
 qckwvqZXTAMXCkvDQy3WF3BVVvdem3wUbxkryPMiauc3LZQ4Lp9JHf5lzUCA3wqFFzTW
 zNI2hN9JhhORaCIqa9gDNUuf4d9G5kuWYZVkGQqJ9Fnisa0ry4QKpErofasMZ8UUbLZZ
 jVXdmF/o4mF2Wp8RWtMD8d68WAUjlAQtqKRDuHw3y+C5m7yBTG+h/dqEC4ZTTH5bndB8
 KM5Q==
X-Gm-Message-State: APjAAAXXHLUurIH3MdcI3Zah3qLwKb3niKPENRY2GIdrn8vnqOebU6n1
 4Osf/JL2TyDenPZRiZnG+zL4fOxN5to=
X-Google-Smtp-Source: APXvYqz/qRrx42/FYMSusJiZYAMG9GVVxd8Y6NTsk1hmS1287NVZQcRKSwP6ZnwW/I1DRNBaz3kI1w==
X-Received: by 2002:a5d:6a8d:: with SMTP id s13mr22714157wru.55.1583142563870; 
 Mon, 02 Mar 2020 01:49:23 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F21FC009E54A4A7C1B66128.dip0.t-ipconnect.de.
 [2003:c5:8f21:fc00:9e54:a4a7:c1b6:6128])
 by smtp.gmail.com with ESMTPSA id b13sm511230wme.2.2020.03.02.01.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 01:49:23 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 4/4] drm/amdgpu: remove unused functions
Date: Mon,  2 Mar 2020 10:52:34 +0100
Message-Id: <20200302095234.3638-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302095234.3638-1-nirmoy.das@amd.com>
References: <20200302095234.3638-1-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

amdgpu statically set priority for compute queues
at initialization so remove all the functions
responsible changing compute queue priority dynamically

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c |  70 ----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |   7 --
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c    |  99 ----------------------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c    | 100 -----------------------
 4 files changed, 276 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index ca6b52054b4b..a7e1d0425ed0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -150,76 +150,6 @@ void amdgpu_ring_undo(struct amdgpu_ring *ring)
 		ring->funcs->end_use(ring);
 }

-/**
- * amdgpu_ring_priority_put - restore a ring's priority
- *
- * @ring: amdgpu_ring structure holding the information
- * @priority: target priority
- *
- * Release a request for executing at @priority
- */
-void amdgpu_ring_priority_put(struct amdgpu_ring *ring,
-			      enum drm_sched_priority priority)
-{
-	int i;
-
-	if (!ring->funcs->set_priority)
-		return;
-
-	if (atomic_dec_return(&ring->num_jobs[priority]) > 0)
-		return;
-
-	/* no need to restore if the job is already at the lowest priority */
-	if (priority == DRM_SCHED_PRIORITY_NORMAL)
-		return;
-
-	mutex_lock(&ring->priority_mutex);
-	/* something higher prio is executing, no need to decay */
-	if (ring->priority > priority)
-		goto out_unlock;
-
-	/* decay priority to the next level with a job available */
-	for (i = priority; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		if (i == DRM_SCHED_PRIORITY_NORMAL
-				|| atomic_read(&ring->num_jobs[i])) {
-			ring->priority = i;
-			ring->funcs->set_priority(ring, i);
-			break;
-		}
-	}
-
-out_unlock:
-	mutex_unlock(&ring->priority_mutex);
-}
-
-/**
- * amdgpu_ring_priority_get - change the ring's priority
- *
- * @ring: amdgpu_ring structure holding the information
- * @priority: target priority
- *
- * Request a ring's priority to be raised to @priority (refcounted).
- */
-void amdgpu_ring_priority_get(struct amdgpu_ring *ring,
-			      enum drm_sched_priority priority)
-{
-	if (!ring->funcs->set_priority)
-		return;
-
-	if (atomic_inc_return(&ring->num_jobs[priority]) <= 0)
-		return;
-
-	mutex_lock(&ring->priority_mutex);
-	if (priority <= ring->priority)
-		goto out_unlock;
-
-	ring->priority = priority;
-	ring->funcs->set_priority(ring, priority);
-
-out_unlock:
-	mutex_unlock(&ring->priority_mutex);
-}
-
 /**
  * amdgpu_ring_init - init driver ring struct.
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 34fcd467f18d..87ec35b68bfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -167,9 +167,6 @@ struct amdgpu_ring_funcs {
 					uint32_t reg0, uint32_t reg1,
 					uint32_t ref, uint32_t mask);
 	void (*emit_tmz)(struct amdgpu_ring *ring, bool start);
-	/* priority functions */
-	void (*set_priority) (struct amdgpu_ring *ring,
-			      enum drm_sched_priority priority);
 	/* Try to soft recover the ring to make the fence signal */
 	void (*soft_recovery)(struct amdgpu_ring *ring, unsigned vmid);
 	int (*preempt_ib)(struct amdgpu_ring *ring);
@@ -259,10 +256,6 @@ void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count);
 void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib);
 void amdgpu_ring_commit(struct amdgpu_ring *ring);
 void amdgpu_ring_undo(struct amdgpu_ring *ring);
-void amdgpu_ring_priority_get(struct amdgpu_ring *ring,
-			      enum drm_sched_priority priority);
-void amdgpu_ring_priority_put(struct amdgpu_ring *ring,
-			      enum drm_sched_priority priority);
 int amdgpu_ring_init(struct amdgpu_device *adev, struct amdgpu_ring *ring,
 		     unsigned ring_size, struct amdgpu_irq_src *irq_src,
 		     unsigned irq_type);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index a222de088af7..88646623bc34 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -6275,104 +6275,6 @@ static void gfx_v8_0_ring_set_wptr_compute(struct amdgpu_ring *ring)
 	WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr));
 }

-static void gfx_v8_0_ring_set_pipe_percent(struct amdgpu_ring *ring,
-					   bool acquire)
-{
-	struct amdgpu_device *adev = ring->adev;
-	int pipe_num, tmp, reg;
-	int pipe_percent = acquire ? SPI_WCL_PIPE_PERCENT_GFX__VALUE_MASK : 0x1;
-
-	pipe_num = ring->me * adev->gfx.mec.num_pipe_per_mec + ring->pipe;
-
-	/* first me only has 2 entries, GFX and HP3D */
-	if (ring->me > 0)
-		pipe_num -= 2;
-
-	reg = mmSPI_WCL_PIPE_PERCENT_GFX + pipe_num;
-	tmp = RREG32(reg);
-	tmp = REG_SET_FIELD(tmp, SPI_WCL_PIPE_PERCENT_GFX, VALUE, pipe_percent);
-	WREG32(reg, tmp);
-}
-
-static void gfx_v8_0_pipe_reserve_resources(struct amdgpu_device *adev,
-					    struct amdgpu_ring *ring,
-					    bool acquire)
-{
-	int i, pipe;
-	bool reserve;
-	struct amdgpu_ring *iring;
-
-	mutex_lock(&adev->gfx.pipe_reserve_mutex);
-	pipe = amdgpu_gfx_mec_queue_to_bit(adev, ring->me, ring->pipe, 0);
-	if (acquire)
-		set_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-	else
-		clear_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-
-	if (!bitmap_weight(adev->gfx.pipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES)) {
-		/* Clear all reservations - everyone reacquires all resources */
-		for (i = 0; i < adev->gfx.num_gfx_rings; ++i)
-			gfx_v8_0_ring_set_pipe_percent(&adev->gfx.gfx_ring[i],
-						       true);
-
-		for (i = 0; i < adev->gfx.num_compute_rings; ++i)
-			gfx_v8_0_ring_set_pipe_percent(&adev->gfx.compute_ring[i],
-						       true);
-	} else {
-		/* Lower all pipes without a current reservation */
-		for (i = 0; i < adev->gfx.num_gfx_rings; ++i) {
-			iring = &adev->gfx.gfx_ring[i];
-			pipe = amdgpu_gfx_mec_queue_to_bit(adev,
-							   iring->me,
-							   iring->pipe,
-							   0);
-			reserve = test_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-			gfx_v8_0_ring_set_pipe_percent(iring, reserve);
-		}
-
-		for (i = 0; i < adev->gfx.num_compute_rings; ++i) {
-			iring = &adev->gfx.compute_ring[i];
-			pipe = amdgpu_gfx_mec_queue_to_bit(adev,
-							   iring->me,
-							   iring->pipe,
-							   0);
-			reserve = test_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-			gfx_v8_0_ring_set_pipe_percent(iring, reserve);
-		}
-	}
-
-	mutex_unlock(&adev->gfx.pipe_reserve_mutex);
-}
-
-static void gfx_v8_0_hqd_set_priority(struct amdgpu_device *adev,
-				      struct amdgpu_ring *ring,
-				      bool acquire)
-{
-	uint32_t pipe_priority = acquire ? 0x2 : 0x0;
-	uint32_t queue_priority = acquire ? 0xf : 0x0;
-
-	mutex_lock(&adev->srbm_mutex);
-	vi_srbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
-
-	WREG32(mmCP_HQD_PIPE_PRIORITY, pipe_priority);
-	WREG32(mmCP_HQD_QUEUE_PRIORITY, queue_priority);
-
-	vi_srbm_select(adev, 0, 0, 0, 0);
-	mutex_unlock(&adev->srbm_mutex);
-}
-static void gfx_v8_0_ring_set_priority_compute(struct amdgpu_ring *ring,
-					       enum drm_sched_priority priority)
-{
-	struct amdgpu_device *adev = ring->adev;
-	bool acquire = priority == DRM_SCHED_PRIORITY_HIGH_HW;
-
-	if (ring->funcs->type != AMDGPU_RING_TYPE_COMPUTE)
-		return;
-
-	gfx_v8_0_hqd_set_priority(adev, ring, acquire);
-	gfx_v8_0_pipe_reserve_resources(adev, ring, acquire);
-}
-
 static void gfx_v8_0_ring_emit_fence_compute(struct amdgpu_ring *ring,
 					     u64 addr, u64 seq,
 					     unsigned flags)
@@ -7005,7 +6907,6 @@ static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_compute = {
 	.test_ib = gfx_v8_0_ring_test_ib,
 	.insert_nop = amdgpu_ring_insert_nop,
 	.pad_ib = amdgpu_ring_generic_pad_ib,
-	.set_priority = gfx_v8_0_ring_set_priority_compute,
 	.emit_wreg = gfx_v8_0_ring_emit_wreg,
 };

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index e1a4e7796dd6..b03d82815dfe 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -5130,105 +5130,6 @@ static u64 gfx_v9_0_ring_get_wptr_compute(struct amdgpu_ring *ring)
 	return wptr;
 }

-static void gfx_v9_0_ring_set_pipe_percent(struct amdgpu_ring *ring,
-					   bool acquire)
-{
-	struct amdgpu_device *adev = ring->adev;
-	int pipe_num, tmp, reg;
-	int pipe_percent = acquire ? SPI_WCL_PIPE_PERCENT_GFX__VALUE_MASK : 0x1;
-
-	pipe_num = ring->me * adev->gfx.mec.num_pipe_per_mec + ring->pipe;
-
-	/* first me only has 2 entries, GFX and HP3D */
-	if (ring->me > 0)
-		pipe_num -= 2;
-
-	reg = SOC15_REG_OFFSET(GC, 0, mmSPI_WCL_PIPE_PERCENT_GFX) + pipe_num;
-	tmp = RREG32(reg);
-	tmp = REG_SET_FIELD(tmp, SPI_WCL_PIPE_PERCENT_GFX, VALUE, pipe_percent);
-	WREG32(reg, tmp);
-}
-
-static void gfx_v9_0_pipe_reserve_resources(struct amdgpu_device *adev,
-					    struct amdgpu_ring *ring,
-					    bool acquire)
-{
-	int i, pipe;
-	bool reserve;
-	struct amdgpu_ring *iring;
-
-	mutex_lock(&adev->gfx.pipe_reserve_mutex);
-	pipe = amdgpu_gfx_mec_queue_to_bit(adev, ring->me, ring->pipe, 0);
-	if (acquire)
-		set_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-	else
-		clear_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-
-	if (!bitmap_weight(adev->gfx.pipe_reserve_bitmap, AMDGPU_MAX_COMPUTE_QUEUES)) {
-		/* Clear all reservations - everyone reacquires all resources */
-		for (i = 0; i < adev->gfx.num_gfx_rings; ++i)
-			gfx_v9_0_ring_set_pipe_percent(&adev->gfx.gfx_ring[i],
-						       true);
-
-		for (i = 0; i < adev->gfx.num_compute_rings; ++i)
-			gfx_v9_0_ring_set_pipe_percent(&adev->gfx.compute_ring[i],
-						       true);
-	} else {
-		/* Lower all pipes without a current reservation */
-		for (i = 0; i < adev->gfx.num_gfx_rings; ++i) {
-			iring = &adev->gfx.gfx_ring[i];
-			pipe = amdgpu_gfx_mec_queue_to_bit(adev,
-							   iring->me,
-							   iring->pipe,
-							   0);
-			reserve = test_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-			gfx_v9_0_ring_set_pipe_percent(iring, reserve);
-		}
-
-		for (i = 0; i < adev->gfx.num_compute_rings; ++i) {
-			iring = &adev->gfx.compute_ring[i];
-			pipe = amdgpu_gfx_mec_queue_to_bit(adev,
-							   iring->me,
-							   iring->pipe,
-							   0);
-			reserve = test_bit(pipe, adev->gfx.pipe_reserve_bitmap);
-			gfx_v9_0_ring_set_pipe_percent(iring, reserve);
-		}
-	}
-
-	mutex_unlock(&adev->gfx.pipe_reserve_mutex);
-}
-
-static void gfx_v9_0_hqd_set_priority(struct amdgpu_device *adev,
-				      struct amdgpu_ring *ring,
-				      bool acquire)
-{
-	uint32_t pipe_priority = acquire ? 0x2 : 0x0;
-	uint32_t queue_priority = acquire ? 0xf : 0x0;
-
-	mutex_lock(&adev->srbm_mutex);
-	soc15_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
-
-	WREG32_SOC15_RLC(GC, 0, mmCP_HQD_PIPE_PRIORITY, pipe_priority);
-	WREG32_SOC15_RLC(GC, 0, mmCP_HQD_QUEUE_PRIORITY, queue_priority);
-
-	soc15_grbm_select(adev, 0, 0, 0, 0);
-	mutex_unlock(&adev->srbm_mutex);
-}
-
-static void gfx_v9_0_ring_set_priority_compute(struct amdgpu_ring *ring,
-					       enum drm_sched_priority priority)
-{
-	struct amdgpu_device *adev = ring->adev;
-	bool acquire = priority == DRM_SCHED_PRIORITY_HIGH_HW;
-
-	if (ring->funcs->type != AMDGPU_RING_TYPE_COMPUTE)
-		return;
-
-	gfx_v9_0_hqd_set_priority(adev, ring, acquire);
-	gfx_v9_0_pipe_reserve_resources(adev, ring, acquire);
-}
-
 static void gfx_v9_0_ring_set_wptr_compute(struct amdgpu_ring *ring)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -6599,7 +6500,6 @@ static const struct amdgpu_ring_funcs gfx_v9_0_ring_funcs_compute = {
 	.test_ib = gfx_v9_0_ring_test_ib,
 	.insert_nop = amdgpu_ring_insert_nop,
 	.pad_ib = amdgpu_ring_generic_pad_ib,
-	.set_priority = gfx_v9_0_ring_set_priority_compute,
 	.emit_wreg = gfx_v9_0_ring_emit_wreg,
 	.emit_reg_wait = gfx_v9_0_ring_emit_reg_wait,
 	.emit_reg_write_reg_wait = gfx_v9_0_ring_emit_reg_write_reg_wait,
--
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

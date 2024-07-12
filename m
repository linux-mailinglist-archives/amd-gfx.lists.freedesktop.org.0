Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568B92FDAE
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2024 17:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A62510ED3B;
	Fri, 12 Jul 2024 15:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EIdbCLnz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9A310ED3B
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2024 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WfRBlEEQPao9DRobjZ97f6xOIfQ3yr7dMBIVNc/kRgM=; b=EIdbCLnzAjBD6rpXO6solw6U00
 1JHyF0izZdz3LFpEUIN+oLGJhyycl0oqa6btp0k+eYWmltYyjONbsjuceFn1ryahOhyKXnYT8Z6N+
 xNiD5/Xnt78z/bFYlKhWvaAkL9RftOCjifn2wkRRtBVkHZ+fr1luuko0BPVszqEwV6VN+p7+++rt1
 RqQPd/iiMThHHG6Pf8E3D3ix5QbC7cQplKgCGOAYo1SbSpc/SUuohOO5N6zNCdrrBYYLTVedxYbHd
 VX9GInUL6DGiBEdVBCens+vy0E1tTNediquy2q9NZjV+Z47PO0WbJxwGZG547PdifZ7MhaMC1dL9r
 7me3qFtA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sSIKv-00ENT8-Ia; Fri, 12 Jul 2024 17:37:29 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH v3 2/3] drm/amdgpu: More efficient ring padding
Date: Fri, 12 Jul 2024 16:37:27 +0100
Message-ID: <20240712153727.45408-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240712152855.45284-3-tursulin@igalia.com>
References: <20240712152855.45284-3-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Having noticed that typically 200+ nops per submission are written into
the ring, using a rather verbose one-nop-at-a-time-plus-ring-buffer-
arithmetic as done in amdgpu_ring_write(), the obvious idea was to
improve it by filling those nops in blocks.

This patch therefore adds the amdgpu_ring_fill() helper which can do the
business in at most two memset32 calls.

The performance gains are not that amazing for normal workloads though.
For instance a game which results in two submissions per frame, each pads
with 222 nops, submission worker thread profile changes from:

+   90.78%     0.67%  kworker/u32:3-e  [kernel.kallsyms]  [k] process_one_work
+   48.92%     0.12%  kworker/u32:3-e  [kernel.kallsyms]  [k] commit_tail
+   41.18%     1.73%  kworker/u32:3-e  [kernel.kallsyms]  [k] amdgpu_dm_atomic_commit_tail
-   30.31%     0.67%  kworker/u32:3-e  [kernel.kallsyms]  [k] drm_sched_run_job_work
   - 29.63% drm_sched_run_job_work
      + 8.55% dma_fence_add_callback
      - 7.50% amdgpu_job_run
         - 7.43% amdgpu_ib_schedule
            - 2.46% amdgpu_ring_commit
                 1.44% amdgpu_ring_insert_nop

To:

+   88.28%     0.21%  kworker/u32:4-e  [kernel.kallsyms]  [k] process_one_work
+   45.22%     0.12%  kworker/u32:4-e  [kernel.kallsyms]  [k] commit_tail
+   37.93%     1.86%  kworker/u32:4-e  [kernel.kallsyms]  [k] amdgpu_dm_atomic_commit_tail
-   29.28%     1.11%  kworker/u32:4-e  [kernel.kallsyms]  [k] drm_sched_run_job_work
   - 28.16% drm_sched_run_job_work
      + 9.93% dma_fence_add_callback
      - 6.84% amdgpu_job_run
         - 6.27% amdgpu_ib_schedule
              1.23% gfx_v10_0_ring_emit_fence
              1.20% amdgpu_ring_commit

But if we run a more "spammy" workload, which does several orders of
magnitude more submissions second we go from:

+   79.38%     1.66%  kworker/u32:1+e  [kernel.kallsyms]  [k] process_one_work
-   63.13%     6.66%  kworker/u32:1+e  [kernel.kallsyms]  [k] drm_sched_run_job_work
   - 56.47% drm_sched_run_job_work
      - 25.67% amdgpu_job_run
         - 24.40% amdgpu_ib_schedule
            - 15.29% amdgpu_ring_commit
                 12.06% amdgpu_ring_insert_nop

To:

+   77.83%     2.07%  kworker/u32:2-e  [kernel.kallsyms]  [k] process_one_work
-   61.03%     7.75%  kworker/u32:2-e  [kernel.kallsyms]  [k] drm_sched_run_job_work
   - 53.27% drm_sched_run_job_work
      - 17.31% amdgpu_job_run
         - 16.34% amdgpu_ib_schedule
            - 7.17% amdgpu_ring_commit
                 1.67% amdgpu_ring_insert_nop

Which is a noticeable improvement in time spent by amdgpu_ring_commit
inserting nops.

v2:
 * Use a much more sensible "fill" approach.

v3:
 * Forgot to git add.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 16 ++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 27 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c  | 13 ++++++------
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 15 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 16 ++++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 16 ++++++++------
 12 files changed, 125 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 1a1963318424..36947250f3f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -108,9 +108,12 @@ int amdgpu_ring_alloc(struct amdgpu_ring *ring, unsigned int ndw)
  */
 void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
-	int i;
+	if (count == 0)
+		return;
 
-	for (i = 0; i < count; i++)
+	if (count > 1)
+		amdgpu_ring_fill(ring, ring->funcs->nop, count);
+	else
 		amdgpu_ring_write(ring, ring->funcs->nop);
 }
 
@@ -124,8 +127,13 @@ void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
  */
 void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 {
-	while (ib->length_dw & ring->funcs->align_mask)
-		ib->ptr[ib->length_dw++] = ring->funcs->nop;
+	u32 count = ib->length_dw & ring->funcs->align_mask;
+
+	if (count) {
+		memset32(&ib->ptr[ib->length_dw], ring->funcs->nop, count);
+
+		ib->length_dw += count;
+	}
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 582053f1cd56..2264d7502eb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -412,6 +412,33 @@ static inline void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
 	ring->count_dw -= count_dw;
 }
 
+static inline void amdgpu_ring_fill(struct amdgpu_ring *ring, u32 v,
+				    unsigned int count_dw)
+{
+	unsigned int occupied, chunk1, chunk2;
+
+	if (!count_dw)
+		return;
+
+	if (unlikely(ring->count_dw < count_dw))
+		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
+
+	occupied = ring->wptr & ring->buf_mask;
+	chunk1 = ring->buf_mask + 1 - occupied;
+	chunk1 = (chunk1 >= count_dw) ? count_dw : chunk1;
+	chunk2 = count_dw - chunk1;
+
+	if (chunk1)
+		memset32((u32 *)&ring->ring[occupied], v, chunk1);
+
+	if (chunk2)
+		memset32((u32 *)&ring->ring[0], v, chunk2);
+
+	ring->wptr += count_dw;
+	ring->wptr &= ring->ptr_mask;
+	ring->count_dw -= count_dw;
+}
+
 /**
  * amdgpu_ring_patch_cond_exec - patch dw count of conditional execute
  * @ring: amdgpu_ring structure
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 5acd20ff5979..61a9766b02e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -452,14 +452,13 @@ static int vpe_resume(void *handle)
 
 static void vpe_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (i == 0)
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				VPE_CMD_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	amdgpu_ring_write(ring, nop | VPE_CMD_NOP_HEADER_COUNT(--count));
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 static uint64_t vpe_get_csa_mc_addr(struct amdgpu_ring *ring, uint32_t vmid)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 952737de9411..1b7742728bf0 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -198,14 +198,15 @@ static void cik_sdma_ring_set_wptr(struct amdgpu_ring *ring)
 static void cik_sdma_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-					  SDMA_NOP_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring, nop | SDMA_NOP_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 725392522267..4061f7a4d055 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -222,14 +222,16 @@ static void sdma_v2_4_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v2_4_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index aa637541da58..f655b5c32bd8 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -398,14 +398,16 @@ static void sdma_v3_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v3_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 772604feb6ac..bc8bb6b184af 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -737,14 +737,16 @@ static void sdma_v4_0_page_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v4_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 01644a869738..3425cf35c0d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -290,14 +290,16 @@ static void sdma_v4_4_2_page_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v4_4_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index b7d33d78bce0..fa6591e9769a 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -387,14 +387,16 @@ static void sdma_v5_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v5_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index cc9e961f0078..f95e2831447e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -194,14 +194,16 @@ static void sdma_v5_2_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v5_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index dab4c2db8c9d..aabe4dc37876 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -181,14 +181,16 @@ static void sdma_v6_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v6_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 96514fd77e35..37ca21dc9678 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -206,14 +206,16 @@ static void sdma_v7_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v7_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (!count)
+		return;
+
+	if (sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	amdgpu_ring_fill(ring, nop, count);
 }
 
 /**
-- 
2.44.0


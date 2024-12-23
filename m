Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864E9FB2FE
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Dec 2024 17:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB27110E583;
	Mon, 23 Dec 2024 16:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sPcpHink";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2199610E57D
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Dec 2024 16:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=//VwxetG5yPQ0FmJ+qnz3qHDAmtshbIYxl8hhTc1NXk=; b=sPcpHink7UXOF4LVm8knB+8Yv0
 P++U8WZVtoiS126f3MbwRErMaoiHEoOOGXxVl7BGotRqDzCeuJzTT7Duw2/q9a4Cx4vQkC1jZnGFH
 2dE1uTekPKqWuP5whI8bmQ3Xr80AeUzdJq6ygHHDiDv4QKuTI5mCk5RogL5TKPnHd7wxozMcCNurJ
 xp5S12ScfQp34AmidiimJqI/oc9QoLuFVHWDKfodgFQYYbMC4fUjTm6wgddMLTYVJlwY0HyVMHnt3
 VG0XRldGfhUxoQzYPyXpMqkAfZVLKl2DxkTPy2J3GXe86J/EPY+h6OKylRCSUdo2Etlt77K/reopW
 vAtWorUw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tPlSp-006ttA-V6; Mon, 23 Dec 2024 17:39:28 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: Use efficient ring padding with more rings
Date: Mon, 23 Dec 2024 16:39:12 +0000
Message-ID: <20241223163913.38767-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241223163913.38767-1-tursulin@igalia.com>
References: <20241223163913.38767-1-tursulin@igalia.com>
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

We can easily expand the approach of writing nops in blocks using memset32
(via the respective helper) to more rings.

We do that by trivially factoring out a new amdgpu_ring_fill() helper out
of amdgpu_ring_insert_nop() and call it from SDMA and VPE vfuncs.

The amount of padding with those rings is a bit less than GFX but it is
still a bit nicer to use the same approach across the board.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 29 +++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c  | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 15 ++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 16 +++++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 16 +++++++------
 12 files changed, 111 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index a27e32f48f99..c3a68eae1c9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -99,16 +99,16 @@ int amdgpu_ring_alloc(struct amdgpu_ring *ring, unsigned int ndw)
 	return 0;
 }
 
-/** amdgpu_ring_insert_nop - insert NOP packets
+/**
+ * amdgpu_ring_fill - insert dwords into a ring
  *
  * @ring: amdgpu_ring structure holding ring information
- * @count: the number of NOP packets to insert
- *
- * This is the generic insert_nop function for rings except SDMA
+ * @val: dword value to insert
+ * @count: the number of dwords to insert
  */
-void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
+void amdgpu_ring_fill(struct amdgpu_ring *ring, u32 val, u32 count)
 {
-	uint32_t occupied, chunk1, chunk2;
+	u32 occupied, chunk1, chunk2;
 
 	occupied = ring->wptr & ring->buf_mask;
 	chunk1 = ring->buf_mask + 1 - occupied;
@@ -116,16 +116,29 @@ void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 	chunk2 = count - chunk1;
 
 	if (chunk1)
-		memset32(&ring->ring[occupied], ring->funcs->nop, chunk1);
+		memset32(&ring->ring[occupied], val, chunk1);
 
 	if (chunk2)
-		memset32(ring->ring, ring->funcs->nop, chunk2);
+		memset32(ring->ring, val, chunk2);
 
 	ring->wptr += count;
 	ring->wptr &= ring->ptr_mask;
 	ring->count_dw -= count;
 }
 
+/**
+ * amdgpu_ring_insert_nop - insert NOP packets
+ *
+ * @ring: amdgpu_ring structure holding ring information
+ * @count: the number of NOP packets to insert
+ *
+ * This is the generic insert_nop function for rings except SDMA
+ */
+void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
+{
+	amdgpu_ring_fill(ring, ring->funcs->nop, count);
+}
+
 /**
  * amdgpu_ring_generic_pad_ib - pad IB with NOP packets
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index dee5a1b4e572..4a8134b682f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -346,6 +346,7 @@ void amdgpu_ring_ib_on_emit_cntl(struct amdgpu_ring *ring);
 void amdgpu_ring_ib_on_emit_ce(struct amdgpu_ring *ring);
 void amdgpu_ring_ib_on_emit_de(struct amdgpu_ring *ring);
 
+void amdgpu_ring_fill(struct amdgpu_ring *ring, u32 val, u32 count);
 void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count);
 void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib);
 void amdgpu_ring_commit(struct amdgpu_ring *ring);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
index 121ee17b522b..92a444922b2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
@@ -459,14 +459,16 @@ static int vpe_resume(struct amdgpu_ip_block *ip_block)
 
 static void vpe_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (i == 0)
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				VPE_CMD_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count) {
+		count--;
+		amdgpu_ring_write(ring, nop | VPE_CMD_NOP_HEADER_COUNT(count));
+		if (count > 1)
+			amdgpu_ring_fill(ring, nop, count);
+		else if (count)
+			amdgpu_ring_write(ring, nop);
+	}
 }
 
 static uint64_t vpe_get_csa_mc_addr(struct amdgpu_ring *ring, uint32_t vmid)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index d9bd8f3f17e2..275494e6cc8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -200,14 +200,15 @@ static void cik_sdma_ring_set_wptr(struct amdgpu_ring *ring)
 static void cik_sdma_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-					  SDMA_NOP_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring, nop | SDMA_NOP_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 135c5099bfb8..7e1498a60f01 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -224,14 +224,16 @@ static void sdma_v2_4_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v2_4_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index c611328671ed..eae8310407eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -400,14 +400,16 @@ static void sdma_v3_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v3_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index b48d9c0b2e1c..68120baafbbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -784,14 +784,16 @@ static void sdma_v4_0_page_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v4_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 56507ae919b0..076a07400db6 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -344,14 +344,16 @@ static void sdma_v4_4_2_page_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v4_4_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index b764550834a0..97079c63e462 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -436,14 +436,16 @@ static void sdma_v5_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v5_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index b1818e87889a..8913f3ed4e2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -253,14 +253,16 @@ static void sdma_v5_2_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v5_2_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index 1a023b45f0be..f2b04adfebdc 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -238,14 +238,16 @@ static void sdma_v6_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v6_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 9c17df2cf37b..ce2af42a9289 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -270,14 +270,16 @@ static void sdma_v7_0_ring_set_wptr(struct amdgpu_ring *ring)
 static void sdma_v7_0_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
-	int i;
+	const u32 nop = ring->funcs->nop;
 
-	for (i = 0; i < count; i++)
-		if (sdma && sdma->burst_nop && (i == 0))
-			amdgpu_ring_write(ring, ring->funcs->nop |
-				SDMA_PKT_NOP_HEADER_COUNT(count - 1));
-		else
-			amdgpu_ring_write(ring, ring->funcs->nop);
+	if (count && sdma && sdma->burst_nop)
+		amdgpu_ring_write(ring,
+				  nop | SDMA_PKT_NOP_HEADER_COUNT(--count));
+
+	if (count > 1)
+		amdgpu_ring_fill(ring, nop, count);
+	else if (count)
+		amdgpu_ring_write(ring, nop);
 }
 
 /**
-- 
2.47.1


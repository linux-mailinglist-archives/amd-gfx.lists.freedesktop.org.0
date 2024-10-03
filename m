Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A098EB92
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2024 10:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C72210E36E;
	Thu,  3 Oct 2024 08:29:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF1110E01F
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2024 08:28:59 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4938SsJn236515; Thu, 3 Oct 2024 13:58:54 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4938SswZ236514;
 Thu, 3 Oct 2024 13:58:54 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 1/2] drm/amdgpu: move error log from ring write to commit
Date: Thu,  3 Oct 2024 13:58:52 +0530
Message-Id: <20241003082853.236479-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Move the error message from ring write as an optimization
to avoid printing that message on every write instead
print once during commit if it exceeds write the allocated
size i.e ring->count_dw.

Also we do not want to log the error message in between a
ring write and complete the write as its mostly not harmful
as it will overwrite stale data only as GPU read from ring
is faster than CPU write to ring.

This reduces the size of amdgpu.ko module by around
600 Kb as write is very often used function and hence
the print.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 690976665cf6..05b3480ecec7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -141,6 +141,9 @@ void amdgpu_ring_commit(struct amdgpu_ring *ring)
 {
 	uint32_t count;
 
+	if (ring->count_dw <= 0)
+		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
+
 	/* We pad to match fetch size */
 	count = ring->funcs->align_mask + 1 -
 		(ring->wptr & ring->funcs->align_mask);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index f93f51002201..af8824e8da49 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -377,8 +377,6 @@ static inline void amdgpu_ring_clear_ring(struct amdgpu_ring *ring)
 
 static inline void amdgpu_ring_write(struct amdgpu_ring *ring, uint32_t v)
 {
-	if (ring->count_dw <= 0)
-		DRM_ERROR("amdgpu: writing more dwords to the ring than expected!\n");
 	ring->ring[ring->wptr++ & ring->buf_mask] = v;
 	ring->wptr &= ring->ptr_mask;
 	ring->count_dw--;
-- 
2.34.1


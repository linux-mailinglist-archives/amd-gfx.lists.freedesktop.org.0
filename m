Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99768995038
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2024 15:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0110E534;
	Tue,  8 Oct 2024 13:35:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2606B10E52E
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2024 13:35:02 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 498DYwQ8710113; Tue, 8 Oct 2024 19:04:58 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 498DYwqd710112;
 Tue, 8 Oct 2024 19:04:58 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 2/6] drm/amdgpu: optimize fn gfx_v9_4_3_ring_insert_nop
Date: Tue,  8 Oct 2024 19:04:52 +0530
Message-Id: <20241008133456.710083-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008133456.710083-1-sunil.khatri@amd.com>
References: <20241008133456.710083-1-sunil.khatri@amd.com>
MIME-Version: 1.0
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

Optimize gfx_v9_4_3_ring_insert_nop() to call
optimized version of amdgpu_ring_insert_nop
instead of calling amdgpu_ring_write for number
of nop times.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 7d425d2e7ab0..ff867077c7be 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -4569,8 +4569,6 @@ static void gfx_v9_4_3_enable_watchdog_timer(struct amdgpu_device *adev)
 
 static void gfx_v9_4_3_ring_insert_nop(struct amdgpu_ring *ring, uint32_t num_nop)
 {
-	int i;
-
 	/* Header itself is a NOP packet */
 	if (num_nop == 1) {
 		amdgpu_ring_write(ring, ring->funcs->nop);
@@ -4581,8 +4579,7 @@ static void gfx_v9_4_3_ring_insert_nop(struct amdgpu_ring *ring, uint32_t num_no
 	amdgpu_ring_write(ring, PACKET3(PACKET3_NOP, min(num_nop - 2, 0x3ffe)));
 
 	/* Header is at index 0, followed by num_nops - 1 NOP packet's */
-	for (i = 1; i < num_nop; i++)
-		amdgpu_ring_write(ring, ring->funcs->nop);
+	amdgpu_ring_insert_nop(ring, num_nop - 1);
 }
 
 static void gfx_v9_4_3_ip_print(struct amdgpu_ip_block *ip_block, struct drm_printer *p)
-- 
2.34.1


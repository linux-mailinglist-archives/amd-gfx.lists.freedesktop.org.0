Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131F094CFD6
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2024 14:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306BB10E8DC;
	Fri,  9 Aug 2024 12:12:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C00810E8E0
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2024 12:12:08 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 479CC3Sm4051516; Fri, 9 Aug 2024 17:42:03 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 479CC3of4051515;
 Fri, 9 Aug 2024 17:42:03 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 4/4] drm/amdgpu: add cp queue registers print for gfx9_4_3
Date: Fri,  9 Aug 2024 17:41:57 +0530
Message-Id: <20240809121157.4051442-5-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809121157.4051442-1-sunil.khatri@amd.com>
References: <20240809121157.4051442-1-sunil.khatri@amd.com>
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

Add gfx9_4_3 print support of CP queue registers
for all queues to be used by devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 42 +++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index c8df4899d42d..5cc5a68e9b49 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -4362,8 +4362,9 @@ static void gfx_v9_4_3_ring_insert_nop(struct amdgpu_ring *ring, uint32_t num_no
 static void gfx_v9_4_3_ip_print(void *handle, struct drm_printer *p)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	uint32_t i;
-	uint32_t xcc_id, xcc_offset, num_xcc;
+	uint32_t i, j, k;
+	uint32_t xcc_id, xcc_offset, inst_offset;
+	uint32_t num_xcc, reg, num_inst;
 	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_9_4_3);
 
 	if (!adev->gfx.ip_dump_core)
@@ -4379,6 +4380,43 @@ static void gfx_v9_4_3_ip_print(void *handle, struct drm_printer *p)
 				   gc_reg_list_9_4_3[i].reg_name,
 				   adev->gfx.ip_dump_core[xcc_offset + i]);
 	}
+
+	/* print compute queue registers for all instances */
+	if (!adev->gfx.ip_dump_compute_queues)
+		return;
+
+	num_inst = adev->gfx.mec.num_mec * adev->gfx.mec.num_pipe_per_mec *
+		adev->gfx.mec.num_queue_per_pipe;
+
+	reg_count = ARRAY_SIZE(gc_cp_reg_list_9_4_3);
+	drm_printf(p, "\nnum_xcc: %d num_mec: %d num_pipe: %d num_queue: %d\n",
+		   num_xcc,
+		   adev->gfx.mec.num_mec,
+		   adev->gfx.mec.num_pipe_per_mec,
+		   adev->gfx.mec.num_queue_per_pipe);
+
+	for (xcc_id = 0; xcc_id < num_xcc; xcc_id++) {
+		xcc_offset = xcc_id * reg_count * num_inst;
+		inst_offset = 0;
+		for (i = 0; i < adev->gfx.mec.num_mec; i++) {
+			for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
+				for (k = 0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
+					drm_printf(p,
+						   "\nxcc:%d mec:%d, pipe:%d, queue:%d\n",
+						    xcc_id, i, j, k);
+					for (reg = 0; reg < reg_count; reg++) {
+						drm_printf(p,
+							   "%-50s \t 0x%08x\n",
+							   gc_cp_reg_list_9_4_3[reg].reg_name,
+							   adev->gfx.ip_dump_compute_queues
+								[xcc_offset + inst_offset +
+								reg]);
+					}
+					inst_offset += reg_count;
+				}
+			}
+		}
+	}
 }
 
 static void gfx_v9_4_3_ip_dump(void *handle)
-- 
2.34.1


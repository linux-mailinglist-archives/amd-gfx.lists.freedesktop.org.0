Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AAA78DE7
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Apr 2025 14:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0657410E6F4;
	Wed,  2 Apr 2025 12:11:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E29B10E6F4
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Apr 2025 12:11:31 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 532CBQQb1689408; Wed, 2 Apr 2025 17:41:26 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 532CBQPH1689407;
 Wed, 2 Apr 2025 17:41:26 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2] drm/amdgpu: make mes_userq_unmap as int from void
Date: Wed,  2 Apr 2025 17:41:25 +0530
Message-Id: <20250402121125.1689394-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

mes_userq_unmap could fail due to MES fw unable to
unmap the queue and the return value needs is not
to be ignored and handled on first step itself.

Also queue->queue_active set to false in this function
but only when the queue is removed successfully. If the
queue is not removed successfully then dont change the active
state of the queue.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index b469b800119f..8f6c12a78f3a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -144,7 +144,7 @@ static int mes_userq_map(struct amdgpu_userq_mgr *uq_mgr,
 	return 0;
 }
 
-static void mes_userq_unmap(struct amdgpu_userq_mgr *uq_mgr,
+static int mes_userq_unmap(struct amdgpu_userq_mgr *uq_mgr,
 			    struct amdgpu_usermode_queue *queue)
 {
 	struct amdgpu_device *adev = uq_mgr->adev;
@@ -159,9 +159,12 @@ static void mes_userq_unmap(struct amdgpu_userq_mgr *uq_mgr,
 	amdgpu_mes_lock(&adev->mes);
 	r = adev->mes.funcs->remove_hw_queue(&adev->mes, &queue_input);
 	amdgpu_mes_unlock(&adev->mes);
-	if (r)
+	if (r) {
 		DRM_ERROR("Failed to unmap queue in HW, err (%d)\n", r);
+		return r;
+	}
 	queue->queue_active = false;
+	return 0;
 }
 
 static int mes_userq_create_ctx_space(struct amdgpu_userq_mgr *uq_mgr,
@@ -345,7 +348,8 @@ mes_userq_mqd_destroy(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_device *adev = uq_mgr->adev;
 
 	if (queue->queue_active)
-		mes_userq_unmap(uq_mgr, queue);
+		if (mes_userq_unmap(uq_mgr, queue))
+			return;
 
 	amdgpu_userqueue_destroy_object(uq_mgr, &queue->fw_obj);
 	kfree(queue->userq_prop);
@@ -358,10 +362,8 @@ mes_userq_mqd_destroy(struct amdgpu_userq_mgr *uq_mgr,
 static int mes_userq_suspend(struct amdgpu_userq_mgr *uq_mgr,
 				   struct amdgpu_usermode_queue *queue)
 {
-	if (queue->queue_active) {
-		mes_userq_unmap(uq_mgr, queue);
-		queue->queue_active = false;
-	}
+	if (queue->queue_active)
+		return mes_userq_unmap(uq_mgr, queue);
 
 	return 0;
 }
-- 
2.34.1


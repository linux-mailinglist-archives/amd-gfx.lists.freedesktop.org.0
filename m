Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKCrNPVGDGp/cwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 13:18:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A871857D5E6
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 13:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3983110E3D5;
	Tue, 19 May 2026 11:18:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A995810EC59
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 11:18:08 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 64JBI4KQ1436024; Tue, 19 May 2026 16:48:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 64JBI4wA1436023;
 Tue, 19 May 2026 16:48:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 7/8] drm/amdgpu/userq: make sure queue is valid in the
 hang_detect_work
Date: Tue, 19 May 2026 16:48:00 +0530
Message-Id: <20260519111801.1435954-7-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519111801.1435954-1-sunil.khatri@amd.com>
References: <20260519111801.1435954-1-sunil.khatri@amd.com>
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
X-Spamd-Result: default: False [2.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: A871857D5E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thread 1: Running amdgpu_userq_destroy which eventually remove
the queue from door bell and set userq_mgr = NULL.

Thread2: An interrupt might have scheduled the hang_detect_work
which still need userq_mgr to be valid but could get an NULL
ptrs.

To fix that make sure we cancel the hang_detect_work again before
setting userq_mgr to NULL.

Along with that we also need all the queue va to remain valid till
we could be running anything on the queue and hence moving the
userq_va post hang_detect handler is cancelled.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index c8f7bb23e2c3..7354c51ae83d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -427,8 +427,6 @@ static void amdgpu_userq_cleanup(struct amdgpu_usermode_queue *queue)
 	xa_erase_irq(&adev->userq_doorbell_xa, queue->doorbell_index);
 	amdgpu_userq_fence_driver_free(queue);
 	queue->fence_drv = NULL;
-	queue->userq_mgr = NULL;
-	list_del(&queue->userq_va_list);
 
 	up_read(&adev->reset_domain->sem);
 }
@@ -619,11 +617,6 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 
 	/* Cancel any pending hang detection work and cleanup */
 	cancel_delayed_work_sync(&queue->hang_detect_work);
-
-	amdgpu_bo_reserve(vm->root.bo, true);
-	amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
-	amdgpu_bo_unreserve(vm->root.bo);
-
 	mutex_lock(&uq_mgr->userq_mutex);
 	amdgpu_userq_wait_for_last_fence(queue);
 
@@ -635,6 +628,14 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 	amdgpu_userq_cleanup(queue);
 	mutex_unlock(&uq_mgr->userq_mutex);
 
+	/* This is case an interrupt was fired and a hang detection work is pending */
+	cancel_delayed_work_sync(&queue->hang_detect_work);
+	amdgpu_bo_reserve(vm->root.bo, true);
+	amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
+	amdgpu_bo_unreserve(vm->root.bo);
+	list_del(&queue->userq_va_list);
+	queue->userq_mgr = NULL;
+
 	amdgpu_bo_reserve(queue->db_obj.obj, true);
 	amdgpu_bo_unpin(queue->db_obj.obj);
 	amdgpu_bo_unreserve(queue->db_obj.obj);
-- 
2.34.1


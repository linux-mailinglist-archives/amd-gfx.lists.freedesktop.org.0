Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDjlGxoS1mmxAwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Apr 2026 10:30:18 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0898B3B90FD
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Apr 2026 10:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E80710E580;
	Wed,  8 Apr 2026 08:30:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABC610E580
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Apr 2026 08:30:15 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 6388UAPm3328400; Wed, 8 Apr 2026 14:00:10 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 6388U9iu3328399;
 Wed, 8 Apr 2026 14:00:09 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH V1] drm/amdgpu/userq: unblock signal ioctl from userq_mutex
Date: Wed,  8 Apr 2026 14:00:09 +0530
Message-Id: <20260408083009.3328380-1-sunil.khatri@amd.com>
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
X-Spamd-Result: default: False [2.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.681];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 0898B3B90FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signal ioctl does not depend on eviction fence and neither it
needs to hold userq_mutex as we just wait for userq fences
to be signalled before we go to suspend state in hardware
and we prempt and unmap the queues.

This unblocks other thread which hold userq_mutex to go on
without breaking the code.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_eviction_fence.c    | 38 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     | 18 ---------
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index 5ae477c49a53..53f0bf6b3ca0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -54,6 +54,41 @@ static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
 	.enable_signaling = amdgpu_eviction_fence_enable_signaling,
 };
 
+static void
+amdgpu_userq_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
+{
+	struct amdgpu_usermode_queue *queue;
+	unsigned long queue_id = 0;
+	struct dma_fence *f;
+
+	for (;;) {
+		xa_lock(&uq_mgr->userq_xa);
+		queue = xa_find(&uq_mgr->userq_xa, &queue_id, ULONG_MAX,
+				XA_PRESENT);
+		if (!queue) {
+			xa_unlock(&uq_mgr->userq_xa);
+			break;
+		}
+
+		kref_get(&queue->refcount);
+		xa_unlock(&uq_mgr->userq_xa);
+
+		mutex_lock(&uq_mgr->userq_mutex);
+		f = dma_fence_get(queue->last_fence);
+		mutex_unlock(&uq_mgr->userq_mutex);
+		if (!f) {
+			amdgpu_userq_put(queue);
+			queue_id++;
+			continue;
+		}
+
+		dma_fence_wait(f, false);
+		dma_fence_put(f);
+		amdgpu_userq_put(queue);
+		queue_id++;
+	}
+}
+
 static void
 amdgpu_eviction_fence_suspend_worker(struct work_struct *work)
 {
@@ -66,6 +101,9 @@ amdgpu_eviction_fence_suspend_worker(struct work_struct *work)
 	struct dma_fence *ev_fence;
 	bool cookie;
 
+	/* Wait for any pending userqueue fence work to finish */
+	amdgpu_userq_wait_for_signal(uq_mgr);
+
 	mutex_lock(&uq_mgr->userq_mutex);
 
 	/*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index c4e92113b557..1e8c08b63f65 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -1269,27 +1269,9 @@ void amdgpu_userq_reset_work(struct work_struct *work)
 	amdgpu_device_gpu_recover(adev, NULL, &reset_context);
 }
 
-static void
-amdgpu_userq_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
-{
-	struct amdgpu_usermode_queue *queue;
-	unsigned long queue_id;
-
-	xa_for_each(&uq_mgr->userq_xa, queue_id, queue) {
-		struct dma_fence *f = queue->last_fence;
-
-		if (!f)
-			continue;
-
-		dma_fence_wait(f, false);
-	}
-}
-
 void
 amdgpu_userq_evict(struct amdgpu_userq_mgr *uq_mgr)
 {
-	/* Wait for any pending userqueue fence work to finish */
-	amdgpu_userq_wait_for_signal(uq_mgr);
 	amdgpu_userq_evict_all(uq_mgr);
 }
 
-- 
2.34.1


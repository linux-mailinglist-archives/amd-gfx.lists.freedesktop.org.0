Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LjfiCmYBDGp1TgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 08:21:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE2577F57
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 08:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3275D10EA85;
	Tue, 19 May 2026 06:21:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7AE10EA83
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 06:21:16 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 64J6LBmi441609; Tue, 19 May 2026 11:51:11 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 64J6LBY3441492;
 Tue, 19 May 2026 11:51:11 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v4 9/9] drm/amdgpu/userq: user array isntead of list for userq
 vas
Date: Tue, 19 May 2026 11:51:07 +0530
Message-Id: <20260519062107.438653-10-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519062107.438653-1-sunil.khatri@amd.com>
References: <20260519062107.438653-1-sunil.khatri@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:mid,amd.com:email]
X-Rspamd-Queue-Id: 5EBE2577F57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add per queue array of maximum size which can hold bo
vas of all types of queues i.e gfx, compute and sdma.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 36 ++++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  4 ++-
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 5c2e0c400d5f..f6cb91256330 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -218,18 +218,11 @@ void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 doorbell)
 static int amdgpu_userq_buffer_va_list_add(struct amdgpu_usermode_queue *queue,
 					   struct amdgpu_bo_va_mapping *va_map, u64 addr)
 {
-	struct amdgpu_userq_va_cursor *va_cursor;
-	struct userq_va_list;
-
-	va_cursor = kzalloc(sizeof(*va_cursor), GFP_KERNEL);
-	if (!va_cursor)
+	if (queue->userq_va_count >= ARRAY_SIZE(queue->userq_va))
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&va_cursor->list);
-	va_cursor->gpu_addr = addr;
+	queue->userq_va[queue->userq_va_count++] = addr;
 	va_map->bo_va->userq_va_mapped = true;
-	list_add(&va_cursor->list, &queue->userq_va_list);
-
 	return 0;
 }
 
@@ -284,14 +277,13 @@ static bool amdgpu_userq_buffer_va_mapped(struct amdgpu_vm *vm, u64 addr)
 
 static bool amdgpu_userq_buffer_vas_mapped(struct amdgpu_usermode_queue *queue)
 {
-	struct amdgpu_userq_va_cursor *va_cursor, *tmp;
-	int r = 0;
+	int i, r = 0;
 
-	list_for_each_entry_safe(va_cursor, tmp, &queue->userq_va_list, list) {
-		r += amdgpu_userq_buffer_va_mapped(queue->vm, va_cursor->gpu_addr);
+	for (i = 0; i < queue->userq_va_count; i++) {
+		r += amdgpu_userq_buffer_va_mapped(queue->vm, queue->userq_va[i]);
 		dev_dbg(queue->userq_mgr->adev->dev,
 			"validate the userq mapping:%p va:%llx r:%d\n",
-			queue, va_cursor->gpu_addr, r);
+			queue, queue->userq_va[i], r);
 	}
 
 	if (r != 0)
@@ -303,19 +295,19 @@ static bool amdgpu_userq_buffer_vas_mapped(struct amdgpu_usermode_queue *queue)
 static void amdgpu_userq_buffer_vas_list_cleanup(struct amdgpu_device *adev,
 						 struct amdgpu_usermode_queue *queue)
 {
-	struct amdgpu_userq_va_cursor *va_cursor, *tmp;
 	struct amdgpu_bo_va_mapping *mapping;
+	int i;
 
 	/* Caller must hold vm->root.bo reservation */
 	dma_resv_assert_held(queue->vm->root.bo->tbo.base.resv);
 
-	list_for_each_entry_safe(va_cursor, tmp, &queue->userq_va_list, list) {
-		mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, va_cursor->gpu_addr);
-		if (mapping)
+	for (i = 0; i < queue->userq_va_count; i++) {
+		mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, queue->userq_va[i]);
+		if (mapping) {
+			mapping->bo_va->userq_va_mapped = false;
 			dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
-				queue, va_cursor->gpu_addr);
-		list_del(&va_cursor->list);
-		kfree(va_cursor);
+				queue, queue->userq_va[i]);
+			}
 	}
 }
 
@@ -427,7 +419,6 @@ static void amdgpu_userq_cleanup(struct amdgpu_usermode_queue *queue)
 	xa_erase_irq(&adev->userq_doorbell_xa, queue->doorbell_index);
 	amdgpu_userq_fence_driver_free(queue);
 	queue->fence_drv = NULL;
-	list_del(&queue->userq_va_list);
 
 	up_read(&adev->reset_domain->sem);
 }
@@ -742,7 +733,6 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		goto err_pm_runtime;
 	}
 
-	INIT_LIST_HEAD(&queue->userq_va_list);
 	queue->doorbell_handle = args->in.doorbell_handle;
 	queue->queue_type = args->in.ip_type;
 	queue->vm = &fpriv->vm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index 9c4d4220c353..2d0f582f9005 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -93,7 +93,9 @@ struct amdgpu_usermode_queue {
 	struct delayed_work	hang_detect_work;
 	struct kref		refcount;
 
-	struct list_head	userq_va_list;
+	/* User to store core bo's va addresses */
+	u64			userq_va[5];
+	int			userq_va_count;
 };
 
 struct amdgpu_userq_funcs {
-- 
2.34.1


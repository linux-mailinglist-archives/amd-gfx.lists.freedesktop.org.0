Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OIvOwas12kMRQgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 15:39:18 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26E73CB61D
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 15:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C15610E7F8;
	Thu,  9 Apr 2026 13:39:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F12310E7F9
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 13:39:14 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 639Dd9Mf1368270; Thu, 9 Apr 2026 19:09:09 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 639Dd9GT1368269;
 Thu, 9 Apr 2026 19:09:09 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 3/4] drm/amdgpu/userq: caller to take reserv lock for
 vas_list_cleanup
Date: Thu,  9 Apr 2026 19:09:05 +0530
Message-Id: <20260409133906.1368219-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409133906.1368219-1-sunil.khatri@amd.com>
References: <20260409133906.1368219-1-sunil.khatri@amd.com>
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
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: C26E73CB61D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In function amdgpu_userq_buffer_vas_list_cleanup, remove the
reservation lock for vm and caller should make sure it's taken
before locking userq_mutex.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 30 ++++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 2408f888c4d9..a7fb061ac690 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -312,25 +312,21 @@ static int amdgpu_userq_buffer_vas_list_cleanup(struct amdgpu_device *adev,
 {
 	struct amdgpu_userq_va_cursor *va_cursor, *tmp;
 	struct amdgpu_bo_va_mapping *mapping;
-	int r;
 
-	r = amdgpu_bo_reserve(queue->vm->root.bo, false);
-	if (r)
-		return r;
+	/* Caller must hold vm->root.bo reservation */
+	dma_resv_assert_held(queue->vm->root.bo->tbo.base.resv);
 
 	list_for_each_entry_safe(va_cursor, tmp, &queue->userq_va_list, list) {
 		mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, va_cursor->gpu_addr);
 		if (!mapping) {
-			r = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 		dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
 			queue, va_cursor->gpu_addr);
 		amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
 	}
-err:
-	amdgpu_bo_unreserve(queue->vm->root.bo);
-	return r;
+
+	return 0;
 }
 
 static int amdgpu_userq_preempt_helper(struct amdgpu_usermode_queue *queue)
@@ -444,8 +440,6 @@ static void amdgpu_userq_cleanup(struct amdgpu_usermode_queue *queue)
 	/* Wait for mode-1 reset to complete */
 	down_read(&adev->reset_domain->sem);
 
-	/* Drop the userq reference. */
-	amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
 	uq_funcs->mqd_destroy(queue);
 	/* Use interrupt-safe locking since IRQ handlers may access these XArrays */
 	xa_erase_irq(&adev->userq_doorbell_xa, queue->doorbell_index);
@@ -626,6 +620,9 @@ static int
 amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_queue *queue)
 {
 	struct amdgpu_device *adev = uq_mgr->adev;
+	struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
+	struct amdgpu_vm *vm = &fpriv->vm;
+
 	int r = 0;
 
 	cancel_delayed_work_sync(&uq_mgr->resume_work);
@@ -633,6 +630,14 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 	/* Cancel any pending hang detection work and cleanup */
 	cancel_delayed_work_sync(&queue->hang_detect_work);
 
+	r = amdgpu_bo_reserve(vm->root.bo, false);
+	if (r) {
+		drm_file_err(uq_mgr->file, "Failed to reserve root bo during userqueue destroy\n");
+		return r;
+	}
+	amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
+	amdgpu_bo_unreserve(vm->root.bo);
+
 	mutex_lock(&uq_mgr->userq_mutex);
 	queue->hang_detect_fence = NULL;
 	amdgpu_userq_wait_for_last_fence(queue);
@@ -664,7 +669,6 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 	}
 	amdgpu_userq_cleanup(queue);
 	mutex_unlock(&uq_mgr->userq_mutex);
-
 	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 
 	return r;
@@ -856,7 +860,9 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 clean_fence_driver:
 	amdgpu_userq_fence_driver_free(queue);
 clean_mapping:
+	amdgpu_bo_reserve(fpriv->vm.root.bo, true);
 	amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
+	amdgpu_bo_unreserve(fpriv->vm.root.bo);
 	kfree(queue);
 	return r;
 }
-- 
2.34.1


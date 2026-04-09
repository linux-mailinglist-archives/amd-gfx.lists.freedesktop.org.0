Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L6HJIlk12nvNQgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 10:34:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046973C7D0B
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 10:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8FF10E775;
	Thu,  9 Apr 2026 08:34:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6310E771
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Apr 2026 08:34:10 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 6398Y0eW1326157; Thu, 9 Apr 2026 14:04:00 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 6398Y0vE1326156;
 Thu, 9 Apr 2026 14:04:00 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 4/4] drm/amdgpu/userq: hold reservation lock in caller of
 amdgpu_userq_input_va_validate
Date: Thu,  9 Apr 2026 14:03:55 +0530
Message-Id: <20260409083355.1326089-5-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409083355.1326089-1-sunil.khatri@amd.com>
References: <20260409083355.1326089-1-sunil.khatri@amd.com>
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
	NEURAL_HAM(-0.00)[-0.798];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 046973C7D0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Caller should hold the reservation lock for root.bo in func
amdgpu_userq_input_va_validate.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c  | 18 ++++++++++-------
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 23 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 1b81ce49d408..333bd84e7619 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -239,13 +239,12 @@ int amdgpu_userq_input_va_validate(struct amdgpu_device *adev,
 	u64 size;
 	int r = 0;
 
+	/* Caller must hold vm->root.bo reservation */
+	dma_resv_assert_held(queue->vm->root.bo->tbo.base.resv);
+
 	user_addr = (addr & AMDGPU_GMC_HOLE_MASK) >> AMDGPU_GPU_PAGE_SHIFT;
 	size = expected_size >> AMDGPU_GPU_PAGE_SHIFT;
 
-	r = amdgpu_bo_reserve(vm->root.bo, false);
-	if (r)
-		return r;
-
 	va_map = amdgpu_vm_bo_lookup_mapping(vm, user_addr);
 	if (!va_map) {
 		r = -EINVAL;
@@ -255,13 +254,11 @@ int amdgpu_userq_input_va_validate(struct amdgpu_device *adev,
 	if (user_addr >= va_map->start  &&
 	    va_map->last - user_addr + 1 >= size) {
 		amdgpu_userq_buffer_va_list_add(queue, va_map, user_addr);
-		amdgpu_bo_unreserve(vm->root.bo);
 		return 0;
 	}
 
 	r = -EINVAL;
 out_err:
-	amdgpu_bo_unreserve(vm->root.bo);
 	return r;
 }
 
@@ -773,13 +770,20 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	db_info.doorbell_offset = args->in.doorbell_offset;
 
 	queue->userq_mgr = uq_mgr;
+
 	/* Validate the userq virtual address.*/
+	r = amdgpu_bo_reserve(fpriv->vm.root.bo, false);
+	if (r)
+		goto free_queue;
+
 	if (amdgpu_userq_input_va_validate(adev, queue, args->in.queue_va, args->in.queue_size) ||
 	    amdgpu_userq_input_va_validate(adev, queue, args->in.rptr_va, AMDGPU_GPU_PAGE_SIZE) ||
 	    amdgpu_userq_input_va_validate(adev, queue, args->in.wptr_va, AMDGPU_GPU_PAGE_SIZE)) {
 		r = -EINVAL;
+		amdgpu_bo_unreserve(fpriv->vm.root.bo);
 		goto clean_mapping;
 	}
+	amdgpu_bo_unreserve(fpriv->vm.root.bo);
 
 	/* Convert relative doorbell offset into absolute doorbell index */
 	index = amdgpu_userq_get_doorbell_index(uq_mgr, &db_info, filp);
@@ -864,7 +868,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
 		amdgpu_bo_unreserve(fpriv->vm.root.bo);
 	}
-
+free_queue:
 	kfree(queue);
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index 527cf2f14691..f7e00169c0be 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -322,12 +322,19 @@ static int mes_userq_mqd_create(struct amdgpu_usermode_queue *queue,
 			goto free_mqd;
 		}
 
+		r = amdgpu_bo_reserve(queue->vm->root.bo, false);
+		if (r) {
+			kfree(compute_mqd);
+			goto free_mqd;
+		}
 		r = amdgpu_userq_input_va_validate(adev, queue, compute_mqd->eop_va,
 						   2048);
 		if (r) {
+			amdgpu_bo_unreserve(queue->vm->root.bo);
 			kfree(compute_mqd);
 			goto free_mqd;
 		}
+		amdgpu_bo_unreserve(queue->vm->root.bo);
 
 		userq_props->eop_gpu_addr = compute_mqd->eop_va;
 		userq_props->hqd_pipe_priority = AMDGPU_GFX_PIPE_PRIO_NORMAL;
@@ -365,18 +372,27 @@ static int mes_userq_mqd_create(struct amdgpu_usermode_queue *queue,
 		userq_props->tmz_queue =
 			mqd_user->flags & AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
 
+		r = amdgpu_bo_reserve(queue->vm->root.bo, false);
+		if (r) {
+			kfree(mqd_gfx_v11);
+			goto free_mqd;
+		}
 		r = amdgpu_userq_input_va_validate(adev, queue, mqd_gfx_v11->shadow_va,
 						   shadow_info.shadow_size);
 		if (r) {
+			amdgpu_bo_unreserve(queue->vm->root.bo);
 			kfree(mqd_gfx_v11);
 			goto free_mqd;
 		}
+
 		r = amdgpu_userq_input_va_validate(adev, queue, mqd_gfx_v11->csa_va,
 						   shadow_info.csa_size);
 		if (r) {
+			amdgpu_bo_unreserve(queue->vm->root.bo);
 			kfree(mqd_gfx_v11);
 			goto free_mqd;
 		}
+		amdgpu_bo_unreserve(queue->vm->root.bo);
 
 		kfree(mqd_gfx_v11);
 	} else if (queue->queue_type == AMDGPU_HW_IP_DMA) {
@@ -394,12 +410,19 @@ static int mes_userq_mqd_create(struct amdgpu_usermode_queue *queue,
 			r = -ENOMEM;
 			goto free_mqd;
 		}
+		r = amdgpu_bo_reserve(queue->vm->root.bo, false);
+		if (r) {
+			kfree(mqd_sdma_v11);
+			goto free_mqd;
+		}
 		r = amdgpu_userq_input_va_validate(adev, queue, mqd_sdma_v11->csa_va,
 						   32);
 		if (r) {
+			amdgpu_bo_unreserve(queue->vm->root.bo);
 			kfree(mqd_sdma_v11);
 			goto free_mqd;
 		}
+		amdgpu_bo_unreserve(queue->vm->root.bo);
 
 		userq_props->csa_addr = mqd_sdma_v11->csa_va;
 		kfree(mqd_sdma_v11);
-- 
2.34.1


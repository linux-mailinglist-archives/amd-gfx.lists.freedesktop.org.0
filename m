Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOstOvKrx2nNaQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Mar 2026 11:22:42 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3B34E10F
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Mar 2026 11:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0022910E370;
	Sat, 28 Mar 2026 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ghY0j63F";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E8410E074
 for <amd-gfx@lists.freedesktop.org>; Sat, 28 Mar 2026 02:16:20 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7d86eb7c854so1503729a34.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2026 19:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774664178; x=1775268978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ApsvoKgQ/+ecwFQ1dbi7zrc8rrPgaJdlpz0Z2+3q9AE=;
 b=ghY0j63F/Fy21eyxTKcTrhUK2EXcQLEsa0pVK4SSFKKTOD41ClhsC898UtJOuNfxIt
 VtiD5Miv+2mSXBoJDu5L0Z6pBA7UvqXWnbElJ258y8n746YJgjb28BDGZUOrjS4aZJ2X
 f7x6tdbsjB/XWgtwpcpY95cDE25/FusQ/qoYr1nn/B9jdnXJ62JLUX0dSHr6nu5pRpnT
 4hf5/y2ZKIovFA1ijqLNYv/flR6ovNIkL7vl/qiDyvj2cq5X5f8SWy9RQDuNTH31CAAY
 sSingn0tJdAvzKPr4EHJnA2VcuyeP4zclAsg2zkwASgiGNft1bFbr0RWvWC5rPCRv3R9
 iJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774664178; x=1775268978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ApsvoKgQ/+ecwFQ1dbi7zrc8rrPgaJdlpz0Z2+3q9AE=;
 b=jx6tsWYSiVeHoPKZ058OK1PwW5XIAkh0vGPpO5HNQMZ5LXSKns94bqHsczhUABcFUh
 trVCNFuk474rmKbO7Y6uWf7g4H6RN3g6Q5UIiNdnY1dsno6ReZf7WK6WmZ7MGdG8UywK
 l3pYzhncmarViSYg5rkzetyM8tMRu/NXNC3c6Qt7mSFelGvu9uLtKAUKWDLYgSwzQPoJ
 bXPbyAnGk4YO/iK0GtDs7jUgeKHz9yoEUrSS0F+j4nYNqX0rIEKDSejaUvJBl+IEXKJS
 wZjhj2CPrvXksJZlptmYrB/x60QYFrqr1rhlTdI67JjWg42ZY7EmbD0lV84g5ufCpQDH
 4/LQ==
X-Gm-Message-State: AOJu0YzBd2j70HJ7g+3uCbpefTBhgiei8iGoxoty4BY1vi+CM6pJMijg
 cApXr+dA5V9VaZVg3HrHg0Yn9k5dp+Z2FuoYClgjGbPAkXAi9jwAY2A/
X-Gm-Gg: ATEYQzxOuk4kzVZMz43SvTi0+uuTZfJxwZ0Q0RSu0z+FTzWdKS14HwWSJZZaYE0KvMJ
 vwuG20uAd9IuSdjKsKWO7jeXcunwZpnn+FOmbEd4jN2Sf6VEtUfL036a3eS5Oyaa6I3XmWjS70o
 BlPRES+gZPWMXBUFi5Tm4RBeBb3IK74KmssNINpVSHvuZ5nELw2cO/L9z3Lvd0qWfRFJ1zZkdbU
 QBCE8BT3pHoqEpUinMoHYRz74MVoB3kHwwZfMUmLynWt/B0ge7QUqnNXr87G+8t2d2eebO3iIgI
 l0K9gtimiivNF9CkUUDfik0Dgd9YHuasU0SWr9W9v3E1vyi0EkFHumNR7WGH4anLTs4pt44+14L
 TuUQTVsUYRvvlxgWAk3o+k6/WGGZJtQ/s7P4r9x5iUMo4DtGq3MU9SJ1yTXNZRhmTkHbJ4vWEYI
 XpRSy8SKYb/GsjV8q0K3JIvrRobvmHrYnINDceCWF7lsHwxPWE9K6vfj4ZONnCSyRu8FS6
X-Received: by 2002:a05:6830:6a11:b0:7d7:d702:401c with SMTP id
 46e09a7af769-7d9faf5af44mr2814201a34.32.1774664178252; 
 Fri, 27 Mar 2026 19:16:18 -0700 (PDT)
Received: from Mac (c-76-107-126-43.hsd1.tn.comcast.net. [76.107.126.43])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7da0a87de2esm683700a34.27.2026.03.27.19.16.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Mar 2026 19:16:17 -0700 (PDT)
From: David Baum <davidbaum461@gmail.com>
To: alexdeucher@gmail.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Baum <davidbaum461@gmail.com>
Subject: [PATCH] drm/amdgpu: fix resource leaks in userqueue creation error
 paths
Date: Fri, 27 Mar 2026 21:16:14 -0500
Message-ID: <20260328021614.20100-1-davidbaum461@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 28 Mar 2026 10:22:39 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:davidbaum461@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[davidbaum461@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[davidbaum461@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 58D3B34E10F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

amdgpu_userq_create() has multiple error paths that jump directly to the
'unlock' label, which only releases the mutex. This leaks resources that
were allocated earlier in the function:

- When amdgpu_userq_fence_driver_alloc() fails, the queue struct,
  doorbell BO, and VA list entries are leaked.
- When xa_store_irq() fails, the MQD and fence driver are leaked
  in addition to the queue struct.
- When kasprintf() fails for the queue debug name, the entire queue
  with all its resources (xa entry, MQD, fence driver, queue struct)
  is leaked.

Fix this by adding cleanup labels in reverse allocation order
(erase_xa, destroy_mqd, free_fence_driver, free_queue) before the
existing unlock label, and routing each error path to the correct
label that matches the resources allocated up to that point.

Signed-off-by: David Baum <davidbaum461@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 37 +++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 7c4503508..93c44798c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -819,17 +819,15 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	    amdgpu_userq_input_va_validate(adev, queue, args->in.rptr_va, AMDGPU_GPU_PAGE_SIZE) ||
 	    amdgpu_userq_input_va_validate(adev, queue, args->in.wptr_va, AMDGPU_GPU_PAGE_SIZE)) {
 		r = -EINVAL;
-		kfree(queue);
-		goto unlock;
+		goto free_queue;
 	}
 
 	/* Convert relative doorbell offset into absolute doorbell index */
 	index = amdgpu_userq_get_doorbell_index(uq_mgr, &db_info, filp);
 	if (index == (uint64_t)-EINVAL) {
 		drm_file_err(uq_mgr->file, "Failed to get doorbell for queue\n");
-		kfree(queue);
 		r = -EINVAL;
-		goto unlock;
+		goto free_queue;
 	}
 
 	queue->doorbell_index = index;
@@ -837,15 +835,13 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	r = amdgpu_userq_fence_driver_alloc(adev, queue);
 	if (r) {
 		drm_file_err(uq_mgr->file, "Failed to alloc fence driver\n");
-		goto unlock;
+		goto free_queue;
 	}
 
 	r = uq_funcs->mqd_create(queue, &args->in);
 	if (r) {
 		drm_file_err(uq_mgr->file, "Failed to create Queue\n");
-		amdgpu_userq_fence_driver_free(queue);
-		kfree(queue);
-		goto unlock;
+		goto free_fence_driver;
 	}
 
 	/* drop this refcount during queue destroy */
@@ -855,21 +851,17 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	down_read(&adev->reset_domain->sem);
 	r = xa_err(xa_store_irq(&adev->userq_doorbell_xa, index, queue, GFP_KERNEL));
 	if (r) {
-		kfree(queue);
 		up_read(&adev->reset_domain->sem);
-		goto unlock;
+		goto destroy_mqd;
 	}
 
 	r = xa_alloc(&uq_mgr->userq_xa, &qid, queue,
 		     XA_LIMIT(1, AMDGPU_MAX_USERQ_COUNT), GFP_KERNEL);
 	if (r) {
 		drm_file_err(uq_mgr->file, "Failed to allocate a queue id\n");
-		amdgpu_userq_fence_driver_free(queue);
-		uq_funcs->mqd_destroy(queue);
-		kfree(queue);
 		r = -ENOMEM;
 		up_read(&adev->reset_domain->sem);
-		goto unlock;
+		goto destroy_mqd;
 	}
 	up_read(&adev->reset_domain->sem);
 
@@ -884,18 +876,14 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		r = amdgpu_userq_map_helper(queue);
 		if (r) {
 			drm_file_err(uq_mgr->file, "Failed to map Queue\n");
-			xa_erase(&uq_mgr->userq_xa, qid);
-			amdgpu_userq_fence_driver_free(queue);
-			uq_funcs->mqd_destroy(queue);
-			kfree(queue);
-			goto unlock;
+			goto erase_xa;
 		}
 	}
 
 	queue_name = kasprintf(GFP_KERNEL, "queue-%d", qid);
 	if (!queue_name) {
 		r = -ENOMEM;
-		goto unlock;
+		goto erase_xa;
 	}
 
 #if defined(CONFIG_DEBUG_FS)
@@ -908,7 +896,16 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 
 	args->out.queue_id = qid;
 	atomic_inc(&uq_mgr->userq_count[queue->queue_type]);
+	goto unlock;
 
+erase_xa:
+	xa_erase_irq(&uq_mgr->userq_xa, qid);
+destroy_mqd:
+	uq_funcs->mqd_destroy(queue);
+free_fence_driver:
+	amdgpu_userq_fence_driver_free(queue);
+free_queue:
+	kfree(queue);
 unlock:
 	mutex_unlock(&uq_mgr->userq_mutex);
 
-- 
2.50.1 (Apple Git-155)


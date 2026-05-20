Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM/YKlJHDWrvvQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 20 May 2026 07:32:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AE3587C8A
	for <lists+amd-gfx@lfdr.de>; Wed, 20 May 2026 07:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3069E10E045;
	Wed, 20 May 2026 05:32:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9755310E045
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 May 2026 05:31:58 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 64K5VrpH2024879; Wed, 20 May 2026 11:01:53 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 64K5VrrZ2024878;
 Wed, 20 May 2026 11:01:53 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 1/5] drm/amdgpu/userq: clean amdgpu_userq_destroy_object
Date: Wed, 20 May 2026 11:01:47 +0530
Message-Id: <20260520053152.2024851-1-sunil.khatri@amd.com>
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
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 38AE3587C8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

amdgpu_userq_destroy_object does not use userq_mgr
reference and hence cleaning that up.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c  |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h  |  3 +--
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 10 ++++------
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 798998d65e17..0607b7078518 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -526,8 +526,7 @@ int amdgpu_userq_create_object(struct amdgpu_userq_mgr *uq_mgr,
 	return r;
 }
 
-void amdgpu_userq_destroy_object(struct amdgpu_userq_mgr *uq_mgr,
-				 struct amdgpu_userq_obj *userq_obj)
+void amdgpu_userq_destroy_object(struct amdgpu_userq_obj *userq_obj)
 {
 	amdgpu_bo_kunmap(userq_obj->obj);
 	amdgpu_bo_unpin(userq_obj->obj);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index 033b8a0de6b1..fe89e35b0d85 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -155,8 +155,7 @@ int amdgpu_userq_create_object(struct amdgpu_userq_mgr *uq_mgr,
 			       struct amdgpu_userq_obj *userq_obj,
 			       int size);
 
-void amdgpu_userq_destroy_object(struct amdgpu_userq_mgr *uq_mgr,
-				 struct amdgpu_userq_obj *userq_obj);
+void amdgpu_userq_destroy_object(struct amdgpu_userq_obj *userq_obj);
 
 void amdgpu_userq_evict(struct amdgpu_userq_mgr *uq_mgr);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index 2d95203ec58e..69b36ebfe7ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -432,10 +432,10 @@ static int mes_userq_mqd_create(struct amdgpu_usermode_queue *queue,
 	return 0;
 
 free_ctx:
-	amdgpu_userq_destroy_object(uq_mgr, &queue->fw_obj);
+	amdgpu_userq_destroy_object(&queue->fw_obj);
 
 free_mqd:
-	amdgpu_userq_destroy_object(uq_mgr, &queue->mqd);
+	amdgpu_userq_destroy_object(&queue->mqd);
 
 free_props:
 	kfree(userq_props);
@@ -445,11 +445,9 @@ static int mes_userq_mqd_create(struct amdgpu_usermode_queue *queue,
 
 static void mes_userq_mqd_destroy(struct amdgpu_usermode_queue *queue)
 {
-	struct amdgpu_userq_mgr *uq_mgr = queue->userq_mgr;
-
-	amdgpu_userq_destroy_object(uq_mgr, &queue->fw_obj);
+	amdgpu_userq_destroy_object(&queue->fw_obj);
 	kfree(queue->userq_prop);
-	amdgpu_userq_destroy_object(uq_mgr, &queue->mqd);
+	amdgpu_userq_destroy_object(&queue->mqd);
 }
 
 static int mes_userq_preempt(struct amdgpu_usermode_queue *queue)
-- 
2.34.1


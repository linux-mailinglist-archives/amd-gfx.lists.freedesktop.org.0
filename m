Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGJlNrtdGWpevwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 11:34:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C6A60002B
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 11:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA5010FBD7;
	Fri, 29 May 2026 09:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DOtKUKuS";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC71110FBD6
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 09:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IeiB3f270jmZ+D9Cv7YP5NKSQlL/Vbxk1kIZkAzLNm8=; b=DOtKUKuS3818aGJbYt+51MmTMT
 rVT/iCn95X9z7avuf1INQv97/etkTZKOfxBenbeppkoetoov2B/XoAip+DrMCO3fq1XV+KHzGLimy
 aEovK7xYV4a+GM5Tm0J9s5biHM+FkfJIncdy/GjzekS7tKMr6+1hxzLfGxWCxaxil8FCvGTX7+iTV
 hYpSEUrwqYtDzZioUl43tdwr3RDUf2ZwTXhuNecKmWfqwRlBNPUru+OdrwRMwH4NxKncFOvFv6DkL
 BlO2j5n/0VM2cv0fXiLD36siJukjNvNcyOaKTgwkgsnOIMfhRLMHo7jHVftwAlfAvLsND+onReUSt
 w+4kUuEQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wStc3-009nUT-0R; Fri, 29 May 2026 11:34:43 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: Remove the bo list mutex
Date: Fri, 29 May 2026 10:34:34 +0100
Message-ID: <20260529093436.82149-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529093436.82149-1-tvrtko.ursulin@igalia.com>
References: <20260529093436.82149-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 86C6A60002B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The bo list is immutable during command submission since the drm_exec
conversion so we can remove the mutex.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  4 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 15 ++++-----------
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 5ce3160ce55a..fa230d480ab0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -42,7 +42,7 @@ static void amdgpu_bo_list_free_rcu(struct rcu_head *rcu)
 {
 	struct amdgpu_bo_list *list = container_of(rcu, struct amdgpu_bo_list,
 						   rhead);
-	mutex_destroy(&list->bo_list_mutex);
+
 	kvfree(list);
 }
 
@@ -134,7 +134,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
 
 	trace_amdgpu_cs_bo_status(list->num_entries, total_size);
 
-	mutex_init(&list->bo_list_mutex);
 	*result = list;
 	return 0;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index 2b5e7c46a39d..1acf53f8b2f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -51,10 +51,6 @@ struct amdgpu_bo_list {
 	unsigned first_userptr;
 	unsigned num_entries;
 
-	/* Protect access during command submission.
-	 */
-	struct mutex bo_list_mutex;
-
 	struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 6ada57abce9d..6845342b9e7e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -870,8 +870,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			return r;
 	}
 
-	mutex_lock(&p->bo_list->bo_list_mutex);
-
 	/* Get userptr backing pages. If pages are updated after registered
 	 * in amdgpu_gem_userptr_ioctl(), amdgpu_cs_list_validate() will do
 	 * amdgpu_ttm_backend_bind() to flush and invalidate new pages
@@ -988,7 +986,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		amdgpu_hmm_range_free(e->range);
 		e->range = NULL;
 	}
-	mutex_unlock(&p->bo_list->bo_list_mutex);
 	return r;
 }
 
@@ -1370,7 +1367,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
 	mutex_unlock(&p->adev->notifier_lock);
-	mutex_unlock(&p->bo_list->bo_list_mutex);
 	return 0;
 }
 
@@ -1442,28 +1438,25 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 
 	r = amdgpu_cs_patch_jobs(&parser);
 	if (r)
-		goto error_backoff;
+		goto error_fini;
 
 	r = amdgpu_cs_vm_handling(&parser);
 	if (r)
-		goto error_backoff;
+		goto error_fini;
 
 	r = amdgpu_cs_sync_rings(&parser);
 	if (r)
-		goto error_backoff;
+		goto error_fini;
 
 	trace_amdgpu_cs_ibs(&parser);
 
 	r = amdgpu_cs_submit(&parser, data);
 	if (r)
-		goto error_backoff;
+		goto error_fini;
 
 	amdgpu_cs_parser_fini(&parser);
 	return 0;
 
-error_backoff:
-	mutex_unlock(&parser.bo_list->bo_list_mutex);
-
 error_fini:
 	amdgpu_cs_parser_fini(&parser);
 	return r;
-- 
2.54.0


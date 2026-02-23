Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE73IxRLnGmODAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 13:41:56 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475A17649C
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 13:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F3910E393;
	Mon, 23 Feb 2026 12:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="sIQ1cx/o";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC1B10E391
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lN7zWashCqN0BWfUo3BFR7Akibh4M5rmipSKa5o9z9w=; b=sIQ1cx/oEJA7YE6xSVzW8/VUo6
 nQvrZqaqvGDMDOtqoBJ0irUbXrxmFozfjk9TLm/1d40MHDYTtUaG0W9D1zTv0z2Wf2BtF/gPN487m
 bQ+kOSGsnFgqa4aeCHc5SA8ZtU5nP2krhcP5C27mk6DJSqnU6lK+8od8b0kWlgLTfxGztfKHIqAAy
 +VFIYEh4ZTiFjmVY1ohLJybKHKsqne+S7IGebHNud7nZ//+xp72rpIuCMsbsD8P6L1GVIt3EE6wY2
 qzSF4fXhtxcJaiQwNbt1JGJEHjm9RehOlQjCucw5nV1o3BWkhlq+osK66VHwbYLHV5ZX7aLDbmLGY
 bBe2aq8g==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vuVG2-004EKP-IZ; Mon, 23 Feb 2026 13:41:50 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 05/12] drm/amdgpu/userq: Use drm_gem_objects_lookup in
 amdgpu_userq_wait_ioctl
Date: Mon, 23 Feb 2026 12:41:34 +0000
Message-ID: <20260223124141.10641-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260223124141.10641-1-tvrtko.ursulin@igalia.com>
References: <20260223124141.10641-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.904];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4475A17649C
X-Rspamd-Action: no action

Use the existing helper instead of open coding it

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 79 ++++++-------------
 1 file changed, 23 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index ee6f03f75b41..d779671bd0db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -610,44 +610,29 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 			    struct drm_file *filp)
 {
-	u32 *syncobj_handles, *timeline_points, *timeline_handles, *bo_handles_read, *bo_handles_write;
-	u32 num_syncobj, num_read_bo_handles, num_write_bo_handles;
-	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
 	struct drm_amdgpu_userq_wait *wait_info = data;
+	const unsigned int num_write_bo_handles = wait_info->num_bo_write_handles;
+	const unsigned int num_read_bo_handles = wait_info->num_bo_read_handles;
+	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
 	struct amdgpu_fpriv *fpriv = filp->driver_priv;
 	struct amdgpu_userq_mgr *userq_mgr = &fpriv->userq_mgr;
+	struct drm_gem_object **gobj_write, **gobj_read;
+	u32 *timeline_points, *timeline_handles;
 	struct amdgpu_usermode_queue *waitq;
-	struct drm_gem_object **gobj_write;
-	struct drm_gem_object **gobj_read;
+	u32 *syncobj_handles, num_syncobj;
 	struct dma_fence **fences = NULL;
 	u16 num_points, num_fences = 0;
-	int r, i, rentry, wentry, cnt;
 	struct drm_exec exec;
+	int r, i, cnt;
 
 	if (!amdgpu_userq_enabled(dev))
 		return -ENOTSUPP;
 
-	num_read_bo_handles = wait_info->num_bo_read_handles;
-	bo_handles_read = memdup_user(u64_to_user_ptr(wait_info->bo_read_handles),
-				      size_mul(sizeof(u32), num_read_bo_handles));
-	if (IS_ERR(bo_handles_read))
-		return PTR_ERR(bo_handles_read);
-
-	num_write_bo_handles = wait_info->num_bo_write_handles;
-	bo_handles_write = memdup_user(u64_to_user_ptr(wait_info->bo_write_handles),
-				       size_mul(sizeof(u32), num_write_bo_handles));
-	if (IS_ERR(bo_handles_write)) {
-		r = PTR_ERR(bo_handles_write);
-		goto free_bo_handles_read;
-	}
-
 	num_syncobj = wait_info->num_syncobj_handles;
 	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
 				      size_mul(sizeof(u32), num_syncobj));
-	if (IS_ERR(syncobj_handles)) {
-		r = PTR_ERR(syncobj_handles);
-		goto free_bo_handles_write;
-	}
+	if (IS_ERR(syncobj_handles))
+		return PTR_ERR(syncobj_handles);
 
 	num_points = wait_info->num_syncobj_timeline_handles;
 	timeline_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_handles),
@@ -664,33 +649,19 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 		goto free_timeline_handles;
 	}
 
-	gobj_read = kmalloc_array(num_read_bo_handles, sizeof(*gobj_read), GFP_KERNEL);
-	if (!gobj_read) {
-		r = -ENOMEM;
+	r = drm_gem_objects_lookup(filp,
+				   u64_to_user_ptr(wait_info->bo_read_handles),
+				   num_read_bo_handles,
+				   &gobj_read);
+	if (r)
 		goto free_timeline_points;
-	}
 
-	for (rentry = 0; rentry < num_read_bo_handles; rentry++) {
-		gobj_read[rentry] = drm_gem_object_lookup(filp, bo_handles_read[rentry]);
-		if (!gobj_read[rentry]) {
-			r = -ENOENT;
-			goto put_gobj_read;
-		}
-	}
-
-	gobj_write = kmalloc_array(num_write_bo_handles, sizeof(*gobj_write), GFP_KERNEL);
-	if (!gobj_write) {
-		r = -ENOMEM;
+	r = drm_gem_objects_lookup(filp,
+				   u64_to_user_ptr(wait_info->bo_write_handles),
+				   num_write_bo_handles,
+				   &gobj_write);
+	if (r)
 		goto put_gobj_read;
-	}
-
-	for (wentry = 0; wentry < num_write_bo_handles; wentry++) {
-		gobj_write[wentry] = drm_gem_object_lookup(filp, bo_handles_write[wentry]);
-		if (!gobj_write[wentry]) {
-			r = -ENOENT;
-			goto put_gobj_write;
-		}
-	}
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
 		      (num_read_bo_handles + num_write_bo_handles));
@@ -947,12 +918,12 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 exec_fini:
 	drm_exec_fini(&exec);
 put_gobj_write:
-	while (wentry-- > 0)
-		drm_gem_object_put(gobj_write[wentry]);
+	for (i = 0; i < num_write_bo_handles; i++)
+		drm_gem_object_put(gobj_write[i]);
 	kfree(gobj_write);
 put_gobj_read:
-	while (rentry-- > 0)
-		drm_gem_object_put(gobj_read[rentry]);
+	for (i = 0; i < num_read_bo_handles; i++)
+		drm_gem_object_put(gobj_read[i]);;
 	kfree(gobj_read);
 free_timeline_points:
 	kfree(timeline_points);
@@ -960,10 +931,6 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 	kfree(timeline_handles);
 free_syncobj_handles:
 	kfree(syncobj_handles);
-free_bo_handles_write:
-	kfree(bo_handles_write);
-free_bo_handles_read:
-	kfree(bo_handles_read);
 
 	return r;
 }
-- 
2.52.0


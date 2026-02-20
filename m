Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDFlOUUbmGnp/wIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 09:28:53 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E8F165A97
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 09:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3460710E799;
	Fri, 20 Feb 2026 08:28:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56DC10E79A
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 08:28:49 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 61K8SiLK2192376; Fri, 20 Feb 2026 13:58:44 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 61K8SiPl2192375;
 Fri, 20 Feb 2026 13:58:44 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/2] drm/amdgpu: add upper bound check on user inputs in
 signal/wait ioctl
Date: Fri, 20 Feb 2026 13:58:40 +0530
Message-Id: <20260220082840.2192325-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220082840.2192325-1-sunil.khatri@amd.com>
References: <20260220082840.2192325-1-sunil.khatri@amd.com>
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
	NEURAL_HAM(-0.00)[-0.942];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 38E8F165A97
X-Rspamd-Action: no action

There are various input arguments set by user in the signal/wait
ioctl which could be a huge value eventually leading to a OOM
condition and system crash and could be exploited.

So check these input value against AMDGPU_USERQ_MAX_HANDLES
which is big enough value and also to avoid out of memory
condition.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a6eb703b62c4..b9810313c5ab 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -35,6 +35,8 @@
 static const struct dma_fence_ops amdgpu_userq_fence_ops;
 static struct kmem_cache *amdgpu_userq_fence_slab;
 
+#define AMDGPU_USERQ_MAX_HANDLES	(1U << 16)
+
 int amdgpu_userq_fence_slab_init(void)
 {
 	amdgpu_userq_fence_slab = kmem_cache_create("amdgpu_userq_fence",
@@ -480,6 +482,9 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 		return -ENOTSUPP;
 
 	num_syncobj_handles = args->num_syncobj_handles;
+	if (num_syncobj_handles > AMDGPU_USERQ_MAX_HANDLES)
+		return -EINVAL;
+
 	syncobj_handles = memdup_array_user(u64_to_user_ptr(args->syncobj_handles),
 					    num_syncobj_handles, sizeof(u32));
 	if (IS_ERR(syncobj_handles))
@@ -501,6 +506,11 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	}
 
 	num_read_bo_handles = args->num_bo_read_handles;
+	if (num_read_bo_handles > AMDGPU_USERQ_MAX_HANDLES) {
+		r = -EINVAL;
+		goto free_syncobj;
+	}
+
 	bo_handles_read = memdup_array_user(u64_to_user_ptr(args->bo_read_handles),
 					    num_read_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_read)) {
@@ -524,6 +534,11 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	}
 
 	num_write_bo_handles = args->num_bo_write_handles;
+	if (num_write_bo_handles > AMDGPU_USERQ_MAX_HANDLES) {
+		r = -EINVAL;
+		goto put_gobj_read;
+	}
+
 	bo_handles_write = memdup_array_user(u64_to_user_ptr(args->bo_write_handles),
 					     num_write_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_write)) {
@@ -666,12 +681,20 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 		return -ENOTSUPP;
 
 	num_read_bo_handles = wait_info->num_bo_read_handles;
+	if (num_read_bo_handles > AMDGPU_USERQ_MAX_HANDLES)
+		return -EINVAL;
+
 	bo_handles_read = memdup_array_user(u64_to_user_ptr(wait_info->bo_read_handles),
 					    num_read_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_read))
 		return PTR_ERR(bo_handles_read);
 
 	num_write_bo_handles = wait_info->num_bo_write_handles;
+	if (num_write_bo_handles > AMDGPU_USERQ_MAX_HANDLES) {
+		r = -EINVAL;
+		goto free_bo_handles_read;
+	}
+
 	bo_handles_write = memdup_array_user(u64_to_user_ptr(wait_info->bo_write_handles),
 					     num_write_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_write)) {
@@ -680,6 +703,11 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 	}
 
 	num_syncobj = wait_info->num_syncobj_handles;
+	if (num_syncobj > AMDGPU_USERQ_MAX_HANDLES) {
+		r = -EINVAL;
+		goto free_bo_handles_write;
+	}
+
 	syncobj_handles = memdup_array_user(u64_to_user_ptr(wait_info->syncobj_handles),
 					    num_syncobj, sizeof(u32));
 	if (IS_ERR(syncobj_handles)) {
@@ -688,6 +716,10 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 	}
 
 	num_points = wait_info->num_syncobj_timeline_handles;
+	if (num_points > AMDGPU_USERQ_MAX_HANDLES) {
+		r = -EINVAL;
+		goto free_syncobj_handles;
+	}
 	timeline_handles = memdup_array_user(u64_to_user_ptr(wait_info->syncobj_timeline_handles),
 					     num_points, sizeof(u32));
 	if (IS_ERR(timeline_handles)) {
@@ -750,6 +782,11 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	if (wait_info->num_fences > AMDGPU_USERQ_MAX_HANDLES) {
+		r = -EINVAL;
+		goto exec_fini;
+	}
+
 	if (!wait_info->num_fences) {
 		if (num_points) {
 			struct dma_fence_unwrap iter;
-- 
2.34.1


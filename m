Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDhzM0YbmGnp/wIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 09:28:54 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A3C165A9E
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 09:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF410E79A;
	Fri, 20 Feb 2026 08:28:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E563810E799
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 08:28:49 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 61K8Sipf2192365; Fri, 20 Feb 2026 13:58:44 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 61K8Si0P2192364;
 Fri, 20 Feb 2026 13:58:44 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 1/2] drm/amdgpu: update memdup_user with memdup_array_user
Date: Fri, 20 Feb 2026 13:58:39 +0530
Message-Id: <20260220082840.2192325-1-sunil.khatri@amd.com>
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
	NEURAL_HAM(-0.00)[-0.940];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 78A3C165A9E
X-Rspamd-Action: no action

memdup_user could return invalid memory allocation if
there is an integer overflow. Using memdup_array_user
make sure we validate the size requirements upfront
and return with an error.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 212056d4ddf0..a6eb703b62c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -480,8 +480,8 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 		return -ENOTSUPP;
 
 	num_syncobj_handles = args->num_syncobj_handles;
-	syncobj_handles = memdup_user(u64_to_user_ptr(args->syncobj_handles),
-				      size_mul(sizeof(u32), num_syncobj_handles));
+	syncobj_handles = memdup_array_user(u64_to_user_ptr(args->syncobj_handles),
+					    num_syncobj_handles, sizeof(u32));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
@@ -501,8 +501,8 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	}
 
 	num_read_bo_handles = args->num_bo_read_handles;
-	bo_handles_read = memdup_user(u64_to_user_ptr(args->bo_read_handles),
-				      sizeof(u32) * num_read_bo_handles);
+	bo_handles_read = memdup_array_user(u64_to_user_ptr(args->bo_read_handles),
+					    num_read_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_read)) {
 		r = PTR_ERR(bo_handles_read);
 		goto free_syncobj;
@@ -524,8 +524,8 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 	}
 
 	num_write_bo_handles = args->num_bo_write_handles;
-	bo_handles_write = memdup_user(u64_to_user_ptr(args->bo_write_handles),
-				       sizeof(u32) * num_write_bo_handles);
+	bo_handles_write = memdup_array_user(u64_to_user_ptr(args->bo_write_handles),
+					     num_write_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_write)) {
 		r = PTR_ERR(bo_handles_write);
 		goto put_gobj_read;
@@ -666,37 +666,37 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 		return -ENOTSUPP;
 
 	num_read_bo_handles = wait_info->num_bo_read_handles;
-	bo_handles_read = memdup_user(u64_to_user_ptr(wait_info->bo_read_handles),
-				      size_mul(sizeof(u32), num_read_bo_handles));
+	bo_handles_read = memdup_array_user(u64_to_user_ptr(wait_info->bo_read_handles),
+					    num_read_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_read))
 		return PTR_ERR(bo_handles_read);
 
 	num_write_bo_handles = wait_info->num_bo_write_handles;
-	bo_handles_write = memdup_user(u64_to_user_ptr(wait_info->bo_write_handles),
-				       size_mul(sizeof(u32), num_write_bo_handles));
+	bo_handles_write = memdup_array_user(u64_to_user_ptr(wait_info->bo_write_handles),
+					     num_write_bo_handles, sizeof(u32));
 	if (IS_ERR(bo_handles_write)) {
 		r = PTR_ERR(bo_handles_write);
 		goto free_bo_handles_read;
 	}
 
 	num_syncobj = wait_info->num_syncobj_handles;
-	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
-				      size_mul(sizeof(u32), num_syncobj));
+	syncobj_handles = memdup_array_user(u64_to_user_ptr(wait_info->syncobj_handles),
+					    num_syncobj, sizeof(u32));
 	if (IS_ERR(syncobj_handles)) {
 		r = PTR_ERR(syncobj_handles);
 		goto free_bo_handles_write;
 	}
 
 	num_points = wait_info->num_syncobj_timeline_handles;
-	timeline_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_handles),
-				       sizeof(u32) * num_points);
+	timeline_handles = memdup_array_user(u64_to_user_ptr(wait_info->syncobj_timeline_handles),
+					     num_points, sizeof(u32));
 	if (IS_ERR(timeline_handles)) {
 		r = PTR_ERR(timeline_handles);
 		goto free_syncobj_handles;
 	}
 
-	timeline_points = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_points),
-				      sizeof(u32) * num_points);
+	timeline_points = memdup_array_user(u64_to_user_ptr(wait_info->syncobj_timeline_points),
+					    num_points, sizeof(u32));
 	if (IS_ERR(timeline_points)) {
 		r = PTR_ERR(timeline_points);
 		goto free_timeline_handles;
-- 
2.34.1


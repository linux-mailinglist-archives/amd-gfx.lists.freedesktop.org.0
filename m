Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJDqA71dGWpevwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 11:34:53 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FCD600039
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 11:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EC110FBDA;
	Fri, 29 May 2026 09:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bD7rOOcz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B5F10FBD3
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P5793bqFLR7O49bKCjXt+FQPLlu2iPMyDy2nIVahYSA=; b=bD7rOOczZsh6M0RwKsvKvO5pl2
 bwkWCLAjPjfTgtxoCLTmVDQ73DqDTzX/VsCuEtnRecCp17pYhOgv6hzxf8o/BfmjKE4BhY0xXv1ve
 dIj10CG367uobVvpV3DAjTzR3DDz2Tm26AdOOTPn343xxQY24iFesYT49PUqPBS83mkj1MeavmkIq
 iwzw0sFdvhJoBr/0h3OKYE7qt5Kf38OSkwP3Y8d752+roMZsRnzWqyfgtvnhXXvQ3QHgv0jKDw+yY
 JYSxpdZoK/zrxOXY2HnH7W+UyR4rKrOsnSItzUZN/yaRzhJ/9CCG+oSGaopNcqlmhaKbkLdLM8nE4
 gkOWUzQA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wStc2-009nUP-86; Fri, 29 May 2026 11:34:42 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: Drop support for variable struct
 drm_amdgpu_bo_list_entry size
Date: Fri, 29 May 2026 10:34:33 +0100
Message-ID: <20260529093436.82149-2-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: D7FCD600039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Userspace always uses struct drm_amdgpu_bo_list_in->bo_info_size equal to
sizeof(struct drm_amdgpu_bo_list_entry) and there are no plans to extend
it. Even if the structure is extended at some point, older kernels will
note that they do not support the additional fields by rejecting the new
structure size.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
--
v2:
 * Expand commit message a bit.

v3:
 * Rebase.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 27 ++++-----------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 43864df8af04..5ce3160ce55a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -183,36 +183,19 @@ void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
 int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 				      struct drm_amdgpu_bo_list_entry **info_param)
 {
-	const uint32_t info_size = sizeof(struct drm_amdgpu_bo_list_entry);
 	const void __user *uptr = u64_to_user_ptr(in->bo_info_ptr);
-	const uint32_t bo_info_size = in->bo_info_size;
 	const uint32_t bo_number = in->bo_number;
 	struct drm_amdgpu_bo_list_entry *info;
 
 	if (bo_number > AMDGPU_BO_LIST_MAX_ENTRIES)
 		return -EINVAL;
 
-	/* copy the handle array from userspace to a kernel buffer */
-	if (likely(info_size == bo_info_size)) {
-		info = vmemdup_array_user(uptr, bo_number, info_size);
-		if (IS_ERR(info))
-			return PTR_ERR(info);
-	} else {
-		const uint32_t bytes = min(bo_info_size, info_size);
-		unsigned i;
+	if (in->bo_info_size != sizeof(struct drm_amdgpu_bo_list_entry))
+		return -EINVAL;
 
-		info = kvmalloc_array(bo_number, info_size, GFP_KERNEL);
-		if (!info)
-			return -ENOMEM;
-
-		memset(info, 0, bo_number * info_size);
-		for (i = 0; i < bo_number; ++i, uptr += bo_info_size) {
-			if (copy_from_user(&info[i], uptr, bytes)) {
-				kvfree(info);
-				return -EFAULT;
-			}
-		}
-	}
+	info = vmemdup_array_user(uptr, bo_number, sizeof(*info));
+	if (IS_ERR(info))
+		return PTR_ERR(info);
 
 	*info_param = info;
 	return 0;
-- 
2.54.0


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPUsAxlLnGmODAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 13:42:01 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DDB1764D5
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 13:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB3610E396;
	Mon, 23 Feb 2026 12:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TtXyugoP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0280610E38E
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uB7oB2Sdfoqaw+hs8qEkAmj68XvFZbB16H6RbDXzFbE=; b=TtXyugoPpc3o0AjJ4+98iD62Gc
 6w8JLkyVrZgFWa4gQawJF5ICLXguMzb5yZD+tBGjzBw4MuGf82ExXuMRt/ZiIEjIH9/uUTeshjpH6
 MMd2KxpzVtkIt6bj2q1N+uhJXVQpZc/7ZQdz4vixC0C+SJtrM5zTJ4jGuaw80/xksc3KwD/rp5oKe
 exkUtVk13albBpFV+uNh0V8hw7tmt6LfjmRB7m8H/60OOGhria/lQCOYNSOFBrfxJ8Q1kXxF6KWlG
 TAknQuyI790HujQnb3SRHK+l2gHCS44SoLG3BHQri4m/CQLySzg1OhxX+FLRCA/nA7vGmZfNMa0Ta
 1SrzZCRA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vuVG3-004EKc-9M; Mon, 23 Feb 2026 13:41:51 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 06/12] drm/amdgpu/userq: Use memdup_array_user in
 amdgpu_userq_wait_ioctl
Date: Mon, 23 Feb 2026 12:41:35 +0000
Message-ID: <20260223124141.10641-7-tvrtko.ursulin@igalia.com>
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
	NEURAL_HAM(-0.00)[-0.911];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3DDB1764D5
X-Rspamd-Action: no action

Use the existing helper instead of multiplying the size.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index d779671bd0db..63d1b6364e96 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -629,21 +629,21 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
 		return -ENOTSUPP;
 
 	num_syncobj = wait_info->num_syncobj_handles;
-	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
-				      size_mul(sizeof(u32), num_syncobj));
+	syncobj_handles = memdup_array_user(u64_to_user_ptr(wait_info->syncobj_handles),
+					    num_syncobj, sizeof(u32));
 	if (IS_ERR(syncobj_handles))
 		return PTR_ERR(syncobj_handles);
 
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
2.52.0


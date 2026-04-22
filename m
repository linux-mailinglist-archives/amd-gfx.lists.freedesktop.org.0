Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPKKII3D6Gm9PwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 14:48:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C54446288
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 14:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CBC10EA03;
	Wed, 22 Apr 2026 12:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="lZspk4wK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Wed, 22 Apr 2026 12:43:23 UTC
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com
 [101.71.155.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F57310E9F8;
 Wed, 22 Apr 2026 12:43:23 +0000 (UTC)
Received: from LAPTOP-99KJFSET (unknown [112.10.250.117])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3bb9ba587;
 Wed, 22 Apr 2026 20:38:17 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, 220245772@seu.edu.cn,
 Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] drm/amdgpu: avoid double drm_exec_fini() in userq validate
Date: Wed, 22 Apr 2026 20:38:17 +0800
Message-ID: <20260422123817.1940-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9db532c6f903a1kunm7eb60d492426
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGk8YVhhDSExDTBhKGUMeGFYeHw5VEwETFhoSFy
 QUDg9ZV1kYEgtZQVlKSklVSktVSU5LVUpKTFlXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
 b=lZspk4wK6YMyq6qyPLONzxsl2WFyxmfrochGEfwUZ/wExadUb+d1bPBVISU1RMDNZoED+GN6oOzU+crna3dlDWr7s8dsf7MrmMF4Z0k6Uq0gFzLWTIUm1l4rlzoqgdA+0C9fiHmAi8tjpwJBK8LY6YcZ68zRbFS6+NwGQ3HvwlY=;
 c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1; 
 bh=dfYTW/RukwJufC/jwZrraJiVVcRI03xOMxKQGV1Op4Y=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 22 Apr 2026 12:48:08 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[seu.edu.cn,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[seu.edu.cn:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[seu.edu.cn:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[getshell@seu.edu.cn,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[seu.edu.cn:email,seu.edu.cn:dkim,seu.edu.cn:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 55C54446288
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When new_addition is true, amdgpu_userq_vm_validate() calls
drm_exec_fini(&exec) before iterating over the collected HMM ranges and
calling amdgpu_ttm_tt_get_user_pages().

If amdgpu_ttm_tt_get_user_pages() fails in that path, the code jumps to
unlock_all and calls drm_exec_fini(&exec) a second time on the same
exec object. drm_exec_fini() is not idempotent: it frees exec->objects
and may also drop exec->contended and finalize the ww acquire context.

Route that error path directly to the range cleanup once exec has
already been finalized.

Fixes: 42f148788469 ("drm/amdgpu/userqueue: validate userptrs for userqueues")
Issue found using a prototype static analysis tool
and confirmed by code review.

Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
Signed-off-by: Slavin Liu <220245772@seu.edu.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 9d67b770bcc2..fe49108fabbd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -1193,7 +1193,7 @@ amdgpu_userq_vm_validate(struct amdgpu_userq_mgr *uq_mgr)
 			bo = range->bo;
 			ret = amdgpu_ttm_tt_get_user_pages(bo, range);
 			if (ret)
-				goto unlock_all;
+				goto free_ranges;
 		}
 
 		invalidated = true;
@@ -1220,6 +1220,7 @@ amdgpu_userq_vm_validate(struct amdgpu_userq_mgr *uq_mgr)
 
 unlock_all:
 	drm_exec_fini(&exec);
+free_ranges:
 	xa_for_each(&xa, tmp_key, range) {
 		if (!range)
 			continue;
-- 
2.50.1.windows.1


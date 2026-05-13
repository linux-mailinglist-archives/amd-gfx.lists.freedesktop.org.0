Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ5ZLRI5BGoqFgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 10:40:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3EA52FCEB
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 10:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF9E10E4CB;
	Wed, 13 May 2026 08:40:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02C10E2D7
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 May 2026 08:40:46 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 64D8eavC1905363; Wed, 13 May 2026 14:10:36 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 64D8eadk1905362;
 Wed, 13 May 2026 14:10:36 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3] drm/amdgpu: userq_va_mapped should remain true once done
Date: Wed, 13 May 2026 14:10:35 +0530
Message-Id: <20260513084035.1905343-1-sunil.khatri@amd.com>
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
X-Rspamd-Queue-Id: 3D3EA52FCEB
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
	NEURAL_HAM(-0.00)[-0.987];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

Multiple queues needs these bo_va objects belonging to
the same uq_mgr. So once they are mapped lets not unmap
them as at any point of time any of the queues might be
using it.

Also userq_va_mapped should be a boolean than atomic.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c  | 16 ++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     |  2 +-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 912c9afaf9e1..4d68732d6223 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -96,7 +96,8 @@ struct amdgpu_bo_va {
 	 * if non-zero, cannot unmap from GPU because user queues may still access it
 	 */
 	unsigned int			queue_refcount;
-	atomic_t			userq_va_mapped;
+	/* Indicates if this buffer is mapped for any user queue. Once set, never reset. */
+	bool				userq_va_mapped;
 };
 
 struct amdgpu_bo {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 24b172a0d9ac..b970617129af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -227,7 +227,7 @@ static int amdgpu_userq_buffer_va_list_add(struct amdgpu_usermode_queue *queue,
 
 	INIT_LIST_HEAD(&va_cursor->list);
 	va_cursor->gpu_addr = addr;
-	atomic_set(&va_map->bo_va->userq_va_mapped, 1);
+	va_map->bo_va->userq_va_mapped = true;
 	list_add(&va_cursor->list, &queue->userq_va_list);
 
 	return 0;
@@ -274,7 +274,7 @@ static bool amdgpu_userq_buffer_va_mapped(struct amdgpu_vm *vm, u64 addr)
 	dma_resv_assert_held(vm->root.bo->tbo.base.resv);
 
 	mapping = amdgpu_vm_bo_lookup_mapping(vm, addr);
-	if (!IS_ERR_OR_NULL(mapping) && atomic_read(&mapping->bo_va->userq_va_mapped))
+	if (!IS_ERR_OR_NULL(mapping) && mapping->bo_va->userq_va_mapped)
 		r = true;
 	else
 		r = false;
@@ -300,15 +300,6 @@ static bool amdgpu_userq_buffer_vas_mapped(struct amdgpu_usermode_queue *queue)
 	return false;
 }
 
-static void amdgpu_userq_buffer_va_list_del(struct amdgpu_bo_va_mapping *mapping,
-					    struct amdgpu_userq_va_cursor *va_cursor)
-{
-	if (mapping)
-		atomic_set(&mapping->bo_va->userq_va_mapped, 0);
-	list_del(&va_cursor->list);
-	kfree(va_cursor);
-}
-
 static void amdgpu_userq_buffer_vas_list_cleanup(struct amdgpu_device *adev,
 						 struct amdgpu_usermode_queue *queue)
 {
@@ -323,7 +314,8 @@ static void amdgpu_userq_buffer_vas_list_cleanup(struct amdgpu_device *adev,
 		if (mapping)
 			dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
 				queue, va_cursor->gpu_addr);
-		amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
+		list_del(&va_cursor->list);
+		kfree(va_cursor);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 82a1c19350ee..b483fecbb524 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2002,7 +2002,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
 	 * during user requests GEM unmap IOCTL except for forcing the unmap
 	 * from user space.
 	 */
-	if (unlikely(atomic_read(&bo_va->userq_va_mapped) > 0))
+	if (unlikely(bo_va->userq_va_mapped))
 		amdgpu_userq_gem_va_unmap_validate(adev, mapping, saddr);
 
 	list_del(&mapping->list);
-- 
2.34.1


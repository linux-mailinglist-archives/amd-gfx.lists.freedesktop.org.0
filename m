Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAwoOZGEsmkeNQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 10:17:05 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6D926F744
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 10:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F165310E9B5;
	Thu, 12 Mar 2026 09:17:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3C610E9C6
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 09:17:02 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 62C9GvkM1948388; Thu, 12 Mar 2026 14:46:57 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 62C9GvD21948381;
 Thu, 12 Mar 2026 14:46:57 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1] drm/amdgpu/userq: unlock cancel_delayed_work_sync for
 hang_detect_work
Date: Thu, 12 Mar 2026 14:46:55 +0530
Message-Id: <20260312091655.1948356-1-sunil.khatri@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 7A6D926F744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cancel_delayed_work_sync for work hand_detect_work should not be
locked since the amdgpu_userq_hang_detect_work also need the same
mutex and when they run together it could be a deadlock.

we do not need to hold the mutex for
cancel_delayed_work_sync(&queue->hang_detect_work). With this in place
if cancel and worker thread run at same time they will not deadlock.

Due to any failures if there is a hand detect and reset that there a
deadlock scenarios between cancel and running the main thread.

[ 243.118276] task:kworker/9:0 state:D stack:0 pid:73 tgid:73 ppid:2 task_flags:0x4208060 flags:0x00080000
[ 243.118283] Workqueue: events amdgpu_userq_hang_detect_work [amdgpu]
[ 243.118636] Call Trace:
[ 243.118639] <TASK>
[ 243.118644] __schedule+0x581/0x1810
[ 243.118649] ? srso_return_thunk+0x5/0x5f
[ 243.118656] ? srso_return_thunk+0x5/0x5f
[ 243.118659] ? wake_up_process+0x15/0x20
[ 243.118665] schedule+0x64/0xe0
[ 243.118668] schedule_preempt_disabled+0x15/0x30
[ 243.118671] __mutex_lock+0x346/0x950
[ 243.118677] __mutex_lock_slowpath+0x13/0x20
[ 243.118681] mutex_lock+0x2c/0x40
[ 243.118684] amdgpu_userq_hang_detect_work+0x63/0x90 [amdgpu]
[ 243.118888] process_scheduled_works+0x1f0/0x450
[ 243.118894] worker_thread+0x27f/0x370
[ 243.118899] kthread+0x1ed/0x210
[ 243.118903] ? __pfx_worker_thread+0x10/0x10
[ 243.118906] ? srso_return_thunk+0x5/0x5f
[ 243.118909] ? __pfx_kthread+0x10/0x10
[ 243.118913] ret_from_fork+0x10f/0x1b0
[ 243.118916] ? __pfx_kthread+0x10/0x10
[ 243.118920] ret_from_fork_asm+0x1a/0x30

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 32541f1bde6d..c5875e175918 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -621,15 +621,22 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
 {
 	struct amdgpu_device *adev = uq_mgr->adev;
 	int r = 0;
+	bool hang_detect_fence = false;
 
 	cancel_delayed_work_sync(&uq_mgr->resume_work);
 	mutex_lock(&uq_mgr->userq_mutex);
 	amdgpu_userq_wait_for_last_fence(queue);
 	/* Cancel any pending hang detection work and cleanup */
 	if (queue->hang_detect_fence) {
-		cancel_delayed_work_sync(&queue->hang_detect_work);
+		hang_detect_fence = true;
 		queue->hang_detect_fence = NULL;
 	}
+	mutex_unlock(&uq_mgr->userq_mutex);
+
+	if (hang_detect_fence)
+		cancel_delayed_work_sync(&queue->hang_detect_work);
+
+	mutex_lock(&uq_mgr->userq_mutex);
 	r = amdgpu_bo_reserve(queue->db_obj.obj, true);
 	if (!r) {
 		amdgpu_bo_unpin(queue->db_obj.obj);
-- 
2.34.1


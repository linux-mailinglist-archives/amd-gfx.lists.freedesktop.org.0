Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDI3DJMN4mkg1AAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2026 12:38:11 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C541A333
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2026 12:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC0110E9F9;
	Fri, 17 Apr 2026 10:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="avbqkE0p";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3732E10E9F2;
 Fri, 17 Apr 2026 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7mFtQnscR0ghOyg8y4gpYR6yXsvLP0tuFR4HMQ94OrI=; b=avbqkE0ps3kq4go0Ag4ZJakimS
 JRqjEWItaW03cc499YEByi8qKaFjr/xZeIHanXIXhuXGcAShq0US5/GkRlYAuWtorZ1uzaa+Y4b0s
 3V2WFuMsWC/WPH3PsQCDl7YBlV63OJK/bRa+k+CNxvObcjYpa5MAiVIgh+3QJNZHBW0ehMzXYVU9F
 KemjKJhWDcn5ZBwkCozVAU2rpd7RtGd9yWkoLrt0mVz8ZVg4gM9cOCRLMfhczJXasbkJfX343MYKg
 g3RJ0lHOmWk3Hr8R5xUs2UUosYnwLBjV3+BBODmHIZo5WUJSta0PjTq774Mo7wDXJRPQ+okajLuvK
 +FOMp81A==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wDgaA-00HPQK-G9; Fri, 17 Apr 2026 12:37:54 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 07/29] drm/sched: Free all finished jobs at once
Date: Fri, 17 Apr 2026 11:37:22 +0100
Message-ID: <20260417103744.76020-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260417103744.76020-1-tvrtko.ursulin@igalia.com>
References: <20260417103744.76020-1-tvrtko.ursulin@igalia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D54C541A333
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To implement fair scheduling we will need as accurate as possible view
into per entity GPU time utilisation. Because sched fence execution time
are only adjusted for accuracy in the free worker we need to process
completed jobs as soon as possible so the metric is most up to date when
view from the submission side of things.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 097ea187d08e..046686a83699 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -910,7 +910,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
  * @sched: scheduler instance
- * @have_more: are there more finished jobs on the list
  *
  * Informs the caller through @have_more whether there are more finished jobs
  * besides the returned one.
@@ -919,7 +918,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
  * ready for it to be destroyed.
  */
 static struct drm_sched_job *
-drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
+drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
 {
 	struct drm_sched_job *job, *next;
 
@@ -934,7 +933,6 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
 		/* cancel this job's TO timer */
 		cancel_delayed_work(&sched->work_tdr);
 
-		*have_more = false;
 		next = list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
 		if (next) {
@@ -944,8 +942,6 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched, bool *have_more)
 				next->s_fence->scheduled.timestamp =
 					dma_fence_timestamp(&job->s_fence->finished);
 
-			*have_more = dma_fence_is_signaled(&next->s_fence->finished);
-
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1004,14 +1000,9 @@ static void drm_sched_free_job_work(struct work_struct *w)
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
 	struct drm_sched_job *job;
-	bool have_more;
 
-	job = drm_sched_get_finished_job(sched, &have_more);
-	if (job) {
+	while ((job = drm_sched_get_finished_job(sched)))
 		sched->ops->free_job(job);
-		if (have_more)
-			drm_sched_run_free_queue(sched);
-	}
 
 	drm_sched_run_job_queue(sched);
 }
-- 
2.52.0


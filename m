Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6593719E6
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 18:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CA56E953;
	Mon,  3 May 2021 16:37:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384BB6E94F;
 Mon,  3 May 2021 16:37:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC90161410;
 Mon,  3 May 2021 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620059837;
 bh=uXAS8Otjd0Y9glK8WUZas1GdrtoN/LxsHz2rE2CSMfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SaYhaotdLlCmTMXhHx4qGTG6nGxIR68LL39SbzQ0mVSNxxL5LtJrENLlTF0XzBb0k
 FjFsuE1oSfoafvaMDZ4tMzbSrmh3s95bB49q7e3hfvKvKCxXp90JigK+GC9iUmT6tZ
 skokeRMwULb6KYsbgb8t5rcKxCmPpS+bdFKtyEreH3jOAbNhnOIUYldlnS6pR/0y8S
 8VQsLWX1Lq9Lqrywfhjg9W+kSI3AuohsSYqkJ1RkS29VnmQaD37RZrKpwxMgNezVa8
 T25huUhQx+ZTwqCfxYB8pCQ8dkdtMLskRtLpBQPvnUFvR3oEVdsn7zlmH00f0JTqfP
 O4IfXPDnOxfNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 011/115] drm/amdgpu/display: buffer
 INTERRUPT_LOW_IRQ_CONTEXT interrupt work
Date: Mon,  3 May 2021 12:35:15 -0400
Message-Id: <20210503163700.2852194-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163700.2852194-1-sashal@kernel.org>
References: <20210503163700.2852194-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Xiaogang Chen <xiaogang.chen@amd.com>,
 dri-devel@lists.freedesktop.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Xiaogang Chen <xiaogang.chen@amd.com>

[ Upstream commit b6f91fc183f758461b9462cc93e673adbbf95c2d ]

amdgpu DM handles INTERRUPT_LOW_IRQ_CONTEXT interrupt(hpd, hpd_rx) by using work
queue and uses single work_struct. If new interrupt is recevied before the
previous handler finished, new interrupts(same type) will be discarded and
driver just sends "amdgpu_dm_irq_schedule_work FAILED" message out. If some
important hpd, hpd_rx related interrupts are missed by driver the hot (un)plug
devices may cause system hang or instability, such as issues with system
resume from S3 sleep with mst device connected.

This patch dynamically allocates new amdgpu_dm_irq_handler_data for new
interrupts if previous INTERRUPT_LOW_IRQ_CONTEXT interrupt work has not been
handled. So the new interrupt works can be queued to the same workqueue_struct,
instead of discard the new interrupts. All allocated amdgpu_dm_irq_handler_data
are put into a single linked list and will be reused after.

Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  14 +--
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 115 ++++++++++++------
 2 files changed, 80 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 1182dafcef02..9dc034b4548a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -68,18 +68,6 @@ struct common_irq_params {
 	enum dc_irq_source irq_src;
 };
 
-/**
- * struct irq_list_head - Linked-list for low context IRQ handlers.
- *
- * @head: The list_head within &struct handler_data
- * @work: A work_struct containing the deferred handler work
- */
-struct irq_list_head {
-	struct list_head head;
-	/* In case this interrupt needs post-processing, 'work' will be queued*/
-	struct work_struct work;
-};
-
 /**
  * struct dm_compressor_info - Buffer info used by frame buffer compression
  * @cpu_addr: MMIO cpu addr
@@ -270,7 +258,7 @@ struct amdgpu_display_manager {
 	 * Note that handlers are called in the same order as they were
 	 * registered (FIFO).
 	 */
-	struct irq_list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
+	struct list_head irq_handler_list_low_tab[DAL_IRQ_SOURCES_NUMBER];
 
 	/**
 	 * @irq_handler_list_high_tab:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
index 26ed70e5538a..6cd76c0eebf9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
@@ -82,6 +82,7 @@ struct amdgpu_dm_irq_handler_data {
 	struct amdgpu_display_manager *dm;
 	/* DAL irq source which registered for this interrupt. */
 	enum dc_irq_source irq_source;
+	struct work_struct work;
 };
 
 #define DM_IRQ_TABLE_LOCK(adev, flags) \
@@ -111,20 +112,10 @@ static void init_handler_common_data(struct amdgpu_dm_irq_handler_data *hcd,
  */
 static void dm_irq_work_func(struct work_struct *work)
 {
-	struct irq_list_head *irq_list_head =
-		container_of(work, struct irq_list_head, work);
-	struct list_head *handler_list = &irq_list_head->head;
-	struct amdgpu_dm_irq_handler_data *handler_data;
-
-	list_for_each_entry(handler_data, handler_list, list) {
-		DRM_DEBUG_KMS("DM_IRQ: work_func: for dal_src=%d\n",
-				handler_data->irq_source);
+	struct amdgpu_dm_irq_handler_data *handler_data =
+		container_of(work, struct amdgpu_dm_irq_handler_data, work);
 
-		DRM_DEBUG_KMS("DM_IRQ: schedule_work: for dal_src=%d\n",
-			handler_data->irq_source);
-
-		handler_data->handler(handler_data->handler_arg);
-	}
+	handler_data->handler(handler_data->handler_arg);
 
 	/* Call a DAL subcomponent which registered for interrupt notification
 	 * at INTERRUPT_LOW_IRQ_CONTEXT.
@@ -156,7 +147,7 @@ static struct list_head *remove_irq_handler(struct amdgpu_device *adev,
 		break;
 	case INTERRUPT_LOW_IRQ_CONTEXT:
 	default:
-		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source].head;
+		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
 		break;
 	}
 
@@ -290,7 +281,8 @@ void *amdgpu_dm_irq_register_interrupt(struct amdgpu_device *adev,
 		break;
 	case INTERRUPT_LOW_IRQ_CONTEXT:
 	default:
-		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source].head;
+		hnd_list = &adev->dm.irq_handler_list_low_tab[irq_source];
+		INIT_WORK(&handler_data->work, dm_irq_work_func);
 		break;
 	}
 
@@ -372,7 +364,7 @@ void amdgpu_dm_irq_unregister_interrupt(struct amdgpu_device *adev,
 int amdgpu_dm_irq_init(struct amdgpu_device *adev)
 {
 	int src;
-	struct irq_list_head *lh;
+	struct list_head *lh;
 
 	DRM_DEBUG_KMS("DM_IRQ\n");
 
@@ -381,9 +373,7 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)
 	for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
 		/* low context handler list init */
 		lh = &adev->dm.irq_handler_list_low_tab[src];
-		INIT_LIST_HEAD(&lh->head);
-		INIT_WORK(&lh->work, dm_irq_work_func);
-
+		INIT_LIST_HEAD(lh);
 		/* high context handler init */
 		INIT_LIST_HEAD(&adev->dm.irq_handler_list_high_tab[src]);
 	}
@@ -400,8 +390,11 @@ int amdgpu_dm_irq_init(struct amdgpu_device *adev)
 void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
 {
 	int src;
-	struct irq_list_head *lh;
+	struct list_head *lh;
+	struct list_head *entry, *tmp;
+	struct amdgpu_dm_irq_handler_data *handler;
 	unsigned long irq_table_flags;
+
 	DRM_DEBUG_KMS("DM_IRQ: releasing resources.\n");
 	for (src = 0; src < DAL_IRQ_SOURCES_NUMBER; src++) {
 		DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
@@ -410,7 +403,16 @@ void amdgpu_dm_irq_fini(struct amdgpu_device *adev)
 		 * (because no code can schedule a new one). */
 		lh = &adev->dm.irq_handler_list_low_tab[src];
 		DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
-		flush_work(&lh->work);
+
+		if (!list_empty(lh)) {
+			list_for_each_safe(entry, tmp, lh) {
+				handler = list_entry(
+					entry,
+					struct amdgpu_dm_irq_handler_data,
+					list);
+				flush_work(&handler->work);
+			}
+		}
 	}
 }
 
@@ -420,6 +422,8 @@ int amdgpu_dm_irq_suspend(struct amdgpu_device *adev)
 	struct list_head *hnd_list_h;
 	struct list_head *hnd_list_l;
 	unsigned long irq_table_flags;
+	struct list_head *entry, *tmp;
+	struct amdgpu_dm_irq_handler_data *handler;
 
 	DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
 
@@ -430,14 +434,22 @@ int amdgpu_dm_irq_suspend(struct amdgpu_device *adev)
 	 * will be disabled from manage_dm_interrupts on disable CRTC.
 	 */
 	for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6RX; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, false);
 
 		DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
-		flush_work(&adev->dm.irq_handler_list_low_tab[src].work);
 
+		if (!list_empty(hnd_list_l)) {
+			list_for_each_safe (entry, tmp, hnd_list_l) {
+				handler = list_entry(
+					entry,
+					struct amdgpu_dm_irq_handler_data,
+					list);
+				flush_work(&handler->work);
+			}
+		}
 		DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
 	}
 
@@ -457,7 +469,7 @@ int amdgpu_dm_irq_resume_early(struct amdgpu_device *adev)
 
 	/* re-enable short pulse interrupts HW interrupt */
 	for (src = DC_IRQ_SOURCE_HPD1RX; src <= DC_IRQ_SOURCE_HPD6RX; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, true);
@@ -483,7 +495,7 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
 	 * will be enabled from manage_dm_interrupts on enable CRTC.
 	 */
 	for (src = DC_IRQ_SOURCE_HPD1; src <= DC_IRQ_SOURCE_HPD6; src++) {
-		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src].head;
+		hnd_list_l = &adev->dm.irq_handler_list_low_tab[src];
 		hnd_list_h = &adev->dm.irq_handler_list_high_tab[src];
 		if (!list_empty(hnd_list_l) || !list_empty(hnd_list_h))
 			dc_interrupt_set(adev->dm.dc, src, true);
@@ -500,22 +512,53 @@ int amdgpu_dm_irq_resume_late(struct amdgpu_device *adev)
 static void amdgpu_dm_irq_schedule_work(struct amdgpu_device *adev,
 					enum dc_irq_source irq_source)
 {
-	unsigned long irq_table_flags;
-	struct work_struct *work = NULL;
+	struct  list_head *handler_list = &adev->dm.irq_handler_list_low_tab[irq_source];
+	struct  amdgpu_dm_irq_handler_data *handler_data;
+	bool    work_queued = false;
 
-	DM_IRQ_TABLE_LOCK(adev, irq_table_flags);
+	if (list_empty(handler_list))
+		return;
+
+	list_for_each_entry (handler_data, handler_list, list) {
+		if (!queue_work(system_highpri_wq, &handler_data->work)) {
+			continue;
+		} else {
+			work_queued = true;
+			break;
+		}
+	}
 
-	if (!list_empty(&adev->dm.irq_handler_list_low_tab[irq_source].head))
-		work = &adev->dm.irq_handler_list_low_tab[irq_source].work;
+	if (!work_queued) {
+		struct  amdgpu_dm_irq_handler_data *handler_data_add;
+		/*get the amdgpu_dm_irq_handler_data of first item pointed by handler_list*/
+		handler_data = container_of(handler_list->next, struct amdgpu_dm_irq_handler_data, list);
 
-	DM_IRQ_TABLE_UNLOCK(adev, irq_table_flags);
+		/*allocate a new amdgpu_dm_irq_handler_data*/
+		handler_data_add = kzalloc(sizeof(*handler_data), GFP_KERNEL);
+		if (!handler_data_add) {
+			DRM_ERROR("DM_IRQ: failed to allocate irq handler!\n");
+			return;
+		}
 
-	if (work) {
-		if (!schedule_work(work))
-			DRM_INFO("amdgpu_dm_irq_schedule_work FAILED src %d\n",
-						irq_source);
-	}
+		/*copy new amdgpu_dm_irq_handler_data members from handler_data*/
+		handler_data_add->handler       = handler_data->handler;
+		handler_data_add->handler_arg   = handler_data->handler_arg;
+		handler_data_add->dm            = handler_data->dm;
+		handler_data_add->irq_source    = irq_source;
 
+		list_add_tail(&handler_data_add->list, handler_list);
+
+		INIT_WORK(&handler_data_add->work, dm_irq_work_func);
+
+		if (queue_work(system_highpri_wq, &handler_data_add->work))
+			DRM_DEBUG("Queued work for handling interrupt from "
+				  "display for IRQ source %d\n",
+				  irq_source);
+		else
+			DRM_ERROR("Failed to queue work for handling interrupt "
+				  "from display for IRQ source %d\n",
+				  irq_source);
+	}
 }
 
 /*
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2795B88DFB6
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972B310FC8E;
	Wed, 27 Mar 2024 12:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IU/WGwyj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666D010FC8E;
 Wed, 27 Mar 2024 12:26:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 60598CE17F8;
 Wed, 27 Mar 2024 12:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0F1C43390;
 Wed, 27 Mar 2024 12:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711542370;
 bh=okH8u4jaOwDDQcG2kpPwu8Gli+STqsV4gB96zg8bIBU=;
 h=From:To:Cc:Subject:Date:From;
 b=IU/WGwyjbF1NeGMh6Vj9nEEc2kvs8GNkWO7oojv9iLHftcDcvAYjq1UVLHgGETwEG
 G1g8QByglONX+gUAUQIvF1WYBaDFkBFKCR5cpNweq5FGG35ypnRXgzygmPy+BFBAzG
 yD+CCI19dvZLFPu7EJdbWbGUOMfYWsm/pOrUbWWPHFjqjJmfeHljHCHiRlGpvcUIY3
 yOq6pMopVEWVxJhAbnchUW7YUx1Z0Mvg2doIuHJFlvh15facrajv2mymKRZTWRoxce
 cPjJq7otKopZ5Vmzj16nc4lLT6/iqBhhcBGCjj6nTBxn0kkGy5cMsP7OsrIdCt/a8j
 Yk37lqKavfPCg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	wayne.lin@amd.com
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: adjust few initialization order in
 dm" failed to apply to 4.19-stable tree
Date: Wed, 27 Mar 2024 08:26:08 -0400
Message-ID: <20240327122608.2840852-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 4.19-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From c9aef4f6c6d7cdc92a64ffe761c6921ec85157ae Mon Sep 17 00:00:00 2001
From: Wayne Lin <wayne.lin@amd.com>
Date: Fri, 2 Feb 2024 17:34:11 +0800
Subject: [PATCH] drm/amd/display: adjust few initialization order in dm

[Why]
Observe error message "Can't retrieve aconnector in hpd_rx_irq_offload_work"
when boot up with a mst tbt4 dock connected. After analyzing, there are few
parts needed to be adjusted:

1. hpd_rx_offload_wq[].aconnector is not initialzed before the dmub outbox
hpd_irq handler get registered which causes the error message.

2. registeration of hpd and hpd_rx_irq event for usb4 dp tunneling is not
aligned with legacy interface sequence

[How]
Put DMUB_NOTIFICATION_HPD and DMUB_NOTIFICATION_HPD_IRQ handler
registration into register_hpd_handlers() to align other interfaces and
get hpd_rx_offload_wq[].aconnector initialized earlier than that.

Leave DMUB_NOTIFICATION_AUX_REPLY registered as it was since we need that
while calling dc_link_detect(). USB4 connection status will be proactively
detected by dc_link_detect_connection_type() in amdgpu_dm_initialize_drm_device()

Cc: Stable <stable@vger.kernel.org>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 985137b51372d..8b13cb334b366 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1844,21 +1844,12 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 			DRM_ERROR("amdgpu: fail to register dmub aux callback");
 			goto error;
 		}
-		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD, dmub_hpd_callback, true)) {
-			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
-			goto error;
-		}
-		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD_IRQ, dmub_hpd_callback, true)) {
-			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
-			goto error;
-		}
-	}
-
-	/* Enable outbox notification only after IRQ handlers are registered and DMUB is alive.
-	 * It is expected that DMUB will resend any pending notifications at this point, for
-	 * example HPD from DPIA.
-	 */
-	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
+		/* Enable outbox notification only after IRQ handlers are registered and DMUB is alive.
+		 * It is expected that DMUB will resend any pending notifications at this point. Note
+		 * that hpd and hpd_irq handler registration are deferred to register_hpd_handlers() to
+		 * align legacy interface initialization sequence. Connection status will be proactivly
+		 * detected once in the amdgpu_dm_initialize_drm_device.
+		 */
 		dc_enable_dmub_outbox(adev->dm.dc);
 
 		/* DPIA trace goes to dmesg logs only if outbox is enabled */
@@ -3547,6 +3538,14 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
 	int_params.requested_polarity = INTERRUPT_POLARITY_DEFAULT;
 	int_params.current_polarity = INTERRUPT_POLARITY_DEFAULT;
 
+	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
+		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD, dmub_hpd_callback, true))
+			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
+
+		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_HPD_IRQ, dmub_hpd_callback, true))
+			DRM_ERROR("amdgpu: fail to register dmub hpd callback");
+	}
+
 	list_for_each_entry(connector,
 			&dev->mode_config.connector_list, head)	{
 
@@ -3575,10 +3574,6 @@ static void register_hpd_handlers(struct amdgpu_device *adev)
 					handle_hpd_rx_irq,
 					(void *) aconnector);
 		}
-
-		if (adev->dm.hpd_rx_offload_wq)
-			adev->dm.hpd_rx_offload_wq[connector->index].aconnector =
-				aconnector;
 	}
 }
 
@@ -4590,6 +4585,10 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 			goto fail;
 		}
 
+		if (dm->hpd_rx_offload_wq)
+			dm->hpd_rx_offload_wq[aconnector->base.index].aconnector =
+				aconnector;
+
 		if (!dc_link_detect_connection_type(link, &new_connection_type))
 			DRM_ERROR("KMS: Failed to detect connector\n");
 
-- 
2.43.0





Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E602B6C3AF1
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Mar 2023 20:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627A810E4F6;
	Tue, 21 Mar 2023 19:46:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr
 [80.12.242.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A47E10E263
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Mar 2023 17:59:35 +0000 (UTC)
Received: from localhost.localdomain ([109.190.253.13])
 by smtp.orange.fr with ESMTPA
 id egGTpZTNYNBsfegGWp5b3D; Tue, 21 Mar 2023 18:59:32 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 21 Mar 2023 18:59:32 +0100
X-ME-IP: 109.190.253.13
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, aurabindo.pillai@amd.com,
 roman.li@amd.com, hersenxs.wu@amd.com, stylon.wang@amd.com
Subject: [PATCH] drm/amd/display: Slightly optimize dm_dmub_outbox1_low_irq()
Date: Tue, 21 Mar 2023 18:58:50 +0100
Message-Id: <b7cff2c1976308c64951d466fd627989ef6e46fb.1679421347.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:46:36 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

A kzalloc()+memcpy() can be optimized in a single kmemdup().
This saves a few cycles because some memory doesn't need to be zeroed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5bac5781a06b..57a5fbdab890 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -820,15 +820,14 @@ static void dm_dmub_outbox1_low_irq(void *interrupt_params)
 					DRM_ERROR("Failed to allocate dmub_hpd_wrk");
 					return;
 				}
-				dmub_hpd_wrk->dmub_notify = kzalloc(sizeof(struct dmub_notification), GFP_ATOMIC);
+				dmub_hpd_wrk->dmub_notify = kmemdup(&notify, sizeof(struct dmub_notification),
+								    GFP_ATOMIC);
 				if (!dmub_hpd_wrk->dmub_notify) {
 					kfree(dmub_hpd_wrk);
 					DRM_ERROR("Failed to allocate dmub_hpd_wrk->dmub_notify");
 					return;
 				}
 				INIT_WORK(&dmub_hpd_wrk->handle_hpd_work, dm_handle_hpd_work);
-				if (dmub_hpd_wrk->dmub_notify)
-					memcpy(dmub_hpd_wrk->dmub_notify, &notify, sizeof(struct dmub_notification));
 				dmub_hpd_wrk->adev = adev;
 				if (notify.type == DMUB_NOTIFICATION_HPD) {
 					plink = adev->dm.dc->links[notify.link_index];
-- 
2.32.0


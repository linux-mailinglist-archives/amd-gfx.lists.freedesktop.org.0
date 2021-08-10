Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E83E1BA6
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Aug 2021 20:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6902D8921B;
	Thu,  5 Aug 2021 18:46:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF83E6EB24
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Aug 2021 18:44:51 +0000 (UTC)
Received: from localhost.localdomain ([217.128.214.245]) by mwinf5d63 with ME
 id dudJ250055JEng903udJWQ; Thu, 05 Aug 2021 20:37:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Aug 2021 20:37:20 +0200
X-ME-IP: 217.128.214.245
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, ray.huang@amd.com, evan.quan@amd.com,
 Xiaojian.Du@amd.com, kevin1.wang@amd.com, Jinzhou.Su@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] drm/amd/pm: Fix a memory leak in an error handling path in
 'vangogh_tables_init()'
Date: Thu,  5 Aug 2021 20:37:14 +0200
Message-Id: <fd28a9cec24a8d32ebb26dd857c399d0a15acdd5.1628188477.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Aug 2021 18:46:18 +0000
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

'watermarks_table' must be freed instead 'clocks_table', because
'clocks_table' is known to be NULL at this point and 'watermarks_table' is
never freed if the last kzalloc fails.

Fixes: c98ee89736b8 ("drm/amd/pm: add the fine grain tuning function for vangogh")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 335b3c70e1a7..06eea917284e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -256,7 +256,7 @@ static int vangogh_tables_init(struct smu_context *smu)
 	return 0;
 
 err3_out:
-	kfree(smu_table->clocks_table);
+	kfree(smu_table->watermarks_table);
 err2_out:
 	kfree(smu_table->gpu_metrics_table);
 err1_out:
-- 
2.30.2


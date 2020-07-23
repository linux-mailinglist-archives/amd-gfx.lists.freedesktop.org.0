Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60622A661
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Jul 2020 06:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFB16E0A6;
	Thu, 23 Jul 2020 04:11:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72D16E2CC;
 Thu, 23 Jul 2020 03:26:20 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 75FB77FF8DAD8F8D1986;
 Thu, 23 Jul 2020 11:26:14 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 23 Jul 2020
 11:26:10 +0800
From: Li Heng <liheng40@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next 1/2] drm: Remove redundant NULL check
Date: Thu, 23 Jul 2020 11:27:42 +0800
Message-ID: <1595474863-33112-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 23 Jul 2020 04:11:05 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix below warnings reported by coccicheck:
./drivers/gpu/drm/drm_drv.c:819:2-7: WARNING: NULL check before some freeing functions is not needed.

Fixes: 5dad34f3c444 ("drm: Cleanups after drmm_add_final_kfree rollout")
Signed-off-by: Li Heng <liheng40@huawei.com>
---
 drivers/gpu/drm/drm_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index bc38322..13068fd 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -815,8 +815,7 @@ static void drm_dev_release(struct kref *ref)
 
 	drm_managed_release(dev);
 
-	if (dev->managed.final_kfree)
-		kfree(dev->managed.final_kfree);
+	kfree(dev->managed.final_kfree);
 }
 
 /**
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

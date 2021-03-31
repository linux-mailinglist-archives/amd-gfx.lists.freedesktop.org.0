Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760AB350152
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Mar 2021 15:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216E96EA9B;
	Wed, 31 Mar 2021 13:36:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Wed, 31 Mar 2021 13:21:11 UTC
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F5A6EA9B
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Mar 2021 13:21:11 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 383AD5404CC;
 Wed, 31 Mar 2021 21:12:11 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Guchun Chen <guchun.chen@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, John Clements <john.clements@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: cleanup coding style a bit
Date: Wed, 31 Mar 2021 06:12:03 -0700
Message-Id: <20210331131205.60710-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQkhJS0seHR4fSkxNVkpNSkxKQk1ISEpNSUNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6NSo*DT8SHjVCGSoWNEgc
 MzQaFAJVSlVKTUpMSkJNSEhKQ0JIVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJQ05KNwY+
X-HM-Tid: 0a788869b23bb038kuuu383ad5404cc
X-Mailman-Approved-At: Wed, 31 Mar 2021 13:36:02 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix patch check warning:
WARNING: suspect code indent for conditional statements (8, 17)
+       if (obj && obj->use < 0) {
+                DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);

WARNING: braces {} are not necessary for single statement blocks
+       if (obj && obj->use < 0) {
+                DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
+       }

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 1fb2a91ad30a..43d17b72c265 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -449,11 +449,10 @@ static ssize_t amdgpu_ras_sysfs_read(struct device *dev,
 
 static inline void put_obj(struct ras_manager *obj)
 {
-	if (obj && --obj->use == 0)
+	if (obj && (--obj->use == 0))
 		list_del(&obj->node);
-	if (obj && obj->use < 0) {
-		 DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
-	}
+	if (obj && (obj->use < 0))
+		DRM_ERROR("RAS ERROR: Unbalance obj(%s) use\n", obj->head.name);
 }
 
 /* make one obj and return it. */
-- 
2.31.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

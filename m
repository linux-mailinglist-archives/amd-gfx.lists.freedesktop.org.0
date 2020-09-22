Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D32742B5
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Sep 2020 15:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED5589A4A;
	Tue, 22 Sep 2020 13:11:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 557 seconds by postgrey-1.36 at gabe;
 Tue, 22 Sep 2020 11:21:07 UTC
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEA66E132
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Sep 2020 11:21:07 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id 495464E17B2;
 Tue, 22 Sep 2020 19:11:45 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm/radeon: fix spellint typo in comments
Date: Tue, 22 Sep 2020 19:11:37 +0800
Message-Id: <1600773099-32693-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHRgeS09ITUgfGUgeVkpNS0tMTEhKS05NTU1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTo6PAw4Sz8YTw4LSAJKQyIh
 MjoaFBNVSlVKTUtLTExISktNS01OVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISllXWQgBWUFKTExCNwY+
X-HM-Tid: 0a74b58327919376kuws495464e17b2
X-Mailman-Approved-At: Tue, 22 Sep 2020 13:11:36 +0000
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
Cc: Wang Qing <wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Modify the comment typo: "definately" -> "definitely".

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/radeon/radeon_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index f60fae0..3d6e2cd
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -188,7 +188,7 @@ struct radeon_fence *radeon_vm_grab_id(struct radeon_device *rdev,
 	    vm_id->last_id_use == rdev->vm_manager.active[vm_id->id])
 		return NULL;
 
-	/* we definately need to flush */
+	/* we definitely need to flush */
 	vm_id->pd_gpu_addr = ~0ll;
 
 	/* skip over VMID 0, since it is the system VM */
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

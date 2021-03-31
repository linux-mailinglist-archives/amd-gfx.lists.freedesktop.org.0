Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E453E35014F
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Mar 2021 15:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6351A6E201;
	Wed, 31 Mar 2021 13:36:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m121143.qiye.163.com (mail-m121143.qiye.163.com
 [115.236.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FCE6EA9E
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Mar 2021 13:21:14 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 905A3540483;
 Wed, 31 Mar 2021 21:12:26 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: use kmalloc_array over kmalloc with multiply
Date: Wed, 31 Mar 2021 06:12:18 -0700
Message-Id: <20210331131218.60768-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQhkaQ01PSxlCSUsfVkpNSkxKQk1IT01DQ0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhA6EAw6TT8PHjUaTig1NAIY
 ChIKCilVSlVKTUpMSkJNSE9MSkhMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJSkhMNwY+
X-HM-Tid: 0a788869edbcb038kuuu905a3540483
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
WARNING: Prefer kmalloc_array over kmalloc with multiply
+	buf = kmalloc(MAX_KFIFO_SIZE * sizeof(*buf), GFP_KERNEL);

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index 17d1736367ea..246522423559 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -81,7 +81,7 @@ static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
 	struct kfd_smi_client *client = filep->private_data;
 	unsigned char *buf;
 
-	buf = kmalloc(MAX_KFIFO_SIZE * sizeof(*buf), GFP_KERNEL);
+	buf = kmalloc_array(MAX_KFIFO_SIZE, sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.31.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

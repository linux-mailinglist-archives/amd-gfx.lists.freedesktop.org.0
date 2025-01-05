Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A800A01AA0
	for <lists+amd-gfx@lfdr.de>; Sun,  5 Jan 2025 17:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B5610E0DA;
	Sun,  5 Jan 2025 16:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="abVM5a29";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5310E4D1
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 Jan 2025 02:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1736045139; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=wOAbSjeiS7mzO1YA1rDb44AgmHyvgbz7tjwGZFa2qEo=;
 b=abVM5a29MAUcu9l1CWT3HOznDFZiUV10qe5d8tblVKwJuZyku6ue7pxK4sskzwjn6FnAD+ECIFWiUyCUquMHYqQ7p7J7TqdIE/qBm4/3dGjeNRJSihSNacxT5qjKU+AEJlOwh2xNjD3rFOZKdMuW5ww22Lu4UqOQaAOTK4GMlaw=
Received: from i32d02263.sqa.eu95.tbsite.net(mailfrom:gerry@linux.alibaba.com
 fp:SMTPD_---0WMx9YBC_1736045138 cluster:ay36) by smtp.aliyun-inc.com;
 Sun, 05 Jan 2025 10:45:38 +0800
From: Jiang Liu <gerry@linux.alibaba.com>
To: amd-gfx@lists.freedesktop.org, xiaogang.chen@amd.com, lijo.lazar@amd.com,
 Kent.Russell@amd.com, shuox.liu@linux.alibaba.com
Cc: Jiang Liu <gerry@linux.alibaba.com>
Subject: [PATCH v2 1/6] amdgpu: fix possible resource leakage in
 kfd_cleanup_nodes()
Date: Sun,  5 Jan 2025 10:45:29 +0800
Message-ID: <70f5963233c8a34354ec8a9efebc3a7b4c7940d4.1736044362.git.gerry@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1736044362.git.gerry@linux.alibaba.com>
References: <cover.1736044362.git.gerry@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 05 Jan 2025 16:40:26 +0000
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

Fix possible resource leakage on error recovery path in function
kgd2kfd_device_init().

Signed-off-by: Jiang Liu <gerry@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index a29374c86405..fa5054940486 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -898,15 +898,15 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 		if (kfd->adev->xcp_mgr)
 			kfd_setup_interrupt_bitmap(node, i);
 
+		spin_lock_init(&node->watch_points_lock);
+
+		kfd->nodes[i] = node;
+
 		/* Initialize the KFD node */
 		if (kfd_init_node(node)) {
 			dev_err(kfd_device, "Error initializing KFD node\n");
 			goto node_init_error;
 		}
-
-		spin_lock_init(&node->watch_points_lock);
-
-		kfd->nodes[i] = node;
 	}
 
 	svm_range_set_max_pages(kfd->adev);
@@ -921,6 +921,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	goto out;
 
 node_init_error:
+	i++;
 node_alloc_error:
 	kfd_cleanup_nodes(kfd, i);
 	kfd_doorbell_fini(kfd);
-- 
2.43.5


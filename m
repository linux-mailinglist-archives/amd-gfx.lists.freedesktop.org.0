Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215112981B
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Dec 2019 16:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222536E2DD;
	Mon, 23 Dec 2019 15:26:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3461889D4D;
 Mon, 23 Dec 2019 13:39:17 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9865AA117CA43E2C3098;
 Mon, 23 Dec 2019 21:39:12 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Dec 2019
 21:39:02 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amdgpu: use true,
 false for bool variable in amdgpu_debugfs.c
Date: Mon, 23 Dec 2019 21:46:20 +0800
Message-ID: <1577108781-68614-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577108781-68614-1-git-send-email-zhengbin13@huawei.com>
References: <1577108781-68614-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 15:26:04 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:132:2-10: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:140:2-10: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c:142:13-21: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 8e6726e..63343bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -129,7 +129,7 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 			sh_bank = 0xFFFFFFFF;
 		if (instance_bank == 0x3FF)
 			instance_bank = 0xFFFFFFFF;
-		use_bank = 1;
+		use_bank = true;
 	} else if (*pos & (1ULL << 61)) {

 		me = (*pos & GENMASK_ULL(33, 24)) >> 24;
@@ -137,9 +137,9 @@ static int  amdgpu_debugfs_process_reg_op(bool read, struct file *f,
 		queue = (*pos & GENMASK_ULL(53, 44)) >> 44;
 		vmid = (*pos & GENMASK_ULL(58, 54)) >> 54;

-		use_ring = 1;
+		use_ring = true;
 	} else {
-		use_bank = use_ring = 0;
+		use_bank = use_ring = false;
 	}

 	*pos &= (1UL << 22) - 1;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

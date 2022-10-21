Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F015607120
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Oct 2022 09:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816BB10E603;
	Fri, 21 Oct 2022 07:31:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED4C10E54B
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Oct 2022 02:22:51 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtpCN18FmzHvCF;
 Fri, 21 Oct 2022 10:22:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:44 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:43 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/11] erofs: fix possible memory leak in erofs_init_sysfs()
Date: Fri, 21 Oct 2022 10:20:59 +0800
Message-ID: <20221021022102.2231464-9-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 21 Oct 2022 07:30:36 +0000
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
Cc: alexander.deucher@amd.com, richard@nod.at, mst@redhat.com,
 gregkh@linuxfoundation.org, somlo@cmu.edu, chao@kernel.org,
 huangjianan@oppo.com, liushixin2@huawei.com, joseph.qi@linux.alibaba.com,
 luben.tuikov@amd.com, jlbec@evilplan.org, hsiangkao@linux.alibaba.com,
 rafael@kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 mark@fasheh.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Inject fault while loading module, kset_register() may fail,
if it fails, but the refcount of kobject is not decreased to
0, the name allocated in kobject_set_name() is leaked. Fix
this by calling kset_put(), so that name can be freed in
callback function kobject_cleanup().

unreferenced object 0xffff888101d228c0 (size 8):
  comm "modprobe", pid 276, jiffies 4294722700 (age 13.151s)
  hex dump (first 8 bytes):
    65 72 6f 66 73 00 ff ff                          erofs...
  backtrace:
    [<00000000e2a9a4a6>] __kmalloc_node_track_caller+0x44/0x1b0
    [<00000000b8ce02de>] kstrdup+0x3a/0x70
    [<000000004a0e01d2>] kstrdup_const+0x63/0x80
    [<00000000051b6cda>] kvasprintf_const+0x149/0x180
    [<000000004dc51dad>] kobject_set_name_vargs+0x56/0x150
    [<00000000b30f0bad>] kobject_set_name+0xab/0xe0

Fixes: 168e9a76200c ("erofs: add sysfs interface")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 fs/erofs/sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index 783bb7b21b51..653b35001bc5 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -254,8 +254,10 @@ int __init erofs_init_sysfs(void)
 	kobject_set_name(&erofs_root.kobj, "erofs");
 	erofs_root.kobj.parent = fs_kobj;
 	ret = kset_register(&erofs_root);
-	if (ret)
+	if (ret) {
+		kset_put(&erofs_root);
 		goto root_err;
+	}
 
 	ret = kobject_init_and_add(&erofs_feat, &erofs_feat_ktype,
 				   NULL, "features");
-- 
2.25.1


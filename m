Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E827665A9
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jul 2023 09:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D1710E670;
	Fri, 28 Jul 2023 07:45:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A76210E63B;
 Fri, 28 Jul 2023 04:48:30 +0000 (UTC)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RBw9J50qQz1GDKB;
 Fri, 28 Jul 2023 12:47:32 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 12:48:26 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
Date: Fri, 28 Jul 2023 13:00:42 +0800
Message-ID: <20230728050043.59880-4-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
References: <20230728050043.59880-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:45:17 +0000
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
Cc: stephen.smalley.work@gmail.com, Kefeng Wang <wangkefeng.wang@huawei.com>,
 paul@paul-moore.com, David Hildenbrand <david@redhat.com>,
 selinux@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, peterz@infradead.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, eparis@parisplace.org, linux-fsdevel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, acme@kernel.org, airlied@gmail.com,
 christian.koenig@amd.com,
 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use the helpers to simplify code.

Cc: Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: Eric Paris <eparis@parisplace.org>
Acked-by: Paul Moore <paul@paul-moore.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 security/selinux/hooks.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index c87b79a29fad..ac582c046c51 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3800,13 +3800,10 @@ static int selinux_file_mprotect(struct vm_area_struct *vma,
 	if (default_noexec &&
 	    (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
 		int rc = 0;
-		if (vma->vm_start >= vma->vm_mm->start_brk &&
-		    vma->vm_end <= vma->vm_mm->brk) {
+		if (vma_is_initial_heap(vma)) {
 			rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
 					  PROCESS__EXECHEAP, NULL);
-		} else if (!vma->vm_file &&
-			   ((vma->vm_start <= vma->vm_mm->start_stack &&
-			     vma->vm_end >= vma->vm_mm->start_stack) ||
+		} else if (!vma->vm_file && (vma_is_initial_stack(vma) ||
 			    vma_is_stack_for_current(vma))) {
 			rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
 					  PROCESS__EXECSTACK, NULL);
-- 
2.41.0


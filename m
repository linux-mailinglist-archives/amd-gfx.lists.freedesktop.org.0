Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7CF83F6C6
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Jan 2024 17:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7028D112712;
	Sun, 28 Jan 2024 16:16:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8424112710;
 Sun, 28 Jan 2024 16:16:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 50BBA61B97;
 Sun, 28 Jan 2024 16:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FEFC43394;
 Sun, 28 Jan 2024 16:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706458559;
 bh=lIoljhouP1oJTBFRiXsRV3C9KwRxMV61vpODY4Dof24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AoBB5fGlywsbZbfa75X7d2PBh4w4ZluNWhH7rltvLYc8OAqcxLoKfjyQK0dOaGIvx
 /LglXqCBlVVjSSTz8/fLUycC2Udf0RFPazJBDixoLkGPVUmOvbnaQ1OKG2kFuQZ3EM
 /IGy6fl9XenInP/g96IWFBJf22BNwGiEZ9EOPTyAe+9/oqioVtRTsw12L1r7PME2T7
 9JZ99tokGMevBGkTa4V/DyoSHx3Erp/ZI6ZkLktL7UM/oYuZOvWv8ZI5dsYOyEhPxD
 RHruvjkA+U0q7h+mq+0Aj2n6dNRxKI3pc/Dum2x/sspqUZnN8jAoDYwZ0oBeN7uDiI
 QPVa4TvNKrToQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 19/19] drm/amdkfd: Fix 'node' NULL check in
 'svm_range_get_range_boundaries()'
Date: Sun, 28 Jan 2024 11:15:16 -0500
Message-ID: <20240128161524.204182-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128161524.204182-1-sashal@kernel.org>
References: <20240128161524.204182-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.148
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

[ Upstream commit d7a254fad873775ce6c32b77796c81e81e6b7f2e ]

Range interval [start, last] is ordered by rb_tree, rb_prev, rb_next
return value still needs NULL check, thus modified from "node" to "rb_node".

Fixes the below:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:2691 svm_range_get_range_boundaries() warn: can 'node' even be NULL?

Suggested-by: Philip Yang <Philip.Yang@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index e2d4e2b42a7c..7f55decc5f37 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2325,6 +2325,7 @@ svm_range_get_range_boundaries(struct kfd_process *p, int64_t addr,
 {
 	struct vm_area_struct *vma;
 	struct interval_tree_node *node;
+	struct rb_node *rb_node;
 	unsigned long start_limit, end_limit;
 
 	vma = find_vma(p->mm, addr << PAGE_SHIFT);
@@ -2341,16 +2342,15 @@ svm_range_get_range_boundaries(struct kfd_process *p, int64_t addr,
 	if (node) {
 		end_limit = min(end_limit, node->start);
 		/* Last range that ends before the fault address */
-		node = container_of(rb_prev(&node->rb),
-				    struct interval_tree_node, rb);
+		rb_node = rb_prev(&node->rb);
 	} else {
 		/* Last range must end before addr because
 		 * there was no range after addr
 		 */
-		node = container_of(rb_last(&p->svms.objects.rb_root),
-				    struct interval_tree_node, rb);
+		rb_node = rb_last(&p->svms.objects.rb_root);
 	}
-	if (node) {
+	if (rb_node) {
+		node = container_of(rb_node, struct interval_tree_node, rb);
 		if (node->last >= addr) {
 			WARN(1, "Overlap with prev node and page fault addr\n");
 			return -EFAULT;
-- 
2.43.0


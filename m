Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5824D98C
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Aug 2020 18:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AC76EB0B;
	Fri, 21 Aug 2020 16:14:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC69C6EAE3;
 Fri, 21 Aug 2020 16:14:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F025921741;
 Fri, 21 Aug 2020 16:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026489;
 bh=RJwd1uKYXJaRiQrAeGa+5Z1ZPgPgI4udkNpDS43Xuvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TOqIQKZ9RQb1RT8Uvfi2E7znoLKzc1VGb+fESf7mWy35HLRdPCLLguPLXWUPy4lMg
 8q/puSn7P5kYHJkjom1gQTDrL4sAyob1/rjLW1rI1xX/WJpCmqT3CLaXHoqKlHEYWO
 dMjlP7O2IWuI8MncXLhSqB/ix438IqLJBt31NOp0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 21/62] drm/amdkfd: Fix reference count leaks.
Date: Fri, 21 Aug 2020 12:13:42 -0400
Message-Id: <20200821161423.347071-21-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161423.347071-1-sashal@kernel.org>
References: <20200821161423.347071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Qiushi Wu <wu000273@umn.edu>, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Qiushi Wu <wu000273@umn.edu>

[ Upstream commit 20eca0123a35305e38b344d571cf32768854168c ]

kobject_init_and_add() takes reference even when it fails.
If this function returns an error, kobject_put() must be called to
properly clean up the memory associated with the object.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index bb77f7af2b6d9..dc3c4149f8600 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -632,8 +632,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 
 	ret = kobject_init_and_add(dev->kobj_node, &node_type,
 			sys_props.kobj_nodes, "%d", id);
-	if (ret < 0)
+	if (ret < 0) {
+		kobject_put(dev->kobj_node);
 		return ret;
+	}
 
 	dev->kobj_mem = kobject_create_and_add("mem_banks", dev->kobj_node);
 	if (!dev->kobj_mem)
@@ -680,8 +682,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 			return -ENOMEM;
 		ret = kobject_init_and_add(mem->kobj, &mem_type,
 				dev->kobj_mem, "%d", i);
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(mem->kobj);
 			return ret;
+		}
 
 		mem->attr.name = "properties";
 		mem->attr.mode = KFD_SYSFS_FILE_MODE;
@@ -699,8 +703,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 			return -ENOMEM;
 		ret = kobject_init_and_add(cache->kobj, &cache_type,
 				dev->kobj_cache, "%d", i);
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(cache->kobj);
 			return ret;
+		}
 
 		cache->attr.name = "properties";
 		cache->attr.mode = KFD_SYSFS_FILE_MODE;
@@ -718,8 +724,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
 			return -ENOMEM;
 		ret = kobject_init_and_add(iolink->kobj, &iolink_type,
 				dev->kobj_iolink, "%d", i);
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(iolink->kobj);
 			return ret;
+		}
 
 		iolink->attr.name = "properties";
 		iolink->attr.mode = KFD_SYSFS_FILE_MODE;
@@ -798,8 +806,10 @@ static int kfd_topology_update_sysfs(void)
 		ret = kobject_init_and_add(sys_props.kobj_topology,
 				&sysprops_type,  &kfd_device->kobj,
 				"topology");
-		if (ret < 0)
+		if (ret < 0) {
+			kobject_put(sys_props.kobj_topology);
 			return ret;
+		}
 
 		sys_props.kobj_nodes = kobject_create_and_add("nodes",
 				sys_props.kobj_topology);
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

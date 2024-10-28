Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFDD9B44F8
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2024 09:55:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E1E10E5E4;
	Tue, 29 Oct 2024 08:55:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1199 seconds by postgrey-1.36 at gabe;
 Mon, 28 Oct 2024 14:18:43 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280A910E4C7
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Oct 2024 14:18:43 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XcZfv6FFzzfbY3;
 Mon, 28 Oct 2024 21:56:07 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
 by mail.maildlp.com (Postfix) with ESMTPS id 97CF8140135;
 Mon, 28 Oct 2024 21:58:40 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 28 Oct 2024 21:58:39 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <alexander.deucher@amd.com>, <lijo.lazar@amd.com>
CC: <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Hawking.Zhang@amd.com>, <yifan1.zhang@amd.com>,
 <Likun.Gao@amd.com>, <Tim.Huang@amd.com>, <pratap.nirujogi@amd.com>,
 <victorchengchi.lu@amd.com>, <Jun.Ma2@amd.com>, <le.ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lihuafei1@huawei.com>
Subject: [PATCH] drm/amdgpu: Fix possible NULL pointer dereference
Date: Tue, 29 Oct 2024 05:59:33 +0800
Message-ID: <20241028215933.2599271-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.74]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500004.china.huawei.com (7.202.181.242)
X-Mailman-Approved-At: Tue, 29 Oct 2024 08:55:06 +0000
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

Fix the potential NULL pointer dereference on mem_ranges in
amdgpu_discovery_get_nps_info(). Additionally, assign the output
parameters nps_type and range_cnt after the kvzalloc() call to prevent
modifying the output parameters in case of an error return.

Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 4bd61c169ca8..1b1aedebb3c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
 
 	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
 	case 1:
-		*nps_type = nps_info->v1.nps_type;
-		*range_cnt = nps_info->v1.count;
 		mem_ranges = kvzalloc(
 			*range_cnt * sizeof(struct amdgpu_gmc_memrange),
 			GFP_KERNEL);
+		if (!mem_ranges)
+			return -ENOMEM;
+		*nps_type = nps_info->v1.nps_type;
+		*range_cnt = nps_info->v1.count;
 		for (i = 0; i < *range_cnt; i++) {
 			mem_ranges[i].base_address =
 				nps_info->v1.instance_info[i].base_address;
-- 
2.25.1


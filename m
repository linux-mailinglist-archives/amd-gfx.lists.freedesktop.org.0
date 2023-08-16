Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77A77DB4A
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Aug 2023 09:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC0E10E2A2;
	Wed, 16 Aug 2023 07:41:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125C110E2B2;
 Wed, 16 Aug 2023 02:20:18 +0000 (UTC)
Received: from dggpemm500016.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RQWz23FdrzrSPZ;
 Wed, 16 Aug 2023 10:18:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 16 Aug
 2023 10:20:14 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <luben.tuikov@amd.com>, <tzimmermann@suse.de>, <javierm@redhat.com>,
 <srinivasan.shanmugam@amd.com>, <xurui@kylinos.cn>, <hongao@uniontech.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next v3] drm/amd/amdgpu: Use kmemdup to simplify kmalloc and
 memcpy logic
Date: Wed, 16 Aug 2023 10:19:58 +0800
Message-ID: <20230816021958.1921084-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 16 Aug 2023 07:41:20 +0000
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
Cc: chenjiahao16@huawei.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Using kmemdup() helper function rather than implementing it again
with kmalloc() + memcpy(), which improves the code readability.

Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index d34037b85cf8..7473a42f7d45 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -264,16 +264,9 @@ struct edid *amdgpu_connector_edid(struct drm_connector *connector)
 static struct edid *
 amdgpu_connector_get_hardcoded_edid(struct amdgpu_device *adev)
 {
-	struct edid *edid;
-
 	if (adev->mode_info.bios_hardcoded_edid) {
-		edid = kmalloc(adev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
-		if (edid) {
-			memcpy((unsigned char *)edid,
-			       (unsigned char *)adev->mode_info.bios_hardcoded_edid,
-			       adev->mode_info.bios_hardcoded_edid_size);
-			return edid;
-		}
+		return kmemdup((unsigned char *)adev->mode_info.bios_hardcoded_edid,
+			       adev->mode_info.bios_hardcoded_edid_size, GFP_KERNEL);
 	}
 	return NULL;
 }
-- 
2.34.1


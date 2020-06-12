Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D981F78B9
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2020 15:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D786E17B;
	Fri, 12 Jun 2020 13:22:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from m17617.mail.qiye.163.com (m17617.mail.qiye.163.com
 [59.111.176.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEADC6E07D
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2020 12:28:34 +0000 (UTC)
Received: from njvxl5505.vivo.xyz (unknown [157.0.31.125])
 by m17617.mail.qiye.163.com (Hmail) with ESMTPA id 070B72616BF;
 Fri, 12 Jun 2020 20:28:32 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: remove unnecessary conversion to bool
Date: Fri, 12 Jun 2020 20:28:24 +0800
Message-Id: <20200612122825.10450-1-bernard@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUwfT09KGUNJHhoeVkpOQkpCTU9CSklKTEJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OhA6Nww6DTgzTgsiNRMLLBpR
 MwJPCw1VSlVKTkJKQk1PQkpJTkNJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSUtCQzcG
X-HM-Tid: 0a72a880ca2b9375kuws070b72616bf
X-Mailman-Approved-At: Fri, 12 Jun 2020 13:22:02 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

In function is_support_sw_smu, remove unnecessary conversion
to bool return, this change is to make the code a bit readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 8c684a6e0156..3e1cfb010378 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -568,7 +568,7 @@ int smu_update_table(struct smu_context *smu, enum smu_table_id table_index, int
 bool is_support_sw_smu(struct amdgpu_device *adev)
 {
 	if (adev->asic_type == CHIP_VEGA20)
-		return (amdgpu_dpm == 2) ? true : false;
+		return (amdgpu_dpm == 2);
 	else if (adev->asic_type >= CHIP_ARCTURUS) {
 	      if (amdgpu_sriov_is_pp_one_vf(adev) || !amdgpu_sriov_vf(adev))
 			return true;
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

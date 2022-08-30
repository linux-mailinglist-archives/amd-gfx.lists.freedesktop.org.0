Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE535A69AD
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Aug 2022 19:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0045410E264;
	Tue, 30 Aug 2022 17:22:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6510410E265;
 Tue, 30 Aug 2022 17:22:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B19BB81D14;
 Tue, 30 Aug 2022 17:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF742C433C1;
 Tue, 30 Aug 2022 17:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880122;
 bh=eNmdi/BoP7WYZz4B7PTE9g7lLo2eJ9DD+Kgpxwy77wE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PUlvtRKsFXUF/auB3zeLbs+sb67LC9t42d0/OKwxYomC/6YWv5cfZ0YXHMTW0IW8l
 ROomTqVdSM76VU6LsjH00Qp0t9DKVOkgad22SsQz3+LH6G5bZvgI4FJXJQd5etmyG6
 SjLc0+bMjY4TliGNVwE5y47L3fbc2B4DlepQSWCm6+2T/D9RElUpiE6Rw1vcoWaTFW
 I+nJTSgA3J4XWUMtE5cYrfBdA0tPHMmy2eSYu/yQW/F3IK9pNAtw6c2ydr8DNdkOom
 3Xz2TJAXiuQqFVhzNfdZmQJax/bcm4dHedSr6kk7WV8ySdq6Zm1b+XwqIuzmxSV0PW
 h2Avb9y3WkFRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/23] drm/amdgpu: Move psp_xgmi_terminate call
 from amdgpu_xgmi_remove_device to psp_hw_fini
Date: Tue, 30 Aug 2022 13:21:23 -0400
Message-Id: <20220830172141.581086-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172141.581086-1-sashal@kernel.org>
References: <20220830172141.581086-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 tao.zhou1@amd.com, guchun.chen@amd.com, airlied@linux.ie, Bokun.Zhang@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, bernard@vivo.com, Alex Deucher <alexander.deucher@amd.com>,
 Likun.Gao@amd.com, candice.li@amd.com, john.clements@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: YiPeng Chai <YiPeng.Chai@amd.com>

[ Upstream commit 9d705d7741ae70764f3d6d87e67fad3b5c30ffd0 ]

V1:
The amdgpu_xgmi_remove_device function will send unload command
to psp through psp ring to terminate xgmi, but psp ring has been
destroyed in psp_hw_fini.

V2:
1. Change the commit title.
2. Restore amdgpu_xgmi_remove_device to its original calling location.
   Move psp_xgmi_terminate call from amdgpu_xgmi_remove_device to
   psp_hw_fini.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 57e9932d8a04e..5b41c29f3ed50 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2729,6 +2729,9 @@ static int psp_hw_fini(void *handle)
 		psp_rap_terminate(psp);
 		psp_dtm_terminate(psp);
 		psp_hdcp_terminate(psp);
+
+		if (adev->gmc.xgmi.num_physical_nodes > 1)
+			psp_xgmi_terminate(psp);
 	}
 
 	psp_asd_unload(psp);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index a799e0b1ff736..ce0b9cb61f582 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -723,7 +723,7 @@ int amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
 		amdgpu_put_xgmi_hive(hive);
 	}
 
-	return psp_xgmi_terminate(&adev->psp);
+	return 0;
 }
 
 static int amdgpu_xgmi_ras_late_init(struct amdgpu_device *adev)
-- 
2.35.1


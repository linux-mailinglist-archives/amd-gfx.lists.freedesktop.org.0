Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC227251F
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Sep 2020 15:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E3E6E15A;
	Mon, 21 Sep 2020 13:14:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512CE6E248;
 Mon, 21 Sep 2020 08:02:19 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 29D167B954BCB2482875;
 Mon, 21 Sep 2020 16:02:17 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:06 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amd/pm: simplify the return expression of
 smu_hw_fini
Date: Mon, 21 Sep 2020 16:24:30 +0800
Message-ID: <20200921082430.2591201-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 21 Sep 2020 13:14:30 +0000
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
Cc: Liu Shixin <liushixin2@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 5c4b74f964fc..3612841d40dc 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1214,7 +1214,6 @@ static int smu_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct smu_context *smu = &adev->smu;
-	int ret = 0;
 
 	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
@@ -1230,11 +1229,7 @@ static int smu_hw_fini(void *handle)
 
 	adev->pm.dpm_enabled = false;
 
-	ret = smu_smc_hw_cleanup(smu);
-	if (ret)
-		return ret;
-
-	return 0;
+	return smu_smc_hw_cleanup(smu);
 }
 
 int smu_reset(struct smu_context *smu)
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

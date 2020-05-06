Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB21C72CB
	for <lists+amd-gfx@lfdr.de>; Wed,  6 May 2020 16:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328C089AE6;
	Wed,  6 May 2020 14:27:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798EE89830;
 Wed,  6 May 2020 14:26:31 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0A863E6B18222A3F57BF;
 Wed,  6 May 2020 22:26:27 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 22:26:18 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/14] drm/radeon: remove comparison to bool in ci_dpm.c
Date: Wed, 6 May 2020 22:33:14 +0800
Message-ID: <20200506143326.66467-3-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200506143326.66467-1-zhengbin13@huawei.com>
References: <20200506143326.66467-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 May 2020 14:27:48 +0000
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

drivers/gpu/drm/radeon/ci_dpm.c:814:5-26: WARNING: Comparison to bool
drivers/gpu/drm/radeon/ci_dpm.c:2916:6-21: WARNING: Comparison to bool

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index 134aa2b01f90..c77ca911a8b6 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -811,7 +811,7 @@ static void ci_apply_state_adjust_rules(struct radeon_device *rdev,
 	else
 		max_limits = &rdev->pm.dpm.dyn_state.max_clock_voltage_on_dc;

-	if (rdev->pm.dpm.ac_power == false) {
+	if (!rdev->pm.dpm.ac_power) {
 		for (i = 0; i < ps->performance_level_count; i++) {
 			if (ps->performance_levels[i].mclk > max_limits->mclk)
 				ps->performance_levels[i].mclk = max_limits->mclk;
@@ -2913,7 +2913,7 @@ static int ci_populate_single_memory_level(struct radeon_device *rdev,

 	if (pi->mclk_stutter_mode_threshold &&
 	    (memory_clock <= pi->mclk_stutter_mode_threshold) &&
-	    (pi->uvd_enabled == false) &&
+	    !pi->uvd_enabled &&
 	    (RREG32(DPG_PIPE_STUTTER_CONTROL) & STUTTER_ENABLE) &&
 	    (rdev->pm.dpm.new_active_crtc_count <= 2))
 		memory_level->StutterEnable = true;
--
2.26.0.106.g9fadedd

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

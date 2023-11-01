Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E747DDDAE
	for <lists+amd-gfx@lfdr.de>; Wed,  1 Nov 2023 09:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7050610E65C;
	Wed,  1 Nov 2023 08:20:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Wed, 01 Nov 2023 03:04:33 UTC
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id A044C10E030
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Nov 2023 03:04:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id A887A605164A1;
 Wed,  1 Nov 2023 10:58:04 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon/ni_dpm: add an error code check in ni_dpm_init
Date: Wed,  1 Nov 2023 10:57:53 +0800
Message-Id: <20231101025752.988228-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 Nov 2023 08:20:14 +0000
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Su Hui <suhui@nfschina.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ni_patch_single_dependency_table_based_on_leakage() return zero or
negative error code. But ni_patch_dependency_tables_based_on_leakage()
doesn't check the return value of the first function call. It's same for
ni_dpm_init(). It's better to add this error code check.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/radeon/ni_dpm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
index 3e1c1a392fb7..f521dc929a06 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -1010,6 +1010,8 @@ static int ni_patch_dependency_tables_based_on_leakage(struct radeon_device *rde
 
 	ret = ni_patch_single_dependency_table_based_on_leakage(rdev,
 								&rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk);
+	if (ret)
+		return ret;
 
 	ret = ni_patch_single_dependency_table_based_on_leakage(rdev,
 								&rdev->pm.dpm.dyn_state.vddc_dependency_on_mclk);
@@ -4098,7 +4100,12 @@ int ni_dpm_init(struct radeon_device *rdev)
 	rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[3].clk = 72000;
 	rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries[3].v = 900;
 
-	ni_patch_dependency_tables_based_on_leakage(rdev);
+	ret = ni_patch_dependency_tables_based_on_leakage(rdev);
+	if (ret) {
+		kfree(rdev->pm.dpm.dyn_state.vddc_dependency_on_dispclk.entries);
+		r600_free_extended_power_table(rdev);
+		return ret;
+	}
 
 	if (rdev->pm.dpm.voltage_response_time == 0)
 		rdev->pm.dpm.voltage_response_time = R600_VOLTAGERESPONSETIME_DFLT;
-- 
2.30.2


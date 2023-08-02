Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E9476C682
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C67E10E4EA;
	Wed,  2 Aug 2023 07:20:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B7D10E37B;
 Tue,  1 Aug 2023 09:38:47 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5111754|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0993225-0.000355378-0.900322; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047192; MF=sunran001@208suo.com; NM=1; PH=DS; RN=7; RT=7; SR=0;
 TI=SMTPD_---.U5s-DtI_1690882719; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5s-DtI_1690882719) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:38:40 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in vega12_hwmgr.h
Date: Tue,  1 Aug 2023 09:38:32 +0000
Message-Id: <20230801093832.7849-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:20:04 +0000
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following enum go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h
index aa63ae41942d..9f2ce4308548 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.h
@@ -38,8 +38,7 @@
 #define VG12_PSUEDO_NUM_DCEFCLK_DPM_LEVELS  8
 #define VG12_PSUEDO_NUM_UCLK_DPM_LEVELS     4
 
-enum
-{
+enum {
 	GNLD_DPM_PREFETCHER = 0,
 	GNLD_DPM_GFXCLK,
 	GNLD_DPM_UCLK,
-- 
2.17.1


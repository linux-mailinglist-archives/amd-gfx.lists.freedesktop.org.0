Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5D276C68C
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361FC10E501;
	Wed,  2 Aug 2023 07:20:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-127.mail.aliyun.com (out28-127.mail.aliyun.com
 [115.124.28.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA42A10E47D;
 Wed,  2 Aug 2023 01:39:49 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5120696|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_alarm|0.141021-0.000878557-0.858101; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047201; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6Iz1dD_1690940380; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6Iz1dD_1690940380) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 09:39:42 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/pm: Clean up errors in hardwaremanager.h
Date: Wed,  2 Aug 2023 01:39:39 +0000
Message-Id: <20230802013939.8855-1-sunran001@208suo.com>
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

ERROR: open brace '{' following struct go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h b/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h
index 01a7d66864f2..f4f9a104d170 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hardwaremanager.h
@@ -44,8 +44,7 @@ struct phm_fan_speed_info {
 };
 
 /* Automatic Power State Throttling */
-enum PHM_AutoThrottleSource
-{
+enum PHM_AutoThrottleSource {
     PHM_AutoThrottleSource_Thermal,
     PHM_AutoThrottleSource_External
 };
-- 
2.17.1


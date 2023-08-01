Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB976C65F
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D674F10E4D4;
	Wed,  2 Aug 2023 07:20:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com [115.124.28.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B32010E386;
 Tue,  1 Aug 2023 09:51:05 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0973273|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0380037-4.3357e-05-0.961953;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5shFFo_1690883457; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5shFFo_1690883457) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:50:58 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Clean up errors in smu9_driver_if.h
Date: Tue,  1 Aug 2023 09:50:56 +0000
Message-Id: <20230801095056.8120-1-sunran001@208suo.com>
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

ERROR: space prohibited before open square bracket '['

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../drm/amd/pm/powerplay/inc/smu9_driver_if.h | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h b/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h
index faae4b918d90..2c69a5694f94 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/smu9_driver_if.h
@@ -178,20 +178,20 @@ typedef struct {
   uint8_t      padding8_2[2];
 
   /* SOC Frequencies */
-  PllSetting_t GfxclkLevel        [NUM_GFXCLK_DPM_LEVELS];
+  PllSetting_t GfxclkLevel[NUM_GFXCLK_DPM_LEVELS];
 
-  uint8_t      SocclkDid          [NUM_SOCCLK_DPM_LEVELS];          /* DID */
-  uint8_t      SocDpmVoltageIndex [NUM_SOCCLK_DPM_LEVELS];
+  uint8_t      SocclkDid[NUM_SOCCLK_DPM_LEVELS];          /* DID */
+  uint8_t      SocDpmVoltageIndex[NUM_SOCCLK_DPM_LEVELS];
 
-  uint8_t      VclkDid            [NUM_UVD_DPM_LEVELS];            /* DID */
-  uint8_t      DclkDid            [NUM_UVD_DPM_LEVELS];            /* DID */
-  uint8_t      UvdDpmVoltageIndex [NUM_UVD_DPM_LEVELS];
+  uint8_t      VclkDid[NUM_UVD_DPM_LEVELS];            /* DID */
+  uint8_t      DclkDid[NUM_UVD_DPM_LEVELS];            /* DID */
+  uint8_t      UvdDpmVoltageIndex[NUM_UVD_DPM_LEVELS];
 
-  uint8_t      EclkDid            [NUM_VCE_DPM_LEVELS];            /* DID */
-  uint8_t      VceDpmVoltageIndex [NUM_VCE_DPM_LEVELS];
+  uint8_t      EclkDid[NUM_VCE_DPM_LEVELS];            /* DID */
+  uint8_t      VceDpmVoltageIndex[NUM_VCE_DPM_LEVELS];
 
-  uint8_t      Mp0clkDid          [NUM_MP0CLK_DPM_LEVELS];          /* DID */
-  uint8_t      Mp0DpmVoltageIndex [NUM_MP0CLK_DPM_LEVELS];
+  uint8_t      Mp0clkDid[NUM_MP0CLK_DPM_LEVELS];          /* DID */
+  uint8_t      Mp0DpmVoltageIndex[NUM_MP0CLK_DPM_LEVELS];
 
   DisplayClockTable_t DisplayClockTable[DSPCLK_COUNT][NUM_DSPCLK_LEVELS];
   QuadraticInt_t      DisplayClock2Gfxclk[DSPCLK_COUNT];
-- 
2.17.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC976C661
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC3710E4D6;
	Wed,  2 Aug 2023 07:20:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com
 [115.124.28.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21B110E49D;
 Wed,  2 Aug 2023 06:29:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4821605|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0156286-0.000344936-0.984026; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047212; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6XgVxA_1690957761; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6XgVxA_1690957761) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:29:23 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in dmub_cmd.h
Date: Wed,  2 Aug 2023 06:29:20 +0000
Message-Id: <20230802062920.11513-1-sunran001@208suo.com>
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

ERROR: Use C99 flexible arrays

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index adde1d84d773..b64740977fc8 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -1165,7 +1165,7 @@ struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 {
 			uint16_t vtotal;
 			uint16_t htotal;
 			uint8_t vblank_pipe_index;
-			uint8_t padding[1];
+			uint8_t padding[];
 			struct {
 				uint8_t drr_in_use;
 				uint8_t drr_window_size_ms;	// Indicates largest VMIN/VMAX adjustment per frame
@@ -3056,7 +3056,7 @@ struct dmub_cmd_abm_set_pwm_frac_data {
 	/**
 	 * Explicit padding to 4 byte boundary.
 	 */
-	uint8_t pad[2];
+	uint8_t pad[];
 };
 
 /**
-- 
2.17.1


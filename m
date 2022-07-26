Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C41581378
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Jul 2022 14:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2743E8FA96;
	Tue, 26 Jul 2022 12:54:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8F111B5B7;
 Tue, 26 Jul 2022 07:27:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R981e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VKUPgkw_1658820420; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VKUPgkw_1658820420) by smtp.aliyun-inc.com;
 Tue, 26 Jul 2022 15:27:03 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 10/20] drm/amd/display: Clean up some inconsistent indenting
Date: Tue, 26 Jul 2022 15:25:45 +0800
Message-Id: <20220726072555.91323-10-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
References: <20220726072555.91323-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Jul 2022 12:54:21 +0000
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

No functional modification involved.

smatch warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:116 mpc3_get_ogam_current() warn: inconsistent indenting.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_mpc.c:445 mpc3_get_shaper_current() warn: inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  | 70 +++++++++----------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index 1981a71b961b..ad1c1b703874 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -109,32 +109,32 @@ enum dc_lut_mode mpc3_get_ogam_current(struct mpc *mpc, int mpcc_id)
 	uint32_t state_ram_lut_in_use;
 	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
 
-	REG_GET_2(MPCC_OGAM_CONTROL[mpcc_id],
-			MPCC_OGAM_MODE_CURRENT, &state_mode,
-			MPCC_OGAM_SELECT_CURRENT, &state_ram_lut_in_use);
+	REG_GET_2(MPCC_OGAM_CONTROL[mpcc_id], MPCC_OGAM_MODE_CURRENT, &state_mode,
+		  MPCC_OGAM_SELECT_CURRENT, &state_ram_lut_in_use);
 
-		switch (state_mode) {
+	switch (state_mode) {
+	case 0:
+		mode = LUT_BYPASS;
+		break;
+	case 2:
+		switch (state_ram_lut_in_use) {
 		case 0:
-			mode = LUT_BYPASS;
+			mode = LUT_RAM_A;
 			break;
-		case 2:
-			switch (state_ram_lut_in_use) {
-			case 0:
-				mode = LUT_RAM_A;
-				break;
-			case 1:
-				mode = LUT_RAM_B;
-				break;
-			default:
-				mode = LUT_BYPASS;
-				break;
-			}
+		case 1:
+			mode = LUT_RAM_B;
 			break;
 		default:
 			mode = LUT_BYPASS;
 			break;
 		}
-		return mode;
+		break;
+	default:
+		mode = LUT_BYPASS;
+		break;
+	}
+
+	return mode;
 }
 
 void mpc3_power_on_ogam_lut(
@@ -439,24 +439,24 @@ static enum dc_lut_mode mpc3_get_shaper_current(struct mpc *mpc, uint32_t rmu_id
 	uint32_t state_mode;
 	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
 
-	REG_GET(SHAPER_CONTROL[rmu_idx],
-			MPC_RMU_SHAPER_LUT_MODE_CURRENT, &state_mode);
+	REG_GET(SHAPER_CONTROL[rmu_idx], MPC_RMU_SHAPER_LUT_MODE_CURRENT, &state_mode);
 
-		switch (state_mode) {
-		case 0:
-			mode = LUT_BYPASS;
-			break;
-		case 1:
-			mode = LUT_RAM_A;
-			break;
-		case 2:
-			mode = LUT_RAM_B;
-			break;
-		default:
-			mode = LUT_BYPASS;
-			break;
-		}
-		return mode;
+	switch (state_mode) {
+	case 0:
+		mode = LUT_BYPASS;
+		break;
+	case 1:
+		mode = LUT_RAM_A;
+		break;
+	case 2:
+		mode = LUT_RAM_B;
+		break;
+	default:
+		mode = LUT_BYPASS;
+		break;
+	}
+
+	return mode;
 }
 
 static void mpc3_configure_shaper_lut(
-- 
2.20.1.7.g153144c


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D4263EC0
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Sep 2020 09:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938FF6E2CC;
	Thu, 10 Sep 2020 07:29:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 433 seconds by postgrey-1.36 at gabe;
 Thu, 10 Sep 2020 02:12:47 UTC
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7323F89D67
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Sep 2020 02:12:47 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 62E7F4826B1;
 Thu, 10 Sep 2020 10:05:28 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 abdoulaye berthe <abdoulaye.berthe@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, jinlong zhang <jinlong.zhang@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: optimize code runtime a bit
Date: Wed,  9 Sep 2020 19:05:04 -0700
Message-Id: <20200910020520.9973-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGh1KHR8aS0xJSkJPVkpOQkJMS0hOSUNMQkxVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MVE6Dgw5OT8dQx1ONQguAgIw
 SisaFE9VSlVKTkJCTEtITklCSEtCVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSEhCSTcG
X-HM-Tid: 0a7475c2b50f93bakuws62e7f4826b1
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:29:37 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

In fnction is_cr_done & is_ch_eq_done, when done = false
happened once, no need to circle left ln_count.
This change is to make the code run a bit fast.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index b2be6ad5101d..53e30be8b66a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -373,34 +373,30 @@ static void dpcd_set_lt_pattern_and_lane_settings(
 static bool is_cr_done(enum dc_lane_count ln_count,
 	union lane_status *dpcd_lane_status)
 {
-	bool done = true;
 	uint32_t lane;
 	/*LANEx_CR_DONE bits All 1's?*/
 	for (lane = 0; lane < (uint32_t)(ln_count); lane++) {
 		if (!dpcd_lane_status[lane].bits.CR_DONE_0)
-			done = false;
+			return false;
 	}
-	return done;
-
+	return true;
 }
 
 static bool is_ch_eq_done(enum dc_lane_count ln_count,
 	union lane_status *dpcd_lane_status,
 	union lane_align_status_updated *lane_status_updated)
 {
-	bool done = true;
 	uint32_t lane;
 	if (!lane_status_updated->bits.INTERLANE_ALIGN_DONE)
-		done = false;
+		return false;
 	else {
 		for (lane = 0; lane < (uint32_t)(ln_count); lane++) {
 			if (!dpcd_lane_status[lane].bits.SYMBOL_LOCKED_0 ||
 				!dpcd_lane_status[lane].bits.CHANNEL_EQ_DONE_0)
-				done = false;
+				return false;
 		}
 	}
-	return done;
-
+	return true;
 }
 
 static void update_drive_settings(
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

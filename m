Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE830BF6A
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Feb 2021 14:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13856E48E;
	Tue,  2 Feb 2021 13:31:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Tue, 02 Feb 2021 12:27:10 UTC
Received: from mail-m17640.qiye.163.com (mail-m17640.qiye.163.com
 [59.111.176.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4CE89D7F
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Feb 2021 12:27:10 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 7EA72540468;
 Tue,  2 Feb 2021 20:19:32 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Aric Cyr <aric.cyr@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Martin Tsai <martin.tsai@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>,
 Vladimir Stempen <vladimir.stempen@amd.com>,
 jinlong zhang <jinlong.zhang@amd.com>,
 Joshua Aberback <joshua.aberback@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] amd/display: remove unneeded variable: "pattern"
Date: Tue,  2 Feb 2021 04:19:24 -0800
Message-Id: <20210202121927.15153-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSk1MShhCQh1KShpOVkpNSklJTUNITElDQkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6TBw5DT8NEzY9MigBKQg1
 VhBPCz5VSlVKTUpJSU1DSExISEpDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSUNDTDcG
X-HM-Tid: 0a7762af0364d995kuws7ea72540468
X-Mailman-Approved-At: Tue, 02 Feb 2021 13:31:35 +0000
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

Remove unneeded variable: "pattern".

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index f95bade59624..d77ae58210f6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -126,9 +126,7 @@ static void dpcd_set_training_pattern(
 static enum dc_dp_training_pattern decide_cr_training_pattern(
 		const struct dc_link_settings *link_settings)
 {
-	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_1;
-
-	return pattern;
+	return DP_TRAINING_PATTERN_SEQUENCE_1;
 }
 
 static enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
-- 
2.29.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

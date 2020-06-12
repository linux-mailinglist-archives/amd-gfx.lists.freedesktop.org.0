Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE141F78B8
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2020 15:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CE36E12C;
	Fri, 12 Jun 2020 13:22:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 367 seconds by postgrey-1.36 at gabe;
 Fri, 12 Jun 2020 12:05:12 UTC
Received: from m17617.mail.qiye.163.com (m17617.mail.qiye.163.com
 [59.111.176.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D75A6E954
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2020 12:05:12 +0000 (UTC)
Received: from njvxl5505.vivo.xyz (unknown [157.0.31.125])
 by m17617.mail.qiye.163.com (Hmail) with ESMTPA id A1813261630;
 Fri, 12 Jun 2020 19:58:58 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Anthony Koo <Anthony.Koo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Wyatt Wood <wyatt.wood@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: add missing fill of the array`s first element
Date: Fri, 12 Jun 2020 19:58:48 +0800
Message-Id: <20200612115851.7123-1-bernard@vivo.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGE4dGElNGBpMS0MfVkpOQkpCTUhKSENCTEpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ny46ATo6GTgrFQsONT4XIygo
 GToKFBdVSlVKTkJKQk1ISkhCSEhKVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSU5DTjcG
X-HM-Tid: 0a72a865bb389375kuwsa1813261630
X-Mailman-Approved-At: Fri, 12 Jun 2020 13:22:02 +0000
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
Cc: opensource.kernel@vivo.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

In function fill_iram_v_2, the ram_table->bright_neg_gain`s
first element [0][0] seems to be missing. This change is just
to make the code a bit readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/modules/power/power_helpers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 8c37bcc27132..7604a01be19c 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -350,6 +350,7 @@ void fill_iram_v_2(struct iram_table_v_2 *ram_table, struct dmcu_iram_parameters
 	ram_table->bright_pos_gain[4][1] = 0x20;
 	ram_table->bright_pos_gain[4][2] = 0x20;
 	ram_table->bright_pos_gain[4][3] = 0x20;
+	ram_table->bright_neg_gain[0][0] = 0x00;
 	ram_table->bright_neg_gain[0][1] = 0x00;
 	ram_table->bright_neg_gain[0][2] = 0x00;
 	ram_table->bright_neg_gain[0][3] = 0x00;
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

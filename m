Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB8343B90
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Mar 2021 09:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6F189DAB;
	Mon, 22 Mar 2021 08:19:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F29D89F4F;
 Mon, 22 Mar 2021 02:22:12 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0USpamAx_1616379725; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0USpamAx_1616379725) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 22 Mar 2021 10:22:10 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: harry.wentland@amd.com
Subject: [PATCH] drm/amd/display: Remove unnecessary conversion to bool
Date: Mon, 22 Mar 2021 10:22:03 +0800
Message-Id: <1616379723-104309-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Mon, 22 Mar 2021 08:19:58 +0000
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following coccicheck warnings:

./drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c:875:62-67: WARNING:
conversion to bool not needed here.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index 3e6f760..5692a8b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -872,7 +872,7 @@ bool mpc3_program_shaper(
 	else
 		next_mode = LUT_RAM_A;
 
-	mpc3_configure_shaper_lut(mpc, next_mode == LUT_RAM_A ? true:false, rmu_idx);
+	mpc3_configure_shaper_lut(mpc, next_mode == LUT_RAM_A, rmu_idx);
 
 	if (next_mode == LUT_RAM_A)
 		mpc3_program_shaper_luta_settings(mpc, params, rmu_idx);
-- 
1.8.3.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

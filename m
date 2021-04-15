Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D0360BC6
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Apr 2021 16:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51EC6EA57;
	Thu, 15 Apr 2021 14:26:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 15 Apr 2021 09:35:28 UTC
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3076EA1C
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Apr 2021 09:35:28 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UVdYADO_1618479022; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UVdYADO_1618479022) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 15 Apr 2021 17:30:23 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/radeon/si: Fix inconsistent indenting
Date: Thu, 15 Apr 2021 17:30:20 +0800
Message-Id: <1618479020-38198-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Thu, 15 Apr 2021 14:26:49 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Kernel test robot throws below warning ->

smatch warnings:
drivers/gpu/drm/radeon/si.c:4514 si_vm_packet3_cp_dma_check() warn:
inconsistent indenting

Fixed the inconsistent indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/radeon/si.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 88731b79..d0e94b1 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -4511,7 +4511,7 @@ static int si_vm_packet3_cp_dma_check(u32 *ib, u32 idx)
 			} else {
 				for (i = 0; i < (command & 0x1fffff); i++) {
 					reg = start_reg + (4 * i);
-				if (!si_vm_reg_valid(reg)) {
+					if (!si_vm_reg_valid(reg)) {
 						DRM_ERROR("CP DMA Bad DST register\n");
 						return -EINVAL;
 					}
-- 
1.8.3.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

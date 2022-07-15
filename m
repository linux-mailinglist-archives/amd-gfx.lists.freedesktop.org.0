Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61645783E0
	for <lists+amd-gfx@lfdr.de>; Mon, 18 Jul 2022 15:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D8918AFD0;
	Mon, 18 Jul 2022 13:38:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 919 seconds by postgrey-1.36 at gabe;
 Mon, 18 Jul 2022 13:37:46 UTC
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8403A18A07E
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 Jul 2022 13:37:46 +0000 (UTC)
X-QQ-mid: bizesmtp63t1658150536tprhb7o4
Received: from localhost.localdomain ( [171.223.96.21])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 18 Jul 2022 21:22:14 +0800 (CST)
X-QQ-SSF: 01000000002000E0U000C00A0000020
X-QQ-FEAT: 83ShfzFP0oDpLP1Dvu6XTjFDq/dXibZuCtQI2VYFTjiZeRQGYV7RLf9qspcim
 qq/C1MNIzlQ0jHPIGxH0ZfVG4OuI1CBlXF9PyaMDO30BDtDNE4h/YCKmhqpnjoQGK9hMKx+
 5MNuDFqrdXP0ZdWvFnDPhQkO2Y1YaXX8WOOAEFc0V903RuYyp0aNwKOHsR2ZzeaDECVgB4I
 xZtPAG6EBYM1UgW0dKytOsfUroYOlPN+CD0MQ/k+yMMAiOsHBw3owqxqTUdY28t/zJleycA
 UEOOgAEUOePbiFwnQaLMVbvmJi79Ci5LbNN9KTEDOglGXrOoy3Qr1MVnNRILM5o6+fQ2O9V
 ydMOSD/nBdTxSFT8GkFafiBr5+NemBN39NinVMaS6RRoolGODmMIzDmZssHcKpZVi4OHkbk
 GIZhlTZosDI=
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: daniel@ffwll.ch
Subject: [PATCH] dma-buf: Fix comment typo
Date: Fri, 15 Jul 2022 13:20:17 +0800
Message-Id: <20220715052017.31633-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Mon, 18 Jul 2022 13:38:20 +0000
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jason Wang <wangborong@cdjrlc.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The double `have' is duplicated in line 696, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 84843b3b3aef..261fcbae88d7 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -693,7 +693,7 @@ int radeon_gem_va_ioctl(struct drm_device *dev, void *data,
 	}
 
 	/* !! DONT REMOVE !!
-	 * We don't support vm_id yet, to be sure we don't have have broken
+	 * We don't support vm_id yet, to be sure we don't have broken
 	 * userspace, reject anyone trying to use non 0 value thus moving
 	 * forward we can use those fields without breaking existant userspace
 	 */
-- 
2.35.1


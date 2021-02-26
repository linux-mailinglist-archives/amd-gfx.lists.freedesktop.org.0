Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1A32606E
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Feb 2021 10:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF2C6E869;
	Fri, 26 Feb 2021 09:48:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4C66E8ED;
 Fri, 26 Feb 2021 06:05:37 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 8C2E6D0590;
 Fri, 26 Feb 2021 14:05:32 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P32473T140679506294528S1614319533098420_; 
 Fri, 26 Feb 2021 14:05:33 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a77edb68d092f3f6d269c21c0bccd56a>
X-RL-SENDER: wangjingyu@uniontech.com
X-SENDER: wangjingyu@uniontech.com
X-LOGIN-NAME: wangjingyu@uniontech.com
X-FST-TO: airlied@linux.ie
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: wangjingyu <wangjingyu@uniontech.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] radeon: ERROR: space prohibited before that ','
Date: Fri, 26 Feb 2021 14:05:28 +0800
Message-Id: <20210226060528.12964-1-wangjingyu@uniontech.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 26 Feb 2021 09:48:19 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wangjingyu <wangjingyu@uniontech.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

drm_property_create_range(rdev->ddev, 0 , "coherent", 0, 1);

Signed-off-by: wangjingyu <wangjingyu@uniontech.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 3a6fedad002d..439d1b3e87d8 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1396,7 +1396,7 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
 
 	if (rdev->is_atom_bios) {
 		rdev->mode_info.coherent_mode_property =
-			drm_property_create_range(rdev->ddev, 0 , "coherent", 0, 1);
+			drm_property_create_range(rdev->ddev, 0, "coherent", 0, 1);
 		if (!rdev->mode_info.coherent_mode_property)
 			return -ENOMEM;
 	}
-- 
2.11.0



_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

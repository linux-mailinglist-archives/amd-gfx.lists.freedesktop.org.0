Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF21345983
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Mar 2021 09:18:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439B6E85F;
	Tue, 23 Mar 2021 08:18:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m17637.qiye.163.com (mail-m17637.qiye.163.com
 [59.111.176.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096256E81F;
 Tue, 23 Mar 2021 01:19:40 +0000 (UTC)
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 295F0980299;
 Tue, 23 Mar 2021 09:19:36 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Wan Jiabing <wanjiabing@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: amd: Remove duplicate includes
Date: Tue, 23 Mar 2021 09:19:20 +0800
Message-Id: <20210323011923.133284-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGktPHx0eSENIHk4dVkpNSk1PTUlITE1PSE9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6PSo6Cz8KNDoMAkNPHT0L
 ExoKCjlVSlVKTUpNT01JSExMSEpOVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFJS0JPNwY+
X-HM-Tid: 0a785caa6db4d992kuws295f0980299
X-Mailman-Approved-At: Tue, 23 Mar 2021 08:18:23 +0000
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
Cc: kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

../hw_ddc.h, ../hw_gpio.h and ../hw_hpd.h have been included 
at line 32, so remove them.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 .../gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c    | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
index 66e4841f41e4..ca335ea60412 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
@@ -48,10 +48,6 @@
 #define REGI(reg_name, block, id)\
 	mm ## block ## id ## _ ## reg_name
 
-#include "../hw_gpio.h"
-#include "../hw_ddc.h"
-#include "../hw_hpd.h"
-
 #include "reg_helper.h"
 #include "../hpd_regs.h"
 
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

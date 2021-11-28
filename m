Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EB460787
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Nov 2021 17:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B69730A4;
	Sun, 28 Nov 2021 16:31:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CD1730A3
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Nov 2021 16:31:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [88.120.44.86])
 by smtp5-g21.free.fr (Postfix) with ESMTP id 4D7885FFB4;
 Sun, 28 Nov 2021 17:31:24 +0100 (CET)
From: Yann Dirson <ydirson@free.fr>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: update fw_load_type module parameter doc to match
 code
Date: Sun, 28 Nov 2021 17:31:20 +0100
Message-Id: <20211128163120.11092-1-ydirson@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Yann Dirson <ydirson@free.fr>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

amdgpu_ucode_get_load_type() does not interpret this parameter as
documented.  It is ignored for many ASIC types (which presumably
only support one load_type), and when not ignored it is only used
to force direct loading instead of PSP loading.  SMU loading is
only available for ASICs for which the parameter is ignored.

Signed-off-by: Yann Dirson <ydirson@free.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ecdec75fdf69..8ab12368b3b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -315,9 +315,12 @@ module_param_named(dpm, amdgpu_dpm, int, 0444);
 
 /**
  * DOC: fw_load_type (int)
- * Set different firmware loading type for debugging (0 = direct, 1 = SMU, 2 = PSP). The default is -1 (auto).
+ * Set different firmware loading type for debugging, if supported.
+ * Set to 0 to force direct loading if supported by the ASIC.  All
+ * other values select the default loading mode as defined by the
+ * driver.  The default is -1 (auto).
  */
-MODULE_PARM_DESC(fw_load_type, "firmware loading type (0 = direct, 1 = SMU, 2 = PSP, -1 = auto)");
+MODULE_PARM_DESC(fw_load_type, "firmware loading type (0 = force direct if supported, non-zero = auto)");
 module_param_named(fw_load_type, amdgpu_fw_load_type, int, 0444);
 
 /**
-- 
2.31.1


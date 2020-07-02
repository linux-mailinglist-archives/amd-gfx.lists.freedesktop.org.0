Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C2C2128B8
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Jul 2020 17:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A297D6EB1E;
	Thu,  2 Jul 2020 15:54:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB0B6E037
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jul 2020 14:01:15 +0000 (UTC)
Received: from hopp.molgen.mpg.de (hopp.molgen.mpg.de [141.14.25.186])
 by mx.molgen.mpg.de (Postfix) with ESMTP id D2CAF20646DD4;
 Thu,  2 Jul 2020 16:01:13 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Change type of module param `ppfeaturemask`
 to hex
Date: Thu,  2 Jul 2020 16:01:02 +0200
Message-Id: <20200702140102.26129-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200702140102.26129-1-pmenzel@molgen.mpg.de>
References: <20200702140102.26129-1-pmenzel@molgen.mpg.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 15:54:18 +0000
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The newly added hex helper is more convenient for bitmasks.

Before:

    $ more /sys/module/amdgpu/parameters/ppfeaturemask
    4294950911

After:

    $ more /sys/module/amdgpu/parameters/ppfeaturemask
    0xffffbfff

Cc: amd-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 126e74758a34..35a66b374e3a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -391,12 +391,12 @@ MODULE_PARM_DESC(sched_hw_submission, "the max number of HW submissions (default
 module_param_named(sched_hw_submission, amdgpu_sched_hw_submission, int, 0444);
 
 /**
- * DOC: ppfeaturemask (uint)
+ * DOC: ppfeaturemask (hex)
  * Override power features enabled. See enum PP_FEATURE_MASK in drivers/gpu/drm/amd/include/amd_shared.h.
  * The default is the current set of stable power features.
  */
 MODULE_PARM_DESC(ppfeaturemask, "all power features enabled (default))");
-module_param_named(ppfeaturemask, amdgpu_pp_feature_mask, uint, 0444);
+module_param_named(ppfeaturemask, amdgpu_pp_feature_mask, hex, 0444);
 
 /**
  * DOC: forcelongtraining (uint)
-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

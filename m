Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6A638751
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Nov 2022 11:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E39210E69C;
	Fri, 25 Nov 2022 10:21:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337FF10E607;
 Fri, 25 Nov 2022 10:21:44 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n7so6035114wrr.13;
 Fri, 25 Nov 2022 02:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vNvKKwZ8yOBHyFdlYI8xsYuxbxPPoIJ+mjPWASz4JZU=;
 b=pU0BXePLNKqlnb4f04CKN8cHcWGbqWKYGJJYgHOjwZNTbo2o0k97JR3BQwHDRLaxOh
 sSwauDKnLPUiHVwHr/2iU0faT5n/BqSR4w4jAIyu1b5aMpeFv0IY0ttZWa1onW+r3azy
 +PJefaohNwyHfPlZF0zymjIN1uBHhCTAjYrE/ITBYSgK3zoVh+YBtygs3wnEuhfrpkBP
 OOBVp0IrVG7gbdqX4iT5AaVC/QqahLWFRPAIWFZaRodxuyZezJQ6KIAjuI5fMMnlIm32
 VnfM+tIoN4Gi693marFqCSYxbNp7XPYSO9/TJJ0qRCdX6GNVmZF9VjzDUzVokTcMjvEv
 2lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNvKKwZ8yOBHyFdlYI8xsYuxbxPPoIJ+mjPWASz4JZU=;
 b=JU2OXXMApWa4J+M8p+qVYxIFLdJ+RibiS4fwO+wx+tat/hGJZ7rEbJGQN/jK631Rxm
 FH0kgMkXDS5lQlGrgXwJDbnZwKTpIH4Q+wEycKFT9eSUA0qELlQlzI0xkcao0KgAFeXB
 6IYfotwdigIe260fthJHq3mLG59hiCUZ9CDcTKbY7Dp8N+FZ6W6xngs+KvEw9a5TYtgn
 2BIcarfA50t7V1pg98DJBh+xakPgPOthW4QnTu7PBwqP5MS31S79lcMwtUddQNxDCPNy
 XpY4T17PBbuI3hXr8w68Awp7Zvj8b+cBVDFgNuLrOjX1HdN62UBrKyFWJKJvtesW0dXQ
 eyTg==
X-Gm-Message-State: ANoB5pkGvwHESXiMQUQRfGMPoxD/xhO5OapDzayPQB1cbTyuenaY8gdd
 NtjcdsBVklBB4alqo1zFC+bDUNzzpHU=
X-Google-Smtp-Source: AA0mqf69bUpf0S4EIGaCEByOQbsqHWHagqnuTFJ0NMyHidzjxSltRqz7I8n3io/OivBPseXBSE+QTQ==
X-Received: by 2002:adf:dec2:0:b0:236:d485:527e with SMTP id
 i2-20020adfdec2000000b00236d485527emr22325187wrn.169.1669371702703; 
 Fri, 25 Nov 2022 02:21:42 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/9] drm/ttm: merge ttm_bo_api.h and ttm_bo_driver.h
Date: Fri, 25 Nov 2022 11:21:32 +0100
Message-Id: <20221125102137.1801-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Merge and cleanup the two headers into a single description of the
object API. Also move all the documentation to the implementation and
drop unecessary includes from the header.

No functional change.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h   |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h        |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h    |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |   1 +
 drivers/gpu/drm/drm_gem_ttm_helper.c          |   2 +
 drivers/gpu/drm/drm_gem_vram_helper.c         |   1 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   2 +-
 drivers/gpu/drm/i915/i915_deps.c              |   2 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |   1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h          |   3 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |   3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       |   1 +
 drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   1 +
 drivers/gpu/drm/qxl/qxl_drv.h                 |   3 +-
 drivers/gpu/drm/qxl/qxl_ttm.c                 |   4 +-
 drivers/gpu/drm/radeon/radeon.h               |   3 +-
 drivers/gpu/drm/radeon/radeon_prime.c         |   2 +
 drivers/gpu/drm/radeon/radeon_ttm.c           |   4 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  81 +++-
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 110 +++++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |  19 +-
 drivers/gpu/drm/ttm/ttm_device.c              |   2 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        |   6 +-
 drivers/gpu/drm/ttm/ttm_pool.c                |   3 +-
 drivers/gpu/drm/ttm/ttm_range_manager.c       |   2 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |   3 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c           |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |   1 -
 .../gpu/drm/vmwgfx/vmwgfx_system_manager.c    |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |   1 -
 include/drm/drm_gem_ttm_helper.h              |   3 +-
 include/drm/drm_gem_vram_helper.h             |   4 +-
 include/drm/ttm/{ttm_bo_api.h => ttm_bo.h}    | 345 +++++++++---------
 include/drm/ttm/ttm_bo_driver.h               | 303 ---------------
 include/drm/ttm/ttm_execbuf_util.h            |   4 +-
 55 files changed, 410 insertions(+), 557 deletions(-)
 rename include/drm/ttm/{ttm_bo_api.h => ttm_bo.h} (67%)
 delete mode 100644 include/drm/ttm/ttm_bo_driver.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6b74df446694..2644cd991210 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -52,8 +52,7 @@
 #include <linux/pci.h>
 #include <linux/aer.h>
 
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3a763916a5a1..ab450f12c445 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,7 @@
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "amdgpu_object.h"
 #include "amdgpu_gem.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
index e4d78491bcc7..ededdc01ca28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
@@ -28,6 +28,8 @@
 
 struct hmm_range;
 
+struct drm_file;
+
 struct amdgpu_device;
 struct amdgpu_bo;
 struct amdgpu_bo_va;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 8516c814bc9b..8b7a09b392ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -32,6 +32,8 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_syncobj.h>
+#include <drm/ttm/ttm_tt.h>
+
 #include "amdgpu_cs.h"
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index 113f39510a72..fb3e3d56d427 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -23,6 +23,8 @@
 #ifndef __AMDGPU_CS_H__
 #define __AMDGPU_CS_H__
 
+#include <linux/ww_mutex.h>
+
 #include "amdgpu_job.h"
 #include "amdgpu_bo_list.h"
 #include "amdgpu_ring.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 271e30e34d93..0c001bb8fc2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -37,6 +37,7 @@
 #include "amdgpu_dma_buf.h"
 #include "amdgpu_xgmi.h"
 #include <drm/amdgpu_drm.h>
+#include <drm/ttm/ttm_tt.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence-array.h>
 #include <linux/pci-p2pdma.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
index 41a4c7056729..e86834bfea1d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h
@@ -30,7 +30,6 @@
 #include <linux/rbtree.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/drm_file.h>
-#include <drm/ttm/ttm_bo_driver.h>
 #include <linux/sched/mm.h>
 
 #include "amdgpu_sync.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 62e98f1ad770..b9d9c523c1fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -34,6 +34,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "amdgpu.h"
 #include "amdgpu_display.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 4365ede42855..3169a942dbbb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -35,6 +35,7 @@
 #include "amdgpu_xgmi.h"
 
 #include <drm/drm_drv.h>
+#include <drm/ttm/ttm_tt.h>
 
 /**
  * amdgpu_gmc_pdb0_alloc - allocate vram for pdb0
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 7b5074e776f4..068c2d8495fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -44,10 +44,10 @@
 #include <linux/module.h>
 
 #include <drm/drm_drv.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 003aa9e47085..fea25519227f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
+#include <drm/ttm/ttm_tt.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 6546e786bf00..44157c6c0804 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -29,7 +29,7 @@
 #include <linux/rbtree.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/drm_file.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <linux/sched/mm.h>
 
 #include "amdgpu_sync.h"
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 814f99888ab1..37219198d518 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -23,6 +23,7 @@
 
 #include <linux/types.h>
 #include <linux/sched/task.h>
+#include <drm/ttm/ttm_tt.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index d5962a34c01d..3734aa2d1c5b 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -3,6 +3,8 @@
 #include <linux/module.h>
 
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
 
 /**
  * DOC: overview
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b6c7e3803bb3..f59adffd938a 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -19,6 +19,7 @@
 #include <drm/drm_simple_kms_helper.h>
 
 #include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_tt.h>
 
 static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index d0d6772e6f36..a7b70701617a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -10,7 +10,7 @@
 #include <linux/mmu_notifier.h>
 
 #include <drm/drm_gem.h>
-#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo.h>
 #include <uapi/drm/i915_drm.h>
 
 #include "i915_active.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 1e50fb0d6bfc..5247d88b3c13 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -5,8 +5,8 @@
 
 #include <linux/shmem_fs.h>
 
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
 #include <drm/drm_buddy.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index f59f812dc6d2..2ebaaf4d663c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -3,7 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "i915_deps.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
index 297b8e4e42ee..91c61864285a 100644
--- a/drivers/gpu/drm/i915/i915_deps.c
+++ b/drivers/gpu/drm/i915/i915_deps.c
@@ -6,7 +6,7 @@
 #include <linux/dma-fence.h>
 #include <linux/slab.h>
 
-#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "i915_deps.h"
 
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7e611476c7a4..a72698a2dbc8 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -5,8 +5,8 @@
 
 #include <linux/slab.h>
 
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include <drm/drm_buddy.h>
 
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 657bbc16a48a..4dc0702081b8 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -2,7 +2,6 @@
 /*
  * Copyright © 2021 Intel Corporation
  */
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_range_manager.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a11871e3119c..335fa91ca4ad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -28,6 +28,7 @@
  */
 
 #include <linux/dma-mapping.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_chan.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index c2d3f9c48eba..774dd93ca76b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -1,8 +1,9 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NOUVEAU_BO_H__
 #define __NOUVEAU_BO_H__
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/drm_gem.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
 
 struct nouveau_channel;
 struct nouveau_cli;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index d6dd07bfa64a..b5de312a523f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -51,8 +51,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 
 #include <drm/drm_audio_component.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 1fde3a5d7c32..25f31d5169e5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -19,11 +19,12 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+#include <drm/ttm/ttm_tt.h>
+
 #include "nouveau_mem.h"
 #include "nouveau_drv.h"
 #include "nouveau_bo.h"
 
-#include <drm/ttm/ttm_bo_driver.h>
 
 #include <nvif/class.h>
 #include <nvif/if000a.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 1ee6cdb9ad9b..76c86d8bb01e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -1,6 +1,6 @@
 #ifndef __NOUVEAU_MEM_H__
 #define __NOUVEAU_MEM_H__
-#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo.h>
 struct ttm_tt;
 
 #include <nvif/mem.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 9608121e49b7..f42c2b1b0363 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -23,6 +23,7 @@
  */
 
 #include <linux/dma-buf.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 85c03c83259b..b14895f75b3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: MIT
 #include <linux/pagemap.h>
 #include <linux/slab.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_mem.h"
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index 76f060810f63..ea993d7162e8 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -42,8 +42,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_gem.h>
 #include <drm/qxl_drm.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index ee95001e6b5e..a92a5b0d4c25 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -29,10 +29,10 @@
 #include <drm/drm_file.h>
 #include <drm/drm_debugfs.h>
 #include <drm/qxl_drm.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 2e7161acd443..57e20780a458 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -73,8 +73,7 @@
 #include <linux/mmu_notifier.h>
 #endif
 
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_execbuf_util.h>
 
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index 42a87948e28c..b3cfc99f4d7e 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -29,6 +29,8 @@
 #include <drm/drm_prime.h>
 #include <drm/radeon_drm.h>
 
+#include <drm/ttm/ttm_tt.h>
+
 #include "radeon.h"
 #include "radeon_prime.h"
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 30402b5ce4c5..1e8e287e113c 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -42,10 +42,10 @@
 #include <drm/drm_file.h>
 #include <drm/drm_prime.h>
 #include <drm/radeon_drm.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "radeon_reg.h"
 #include "radeon.h"
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 4749b65bedc4..f9d9fd2d865d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,8 +31,10 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
+
 #include <linux/jiffies.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
@@ -381,6 +383,13 @@ static void ttm_bo_release(struct kref *kref)
 	bo->destroy(bo);
 }
 
+/**
+ * ttm_bo_put
+ *
+ * @bo: The buffer object.
+ *
+ * Unreference a buffer object.
+ */
 void ttm_bo_put(struct ttm_buffer_object *bo)
 {
 	kref_put(&bo->kref, ttm_bo_release);
@@ -467,6 +476,14 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	return ret;
 }
 
+/**
+ * ttm_bo_eviction_valuable
+ *
+ * @bo: The buffer object to evict
+ * @place: the placement we need to make room for
+ *
+ * Check if it is valuable to evict the BO to make room for the given placement.
+ */
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place)
 {
@@ -726,13 +743,23 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 	return ttm_bo_add_move_fence(bo, man, *mem, ctx->no_wait_gpu);
 }
 
-/*
- * Creates space for memory region @mem according to its type.
+/**
+ * ttm_bo_mem_space
  *
- * This function first searches for free space in compatible memory types in
- * the priority order defined by the driver.  If free space isn't found, then
- * ttm_bo_mem_force_space is attempted in priority order to evict and find
- * space.
+ * @bo: Pointer to a struct ttm_buffer_object. the data of which
+ * we want to allocate space for.
+ * @proposed_placement: Proposed new placement for the buffer object.
+ * @mem: A struct ttm_resource.
+ * @ctx: if and how to sleep, lock buffers and alloc memory
+ *
+ * Allocate memory space for the buffer object pointed to by @bo, using
+ * the placement flags in @placement, potentially evicting other idle buffer objects.
+ * This function may sleep while waiting for space to become available.
+ * Returns:
+ * -EBUSY: No space available (only if no_wait == 1).
+ * -ENOMEM: Could not allocate memory for the buffer object, either due to
+ * fragmentation or concurrent allocators.
+ * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
  */
 int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			struct ttm_placement *placement,
@@ -838,6 +865,21 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
 	return ret;
 }
 
+/**
+ * ttm_bo_validate
+ *
+ * @bo: The buffer object.
+ * @placement: Proposed placement for the buffer object.
+ * @ctx: validation parameters.
+ *
+ * Changes placement and caching policy of the buffer object
+ * according proposed placement.
+ * Returns
+ * -EINVAL on invalid proposed placement.
+ * -ENOMEM on out-of-memory condition.
+ * -EBUSY if no_wait is true and buffer busy.
+ * -ERESTARTSYS if interrupted by a signal.
+ */
 int ttm_bo_validate(struct ttm_buffer_object *bo,
 		    struct ttm_placement *placement,
 		    struct ttm_operation_ctx *ctx)
@@ -1030,6 +1072,11 @@ EXPORT_SYMBOL(ttm_bo_init_validate);
  * buffer object vm functions.
  */
 
+/**
+ * ttm_bo_unmap_virtual
+ *
+ * @bo: tear down the virtual mappings for this BO
+ */
 void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 {
 	struct ttm_device *bdev = bo->bdev;
@@ -1039,6 +1086,20 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
 }
 EXPORT_SYMBOL(ttm_bo_unmap_virtual);
 
+/**
+ * ttm_bo_wait - wait for buffer idle.
+ *
+ * @bo:  The buffer object.
+ * @interruptible:  Use interruptible wait.
+ * @no_wait:  Return immediately if buffer is busy.
+ *
+ * This function must be called with the bo::mutex held, and makes
+ * sure any previous rendering to the buffer is completed.
+ * Note: It might be necessary to block validations before the
+ * wait by reserving the buffer.
+ * Returns -EBUSY if no_wait is true and the buffer is busy.
+ * Returns -ERESTARTSYS if interrupted by a signal.
+ */
 int ttm_bo_wait(struct ttm_buffer_object *bo,
 		bool interruptible, bool no_wait)
 {
@@ -1063,6 +1124,12 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_wait);
 
+int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
+{
+	return ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+}
+EXPORT_SYMBOL(ttm_bo_wait_ctx);
+
 int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		   gfp_t gfp_flags)
 {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ae4b7922ee1a..fee7c20775c0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -29,18 +29,11 @@
  * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
  */
 
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
+
 #include <drm/drm_cache.h>
-#include <drm/drm_vma_manager.h>
-#include <linux/iosys-map.h>
-#include <linux/io.h>
-#include <linux/highmem.h>
-#include <linux/wait.h>
-#include <linux/slab.h>
-#include <linux/vmalloc.h>
-#include <linux/module.h>
-#include <linux/dma-resv.h>
 
 struct ttm_transfer_obj {
 	struct ttm_buffer_object base;
@@ -128,6 +121,23 @@ void ttm_move_memcpy(bool clear,
 }
 EXPORT_SYMBOL(ttm_move_memcpy);
 
+/**
+ * ttm_bo_move_memcpy
+ *
+ * @bo: A pointer to a struct ttm_buffer_object.
+ * @interruptible: Sleep interruptible if waiting.
+ * @no_wait_gpu: Return immediately if the GPU is busy.
+ * @new_mem: struct ttm_resource indicating where to move.
+ *
+ * Fallback move function for a mappable buffer object in mappable memory.
+ * The function will, if successful,
+ * free any old aperture space, and set (@new_mem)->mm_node to NULL,
+ * and update the (@bo)->mem placement flags. If unsuccessful, the old
+ * data remains untouched, and it's up to the caller to free the
+ * memory space indicated by @new_mem.
+ * Returns:
+ * !0: Failure.
+ */
 int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 		       struct ttm_operation_ctx *ctx,
 		       struct ttm_resource *dst_mem)
@@ -266,6 +276,16 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	return 0;
 }
 
+/**
+ * ttm_io_prot
+ *
+ * bo: ttm buffer object
+ * res: ttm resource object
+ * @tmp: Page protection flag for a normal, cached mapping.
+ *
+ * Utility function that returns the pgprot_t that should be used for
+ * setting up a PTE with the caching model indicated by @c_state.
+ */
 pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
 		     pgprot_t tmp)
 {
@@ -347,6 +367,22 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
 	return (!map->virtual) ? -ENOMEM : 0;
 }
 
+/**
+ * ttm_bo_kmap
+ *
+ * @bo: The buffer object.
+ * @start_page: The first page to map.
+ * @num_pages: Number of pages to map.
+ * @map: pointer to a struct ttm_bo_kmap_obj representing the map.
+ *
+ * Sets up a kernel virtual mapping, using ioremap, vmap or kmap to the
+ * data in the buffer object. The ttm_kmap_obj_virtual function can then be
+ * used to obtain a virtual address to the data.
+ *
+ * Returns
+ * -ENOMEM: Out of memory.
+ * -EINVAL: Invalid range.
+ */
 int ttm_bo_kmap(struct ttm_buffer_object *bo,
 		unsigned long start_page, unsigned long num_pages,
 		struct ttm_bo_kmap_obj *map)
@@ -374,6 +410,13 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_kmap);
 
+/**
+ * ttm_bo_kunmap
+ *
+ * @map: Object describing the map to unmap.
+ *
+ * Unmaps a kernel map set up by ttm_bo_kmap.
+ */
 void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 {
 	if (!map->virtual)
@@ -399,6 +442,20 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
 }
 EXPORT_SYMBOL(ttm_bo_kunmap);
 
+/**
+ * ttm_bo_vmap
+ *
+ * @bo: The buffer object.
+ * @map: pointer to a struct iosys_map representing the map.
+ *
+ * Sets up a kernel virtual mapping, using ioremap or vmap to the
+ * data in the buffer object. The parameter @map returns the virtual
+ * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
+ *
+ * Returns
+ * -ENOMEM: Out of memory.
+ * -EINVAL: Invalid range.
+ */
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 {
 	struct ttm_resource *mem = bo->resource;
@@ -460,6 +517,14 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 }
 EXPORT_SYMBOL(ttm_bo_vmap);
 
+/**
+ * ttm_bo_vunmap
+ *
+ * @bo: The buffer object.
+ * @map: Object describing the map to unmap.
+ *
+ * Unmaps a kernel map set up by ttm_bo_vmap().
+ */
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 {
 	struct ttm_resource *mem = bo->resource;
@@ -553,6 +618,22 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 	ttm_resource_free(bo, &bo->resource);
 }
 
+/**
+ * ttm_bo_move_accel_cleanup.
+ *
+ * @bo: A pointer to a struct ttm_buffer_object.
+ * @fence: A fence object that signals when moving is complete.
+ * @evict: This is an evict move. Don't return until the buffer is idle.
+ * @pipeline: evictions are to be pipelined.
+ * @new_mem: struct ttm_resource indicating where to move.
+ *
+ * Accelerated move function to be called when an accelerated move
+ * has been scheduled. The function will create a new temporary buffer object
+ * representing the old placement, and put the sync object on both buffer
+ * objects. After that the newly created buffer object is unref'd to be
+ * destroyed when the move is complete. This will help pipeline
+ * buffer moves.
+ */
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 			      struct dma_fence *fence,
 			      bool evict,
@@ -581,6 +662,15 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
 
+/**
+ * ttm_bo_move_sync_cleanup.
+ *
+ * @bo: A pointer to a struct ttm_buffer_object.
+ * @new_mem: struct ttm_resource indicating where to move.
+ *
+ * Special case of ttm_bo_move_accel_cleanup where the bo is guaranteed
+ * by the caller to be idle. Typically used after memcpy buffer moves.
+ */
 void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
 			      struct ttm_resource *new_mem)
 {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 5a3e4b891377..3ecda6db24b8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -31,17 +31,12 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/drm_vma_manager.h>
+#include <drm/ttm/ttm_tt.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
-#include <linux/mm.h>
-#include <linux/pfn_t.h>
-#include <linux/rbtree.h>
-#include <linux/module.h>
-#include <linux/uaccess.h>
-#include <linux/mem_encrypt.h>
 
 static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 				struct vm_fault *vmf)
@@ -446,6 +441,14 @@ static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.access = ttm_bo_vm_access,
 };
 
+/**
+ * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
+ *
+ * @vma:       vma as input from the fbdev mmap method.
+ * @bo:        The bo backing the address space.
+ *
+ * Maps a buffer object.
+ */
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	/* Enforce no COW since would have really strange behavior with it. */
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e9bedca4dfdc..c7a1862f322a 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -29,10 +29,10 @@
 
 #include <linux/mm.h>
 
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_bo_api.h>
 
 #include "ttm_module.h"
 
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index dbee34a058df..f1c60fa80c2d 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -27,11 +27,7 @@
  **************************************************************************/
 
 #include <drm/ttm/ttm_execbuf_util.h>
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <linux/wait.h>
-#include <linux/sched.h>
-#include <linux/module.h>
+#include <drm/ttm/ttm_bo.h>
 
 static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
 					      struct ttm_validate_buffer *entry)
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 9f6764bf3b15..aa116a7bbae3 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -33,6 +33,7 @@
 
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
+#include <linux/debugfs.h>
 #include <linux/highmem.h>
 #include <linux/sched/mm.h>
 
@@ -41,8 +42,8 @@
 #endif
 
 #include <drm/ttm/ttm_pool.h>
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_tt.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "ttm_module.h"
 
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 0a8bc0b7f380..ae11d07eb63a 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -32,7 +32,7 @@
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
-#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/drm_mm.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 328391bb1d87..b8a826a24fb2 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -26,8 +26,9 @@
 #include <linux/io-mapping.h>
 #include <linux/scatterlist.h>
 
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
-#include <drm/ttm/ttm_bo_driver.h>
 
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index d505603930a7..ab725d9d14a6 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -36,7 +36,8 @@
 #include <linux/file.h>
 #include <linux/module.h>
 #include <drm/drm_cache.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_tt.h>
 
 #include "ttm_module.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 3c06df2a5474..2b843ff4b437 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -28,7 +28,7 @@
 #include <linux/dmapool.h>
 #include <linux/pci.h>
 
-#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "vmwgfx_drv.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bd02cb0e6837..9ad28346aff7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -40,7 +40,6 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_module.h>
 #include <drm/drm_sysfs.h>
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_placement.h>
 #include <generated/utsrelease.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index b062b020b378..4b612fc9758c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -37,8 +37,10 @@
 #include <drm/drm_file.h>
 #include <drm/drm_rect.h>
 
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_execbuf_util.h>
+#include <drm/ttm/ttm_tt.h>
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "ttm_object.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index a5379f6fb5ab..43cec8e37e4d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -29,7 +29,7 @@
 
 #include "vmwgfx_drv.h"
 #include "vmwgfx_reg.h"
-#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include "vmwgfx_so.h"
 #include "vmwgfx_binding.h"
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c
index c482e5298e11..20158a92acc7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c
@@ -25,7 +25,6 @@
  *
  **************************************************************************/
 
-#include <drm/ttm/ttm_bo_driver.h>
 
 #include "vmwgfx_drv.h"
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index abd5e3323ebf..ceb4d3d3b965 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -29,7 +29,6 @@
  */
 
 #include "vmwgfx_drv.h"
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 #include <linux/idr.h>
 #include <linux/spinlock.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
index d3007bf1b8f5..ee7964cbdaca 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
@@ -26,7 +26,6 @@
 
 #include "vmwgfx_drv.h"
 
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index 4e3938e62c08..856a352a72a6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -26,7 +26,6 @@
  **************************************************************************/
 
 #include "vmwgfx_drv.h"
-#include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_placement.h>
 
 static const struct ttm_place vram_placement_flags = {
diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm_helper.h
index 4c003b4f173e..7b53d673ae7e 100644
--- a/include/drm/drm_gem_ttm_helper.h
+++ b/include/drm/drm_gem_ttm_helper.h
@@ -7,8 +7,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
 
 struct iosys_map;
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index c083a1d71cf4..d3e8920c0b64 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -8,8 +8,8 @@
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modes.h>
-#include <drm/ttm/ttm_bo_api.h>
-#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
 
 #include <linux/container_of.h>
 #include <linux/iosys-map.h>
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo.h
similarity index 67%
rename from include/drm/ttm/ttm_bo_api.h
rename to include/drm/ttm/ttm_bo.h
index 69e62bbb01e3..cfaf88e2d678 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -32,28 +32,24 @@
 #define _TTM_BO_API_H_
 
 #include <drm/drm_gem.h>
-#include <drm/drm_vma_manager.h>
+
 #include <linux/kref.h>
 #include <linux/list.h>
-#include <linux/wait.h>
-#include <linux/mutex.h>
-#include <linux/mm.h>
-#include <linux/bitmap.h>
-#include <linux/dma-resv.h>
-
-#include "ttm_resource.h"
 
-struct ttm_global;
+#include "ttm_device.h"
 
-struct ttm_device;
+/* Default number of pre-faulted pages in the TTM fault handler */
+#define TTM_BO_VM_NUM_PREFAULT 16
 
 struct iosys_map;
 
-struct drm_mm_node;
-
+struct ttm_global;
+struct ttm_device;
 struct ttm_placement;
-
 struct ttm_place;
+struct ttm_resource;
+struct ttm_resource_manager;
+struct ttm_tt;
 
 /**
  * enum ttm_bo_type
@@ -68,15 +64,12 @@ struct ttm_place;
  * @ttm_bo_type_sg: Buffer made from dmabuf sg table shared with another
  * driver.
  */
-
 enum ttm_bo_type {
 	ttm_bo_type_device,
 	ttm_bo_type_kernel,
 	ttm_bo_type_sg
 };
 
-struct ttm_tt;
-
 /**
  * struct ttm_buffer_object
  *
@@ -85,17 +78,11 @@ struct ttm_tt;
  * @type: The bo type.
  * @page_alignment: Page alignment.
  * @destroy: Destruction function. If NULL, kfree is used.
- * @num_pages: Actual number of pages.
  * @kref: Reference count of this buffer object. When this refcount reaches
  * zero, the object is destroyed or put on the delayed delete list.
- * @mem: structure describing current placement.
+ * @resource: structure describing current placement.
  * @ttm: TTM structure holding system pages.
- * @evicted: Whether the object was evicted without user-space knowing.
  * @deleted: True if the object is only a zombie and already deleted.
- * @swap: List head for swap LRU list.
- * @offset: The current GPU offset, which can have different meanings
- * depending on the memory type. For SYSTEM type memory, it should be 0.
- * @cur_placement: Hint of current placement.
  *
  * Base class for TTM buffer object, that deals with data placement and CPU
  * mappings. GPU mappings are really up to the driver, but for simpler GPUs
@@ -108,28 +95,25 @@ struct ttm_tt;
  * The destroy member, the API visibility of this object makes it possible
  * to derive driver specific types.
  */
-
 struct ttm_buffer_object {
 	struct drm_gem_object base;
 
-	/**
+	/*
 	 * Members constant at init.
 	 */
-
 	struct ttm_device *bdev;
 	enum ttm_bo_type type;
 	uint32_t page_alignment;
 	void (*destroy) (struct ttm_buffer_object *);
 
-	/**
+	/*
 	* Members not needing protection.
 	*/
 	struct kref kref;
 
-	/**
+	/*
 	 * Members protected by the bo::resv::reserved lock.
 	 */
-
 	struct ttm_resource *resource;
 	struct ttm_tt *ttm;
 	bool deleted;
@@ -148,8 +132,7 @@ struct ttm_buffer_object {
 	 * and the bo::lock when written to. Can be read with
 	 * either of these locks held.
 	 */
-
-	struct sg_table *sg;
+        struct sg_table *sg;
 };
 
 /**
@@ -164,7 +147,6 @@ struct ttm_buffer_object {
  * mapping can either be an ioremap, a vmap, a kmap or part of a
  * premapped region.
  */
-
 #define TTM_BO_MAP_IOMEM_MASK 0x80
 struct ttm_bo_kmap_obj {
 	void *virtual;
@@ -232,79 +214,119 @@ ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
 }
 
 /**
- * ttm_bo_wait - wait for buffer idle.
+ * ttm_bo_reserve:
+ *
+ * @bo: A pointer to a struct ttm_buffer_object.
+ * @interruptible: Sleep interruptible if waiting.
+ * @no_wait: Don't sleep while trying to reserve, rather return -EBUSY.
+ * @ticket: ticket used to acquire the ww_mutex.
  *
- * @bo:  The buffer object.
- * @interruptible:  Use interruptible wait.
- * @no_wait:  Return immediately if buffer is busy.
+ * Locks a buffer object for validation. (Or prevents other processes from
+ * locking it for validation), while taking a number of measures to prevent
+ * deadlocks.
  *
- * This function must be called with the bo::mutex held, and makes
- * sure any previous rendering to the buffer is completed.
- * Note: It might be necessary to block validations before the
- * wait by reserving the buffer.
- * Returns -EBUSY if no_wait is true and the buffer is busy.
- * Returns -ERESTARTSYS if interrupted by a signal.
+ * Returns:
+ * -EDEADLK: The reservation may cause a deadlock.
+ * Release all buffer reservations, wait for @bo to become unreserved and
+ * try again.
+ * -ERESTARTSYS: A wait for the buffer to become unreserved was interrupted by
+ * a signal. Release all buffer reservations and return to user-space.
+ * -EBUSY: The function needed to sleep, but @no_wait was true
+ * -EALREADY: Bo already reserved using @ticket. This error code will only
+ * be returned if @use_ticket is set to true.
  */
-int ttm_bo_wait(struct ttm_buffer_object *bo, bool interruptible, bool no_wait);
-
-static inline int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx)
+static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
+				 bool interruptible, bool no_wait,
+				 struct ww_acquire_ctx *ticket)
 {
-	return ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
+	int ret = 0;
+
+	if (no_wait) {
+		bool success;
+		if (WARN_ON(ticket))
+			return -EBUSY;
+
+		success = dma_resv_trylock(bo->base.resv);
+		return success ? 0 : -EBUSY;
+	}
+
+	if (interruptible)
+		ret = dma_resv_lock_interruptible(bo->base.resv, ticket);
+	else
+		ret = dma_resv_lock(bo->base.resv, ticket);
+	if (ret == -EINTR)
+		return -ERESTARTSYS;
+	return ret;
 }
 
 /**
- * ttm_bo_validate
- *
- * @bo: The buffer object.
- * @placement: Proposed placement for the buffer object.
- * @ctx: validation parameters.
- *
- * Changes placement and caching policy of the buffer object
- * according proposed placement.
- * Returns
- * -EINVAL on invalid proposed placement.
- * -ENOMEM on out-of-memory condition.
- * -EBUSY if no_wait is true and buffer busy.
- * -ERESTARTSYS if interrupted by a signal.
+ * ttm_bo_reserve_slowpath:
+ * @bo: A pointer to a struct ttm_buffer_object.
+ * @interruptible: Sleep interruptible if waiting.
+ * @sequence: Set (@bo)->sequence to this value after lock
+ *
+ * This is called after ttm_bo_reserve returns -EAGAIN and we backed off
+ * from all our other reservations. Because there are no other reservations
+ * held by us, this function cannot deadlock any more.
  */
-int ttm_bo_validate(struct ttm_buffer_object *bo,
-		    struct ttm_placement *placement,
-		    struct ttm_operation_ctx *ctx);
+static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
+					  bool interruptible,
+					  struct ww_acquire_ctx *ticket)
+{
+	if (interruptible) {
+		int ret = dma_resv_lock_slow_interruptible(bo->base.resv,
+							   ticket);
+		if (ret == -EINTR)
+			ret = -ERESTARTSYS;
+		return ret;
+	}
+	dma_resv_lock_slow(bo->base.resv, ticket);
+	return 0;
+}
+
+void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo);
+
+static inline void
+ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
+{
+	spin_lock(&bo->bdev->lru_lock);
+	ttm_bo_move_to_lru_tail(bo);
+	spin_unlock(&bo->bdev->lru_lock);
+}
+
+static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
+				     struct ttm_resource *new_mem)
+{
+	WARN_ON(bo->resource);
+	bo->resource = new_mem;
+}
 
 /**
- * ttm_bo_put
- *
- * @bo: The buffer object.
+ * ttm_bo_move_null = assign memory for a buffer object.
+ * @bo: The bo to assign the memory to
+ * @new_mem: The memory to be assigned.
  *
- * Unreference a buffer object.
+ * Assign the memory from new_mem to the memory of the buffer object bo.
  */
-void ttm_bo_put(struct ttm_buffer_object *bo);
-
-void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo);
-void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
-			  struct ttm_lru_bulk_move *bulk);
+static inline void ttm_bo_move_null(struct ttm_buffer_object *bo,
+				    struct ttm_resource *new_mem)
+{
+	ttm_resource_free(bo, &bo->resource);
+	ttm_bo_assign_mem(bo, new_mem);
+}
 
 /**
- * ttm_bo_eviction_valuable
+ * ttm_bo_unreserve
  *
- * @bo: The buffer object to evict
- * @place: the placement we need to make room for
+ * @bo: A pointer to a struct ttm_buffer_object.
  *
- * Check if it is valuable to evict the BO to make room for the given placement.
+ * Unreserve a previous reservation of @bo.
  */
-bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
-			      const struct ttm_place *place);
-
-int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-			 enum ttm_bo_type type, struct ttm_placement *placement,
-			 uint32_t alignment, struct ttm_operation_ctx *ctx,
-			 struct sg_table *sg, struct dma_resv *resv,
-			 void (*destroy) (struct ttm_buffer_object *));
-int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-			 enum ttm_bo_type type, struct ttm_placement *placement,
-			 uint32_t alignment, bool interruptible,
-			 struct sg_table *sg, struct dma_resv *resv,
-			 void (*destroy) (struct ttm_buffer_object *));
+static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
+{
+	ttm_bo_move_to_lru_tail_unlocked(bo);
+	dma_resv_unlock(bo->base.resv);
+}
 
 /**
  * ttm_kmap_obj_virtual
@@ -324,124 +346,85 @@ static inline void *ttm_kmap_obj_virtual(struct ttm_bo_kmap_obj *map,
 	return map->virtual;
 }
 
-/**
- * ttm_bo_kmap
- *
- * @bo: The buffer object.
- * @start_page: The first page to map.
- * @num_pages: Number of pages to map.
- * @map: pointer to a struct ttm_bo_kmap_obj representing the map.
- *
- * Sets up a kernel virtual mapping, using ioremap, vmap or kmap to the
- * data in the buffer object. The ttm_kmap_obj_virtual function can then be
- * used to obtain a virtual address to the data.
- *
- * Returns
- * -ENOMEM: Out of memory.
- * -EINVAL: Invalid range.
- */
+int ttm_bo_wait(struct ttm_buffer_object *bo, bool interruptible, bool no_wait);
+int ttm_bo_wait_ctx(struct ttm_buffer_object *bo,
+		    struct ttm_operation_ctx *ctx);
+int ttm_bo_validate(struct ttm_buffer_object *bo,
+		    struct ttm_placement *placement,
+		    struct ttm_operation_ctx *ctx);
+void ttm_bo_put(struct ttm_buffer_object *bo);
+void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
+			  struct ttm_lru_bulk_move *bulk);
+int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev);
+void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
+bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
+			      const struct ttm_place *place);
+int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
+			 enum ttm_bo_type type, struct ttm_placement *placement,
+			 uint32_t alignment, struct ttm_operation_ctx *ctx,
+			 struct sg_table *sg, struct dma_resv *resv,
+			 void (*destroy) (struct ttm_buffer_object *));
+int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
+			 enum ttm_bo_type type, struct ttm_placement *placement,
+			 uint32_t alignment, bool interruptible,
+			 struct sg_table *sg, struct dma_resv *resv,
+			 void (*destroy) (struct ttm_buffer_object *));
 int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
 		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
-
-/**
- * ttm_bo_kunmap
- *
- * @map: Object describing the map to unmap.
- *
- * Unmaps a kernel map set up by ttm_bo_kmap.
- */
 void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
-
-/**
- * ttm_bo_vmap
- *
- * @bo: The buffer object.
- * @map: pointer to a struct iosys_map representing the map.
- *
- * Sets up a kernel virtual mapping, using ioremap or vmap to the
- * data in the buffer object. The parameter @map returns the virtual
- * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
- *
- * Returns
- * -ENOMEM: Out of memory.
- * -EINVAL: Invalid range.
- */
 int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
-
-/**
- * ttm_bo_vunmap
- *
- * @bo: The buffer object.
- * @map: Object describing the map to unmap.
- *
- * Unmaps a kernel map set up by ttm_bo_vmap().
- */
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
-
-/**
- * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
- *
- * @vma:       vma as input from the fbdev mmap method.
- * @bo:        The bo backing the address space.
- *
- * Maps a buffer object.
- */
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
-
-/**
- * ttm_bo_io
- *
- * @bdev:      Pointer to the struct ttm_device.
- * @filp:      Pointer to the struct file attempting to read / write.
- * @wbuf:      User-space pointer to address of buffer to write. NULL on read.
- * @rbuf:      User-space pointer to address of buffer to read into.
- * Null on write.
- * @count:     Number of bytes to read / write.
- * @f_pos:     Pointer to current file position.
- * @write:     1 for read, 0 for write.
- *
- * This function implements read / write into ttm buffer objects, and is
- * intended to
- * be called from the fops::read and fops::write method.
- * Returns:
- * See man (2) write, man(2) read. In particular,
- * the function may return -ERESTARTSYS if
- * interrupted by a signal.
- */
-ssize_t ttm_bo_io(struct ttm_device *bdev, struct file *filp,
-		  const char __user *wbuf, char __user *rbuf,
-		  size_t count, loff_t *f_pos, bool write);
-
 int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		   gfp_t gfp_flags);
-
 void ttm_bo_pin(struct ttm_buffer_object *bo);
 void ttm_bo_unpin(struct ttm_buffer_object *bo);
-
 int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ttm_resource_manager *man,
 			const struct ttm_place *place,
 			struct ttm_operation_ctx *ctx,
 			struct ww_acquire_ctx *ticket);
-
-/* Default number of pre-faulted pages in the TTM fault handler */
-#define TTM_BO_VM_NUM_PREFAULT 16
-
 vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
 			     struct vm_fault *vmf);
-
 vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 				    pgprot_t prot,
 				    pgoff_t num_prefault);
-
 vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf);
-
 void ttm_bo_vm_open(struct vm_area_struct *vma);
-
 void ttm_bo_vm_close(struct vm_area_struct *vma);
-
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
 vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
 
+int ttm_bo_mem_space(struct ttm_buffer_object *bo,
+		     struct ttm_placement *placement,
+		     struct ttm_resource **mem,
+		     struct ttm_operation_ctx *ctx);
+
+void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
+/*
+ * ttm_bo_util.c
+ */
+int ttm_mem_io_reserve(struct ttm_device *bdev,
+		       struct ttm_resource *mem);
+void ttm_mem_io_free(struct ttm_device *bdev,
+		     struct ttm_resource *mem);
+void ttm_move_memcpy(bool clear,
+                     u32 num_pages,
+                     struct ttm_kmap_iter *dst_iter,
+                     struct ttm_kmap_iter *src_iter);
+int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
+		       struct ttm_operation_ctx *ctx,
+		       struct ttm_resource *new_mem);
+int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
+			      struct dma_fence *fence, bool evict,
+			      bool pipeline,
+			      struct ttm_resource *new_mem);
+void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
+			      struct ttm_resource *new_mem);
+int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
+pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
+		     pgprot_t tmp);
+void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
+
 #endif
diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
deleted file mode 100644
index 1afa891f488a..000000000000
--- a/include/drm/ttm/ttm_bo_driver.h
+++ /dev/null
@@ -1,303 +0,0 @@
-/**************************************************************************
- *
- * Copyright (c) 2006-2009 Vmware, Inc., Palo Alto, CA., USA
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the
- * "Software"), to deal in the Software without restriction, including
- * without limitation the rights to use, copy, modify, merge, publish,
- * distribute, sub license, and/or sell copies of the Software, and to
- * permit persons to whom the Software is furnished to do so, subject to
- * the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial portions
- * of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE.
- *
- **************************************************************************/
-/*
- * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
- */
-#ifndef _TTM_BO_DRIVER_H_
-#define _TTM_BO_DRIVER_H_
-
-#include <drm/drm_mm.h>
-#include <drm/drm_vma_manager.h>
-#include <linux/workqueue.h>
-#include <linux/fs.h>
-#include <linux/spinlock.h>
-#include <linux/dma-resv.h>
-
-#include <drm/ttm/ttm_device.h>
-
-#include "ttm_bo_api.h"
-#include "ttm_kmap_iter.h"
-#include "ttm_placement.h"
-#include "ttm_tt.h"
-#include "ttm_pool.h"
-
-/*
- * ttm_bo.c
- */
-
-/**
- * ttm_bo_mem_space
- *
- * @bo: Pointer to a struct ttm_buffer_object. the data of which
- * we want to allocate space for.
- * @proposed_placement: Proposed new placement for the buffer object.
- * @mem: A struct ttm_resource.
- * @interruptible: Sleep interruptible when sliping.
- * @no_wait_gpu: Return immediately if the GPU is busy.
- *
- * Allocate memory space for the buffer object pointed to by @bo, using
- * the placement flags in @mem, potentially evicting other idle buffer objects.
- * This function may sleep while waiting for space to become available.
- * Returns:
- * -EBUSY: No space available (only if no_wait == 1).
- * -ENOMEM: Could not allocate memory for the buffer object, either due to
- * fragmentation or concurrent allocators.
- * -ERESTARTSYS: An interruptible sleep was interrupted by a signal.
- */
-int ttm_bo_mem_space(struct ttm_buffer_object *bo,
-		     struct ttm_placement *placement,
-		     struct ttm_resource **mem,
-		     struct ttm_operation_ctx *ctx);
-
-/**
- * ttm_bo_unmap_virtual
- *
- * @bo: tear down the virtual mappings for this BO
- */
-void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
-
-/**
- * ttm_bo_reserve:
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @no_wait: Don't sleep while trying to reserve, rather return -EBUSY.
- * @ticket: ticket used to acquire the ww_mutex.
- *
- * Locks a buffer object for validation. (Or prevents other processes from
- * locking it for validation), while taking a number of measures to prevent
- * deadlocks.
- *
- * Returns:
- * -EDEADLK: The reservation may cause a deadlock.
- * Release all buffer reservations, wait for @bo to become unreserved and
- * try again.
- * -ERESTARTSYS: A wait for the buffer to become unreserved was interrupted by
- * a signal. Release all buffer reservations and return to user-space.
- * -EBUSY: The function needed to sleep, but @no_wait was true
- * -EALREADY: Bo already reserved using @ticket. This error code will only
- * be returned if @use_ticket is set to true.
- */
-static inline int ttm_bo_reserve(struct ttm_buffer_object *bo,
-				 bool interruptible, bool no_wait,
-				 struct ww_acquire_ctx *ticket)
-{
-	int ret;
-
-	if (no_wait) {
-		bool success;
-		if (WARN_ON(ticket))
-			return -EBUSY;
-
-		success = dma_resv_trylock(bo->base.resv);
-		return success ? 0 : -EBUSY;
-	}
-
-	if (interruptible)
-		ret = dma_resv_lock_interruptible(bo->base.resv, ticket);
-	else
-		ret = dma_resv_lock(bo->base.resv, ticket);
-	if (ret == -EINTR)
-		return -ERESTARTSYS;
-	return ret;
-}
-
-/**
- * ttm_bo_reserve_slowpath:
- * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @sequence: Set (@bo)->sequence to this value after lock
- *
- * This is called after ttm_bo_reserve returns -EAGAIN and we backed off
- * from all our other reservations. Because there are no other reservations
- * held by us, this function cannot deadlock any more.
- */
-static inline int ttm_bo_reserve_slowpath(struct ttm_buffer_object *bo,
-					  bool interruptible,
-					  struct ww_acquire_ctx *ticket)
-{
-	if (interruptible) {
-		int ret = dma_resv_lock_slow_interruptible(bo->base.resv,
-							   ticket);
-		if (ret == -EINTR)
-			ret = -ERESTARTSYS;
-		return ret;
-	}
-	dma_resv_lock_slow(bo->base.resv, ticket);
-	return 0;
-}
-
-static inline void
-ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
-{
-	spin_lock(&bo->bdev->lru_lock);
-	ttm_bo_move_to_lru_tail(bo);
-	spin_unlock(&bo->bdev->lru_lock);
-}
-
-static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
-				     struct ttm_resource *new_mem)
-{
-	WARN_ON(bo->resource);
-	bo->resource = new_mem;
-}
-
-/**
- * ttm_bo_move_null = assign memory for a buffer object.
- * @bo: The bo to assign the memory to
- * @new_mem: The memory to be assigned.
- *
- * Assign the memory from new_mem to the memory of the buffer object bo.
- */
-static inline void ttm_bo_move_null(struct ttm_buffer_object *bo,
-				    struct ttm_resource *new_mem)
-{
-	ttm_resource_free(bo, &bo->resource);
-	ttm_bo_assign_mem(bo, new_mem);
-}
-
-/**
- * ttm_bo_unreserve
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- *
- * Unreserve a previous reservation of @bo.
- */
-static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
-{
-	ttm_bo_move_to_lru_tail_unlocked(bo);
-	dma_resv_unlock(bo->base.resv);
-}
-
-/*
- * ttm_bo_util.c
- */
-int ttm_mem_io_reserve(struct ttm_device *bdev,
-		       struct ttm_resource *mem);
-void ttm_mem_io_free(struct ttm_device *bdev,
-		     struct ttm_resource *mem);
-
-/**
- * ttm_bo_move_memcpy
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @interruptible: Sleep interruptible if waiting.
- * @no_wait_gpu: Return immediately if the GPU is busy.
- * @new_mem: struct ttm_resource indicating where to move.
- *
- * Fallback move function for a mappable buffer object in mappable memory.
- * The function will, if successful,
- * free any old aperture space, and set (@new_mem)->mm_node to NULL,
- * and update the (@bo)->mem placement flags. If unsuccessful, the old
- * data remains untouched, and it's up to the caller to free the
- * memory space indicated by @new_mem.
- * Returns:
- * !0: Failure.
- */
-
-int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
-		       struct ttm_operation_ctx *ctx,
-		       struct ttm_resource *new_mem);
-
-/**
- * ttm_bo_move_accel_cleanup.
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @fence: A fence object that signals when moving is complete.
- * @evict: This is an evict move. Don't return until the buffer is idle.
- * @pipeline: evictions are to be pipelined.
- * @new_mem: struct ttm_resource indicating where to move.
- *
- * Accelerated move function to be called when an accelerated move
- * has been scheduled. The function will create a new temporary buffer object
- * representing the old placement, and put the sync object on both buffer
- * objects. After that the newly created buffer object is unref'd to be
- * destroyed when the move is complete. This will help pipeline
- * buffer moves.
- */
-int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
-			      struct dma_fence *fence, bool evict,
-			      bool pipeline,
-			      struct ttm_resource *new_mem);
-
-/**
- * ttm_bo_move_sync_cleanup.
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- * @new_mem: struct ttm_resource indicating where to move.
- *
- * Special case of ttm_bo_move_accel_cleanup where the bo is guaranteed
- * by the caller to be idle. Typically used after memcpy buffer moves.
- */
-void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
-			      struct ttm_resource *new_mem);
-
-/**
- * ttm_bo_pipeline_gutting.
- *
- * @bo: A pointer to a struct ttm_buffer_object.
- *
- * Pipelined gutting a BO of its backing store.
- */
-int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
-
-/**
- * ttm_io_prot
- *
- * bo: ttm buffer object
- * res: ttm resource object
- * @tmp: Page protection flag for a normal, cached mapping.
- *
- * Utility function that returns the pgprot_t that should be used for
- * setting up a PTE with the caching model indicated by @c_state.
- */
-pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
-		     pgprot_t tmp);
-
-/**
- * ttm_bo_tt_bind
- *
- * Bind the object tt to a memory resource.
- */
-int ttm_bo_tt_bind(struct ttm_buffer_object *bo, struct ttm_resource *mem);
-
-/**
- * ttm_bo_tt_destroy.
- */
-void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
-
-void ttm_move_memcpy(bool clear,
-		     u32 num_pages,
-		     struct ttm_kmap_iter *dst_iter,
-		     struct ttm_kmap_iter *src_iter);
-
-struct ttm_kmap_iter *
-ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
-			 struct io_mapping *iomap,
-			 struct sg_table *st,
-			 resource_size_t start);
-#endif
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
index a99d7fdf2964..03aca29d3ce4 100644
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ b/include/drm/ttm/ttm_execbuf_util.h
@@ -33,7 +33,9 @@
 
 #include <linux/list.h>
 
-#include "ttm_bo_api.h"
+struct ww_acquire_ctx;
+struct dma_fence;
+struct ttm_buffer_object;
 
 /**
  * struct ttm_validate_buffer
-- 
2.34.1


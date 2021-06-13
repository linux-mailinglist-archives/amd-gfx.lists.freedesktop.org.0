Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBB73A5DC8
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Jun 2021 09:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D2489D60;
	Mon, 14 Jun 2021 07:37:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5036E0CD;
 Sun, 13 Jun 2021 11:20:48 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id p13so8400382pfw.0;
 Sun, 13 Jun 2021 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=km7fFSoakwLzBL2K4C+XOrORhJcE9EZrDxM5qTTgCOg=;
 b=EVJ4IsPbyK9Sj8w5NYgL4BjGXMDVJ/sTd/Sf8kbEd+6MvzMRLCpjdOYBSH6+WVO3AK
 oVScYkOnPrjZYQGfznN9DxDHEgzZZalD2qAa+g9IJBC2ucq6GxuUFPG1jvEyl9UFzpcs
 P2qssZdMyqAhxklk3sP0DFHwCtV52Oxjl/XCIGn3ftmvJ7ZMwk/phuCLwwRUK8QmJVLg
 6o9ZztKWVtu7VvJW1uq/sLWMoC+vz3TnKoaD1RAO1V2eRAQDRA7APrMfOfrN5I4Kmoax
 qXdLYV3FEzS55cVcEeGFW9kIKvU9XX3lAwqJPQXoy2xSFPULA/9ga2BFKhyAyftunyAy
 KqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=km7fFSoakwLzBL2K4C+XOrORhJcE9EZrDxM5qTTgCOg=;
 b=OIJWMKHtMBE/we91vdrZRPH+bk1bvY6VdP60R6ZLkWrYFtmg3Rd7fqHpwmE3nzV4ul
 v2vExDtq9NOVvnhRtwM+z47L1fQA3nflCaZQyPMD1mLIgbdW5w9YDus/Akbe7nd0OXGD
 pG+e1h8BfZECNe5czjQoVs3RB3l9uHvZ7ZTP40CCzaF3xKuShKq2JjEIY44Hq1OnMyWA
 t8WR/cFxJdOnuCm6w9HeqyqfEUpXtFWS6coL0kHI2Vf7TvpRn2qMhznDen0kOlqt3oLM
 v6LtoOH6u0YhNYem6UVvL6AF2fX6LJHnxF/Zv7nJmjyvhyx0qSNavEI7XTuJ6crCSzRL
 L2BA==
X-Gm-Message-State: AOAM530jLUYEuEbrfFgPZqmgbg3mBA/3KzQmq4lAB0nHNrCFoXHw8dCR
 OAetAA6Z18Y2L0Mo5kl0US4=
X-Google-Smtp-Source: ABdhPJzUiGJ1yIHs4EorvIoB5w2vzkEzl8kzr/5ccH+zbckWpdu6tvfVwa1iOirPhvkpacyDXQwCtg==
X-Received: by 2002:a63:b10:: with SMTP id 16mr12369772pgl.90.1623583248107;
 Sun, 13 Jun 2021 04:20:48 -0700 (PDT)
Received: from localhost.localdomain ([209.58.129.97])
 by smtp.gmail.com with ESMTPSA id l5sm9392162pff.20.2021.06.13.04.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 04:20:47 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH --next] drm/amd/amdgpu: Fix kernel doc warnings
Date: Sun, 13 Jun 2021 16:50:34 +0530
Message-Id: <20210613112034.19235-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 14 Jun 2021 07:37:56 +0000
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
Cc: lukas.bulwahn@gmail.com, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Commit cb1c81467af3 ("drm/ttm: flip the switch for driver
allocated resources v2") changed few ttm_resource pointer names.
The corresponding kernel doc comments were not updated, which
produces few kernel doc build warnings of the type:

./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:193: warning: Excess
function parameter 'mem' description in 'amdgpu_gtt_mgr_del'

Rename the kernel doc function arguments to match the prototype.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index ec96e0b26b11..fa88273364b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -118,7 +118,7 @@ bool amdgpu_gtt_mgr_has_gart_addr(struct ttm_resource *res)
  * @man: TTM memory type manager
  * @tbo: TTM BO we need this range for
  * @place: placement flags and restrictions
- * @mem: the resulting mem object
+ * @res: the resulting TTM memory object
  *
  * Dummy, allocate the node but no space for it yet.
  */
@@ -184,7 +184,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
  * amdgpu_gtt_mgr_del - free ranges
  *
  * @man: TTM memory type manager
- * @mem: TTM memory object
+ * @res: TTM memory object
  *
  * Free the allocated GTT again.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 436ec246a7da..f06813f04e8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -361,7 +361,7 @@ static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
  * @man: TTM memory type manager
  * @tbo: TTM BO we need this range for
  * @place: placement flags and restrictions
- * @mem: the resulting mem object
+ * @res: the resulting TTM memory object
  *
  * Allocate VRAM for the given BO.
  */
@@ -482,7 +482,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
  * amdgpu_vram_mgr_del - free ranges
  *
  * @man: TTM memory type manager
- * @mem: TTM memory object
+ * @res: TTM memory object
  *
  * Free the allocated VRAM again.
  */
@@ -517,7 +517,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
  * amdgpu_vram_mgr_alloc_sgt - allocate and fill a sg table
  *
  * @adev: amdgpu device pointer
- * @mem: TTM memory object
+ * @res: TTM memory object
  * @offset: byte offset from the base of VRAM BO
  * @length: number of bytes to export in sg_table
  * @dev: the other device
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

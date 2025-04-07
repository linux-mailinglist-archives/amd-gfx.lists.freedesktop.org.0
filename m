Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E610A7E0EA
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Apr 2025 16:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513810E48B;
	Mon,  7 Apr 2025 14:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XheIOC10";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802B010E489;
 Mon,  7 Apr 2025 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744035575; x=1775571575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hpDb+1m/k1u4yTwGzkvw+8r5MtZcOIxF44F/LagRZTk=;
 b=XheIOC10CRoHc2EofNS7jm8JbxGl4NU/tKxhiSnhpJ4a58rMXu2GR6Oa
 ItFU7ClvjGo9fY8CF/IbUFkHxikHA3K1FRq/MUTwqedgwtFTw1pTAnrEE
 MmPuynhG3bQGmfs+eBPyAH+oYd1oWxnn4FxQd0ZkM/KYNaY5BMWljpPEI
 rJgndyi6xSqq67KqVJCDdb5yG8ltRRWMzFXj9NCLoXPWGN+XEA1JqEa8q
 Uq7DTgsZS8yCDvpJI0DMzcJy1HGIIXgobKiGiMhlPpeLufdpFL+v874Kp
 tMHobleBN+2ffw0nGF1msWTXX7CoApThccQNu/uA73ACJzSAH6NOVmOIf A==;
X-CSE-ConnectionGUID: zhV73DNCSICq5djGCko59A==
X-CSE-MsgGUID: e7gxegGzTqmyFi2qKBDwbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45516557"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45516557"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:19:35 -0700
X-CSE-ConnectionGUID: dP9wzO5NS+iaG2ArmVz5Iw==
X-CSE-MsgGUID: 9vo+JgdWQGOlOD6KkLIotg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128302344"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:19:34 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/amdgpu/dma_buf: fix page_link check
Date: Mon,  7 Apr 2025 15:18:25 +0100
Message-ID: <20250407141823.44504-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407141823.44504-3-matthew.auld@intel.com>
References: <20250407141823.44504-3-matthew.auld@intel.com>
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

The page_link lower bits of the first sg could contain something like
SG_END, if we are mapping a single VRAM page or contiguous blob which
fits into one sg entry. Rather pull out the struct page, and use that in
our check to know if we mapped struct pages vs VRAM.

Fixes: f44ffd677fb3 ("drm/amdgpu: add support for exporting VRAM using DMA-buf v3")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 9f627caedc3f..c9842a0e2a1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -184,7 +184,7 @@ static void amdgpu_dma_buf_unmap(struct dma_buf_attachment *attach,
 				 struct sg_table *sgt,
 				 enum dma_data_direction dir)
 {
-	if (sgt->sgl->page_link) {
+	if (sg_page(sgt->sgl)) {
 		dma_unmap_sgtable(attach->dev, sgt, dir, 0);
 		sg_free_table(sgt);
 		kfree(sgt);
-- 
2.49.0


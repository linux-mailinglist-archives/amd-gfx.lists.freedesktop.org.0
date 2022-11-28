Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE563AF30
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Nov 2022 18:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D8C10E30F;
	Mon, 28 Nov 2022 17:39:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32B510E30E;
 Mon, 28 Nov 2022 17:39:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AF6CB80E9D;
 Mon, 28 Nov 2022 17:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE365C433C1;
 Mon, 28 Nov 2022 17:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669657179;
 bh=FdHzm1ZvsF1Ap/UO72Req/MoTEbJHBn8Dzxrp/8s6T8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hutTi1Rj/MIaCD4pIu2e2kdgATMjsa464IMNFgLWB3iiB30eg1o1dp+0DgRPH/IRM
 k3J37Hc0672HwqFIBPHNA4sLfF8Kqz1C60G3qDT4mgqDGKT9LmRrId0AlhLhcxIJ+c
 yDvZUvX1QUpyepjd31ulNgM6icNmpvn3FROCRt+5sQ8hPqzCPE8QntPfZzgK1C5r8U
 P01+KaMV63Rg6Azji6XTOkAC+groutkqe+h0zv86uMEp6jokaR2u1BoaRMObjeiPCO
 vCabEKrCrEr9rmY/3SoonrquUYBxqg6GThq7pW7c+L0qf8/EXhIPNfqsWrI/+GGQM1
 l+oSB1ueXNExA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 36/39] drm/amd/display: Use viewport height for
 subvp mall allocation size
Date: Mon, 28 Nov 2022 12:36:16 -0500
Message-Id: <20221128173642.1441232-36-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128173642.1441232-1-sashal@kernel.org>
References: <20221128173642.1441232-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Brian Chang <Brian.Chang@amd.com>,
 Ethan.Wellenreiter@amd.com, Dillon Varone <Dillon.Varone@amd.com>,
 sunpeng.li@amd.com, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, Syed.Hassan@amd.com,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, daniel@ffwll.ch,
 Martin Leung <Martin.Leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun.Lei@amd.com, harry.wentland@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dillon Varone <Dillon.Varone@amd.com>

[ Upstream commit dd2c028c1395d622df7ddd6837f8ab2dc94008ee ]

[WHY?]
MALL allocation size depends on the viewport height, not the addressable
vertical lines, which will not match when scaling.

[HOW?]
Base MALL allocation size calculations off viewport height.

Reviewed-by: Alvin Lee <Alvin.Lee2@amd.com>
Reviewed-by: Martin Leung <Martin.Leung@amd.com>
Acked-by: Brian Chang <Brian.Chang@amd.com>
Signed-off-by: Dillon Varone <Dillon.Varone@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 13cd1f2e50ca..902c69d126d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -101,7 +101,7 @@ uint32_t dcn32_helper_calculate_num_ways_for_subvp(struct dc *dc, struct dc_stat
 			mall_alloc_width_blk_aligned = full_vp_width_blk_aligned;
 
 			/* mall_alloc_height_blk_aligned_l/c = CEILING(sub_vp_height_l/c - 1, blk_height_l/c) + blk_height_l/c */
-			mall_alloc_height_blk_aligned = (pipe->stream->timing.v_addressable - 1 + mblk_height - 1) /
+			mall_alloc_height_blk_aligned = (pipe->plane_res.scl_data.viewport.height - 1 + mblk_height - 1) /
 					mblk_height * mblk_height + mblk_height;
 
 			/* full_mblk_width_ub_l/c = mall_alloc_width_blk_aligned_l/c;
-- 
2.35.1


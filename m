Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA64835B3
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jan 2022 18:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF98189F41;
	Mon,  3 Jan 2022 17:29:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDCC89F19;
 Mon,  3 Jan 2022 17:29:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F32F61169;
 Mon,  3 Jan 2022 17:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03ACCC36AEB;
 Mon,  3 Jan 2022 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641230992;
 bh=KqtkVt83uKOqL6K+uL+/pgElnlYrbHJGW1M2WZE2EXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j9eC2PddgZjdogZmdtEE+2wLUDZrlUrCWkV1UzCpalbG5/5mn3VYeLzMKOalTX7/1
 c5zTWWuYg4FJRNLmee1+Vo5nEeaY3G74nUjACTapoEkAihokaaov7fYL9pp9iNKSlz
 2edGRCnuUqZM7kue50YUEC2qq7FHAOw/qfeaJm772hOnIdhUKyxU0RG2LH2kAlvGqb
 YRL74IGsmfWE0N53fz0mk6KfLWaTxo2+KXcAvIHQpMm6A5Mdwrml3RQ1US0wIKXUIz
 CaB5lcorcLJMg0SubmfSnyzbz2/YIXi3k9mGTCYmTS1qSisRTGdDDfxkf5U6aDonYH
 Two5NKjqBTJUQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 13/16] drm/amd/display: fix B0 TMDS deepcolor no
 dislay issue
Date: Mon,  3 Jan 2022 12:28:46 -0500
Message-Id: <20220103172849.1612731-13-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103172849.1612731-1-sashal@kernel.org>
References: <20220103172849.1612731-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 Jun Lei <Jun.Lei@amd.com>, Sasha Levin <sashal@kernel.org>,
 Charlene Liu <Charlene.Liu@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 michael.strauss@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 nikola.cornij@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 agustin.gutierrez@amd.com, Eric.Yang2@amd.com, Xinhui.Pan@amd.com,
 Zhan.Liu@amd.com, christian.koenig@amd.com,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Charlene Liu <Charlene.Liu@amd.com>

[ Upstream commit 2eb82577a16d4c8eb31e4ed520649850bb95b223 ]

[why]
B0 PHY C map to F, D map to G driver use logic instance, dmub does the
remap. Driver still need use the right PHY instance to access right HW.

[how]
use phyical instance when program PHY register.

[note]
could move resync_control programming to dmub next.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dcn31/dcn31_resource.c | 25 +++++++++++++--
 .../drm/amd/display/dc/dcn31/dcn31_resource.h | 31 +++++++++++++++++++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 79e92ecca96c1..0c0fe3fb70e19 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -352,6 +352,14 @@ static const struct dce110_clk_src_regs clk_src_regs[] = {
 	clk_src_regs(3, D),
 	clk_src_regs(4, E)
 };
+/*pll_id being rempped in dmub, in driver it is logical instance*/
+static const struct dce110_clk_src_regs clk_src_regs_b0[] = {
+	clk_src_regs(0, A),
+	clk_src_regs(1, B),
+	clk_src_regs(2, F),
+	clk_src_regs(3, G),
+	clk_src_regs(4, E)
+};
 
 static const struct dce110_clk_src_shift cs_shift = {
 		CS_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
@@ -2019,14 +2027,27 @@ static bool dcn31_resource_construct(
 			dcn30_clock_source_create(ctx, ctx->dc_bios,
 				CLOCK_SOURCE_COMBO_PHY_PLL1,
 				&clk_src_regs[1], false);
-	pool->base.clock_sources[DCN31_CLK_SRC_PLL2] =
+	/*move phypllx_pixclk_resync to dmub next*/
+	if (dc->ctx->asic_id.hw_internal_rev == YELLOW_CARP_B0) {
+		pool->base.clock_sources[DCN31_CLK_SRC_PLL2] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs_b0[2], false);
+		pool->base.clock_sources[DCN31_CLK_SRC_PLL3] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs_b0[3], false);
+	} else {
+		pool->base.clock_sources[DCN31_CLK_SRC_PLL2] =
 			dcn30_clock_source_create(ctx, ctx->dc_bios,
 				CLOCK_SOURCE_COMBO_PHY_PLL2,
 				&clk_src_regs[2], false);
-	pool->base.clock_sources[DCN31_CLK_SRC_PLL3] =
+		pool->base.clock_sources[DCN31_CLK_SRC_PLL3] =
 			dcn30_clock_source_create(ctx, ctx->dc_bios,
 				CLOCK_SOURCE_COMBO_PHY_PLL3,
 				&clk_src_regs[3], false);
+	}
+
 	pool->base.clock_sources[DCN31_CLK_SRC_PLL4] =
 			dcn30_clock_source_create(ctx, ctx->dc_bios,
 				CLOCK_SOURCE_COMBO_PHY_PLL4,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
index 93571c9769967..cc4bed675588c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
@@ -39,4 +39,35 @@ struct resource_pool *dcn31_create_resource_pool(
 		const struct dc_init_data *init_data,
 		struct dc *dc);
 
+/*temp: B0 specific before switch to dcn313 headers*/
+#ifndef regPHYPLLF_PIXCLK_RESYNC_CNTL
+#define regPHYPLLF_PIXCLK_RESYNC_CNTL 0x007e
+#define regPHYPLLF_PIXCLK_RESYNC_CNTL_BASE_IDX 1
+#define regPHYPLLG_PIXCLK_RESYNC_CNTL 0x005f
+#define regPHYPLLG_PIXCLK_RESYNC_CNTL_BASE_IDX 1
+
+//PHYPLLF_PIXCLK_RESYNC_CNTL
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_PIXCLK_RESYNC_ENABLE__SHIFT 0x0
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_DEEP_COLOR_DTO_ENABLE_STATUS__SHIFT 0x1
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_DCCG_DEEP_COLOR_CNTL__SHIFT 0x4
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_PIXCLK_ENABLE__SHIFT 0x8
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_PIXCLK_DOUBLE_RATE_ENABLE__SHIFT 0x9
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_PIXCLK_RESYNC_ENABLE_MASK 0x00000001L
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_DEEP_COLOR_DTO_ENABLE_STATUS_MASK 0x00000002L
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_DCCG_DEEP_COLOR_CNTL_MASK 0x00000030L
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_PIXCLK_ENABLE_MASK 0x00000100L
+#define PHYPLLF_PIXCLK_RESYNC_CNTL__PHYPLLF_PIXCLK_DOUBLE_RATE_ENABLE_MASK 0x00000200L
+
+//PHYPLLG_PIXCLK_RESYNC_CNTL
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_PIXCLK_RESYNC_ENABLE__SHIFT 0x0
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_DEEP_COLOR_DTO_ENABLE_STATUS__SHIFT 0x1
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_DCCG_DEEP_COLOR_CNTL__SHIFT 0x4
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_PIXCLK_ENABLE__SHIFT 0x8
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_PIXCLK_DOUBLE_RATE_ENABLE__SHIFT 0x9
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_PIXCLK_RESYNC_ENABLE_MASK 0x00000001L
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_DEEP_COLOR_DTO_ENABLE_STATUS_MASK 0x00000002L
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_DCCG_DEEP_COLOR_CNTL_MASK 0x00000030L
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_PIXCLK_ENABLE_MASK 0x00000100L
+#define PHYPLLG_PIXCLK_RESYNC_CNTL__PHYPLLG_PIXCLK_DOUBLE_RATE_ENABLE_MASK 0x00000200L
+#endif
 #endif /* _DCN31_RESOURCE_H_ */
-- 
2.34.1


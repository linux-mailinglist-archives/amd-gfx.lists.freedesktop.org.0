Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD588DDFC
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EA310FB20;
	Wed, 27 Mar 2024 12:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oxIZa/Na";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0F610FB1E;
 Wed, 27 Mar 2024 12:12:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CBB0ECE262F;
 Wed, 27 Mar 2024 12:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2913C433C7;
 Wed, 27 Mar 2024 12:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541562;
 bh=3gOTcSfpvoPoURCbubBqohbjwh1DJnoyYzhkx4XqD3g=;
 h=From:To:Cc:Subject:Date:From;
 b=oxIZa/NaXbeq67l7M6kzzEguu4C/X4yxCgplAZtPJmuR2tGFVmLBdVbUKjbtHRL7L
 fu1V42EFmlxODR9DgFriD5Tc3tPJOdkfT1dF+ilRQicpK5bSFFX7DhUqk0lnswEJst
 GRsyA+/Na5uyk3yBL9myaYtQekDfYh6PT8o+3WpduiO/MoBT8t+0WplaRzQYmVdRde
 4tuo9b+taJCzY6CQgOhJDSmGBZROtjaTr0IJ8j9ZZHTc+2i8PXAP2yKaf4AKuyqGHs
 2IjdLxAqs5GgX06Hns6rhx8mAfZ+UyDBhhPSZXqG9HCG1fLsxjWXY9B1PPxqSzTbrA
 WkJmnGtR7FlfA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	srinivasan.shanmugam@amd.com
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Fix late derefrence 'dsc' check in
 'link_set_dsc_pps_packet()'" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:12:39 -0400
Message-ID: <20240327121239.2829699-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 166225e79ccc3d02c4c46e1b3c09d03eb91473ca Mon Sep 17 00:00:00 2001
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Date: Wed, 10 Jan 2024 20:58:35 +0530
Subject: [PATCH] drm/amd/display: Fix late derefrence 'dsc' check in
 'link_set_dsc_pps_packet()'

In link_set_dsc_pps_packet(), 'struct display_stream_compressor *dsc'
was dereferenced in a DC_LOGGER_INIT(dsc->ctx->logger); before the 'dsc'
NULL pointer check.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dpms.c:905 link_set_dsc_pps_packet() warn: variable dereferenced before check 'dsc' (see line 903)

Cc: stable@vger.kernel.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/link/link_dpms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 3de148004c066..3cbfbf8d107e9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -900,11 +900,15 @@ bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx, bool enable, bool immedi
 {
 	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
 	struct dc_stream_state *stream = pipe_ctx->stream;
-	DC_LOGGER_INIT(dsc->ctx->logger);
 
-	if (!pipe_ctx->stream->timing.flags.DSC || !dsc)
+	if (!pipe_ctx->stream->timing.flags.DSC)
 		return false;
 
+	if (!dsc)
+		return false;
+
+	DC_LOGGER_INIT(dsc->ctx->logger);
+
 	if (enable) {
 		struct dsc_config dsc_cfg;
 		uint8_t dsc_packed_pps[128];
-- 
2.43.0





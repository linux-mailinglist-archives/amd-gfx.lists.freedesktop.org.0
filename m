Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D328388DD51
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA47910FA96;
	Wed, 27 Mar 2024 12:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EmB7QmSe";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2D710FA94;
 Wed, 27 Mar 2024 12:07:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3FCE46151F;
 Wed, 27 Mar 2024 12:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8898C43390;
 Wed, 27 Mar 2024 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541277;
 bh=b2XwbxfKmnqaeyj2iO4j8FwUcsmrFjgxwZCWdP3SyfA=;
 h=From:To:Cc:Subject:Date:From;
 b=EmB7QmSeR1qVow3TdE9XXn9CZVvt1nixJ+n6zqKabP6wIJQqvQKj9n+6tKs3ctaVE
 02zFnPYo/2HYAP2MVw9O94Luir/AzdTc/aNZJHGo/woFI+4DOM+sKYeBag3zE/jrSU
 rb4ztVubiunn+T2DX1J1u9MeniYQA1TtG3xb9tYK1SgycyFzvXqJ8cU2RXiVqv8Z7B
 XPsKrZ+vRMCwbcKd1UWaQe6cCXtHiqc2oQfzDOnAkUiB4ZCc6qiFi6HF9+ijRsGkPg
 v5QZpjgs6+v1XhGi5GY2z1lbQfy//txNfW9MhvfMdftjJxny1pTXIQ+bQbHKkTM2wX
 EkqivIURkXncQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jerry.zuo@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Fix dcn35 8k30 Underflow/Corruption
 Issue" failed to apply to 6.8-stable tree
Date: Wed, 27 Mar 2024 08:07:54 -0400
Message-ID: <20240327120754.2825804-1-sashal@kernel.org>
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

The patch below does not apply to the 6.8-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 4ba9ca63e696f7bdc91293aeb70c22203b7089be Mon Sep 17 00:00:00 2001
From: Fangzhi Zuo <jerry.zuo@amd.com>
Date: Thu, 11 Jan 2024 14:46:01 -0500
Subject: [PATCH] drm/amd/display: Fix dcn35 8k30 Underflow/Corruption Issue

[why]
odm calculation is missing for pipe split policy determination
and cause Underflow/Corruption issue.

[how]
Add the odm calculation.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Fangzhi Zuo <jerry.zuo@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../display/dc/dml2/dml2_translation_helper.c | 29 +++++++------------
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  2 ++
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 8b0f930be5ae1..23a608274096f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -791,35 +791,28 @@ static void populate_dml_surface_cfg_from_plane_state(enum dml_project_id dml2_p
 	}
 }
 
-/*TODO no support for mpc combine, need rework - should calculate scaling params based on plane+stream*/
-static struct scaler_data get_scaler_data_for_plane(const struct dc_plane_state *in, const struct dc_state *context)
+static struct scaler_data get_scaler_data_for_plane(const struct dc_plane_state *in, struct dc_state *context)
 {
 	int i;
-	struct scaler_data data = { 0 };
+	struct pipe_ctx *temp_pipe = &context->res_ctx.temp_pipe;
+
+	memset(temp_pipe, 0, sizeof(struct pipe_ctx));
 
 	for (i = 0; i < MAX_PIPES; i++)	{
 		const struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
 		if (pipe->plane_state == in && !pipe->prev_odm_pipe) {
-			const struct pipe_ctx *next_pipe = pipe->next_odm_pipe;
-
-			data = context->res_ctx.pipe_ctx[i].plane_res.scl_data;
-			while (next_pipe) {
-				data.h_active += next_pipe->plane_res.scl_data.h_active;
-				data.recout.width += next_pipe->plane_res.scl_data.recout.width;
-				if (in->rotation == ROTATION_ANGLE_0 || in->rotation == ROTATION_ANGLE_180) {
-					data.viewport.width += next_pipe->plane_res.scl_data.viewport.width;
-				} else {
-					data.viewport.height += next_pipe->plane_res.scl_data.viewport.height;
-				}
-				next_pipe = next_pipe->next_odm_pipe;
-			}
+			temp_pipe->stream = pipe->stream;
+			temp_pipe->plane_state = pipe->plane_state;
+			temp_pipe->plane_res.scl_data.taps = pipe->plane_res.scl_data.taps;
+
+			resource_build_scaling_params(temp_pipe);
 			break;
 		}
 	}
 
 	ASSERT(i < MAX_PIPES);
-	return data;
+	return temp_pipe->plane_res.scl_data;
 }
 
 static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_stream_state *in)
@@ -864,7 +857,7 @@ static void populate_dummy_dml_plane_cfg(struct dml_plane_cfg_st *out, unsigned
 	out->ScalerEnabled[location] = false;
 }
 
-static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_plane_state *in, const struct dc_state *context)
+static void populate_dml_plane_cfg_from_plane_state(struct dml_plane_cfg_st *out, unsigned int location, const struct dc_plane_state *in, struct dc_state *context)
 {
 	const struct scaler_data scaler_data = get_scaler_data_for_plane(in, context);
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index f74ae0d41d3c4..3a6bf77a68732 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -469,6 +469,8 @@ struct resource_context {
 	unsigned int hpo_dp_link_enc_to_link_idx[MAX_HPO_DP2_LINK_ENCODERS];
 	int hpo_dp_link_enc_ref_cnts[MAX_HPO_DP2_LINK_ENCODERS];
 	bool is_mpc_3dlut_acquired[MAX_PIPES];
+	/* solely used for build scalar data in dml2 */
+	struct pipe_ctx temp_pipe;
 };
 
 struct dce_bw_output {
-- 
2.43.0





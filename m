Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0988DD7B
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5EA10FAB8;
	Wed, 27 Mar 2024 12:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O0XEsLi8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E507710FABA;
 Wed, 27 Mar 2024 12:09:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C16661511;
 Wed, 27 Mar 2024 12:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F91C433C7;
 Wed, 27 Mar 2024 12:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541342;
 bh=sV50j7eYImpFJDReGawZGKXxcTlYJyJ0zm/7k4spmLE=;
 h=From:To:Cc:Subject:Date:From;
 b=O0XEsLi8a9YH+qZujLkksjMV2uWy2jGegu+gNoXaKC5tH5ArMVkdw88+9BDgn4R0w
 k+TUQPxBn1YEzIL0ao1GvBGZhjNMAx+XSq5d3IMXMgsOokj4D6GEmWnjwjt8oIVx2Z
 zdmAbf1js4W04LU0S0vjDsyHUFA1ZibS3aQBr28gncUEaA+2P1Uzi+FLtleEcx9jIP
 Ohi777VqC1CtBKajM+NBOrS2JiVLM3byNMmJm7bcw0A3yJv22a08kZ5sM772c7IsuQ
 EteKJj4WXmCUhfXH4mN2HW8TkjtxA1Q9ZfRxKfjSWamF6PlAOYq76fIXrVmEU7Ru+k
 6M/jDRFsmmIUA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chuntao.tso@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Alex Hung <alex.hung@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Amend coasting vtotal for replay low
 hz" failed to apply to 6.7-stable tree
Date: Wed, 27 Mar 2024 08:08:59 -0400
Message-ID: <20240327120900.2826683-1-sashal@kernel.org>
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

The patch below does not apply to the 6.7-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 8e054b0f1e71531762b8ded7f66c1b4af734671b Mon Sep 17 00:00:00 2001
From: ChunTao Tso <chuntao.tso@amd.com>
Date: Tue, 20 Feb 2024 17:08:39 +0800
Subject: [PATCH] drm/amd/display: Amend coasting vtotal for replay low hz

[WHY]
The original coasting vtotal is 2 bytes, and it need to
be amended to 4 bytes because low hz case.

[HOW]
Amend coasting vtotal from 2 bytes to 4 bytes.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: ChunTao Tso <chuntao.tso@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_types.h                 | 4 ++--
 drivers/gpu/drm/amd/display/dc/inc/link.h                 | 4 ++--
 .../display/dc/link/protocols/link_edp_panel_control.c    | 4 ++--
 .../display/dc/link/protocols/link_edp_panel_control.h    | 4 ++--
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h           | 8 ++++++++
 drivers/gpu/drm/amd/display/modules/power/power_helpers.c | 2 +-
 drivers/gpu/drm/amd/display/modules/power/power_helpers.h | 2 +-
 7 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 9900dda2eef5c..be2ac5c442a48 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -1085,9 +1085,9 @@ struct replay_settings {
 	/* SMU optimization is enabled */
 	bool replay_smu_opt_enable;
 	/* Current Coasting vtotal */
-	uint16_t coasting_vtotal;
+	uint32_t coasting_vtotal;
 	/* Coasting vtotal table */
-	uint16_t coasting_vtotal_table[PR_COASTING_TYPE_NUM];
+	uint32_t coasting_vtotal_table[PR_COASTING_TYPE_NUM];
 	/* Maximum link off frame count */
 	enum replay_link_off_frame_count_level link_off_frame_count_level;
 	/* Replay pseudo vtotal for abm + ips on full screen video which can improve ips residency */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index 26fe81f213da5..bf29fc58ea6a6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -285,12 +285,12 @@ struct link_service {
 			enum replay_FW_Message_type msg,
 			union dmub_replay_cmd_set *cmd_data);
 	bool (*edp_set_coasting_vtotal)(
-			struct dc_link *link, uint16_t coasting_vtotal);
+			struct dc_link *link, uint32_t coasting_vtotal);
 	bool (*edp_replay_residency)(const struct dc_link *link,
 			unsigned int *residency, const bool is_start,
 			const bool is_alpm);
 	bool (*edp_set_replay_power_opt_and_coasting_vtotal)(struct dc_link *link,
-			const unsigned int *power_opts, uint16_t coasting_vtotal);
+			const unsigned int *power_opts, uint32_t coasting_vtotal);
 
 	bool (*edp_wait_for_t12)(struct dc_link *link);
 	bool (*edp_is_ilr_optimization_required)(struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index acfbbc638cc64..3baa2bdd6dd65 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -1034,7 +1034,7 @@ bool edp_send_replay_cmd(struct dc_link *link,
 	return true;
 }
 
-bool edp_set_coasting_vtotal(struct dc_link *link, uint16_t coasting_vtotal)
+bool edp_set_coasting_vtotal(struct dc_link *link, uint32_t coasting_vtotal)
 {
 	struct dc *dc = link->ctx->dc;
 	struct dmub_replay *replay = dc->res_pool->replay;
@@ -1073,7 +1073,7 @@ bool edp_replay_residency(const struct dc_link *link,
 }
 
 bool edp_set_replay_power_opt_and_coasting_vtotal(struct dc_link *link,
-	const unsigned int *power_opts, uint16_t coasting_vtotal)
+	const unsigned int *power_opts, uint32_t coasting_vtotal)
 {
 	struct dc  *dc = link->ctx->dc;
 	struct dmub_replay *replay = dc->res_pool->replay;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
index 34e521af7bb48..a158c6234d422 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.h
@@ -59,12 +59,12 @@ bool edp_setup_replay(struct dc_link *link,
 bool edp_send_replay_cmd(struct dc_link *link,
 			enum replay_FW_Message_type msg,
 			union dmub_replay_cmd_set *cmd_data);
-bool edp_set_coasting_vtotal(struct dc_link *link, uint16_t coasting_vtotal);
+bool edp_set_coasting_vtotal(struct dc_link *link, uint32_t coasting_vtotal);
 bool edp_replay_residency(const struct dc_link *link,
 	unsigned int *residency, const bool is_start, const bool is_alpm);
 bool edp_get_replay_state(const struct dc_link *link, uint64_t *state);
 bool edp_set_replay_power_opt_and_coasting_vtotal(struct dc_link *link,
-	const unsigned int *power_opts, uint16_t coasting_vtotal);
+	const unsigned int *power_opts, uint32_t coasting_vtotal);
 bool edp_wait_for_t12(struct dc_link *link);
 bool edp_is_ilr_optimization_required(struct dc_link *link,
        struct dc_crtc_timing *crtc_timing);
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index a529e369b2ace..af3fe8bb0728b 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -3238,6 +3238,14 @@ struct dmub_cmd_replay_set_coasting_vtotal_data {
 	 * Currently the support is only for 0 or 1
 	 */
 	uint8_t panel_inst;
+	/**
+	 * 16-bit value dicated by driver that indicates the coasting vtotal high byte part.
+	 */
+	uint16_t coasting_vtotal_high;
+	/**
+	 * Explicit padding to 4 byte boundary.
+	 */
+	uint8_t pad[2];
 };
 
 /**
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index e304e8435fb8f..2a3698fd2dc24 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -975,7 +975,7 @@ bool psr_su_set_dsc_slice_height(struct dc *dc, struct dc_link *link,
 
 void set_replay_coasting_vtotal(struct dc_link *link,
 	enum replay_coasting_vtotal_type type,
-	uint16_t vtotal)
+	uint32_t vtotal)
 {
 	link->replay_settings.coasting_vtotal_table[type] = vtotal;
 }
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
index bef4815e1703d..ff7e6f3cd6be2 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
@@ -56,7 +56,7 @@ bool dmub_init_abm_config(struct resource_pool *res_pool,
 void init_replay_config(struct dc_link *link, struct replay_config *pr_config);
 void set_replay_coasting_vtotal(struct dc_link *link,
 	enum replay_coasting_vtotal_type type,
-	uint16_t vtotal);
+	uint32_t vtotal);
 void set_replay_ips_full_screen_video_src_vtotal(struct dc_link *link, uint16_t vtotal);
 void calculate_replay_link_off_frame_count(struct dc_link *link,
 	uint16_t vtotal, uint16_t htotal);
-- 
2.43.0





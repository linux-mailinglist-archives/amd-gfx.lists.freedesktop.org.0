Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E513BCB91
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Jul 2021 13:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0D989FEA;
	Tue,  6 Jul 2021 11:14:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D0D589FD4;
 Tue,  6 Jul 2021 11:14:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E94E610F7;
 Tue,  6 Jul 2021 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570074;
 bh=KRP1Cyi2W3dJWgDmqHI0jiFZG7iLyI9OiCvn3Dzv2g8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QdjwFADYh41IPxClc8qOWwyBq6yQIaHf063Tbua1hszxOkT5jT/6/zqF/OzhwqMmU
 j6eeCC2hw5foMpql+/D2zEUeD+yUUD/RBmHVgyDQsuOWqqR1K5oM6Al9AjfHUK0oid
 Z24zltxA770jYlPqlpz/x9zaU1PLWmK0Lw6dCIgZxSvXY2JH25eh2/9Co8P6eWZ39/
 GRlUN/VXesuLhUd2UVD6gZuZAZ2vDllcHfqsklcu1hT47V+NKqtsiXii/02VCTlLU+
 KZh23s9IV0+dhmIwqp0KE+/j00PjB7wdRSfVZemR9XNCE6Bwc6/09AU/OE25JESQe7
 tIMIrR75vshhg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 016/189] drm/amd/display: Fix clock table filling
 logic
Date: Tue,  6 Jul 2021 07:11:16 -0400
Message-Id: <20210706111409.2058071-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Ilya Bakoulin <Ilya.Bakoulin@amd.com>

[ Upstream commit c31bef1cb1203b26f901a511a3246204cfaf8a57 ]

[Why]
Currently, the code that fills the clock table can miss filling
information about some of the higher voltage states advertised
by the SMU. This, in turn, may cause some of the higher pixel clock
modes (e.g. 8k60) to fail validation.

[How]
Fill the table with one entry per DCFCLK level instead of one entry
per FCLK level. This is needed because the maximum FCLK does not
necessarily need maximum voltage, whereas DCFCLK values from SMU
cover the full voltage range.

Signed-off-by: Ilya Bakoulin <Ilya.Bakoulin@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Stylon Wang <stylon.wang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 80 ++++++++++++-------
 .../drm/amd/display/dc/dcn21/dcn21_resource.c | 33 +++++---
 2 files changed, 74 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 49d19fdd750b..1f56ceab5922 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -834,46 +834,67 @@ static struct wm_table lpddr4_wm_table_rn = {
 		},
 	}
 };
-static unsigned int find_socclk_for_voltage(struct dpm_clocks *clock_table, unsigned int voltage)
+
+static unsigned int find_max_fclk_for_voltage(struct dpm_clocks *clock_table,
+		unsigned int voltage)
 {
 	int i;
+	uint32_t max_clk = 0;
 
-	for (i = 0; i < PP_SMU_NUM_SOCCLK_DPM_LEVELS; i++) {
-		if (clock_table->SocClocks[i].Vol == voltage)
-			return clock_table->SocClocks[i].Freq;
+	for (i = 0; i < PP_SMU_NUM_FCLK_DPM_LEVELS; i++) {
+		if (clock_table->FClocks[i].Vol <= voltage) {
+			max_clk = clock_table->FClocks[i].Freq > max_clk ?
+				clock_table->FClocks[i].Freq : max_clk;
+		}
 	}
 
-	ASSERT(0);
-	return 0;
+	return max_clk;
 }
-static unsigned int find_dcfclk_for_voltage(struct dpm_clocks *clock_table, unsigned int voltage)
+
+static unsigned int find_max_memclk_for_voltage(struct dpm_clocks *clock_table,
+		unsigned int voltage)
 {
 	int i;
+	uint32_t max_clk = 0;
 
-	for (i = 0; i < PP_SMU_NUM_DCFCLK_DPM_LEVELS; i++) {
-		if (clock_table->DcfClocks[i].Vol == voltage)
-			return clock_table->DcfClocks[i].Freq;
+	for (i = 0; i < PP_SMU_NUM_MEMCLK_DPM_LEVELS; i++) {
+		if (clock_table->MemClocks[i].Vol <= voltage) {
+			max_clk = clock_table->MemClocks[i].Freq > max_clk ?
+				clock_table->MemClocks[i].Freq : max_clk;
+		}
 	}
 
-	ASSERT(0);
-	return 0;
+	return max_clk;
+}
+
+static unsigned int find_max_socclk_for_voltage(struct dpm_clocks *clock_table,
+		unsigned int voltage)
+{
+	int i;
+	uint32_t max_clk = 0;
+
+	for (i = 0; i < PP_SMU_NUM_SOCCLK_DPM_LEVELS; i++) {
+		if (clock_table->SocClocks[i].Vol <= voltage) {
+			max_clk = clock_table->SocClocks[i].Freq > max_clk ?
+				clock_table->SocClocks[i].Freq : max_clk;
+		}
+	}
+
+	return max_clk;
 }
 
 static void rn_clk_mgr_helper_populate_bw_params(struct clk_bw_params *bw_params, struct dpm_clocks *clock_table, struct integrated_info *bios_info)
 {
 	int i, j = 0;
+	unsigned int volt;
 
 	j = -1;
 
-	ASSERT(PP_SMU_NUM_FCLK_DPM_LEVELS <= MAX_NUM_DPM_LVL);
-
-	/* Find lowest DPM, FCLK is filled in reverse order*/
-
-	for (i = PP_SMU_NUM_FCLK_DPM_LEVELS - 1; i >= 0; i--) {
-		if (clock_table->FClocks[i].Freq != 0 && clock_table->FClocks[i].Vol != 0) {
+	/* Find max DPM */
+	for (i = 0; i < PP_SMU_NUM_DCFCLK_DPM_LEVELS; ++i) {
+		if (clock_table->DcfClocks[i].Freq != 0 &&
+				clock_table->DcfClocks[i].Vol != 0)
 			j = i;
-			break;
-		}
 	}
 
 	if (j == -1) {
@@ -884,13 +905,18 @@ static void rn_clk_mgr_helper_populate_bw_params(struct clk_bw_params *bw_params
 
 	bw_params->clk_table.num_entries = j + 1;
 
-	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
-		bw_params->clk_table.entries[i].fclk_mhz = clock_table->FClocks[j].Freq;
-		bw_params->clk_table.entries[i].memclk_mhz = clock_table->MemClocks[j].Freq;
-		bw_params->clk_table.entries[i].voltage = clock_table->FClocks[j].Vol;
-		bw_params->clk_table.entries[i].dcfclk_mhz = find_dcfclk_for_voltage(clock_table, clock_table->FClocks[j].Vol);
-		bw_params->clk_table.entries[i].socclk_mhz = find_socclk_for_voltage(clock_table,
-									bw_params->clk_table.entries[i].voltage);
+	for (i = 0; i < bw_params->clk_table.num_entries; i++) {
+		volt = clock_table->DcfClocks[i].Vol;
+
+		bw_params->clk_table.entries[i].voltage = volt;
+		bw_params->clk_table.entries[i].dcfclk_mhz =
+			clock_table->DcfClocks[i].Freq;
+		bw_params->clk_table.entries[i].fclk_mhz =
+			find_max_fclk_for_voltage(clock_table, volt);
+		bw_params->clk_table.entries[i].memclk_mhz =
+			find_max_memclk_for_voltage(clock_table, volt);
+		bw_params->clk_table.entries[i].socclk_mhz =
+			find_max_socclk_for_voltage(clock_table, volt);
 	}
 
 	bw_params->vram_type = bios_info->memory_type;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 8e3f1d0b4cc3..38a2aa87f5f5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -1575,10 +1575,12 @@ static struct _vcs_dpi_voltage_scaling_st construct_low_pstate_lvl(struct clk_li
 	low_pstate_lvl.phyclk_d18_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].phyclk_d18_mhz;
 	low_pstate_lvl.phyclk_mhz = dcn2_1_soc.clock_limits[high_voltage_lvl].phyclk_mhz;
 
-	for (i = clk_table->num_entries; i > 1; i--)
-		clk_table->entries[i] = clk_table->entries[i-1];
-	clk_table->entries[1] = clk_table->entries[0];
-	clk_table->num_entries++;
+	if (clk_table->num_entries < MAX_NUM_DPM_LVL) {
+		for (i = clk_table->num_entries; i > 1; i--)
+			clk_table->entries[i] = clk_table->entries[i-1];
+		clk_table->entries[1] = clk_table->entries[0];
+		clk_table->num_entries++;
+	}
 
 	return low_pstate_lvl;
 }
@@ -1610,10 +1612,6 @@ static void update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 			}
 		}
 
-		/* clk_table[1] is reserved for min DF PState.  skip here to fill in later. */
-		if (i == 1)
-			k++;
-
 		clock_limits[k].state = k;
 		clock_limits[k].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
 		clock_limits[k].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
@@ -1630,14 +1628,25 @@ static void update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 
 		k++;
 	}
-	for (i = 0; i < clk_table->num_entries + 1; i++)
-		dcn2_1_soc.clock_limits[i] = clock_limits[i];
+
+	if (clk_table->num_entries >= MAX_NUM_DPM_LVL) {
+		for (i = 0; i < clk_table->num_entries + 1; i++)
+			dcn2_1_soc.clock_limits[i] = clock_limits[i];
+	} else {
+		dcn2_1_soc.clock_limits[0] = clock_limits[0];
+		for (i = 2; i < clk_table->num_entries + 1; i++) {
+			dcn2_1_soc.clock_limits[i] = clock_limits[i - 1];
+			dcn2_1_soc.clock_limits[i].state = i;
+		}
+	}
+
 	if (clk_table->num_entries) {
-		dcn2_1_soc.num_states = clk_table->num_entries + 1;
 		/* fill in min DF PState */
 		dcn2_1_soc.clock_limits[1] = construct_low_pstate_lvl(clk_table, closest_clk_lvl);
+		dcn2_1_soc.num_states = clk_table->num_entries;
 		/* duplicate last level */
-		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states] = dcn2_1_soc.clock_limits[dcn2_1_soc.num_states - 1];
+		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states] =
+			dcn2_1_soc.clock_limits[dcn2_1_soc.num_states - 1];
 		dcn2_1_soc.clock_limits[dcn2_1_soc.num_states].state = dcn2_1_soc.num_states;
 	}
 
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

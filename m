Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6346EFD0
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Dec 2021 18:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89610EEA4;
	Thu,  9 Dec 2021 16:54:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A55A89F8B
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Dec 2021 15:47:53 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4J8z2K12G9zF4c9;
 Thu,  9 Dec 2021 07:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1639064873; bh=nlVlFGopO20pEJPTg4sgiYConAFOuT6AB/GdLATt/QU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=elKGg8kY3oOeYGP5VROB86z5A/g/nZxukNceDB7ODQlJJnBH1HAuFbIo1xj0mK0nW
 X52xNseaErASn9i42eQio6WcQtC2m2nDIpfcKK4h/OwAH4hcz9WHv0SfVlTS0JBFAQ
 uOwWkvHSndM43fisjxm7zOhhZRmK4Yirf1YkFL6I=
X-Riseup-User-ID: BDC6E2617EF544B8E4D141515F8C469E4297AB1D91E0062623EFFD87B1359A1F
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4J8z2G48f2z1yT2;
 Thu,  9 Dec 2021 07:47:50 -0800 (PST)
From: Isabella Basso <isabbasso@riseup.net>
To: alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, Rodrigo.Siqueira@amd.com, Felix.Kuehling@amd.com
Subject: [PATCH v2 06/10] drm/amd/display: fix function scopes
Date: Thu,  9 Dec 2021 12:47:20 -0300
Message-Id: <20211209154722.4018279-3-isabbasso@riseup.net>
In-Reply-To: <20211209154722.4018279-1-isabbasso@riseup.net>
References: <20211209154722.4018279-1-isabbasso@riseup.net>
MIME-Version: 1.0
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
Cc: ~lkcamp/patches@lists.sr.ht, Isabella Basso <isabbasso@riseup.net>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This turns previously global functions into static, thus removing
compile-time warnings such as:

  warning: no previous prototype for 'get_highest_allowed_voltage_level'
  [-Wmissing-prototypes]
  742 | unsigned int get_highest_allowed_voltage_level(uint32_t chip_family, uint32_t hw_internal_rev, uint32_t pci_revision_id)
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  warning: no previous prototype for 'rv1_vbios_smu_send_msg_with_param'
  [-Wmissing-prototypes]
  102 | int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr, unsigned int msg_id, unsigned int param)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Changes since v1:
- As suggested by Rodrigo Siqueira:
  1. Rewrite function signatures to make them more readable.
  2. Get rid of unused functions in order to remove 'defined but not
     used' warnings.

Signed-off-by: Isabella Basso <isabbasso@riseup.net>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 18 ++--
 .../gpu/drm/amd/display/dc/calcs/dcn_calcs.c  |  4 +-
 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |  2 +-
 .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |  2 +-
 .../dc/clk_mgr/dcn201/dcn201_clk_mgr.c        | 36 -------
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 23 +----
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c   |  4 +-
 .../display/dc/clk_mgr/dcn301/dcn301_smu.c    |  6 +-
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 20 +---
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  |  7 +-
 .../amd/display/dc/clk_mgr/dcn31/dcn31_smu.c  |  6 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  3 +-
 .../gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c  |  8 --
 .../drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c | 97 -------------------
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 29 +++---
 .../gpu/drm/amd/display/dc/dcn10/dcn10_opp.c  | 30 ------
 .../gpu/drm/amd/display/dc/dcn10/dcn10_optc.c | 20 +---
 .../drm/amd/display/dc/dcn10/dcn10_resource.c | 18 ++--
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c  | 14 ---
 .../drm/amd/display/dc/dcn20/dcn20_dwb_scl.c  |  4 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c |  7 +-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  6 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c  |  9 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_optc.c | 57 +----------
 .../drm/amd/display/dc/dcn201/dcn201_dccg.c   |  3 +-
 .../drm/amd/display/dc/dcn201/dcn201_hubp.c   |  7 +-
 .../display/dc/dcn201/dcn201_link_encoder.c   |  6 +-
 .../amd/display/dc/dcn201/dcn201_resource.c   | 16 ++-
 .../drm/amd/display/dc/dcn21/dcn21_hubbub.c   |  2 +-
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c | 15 +--
 .../amd/display/dc/dcn21/dcn21_link_encoder.c |  9 +-
 .../drm/amd/display/dc/dcn21/dcn21_resource.c | 31 +++---
 .../dc/dcn30/dcn30_dio_stream_encoder.c       | 18 +---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  | 36 ++-----
 .../drm/amd/display/dc/dcn30/dcn30_mmhubbub.c |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  2 +-
 .../drm/amd/display/dc/dcn30/dcn30_resource.c | 12 +--
 .../amd/display/dc/dcn301/dcn301_panel_cntl.c | 10 +-
 .../amd/display/dc/dcn301/dcn301_resource.c   | 45 ++++-----
 .../gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c |  2 +-
 .../display/dc/dcn31/dcn31_dio_link_encoder.c |  2 +-
 .../amd/display/dc/dcn31/dcn31_panel_cntl.c   | 10 +-
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |  2 +-
 .../dc/dml/dcn21/display_rq_dlg_calc_21.c     |  8 --
 .../display/dc/irq/dcn10/irq_service_dcn10.c  |  7 +-
 .../dc/irq/dcn201/irq_service_dcn201.c        |  7 +-
 .../display/dc/irq/dcn21/irq_service_dcn21.c  |  7 +-
 .../display/dc/irq/dcn31/irq_service_dcn31.c  |  7 +-
 48 files changed, 179 insertions(+), 517 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 26c65c72eb75..3fe8a26dbfa0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -632,7 +632,8 @@ static void dm_dcn_vertical_interrupt0_high_irq(void *interrupt_params)
  * Copies dmub notification to DM which is to be read by AUX command.
  * issuing thread and also signals the event to wake up the thread.
  */
-void dmub_aux_setconfig_callback(struct amdgpu_device *adev, struct dmub_notification *notify)
+static void dmub_aux_setconfig_callback(struct amdgpu_device *adev,
+					struct dmub_notification *notify)
 {
 	if (adev->dm.dmub_notify)
 		memcpy(adev->dm.dmub_notify, notify, sizeof(struct dmub_notification));
@@ -648,7 +649,8 @@ void dmub_aux_setconfig_callback(struct amdgpu_device *adev, struct dmub_notific
  * Dmub Hpd interrupt processing callback. Gets displayindex through the
  * ink index and calls helper to do the processing.
  */
-void dmub_hpd_callback(struct amdgpu_device *adev, struct dmub_notification *notify)
+static void dmub_hpd_callback(struct amdgpu_device *adev,
+			      struct dmub_notification *notify)
 {
 	struct amdgpu_dm_connector *aconnector;
 	struct amdgpu_dm_connector *hpd_aconnector = NULL;
@@ -705,8 +707,10 @@ void dmub_hpd_callback(struct amdgpu_device *adev, struct dmub_notification *not
  * to dmub interrupt handling thread
  * Return: true if successfully registered, false if there is existing registration
  */
-bool register_dmub_notify_callback(struct amdgpu_device *adev, enum dmub_notification_type type,
-dmub_notify_interrupt_callback_t callback, bool dmub_int_thread_offload)
+static bool register_dmub_notify_callback(struct amdgpu_device *adev,
+					  enum dmub_notification_type type,
+					  dmub_notify_interrupt_callback_t callback,
+					  bool dmub_int_thread_offload)
 {
 	if (callback != NULL && type < ARRAY_SIZE(adev->dm.dmub_thread_offload)) {
 		adev->dm.dmub_callback[type] = callback;
@@ -11614,8 +11618,10 @@ uint32_t dm_read_reg_func(const struct dc_context *ctx, uint32_t address,
 	return value;
 }
 
-int amdgpu_dm_set_dmub_async_sync_status(bool is_cmd_aux, struct dc_context *ctx,
-	uint8_t status_type, uint32_t *operation_result)
+static int amdgpu_dm_set_dmub_async_sync_status(bool is_cmd_aux,
+						struct dc_context *ctx,
+						uint8_t status_type,
+						uint32_t *operation_result)
 {
 	struct amdgpu_device *adev = ctx->driver_context;
 	int return_status = -1;
diff --git a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
index c8b0a2f05b4d..ec19678a0702 100644
--- a/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/calcs/dcn_calcs.c
@@ -739,7 +739,9 @@ static void hack_bounding_box(struct dcn_bw_internal_vars *v,
 		hack_force_pipe_split(v, context->streams[0]->timing.pix_clk_100hz);
 }
 
-unsigned int get_highest_allowed_voltage_level(uint32_t chip_family, uint32_t hw_internal_rev, uint32_t pci_revision_id)
+static unsigned int get_highest_allowed_voltage_level(uint32_t chip_family,
+						      uint32_t hw_internal_rev,
+						      uint32_t pci_revision_id)
 {
 	/* for low power RV2 variants, the highest voltage level we want is 0 */
 	if ((chip_family == FAMILY_RV) &&
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
index 76ec8ec92efd..60761ff3cbf1 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
@@ -34,7 +34,7 @@
 #include "rv1_clk_mgr_vbios_smu.h"
 #include "rv1_clk_mgr_clk.h"
 
-void rv1_init_clocks(struct clk_mgr *clk_mgr)
+static void rv1_init_clocks(struct clk_mgr *clk_mgr)
 {
 	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
 }
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
index 2108bff49d4e..9f35f2e8f971 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
@@ -409,7 +409,7 @@ void dcn2_init_clocks(struct clk_mgr *clk_mgr)
 	clk_mgr->clks.prev_p_state_change_support = true;
 }
 
-void dcn2_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+static void dcn2_enable_pme_wa(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct pp_smu_funcs_nv *pp_smu = NULL;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
index db9950244c7b..8c20a0fb1e4f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
@@ -74,42 +74,6 @@ static const struct clk_mgr_mask clk_mgr_mask = {
 	CLK_COMMON_MASK_SH_LIST_DCN201_BASE(_MASK)
 };
 
-void dcn201_update_clocks_vbios(struct clk_mgr *clk_mgr,
-			struct dc_state *context,
-			bool safe_to_lower)
-{
-	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
-
-	bool update_dppclk = false;
-	bool update_dispclk = false;
-
-	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->clks.dppclk_khz)) {
-		clk_mgr->clks.dppclk_khz = new_clocks->dppclk_khz;
-		update_dppclk = true;
-	}
-
-	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr->clks.dispclk_khz)) {
-		clk_mgr->clks.dispclk_khz = new_clocks->dispclk_khz;
-		update_dispclk = true;
-	}
-
-	if (update_dppclk || update_dispclk) {
-		struct bp_set_dce_clock_parameters dce_clk_params;
-		struct dc_bios *bp = clk_mgr->ctx->dc_bios;
-
-		if (update_dispclk) {
-			memset(&dce_clk_params, 0, sizeof(dce_clk_params));
-			dce_clk_params.target_clock_frequency = new_clocks->dispclk_khz;
-			dce_clk_params.pll_id = CLOCK_SOURCE_ID_DFS;
-			dce_clk_params.clock_type = DCECLOCK_TYPE_DISPLAY_CLOCK;
-			bp->funcs->set_dce_clock(bp, &dce_clk_params);
-		}
-		/* currently there is no DCECLOCK_TYPE_DPPCLK type defined in VBIOS interface.
-		 * vbios program DPPCLK to the same DispCLK limitation
-		 */
-	}
-}
-
 static void dcn201_init_clocks(struct clk_mgr *clk_mgr)
 {
 	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index ac2d4c4f04e4..a825e169c832 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -56,9 +56,7 @@
 
 
 /* TODO: evaluate how to lower or disable all dcn clocks in screen off case */
-int rn_get_active_display_cnt_wa(
-		struct dc *dc,
-		struct dc_state *context)
+static int rn_get_active_display_cnt_wa(struct dc *dc, struct dc_state *context)
 {
 	int i, display_count;
 	bool tmds_present = false;
@@ -88,7 +86,7 @@ int rn_get_active_display_cnt_wa(
 	return display_count;
 }
 
-void rn_set_low_power_state(struct clk_mgr *clk_mgr_base)
+static void rn_set_low_power_state(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 
@@ -122,7 +120,7 @@ static void rn_update_clocks_update_dpp_dto(struct clk_mgr_internal *clk_mgr,
 }
 
 
-void rn_update_clocks(struct clk_mgr *clk_mgr_base,
+static void rn_update_clocks(struct clk_mgr *clk_mgr_base,
 			struct dc_state *context,
 			bool safe_to_lower)
 {
@@ -437,25 +435,14 @@ static void rn_dump_clk_registers(struct clk_state_registers_and_bypass *regs_an
 	}
 }
 
-/* This function produce translated logical clk state values*/
-void rn_get_clk_states(struct clk_mgr *clk_mgr_base, struct clk_states *s)
-{
-	struct clk_state_registers_and_bypass sb = { 0 };
-	struct clk_log_info log_info = { 0 };
-
-	rn_dump_clk_registers(&sb, clk_mgr_base, &log_info);
-
-	s->dprefclk_khz = sb.dprefclk * 1000;
-}
-
-void rn_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+static void rn_enable_pme_wa(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 
 	rn_vbios_smu_enable_pme_wa(clk_mgr);
 }
 
-void rn_init_clocks(struct clk_mgr *clk_mgr)
+static void rn_init_clocks(struct clk_mgr *clk_mgr)
 {
 	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
 	// Assumption is that boot state always supports pstate
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
index 9f7eed6688c4..0c963fc0523f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
@@ -86,7 +86,9 @@ static uint32_t rn_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsig
 }
 
 
-int rn_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr, unsigned int msg_id, unsigned int param)
+static int rn_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
+					    unsigned int msg_id,
+					    unsigned int param)
 {
 	uint32_t result;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
index 6ea642615854..d9920d91838d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
@@ -88,9 +88,9 @@ static uint32_t dcn301_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, u
 	return res_val;
 }
 
-int dcn301_smu_send_msg_with_param(
-		struct clk_mgr_internal *clk_mgr,
-		unsigned int msg_id, unsigned int param)
+static int dcn301_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
+					  unsigned int msg_id,
+					  unsigned int param)
 {
 	uint32_t result;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
index 3eee32faa208..8f78e62b28b7 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
@@ -89,9 +89,9 @@ static int vg_get_active_display_cnt_wa(
 	return display_count;
 }
 
-void vg_update_clocks(struct clk_mgr *clk_mgr_base,
-			struct dc_state *context,
-			bool safe_to_lower)
+static void vg_update_clocks(struct clk_mgr *clk_mgr_base,
+			     struct dc_state *context,
+			     bool safe_to_lower)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
@@ -367,18 +367,6 @@ static void vg_dump_clk_registers(struct clk_state_registers_and_bypass *regs_an
 	}
 }
 
-/* This function produce translated logical clk state values*/
-void vg_get_clk_states(struct clk_mgr *clk_mgr_base, struct clk_states *s)
-{
-
-	struct clk_state_registers_and_bypass sb = { 0 };
-	struct clk_log_info log_info = { 0 };
-
-	vg_dump_clk_registers(&sb, clk_mgr_base, &log_info);
-
-	s->dprefclk_khz = sb.dprefclk * 1000;
-}
-
 static void vg_enable_pme_wa(struct clk_mgr *clk_mgr_base)
 {
 	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
@@ -386,7 +374,7 @@ static void vg_enable_pme_wa(struct clk_mgr *clk_mgr_base)
 	dcn301_smu_enable_pme_wa(clk_mgr);
 }
 
-void vg_init_clocks(struct clk_mgr *clk_mgr)
+static void vg_init_clocks(struct clk_mgr *clk_mgr)
 {
 	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
 	// Assumption is that boot state always supports pstate
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
index a13ff1783b9b..412cc6a716f7 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
@@ -540,10 +540,9 @@ static unsigned int find_clk_for_voltage(
 	return clock;
 }
 
-void dcn31_clk_mgr_helper_populate_bw_params(
-		struct clk_mgr_internal *clk_mgr,
-		struct integrated_info *bios_info,
-		const DpmClocks_t *clock_table)
+static void dcn31_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk_mgr,
+						    struct integrated_info *bios_info,
+						    const DpmClocks_t *clock_table)
 {
 	int i, j;
 	struct clk_bw_params *bw_params = clk_mgr->base.bw_params;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
index 8c2b77eb9459..b7ace235a2d5 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
@@ -95,9 +95,9 @@ static uint32_t dcn31_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, un
 	return res_val;
 }
 
-int dcn31_smu_send_msg_with_param(
-		struct clk_mgr_internal *clk_mgr,
-		unsigned int msg_id, unsigned int param)
+static int dcn31_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
+					 unsigned int msg_id,
+					 unsigned int param)
 {
 	uint32_t result;
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 9639d7a7f03e..3d75f56a939c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3416,7 +3416,8 @@ static void dc_log_vcp_x_y(const struct dc_link *link, struct fixed31_32 avg_tim
 /*
  * Payload allocation/deallocation for SST introduced in DP2.0
  */
-enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx, bool allocate)
+static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
+						 bool allocate)
 {
 	struct dc_stream_state *stream = pipe_ctx->stream;
 	struct dc_link *link = stream->link;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
index 91fdfcd8a14e..db7ca4b0cdb9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp.c
@@ -119,14 +119,6 @@ void dpp_read_state(struct dpp *dpp_base,
 	}
 }
 
-/* Program gamut remap in bypass mode */
-void dpp_set_gamut_remap_bypass(struct dcn10_dpp *dpp)
-{
-	REG_SET(CM_GAMUT_REMAP_CONTROL, 0,
-			CM_GAMUT_REMAP_MODE, 0);
-	/* Gamut remap in bypass */
-}
-
 #define IDENTITY_RATIO(ratio) (dc_fixpt_u2d19(ratio) == (1 << 19))
 
 bool dpp1_get_optimal_number_of_taps(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
index e31a6f1516bb..f607a0e28f14 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
@@ -89,51 +89,6 @@ enum dscl_mode_sel {
 	DSCL_MODE_DSCL_BYPASS = 6
 };
 
-static void dpp1_dscl_set_overscan(
-	struct dcn10_dpp *dpp,
-	const struct scaler_data *data)
-{
-	uint32_t left = data->recout.x;
-	uint32_t top = data->recout.y;
-
-	int right = data->h_active - data->recout.x - data->recout.width;
-	int bottom = data->v_active - data->recout.y - data->recout.height;
-
-	if (right < 0) {
-		BREAK_TO_DEBUGGER();
-		right = 0;
-	}
-	if (bottom < 0) {
-		BREAK_TO_DEBUGGER();
-		bottom = 0;
-	}
-
-	REG_SET_2(DSCL_EXT_OVERSCAN_LEFT_RIGHT, 0,
-		EXT_OVERSCAN_LEFT, left,
-		EXT_OVERSCAN_RIGHT, right);
-
-	REG_SET_2(DSCL_EXT_OVERSCAN_TOP_BOTTOM, 0,
-		EXT_OVERSCAN_BOTTOM, bottom,
-		EXT_OVERSCAN_TOP, top);
-}
-
-static void dpp1_dscl_set_otg_blank(
-		struct dcn10_dpp *dpp, const struct scaler_data *data)
-{
-	uint32_t h_blank_start = data->h_active;
-	uint32_t h_blank_end = 0;
-	uint32_t v_blank_start = data->v_active;
-	uint32_t v_blank_end = 0;
-
-	REG_SET_2(OTG_H_BLANK, 0,
-			OTG_H_BLANK_START, h_blank_start,
-			OTG_H_BLANK_END, h_blank_end);
-
-	REG_SET_2(OTG_V_BLANK, 0,
-			OTG_V_BLANK_START, v_blank_start,
-			OTG_V_BLANK_END, v_blank_end);
-}
-
 static int dpp1_dscl_get_pixel_depth_val(enum lb_pixel_depth depth)
 {
 	if (depth == LB_PIXEL_DEPTH_30BPP)
@@ -555,58 +510,6 @@ static enum lb_memory_config dpp1_dscl_find_lb_memory_config(struct dcn10_dpp *d
 	return LB_MEMORY_CONFIG_0;
 }
 
-void dpp1_dscl_set_scaler_auto_scale(
-	struct dpp *dpp_base,
-	const struct scaler_data *scl_data)
-{
-	enum lb_memory_config lb_config;
-	struct dcn10_dpp *dpp = TO_DCN10_DPP(dpp_base);
-	enum dscl_mode_sel dscl_mode = dpp1_dscl_get_dscl_mode(
-			dpp_base, scl_data, dpp_base->ctx->dc->debug.always_scale);
-	bool ycbcr = scl_data->format >= PIXEL_FORMAT_VIDEO_BEGIN
-				&& scl_data->format <= PIXEL_FORMAT_VIDEO_END;
-
-	dpp1_dscl_set_overscan(dpp, scl_data);
-
-	dpp1_dscl_set_otg_blank(dpp, scl_data);
-
-	REG_UPDATE(SCL_MODE, DSCL_MODE, dscl_mode);
-
-	if (dscl_mode == DSCL_MODE_DSCL_BYPASS)
-		return;
-
-	lb_config =  dpp1_dscl_find_lb_memory_config(dpp, scl_data);
-	dpp1_dscl_set_lb(dpp, &scl_data->lb_params, lb_config);
-
-	if (dscl_mode == DSCL_MODE_SCALING_444_BYPASS)
-		return;
-
-	/* TODO: v_min */
-	REG_SET_3(DSCL_AUTOCAL, 0,
-		AUTOCAL_MODE, AUTOCAL_MODE_AUTOSCALE,
-		AUTOCAL_NUM_PIPE, 0,
-		AUTOCAL_PIPE_ID, 0);
-
-	/* Black offsets */
-	if (ycbcr)
-		REG_SET_2(SCL_BLACK_OFFSET, 0,
-				SCL_BLACK_OFFSET_RGB_Y, BLACK_OFFSET_RGB_Y,
-				SCL_BLACK_OFFSET_CBCR, BLACK_OFFSET_CBCR);
-	else
-
-		REG_SET_2(SCL_BLACK_OFFSET, 0,
-				SCL_BLACK_OFFSET_RGB_Y, BLACK_OFFSET_RGB_Y,
-				SCL_BLACK_OFFSET_CBCR, BLACK_OFFSET_RGB_Y);
-
-	REG_SET_4(SCL_TAP_CONTROL, 0,
-		SCL_V_NUM_TAPS, scl_data->taps.v_taps - 1,
-		SCL_H_NUM_TAPS, scl_data->taps.h_taps - 1,
-		SCL_V_NUM_TAPS_C, scl_data->taps.v_taps_c - 1,
-		SCL_H_NUM_TAPS_C, scl_data->taps.h_taps_c - 1);
-
-	dpp1_dscl_set_scl_filter(dpp, scl_data, ycbcr);
-}
-
 
 static void dpp1_dscl_set_manual_ratio_init(
 		struct dcn10_dpp *dpp, const struct scaler_data *data)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index a2b925cc4132..2d470f524367 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -77,9 +77,9 @@
 #define PGFSM_POWER_ON 0
 #define PGFSM_POWER_OFF 2
 
-void print_microsec(struct dc_context *dc_ctx,
-	struct dc_log_buffer_ctx *log_ctx,
-	uint32_t ref_cycle)
+static void print_microsec(struct dc_context *dc_ctx,
+			   struct dc_log_buffer_ctx *log_ctx,
+			   uint32_t ref_cycle)
 {
 	const uint32_t ref_clk_mhz = dc_ctx->dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000;
 	static const unsigned int frac = 1000;
@@ -132,7 +132,8 @@ static void log_mpc_crc(struct dc *dc,
 		REG_READ(DPP_TOP0_DPP_CRC_VAL_B_A), REG_READ(DPP_TOP0_DPP_CRC_VAL_R_G));
 }
 
-void dcn10_log_hubbub_state(struct dc *dc, struct dc_log_buffer_ctx *log_ctx)
+static void dcn10_log_hubbub_state(struct dc *dc,
+				   struct dc_log_buffer_ctx *log_ctx)
 {
 	struct dc_context *dc_ctx = dc->ctx;
 	struct dcn_hubbub_wm wm;
@@ -1972,10 +1973,9 @@ static bool wait_for_reset_trigger_to_occur(
 	return rc;
 }
 
-uint64_t reduceSizeAndFraction(
-	uint64_t *numerator,
-	uint64_t *denominator,
-	bool checkUint32Bounary)
+static uint64_t reduceSizeAndFraction(uint64_t *numerator,
+				      uint64_t *denominator,
+				      bool checkUint32Bounary)
 {
 	int i;
 	bool ret = checkUint32Bounary == false;
@@ -2023,7 +2023,7 @@ uint64_t reduceSizeAndFraction(
 	return ret;
 }
 
-bool is_low_refresh_rate(struct pipe_ctx *pipe)
+static bool is_low_refresh_rate(struct pipe_ctx *pipe)
 {
 	uint32_t master_pipe_refresh_rate =
 		pipe->stream->timing.pix_clk_100hz * 100 /
@@ -2032,7 +2032,8 @@ bool is_low_refresh_rate(struct pipe_ctx *pipe)
 	return master_pipe_refresh_rate <= 30;
 }
 
-uint8_t get_clock_divider(struct pipe_ctx *pipe, bool account_low_refresh_rate)
+static uint8_t get_clock_divider(struct pipe_ctx *pipe,
+				 bool account_low_refresh_rate)
 {
 	uint32_t clock_divider = 1;
 	uint32_t numpipes = 1;
@@ -2052,10 +2053,8 @@ uint8_t get_clock_divider(struct pipe_ctx *pipe, bool account_low_refresh_rate)
 	return clock_divider;
 }
 
-int dcn10_align_pixel_clocks(
-	struct dc *dc,
-	int group_size,
-	struct pipe_ctx *grouped_pipes[])
+static int dcn10_align_pixel_clocks(struct dc *dc, int group_size,
+				    struct pipe_ctx *grouped_pipes[])
 {
 	struct dc_context *dc_ctx = dc->ctx;
 	int i, master = -1, embedded = -1;
@@ -2344,7 +2343,7 @@ static void mmhub_read_vm_context0_settings(struct dcn10_hubp *hubp1,
 }
 
 
-void dcn10_program_pte_vm(struct dce_hwseq *hws, struct hubp *hubp)
+static void dcn10_program_pte_vm(struct dce_hwseq *hws, struct hubp *hubp)
 {
 	struct dcn10_hubp *hubp1 = TO_DCN10_HUBP(hubp);
 	struct vm_system_aperture_param apt = {0};
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
index d54d731415d7..2c409356f512 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
@@ -348,36 +348,6 @@ void opp1_program_stereo(
 	*/
 }
 
-void opp1_program_oppbuf(
-	struct output_pixel_processor *opp,
-	struct oppbuf_params *oppbuf)
-{
-	struct dcn10_opp *oppn10 = TO_DCN10_OPP(opp);
-
-	/* Program the oppbuf active width to be the frame width from mpc */
-	REG_UPDATE(OPPBUF_CONTROL, OPPBUF_ACTIVE_WIDTH, oppbuf->active_width);
-
-	/* Specifies the number of segments in multi-segment mode (DP-MSO operation)
-	 * description  "In 1/2/4 segment mode, specifies the horizontal active width in pixels of the display panel.
-	 * In 4 segment split left/right mode, specifies the horizontal 1/2 active width in pixels of the display panel.
-	 * Used to determine segment boundaries in multi-segment mode. Used to determine the width of the vertical active space in 3D frame packed modes.
-	 * OPPBUF_ACTIVE_WIDTH must be integer divisible by the total number of segments."
-	 */
-	REG_UPDATE(OPPBUF_CONTROL, OPPBUF_DISPLAY_SEGMENTATION, oppbuf->mso_segmentation);
-
-	/* description  "Specifies the number of overlap pixels (1-8 overlapping pixels supported), used in multi-segment mode (DP-MSO operation)" */
-	REG_UPDATE(OPPBUF_CONTROL, OPPBUF_OVERLAP_PIXEL_NUM, oppbuf->mso_overlap_pixel_num);
-
-	/* description  "Specifies the number of times a pixel is replicated (0-15 pixel replications supported).
-	 * A value of 0 disables replication. The total number of times a pixel is output is OPPBUF_PIXEL_REPETITION + 1."
-	 */
-	REG_UPDATE(OPPBUF_CONTROL, OPPBUF_PIXEL_REPETITION, oppbuf->pixel_repetition);
-
-	/* Controls the number of padded pixels at the end of a segment */
-	if (REG(OPPBUF_CONTROL1))
-		REG_UPDATE(OPPBUF_CONTROL1, OPPBUF_NUM_SEGMENT_PADDED_PIXELS, oppbuf->num_segment_padded_pixels);
-}
-
 void opp1_pipe_clock_control(struct output_pixel_processor *opp, bool enable)
 {
 	struct dcn10_opp *oppn10 = TO_DCN10_OPP(opp);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
index 3d2a2848857a..b1671b00ce40 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
@@ -131,22 +131,6 @@ void optc1_setup_vertical_interrupt2(
 			OTG_VERTICAL_INTERRUPT2_LINE_START, start_line);
 }
 
-/**
- * Vupdate keepout can be set to a window to block the update lock for that pipe from changing.
- * Start offset begins with vstartup and goes for x number of clocks,
- * end offset starts from end of vupdate to x number of clocks.
- */
-void optc1_set_vupdate_keepout(struct timing_generator *optc,
-			       struct vupdate_keepout_params *params)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	REG_SET_3(OTG_VUPDATE_KEEPOUT, 0,
-		  MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_START_OFFSET, params->start_offset,
-		  MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_END_OFFSET, params->end_offset,
-		  OTG_MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_EN, params->enable);
-}
-
 /**
  * program_timing_generator   used by mode timing set
  * Program CRTC Timing Registers - OTG_H_*, OTG_V_*, Pixel repetition.
@@ -876,7 +860,7 @@ void optc1_set_static_screen_control(
 			OTG_STATIC_SCREEN_FRAME_COUNT, num_frames);
 }
 
-void optc1_setup_manual_trigger(struct timing_generator *optc)
+static void optc1_setup_manual_trigger(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
@@ -894,7 +878,7 @@ void optc1_setup_manual_trigger(struct timing_generator *optc)
 			OTG_TRIGA_CLEAR, 1);
 }
 
-void optc1_program_manual_trigger(struct timing_generator *optc)
+static void optc1_program_manual_trigger(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 19a2dd619ec7..858b72149897 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -686,9 +686,8 @@ static struct output_pixel_processor *dcn10_opp_create(
 	return &opp->base;
 }
 
-struct dce_aux *dcn10_aux_engine_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_aux *dcn10_aux_engine_create(struct dc_context *ctx,
+					       uint32_t inst)
 {
 	struct aux_engine_dce110 *aux_engine =
 		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
@@ -724,9 +723,8 @@ static const struct dce_i2c_mask i2c_masks = {
 		I2C_COMMON_MASK_SH_LIST_DCE110(_MASK)
 };
 
-struct dce_i2c_hw *dcn10_i2c_hw_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_i2c_hw *dcn10_i2c_hw_create(struct dc_context *ctx,
+					      uint32_t inst)
 {
 	struct dce_i2c_hw *dce_i2c_hw =
 		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
@@ -805,7 +803,7 @@ static const struct encoder_feature_support link_enc_feature = {
 		.flags.bits.IS_TPS4_CAPABLE = true
 };
 
-struct link_encoder *dcn10_link_encoder_create(
+static struct link_encoder *dcn10_link_encoder_create(
 	const struct encoder_init_data *enc_init_data)
 {
 	struct dcn10_link_encoder *enc10 =
@@ -847,7 +845,7 @@ static struct panel_cntl *dcn10_panel_cntl_create(const struct panel_cntl_init_d
 	return &panel_cntl->base;
 }
 
-struct clock_source *dcn10_clock_source_create(
+static struct clock_source *dcn10_clock_source_create(
 	struct dc_context *ctx,
 	struct dc_bios *bios,
 	enum clock_source_id id,
@@ -945,7 +943,7 @@ static const struct resource_create_funcs res_create_maximus_funcs = {
 	.create_hwseq = dcn10_hwseq_create,
 };
 
-void dcn10_clock_source_destroy(struct clock_source **clk_src)
+static void dcn10_clock_source_destroy(struct clock_source **clk_src)
 {
 	kfree(TO_DCE110_CLK_SRC(*clk_src));
 	*clk_src = NULL;
@@ -1122,7 +1120,7 @@ static enum dc_status build_mapped_resource(
 	return DC_OK;
 }
 
-enum dc_status dcn10_add_stream_to_ctx(
+static enum dc_status dcn10_add_stream_to_ctx(
 		struct dc *dc,
 		struct dc_state *new_ctx,
 		struct dc_stream_state *dc_stream)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
index a9e420c7d75a..970b65efeac1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp.c
@@ -251,20 +251,6 @@ static void dpp2_cnv_setup (
 
 }
 
-void dpp2_cnv_set_bias_scale(
-		struct dpp *dpp_base,
-		struct  dc_bias_and_scale *bias_and_scale)
-{
-	struct dcn20_dpp *dpp = TO_DCN20_DPP(dpp_base);
-
-	REG_UPDATE(FCNV_FP_BIAS_R, FCNV_FP_BIAS_R, bias_and_scale->bias_red);
-	REG_UPDATE(FCNV_FP_BIAS_G, FCNV_FP_BIAS_G, bias_and_scale->bias_green);
-	REG_UPDATE(FCNV_FP_BIAS_B, FCNV_FP_BIAS_B, bias_and_scale->bias_blue);
-	REG_UPDATE(FCNV_FP_SCALE_R, FCNV_FP_SCALE_R, bias_and_scale->scale_red);
-	REG_UPDATE(FCNV_FP_SCALE_G, FCNV_FP_SCALE_G, bias_and_scale->scale_green);
-	REG_UPDATE(FCNV_FP_SCALE_B, FCNV_FP_SCALE_B, bias_and_scale->scale_blue);
-}
-
 /*compute the maximum number of lines that we can fit in the line buffer*/
 void dscl2_calc_lb_num_partitions(
 		const struct scaler_data *scl_data,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c
index 880954ac0b02..994fb732a7cb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb_scl.c
@@ -527,7 +527,7 @@ static const uint16_t filter_12tap_16p_183[108] = {
 	0, 84, 16328, 16032, 416, 1944, 1944, 416, 16032, 16328, 84, 0,
 };
 
-const uint16_t *wbscl_get_filter_3tap_16p(struct fixed31_32 ratio)
+static const uint16_t *wbscl_get_filter_3tap_16p(struct fixed31_32 ratio)
 {
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_3tap_16p_upscale;
@@ -539,7 +539,7 @@ const uint16_t *wbscl_get_filter_3tap_16p(struct fixed31_32 ratio)
 		return filter_3tap_16p_183;
 }
 
-const uint16_t *wbscl_get_filter_4tap_16p(struct fixed31_32 ratio)
+static const uint16_t *wbscl_get_filter_4tap_16p(struct fixed31_32 ratio)
 {
 	if (ratio.value < dc_fixpt_one.value)
 		return filter_4tap_16p_upscale;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 5adf42a7cc27..e293b3050cd0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -192,9 +192,8 @@ void hubp2_vready_at_or_After_vsync(struct hubp *hubp,
 	REG_UPDATE(DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, value);
 }
 
-void hubp2_program_requestor(
-		struct hubp *hubp,
-		struct _vcs_dpi_display_rq_regs_st *rq_regs)
+static void hubp2_program_requestor(struct hubp *hubp,
+				    struct _vcs_dpi_display_rq_regs_st *rq_regs)
 {
 	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
 
@@ -1285,7 +1284,7 @@ void hubp2_read_state(struct hubp *hubp)
 
 }
 
-void hubp2_validate_dml_output(struct hubp *hubp,
+static void hubp2_validate_dml_output(struct hubp *hubp,
 		struct dc_context *ctx,
 		struct _vcs_dpi_display_rq_regs_st *dml_rq_regs,
 		struct _vcs_dpi_display_dlg_regs_st *dml_dlg_attr,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index e6af99ae3d9f..de4723f33c60 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1080,10 +1080,8 @@ static void dcn20_power_on_plane(
 	}
 }
 
-void dcn20_enable_plane(
-	struct dc *dc,
-	struct pipe_ctx *pipe_ctx,
-	struct dc_state *context)
+static void dcn20_enable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx,
+			       struct dc_state *context)
 {
 	//if (dc->debug.sanity_checks) {
 	//	dcn10_verify_allow_pstate_change_high(dc);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
index 947eb0df3f12..15734db0cdea 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
@@ -400,10 +400,9 @@ static void mpc20_program_ogam_pwl(
 
 }
 
-void apply_DEDCN20_305_wa(
-		struct mpc *mpc,
-		int mpcc_id, enum dc_lut_mode current_mode,
-		enum dc_lut_mode next_mode)
+static void apply_DEDCN20_305_wa(struct mpc *mpc, int mpcc_id,
+				 enum dc_lut_mode current_mode,
+				 enum dc_lut_mode next_mode)
 {
 	struct dcn20_mpc *mpc20 = TO_DCN20_MPC(mpc);
 
@@ -525,7 +524,7 @@ static void mpc2_init_mpcc(struct mpcc *mpcc, int mpcc_inst)
 	mpcc->sm_cfg.enable = false;
 }
 
-struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
+static struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 {
 	struct mpcc *tmp_mpcc = tree->opp_list;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
index 8c34751b0e58..0340fdd3f5fb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
@@ -72,21 +72,6 @@ bool optc2_enable_crtc(struct timing_generator *optc)
 	return true;
 }
 
-/**
- * DRR double buffering control to select buffer point
- * for V_TOTAL, H_TOTAL, VTOTAL_MIN, VTOTAL_MAX, VTOTAL_MIN_SEL and VTOTAL_MAX_SEL registers
- * Options: anytime, start of frame, dp start of frame (range timing)
- */
-void optc2_set_timing_db_mode(struct timing_generator *optc, bool enable)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	uint32_t blank_data_double_buffer_enable = enable ? 1 : 0;
-
-	REG_UPDATE(OTG_DOUBLE_BUFFER_CONTROL,
-		OTG_RANGE_TIMING_DBUF_UPDATE_MODE, blank_data_double_buffer_enable);
-}
-
 /**
  *For the below, I'm not sure how your GSL parameters are stored in your env,
  * so I will assume a gsl_params struct for now
@@ -110,30 +95,6 @@ void optc2_set_gsl(struct timing_generator *optc,
 }
 
 
-/* Use the gsl allow flip as the master update lock */
-void optc2_use_gsl_as_master_update_lock(struct timing_generator *optc,
-		   const struct gsl_params *params)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	REG_UPDATE(OTG_GSL_CONTROL,
-		OTG_MASTER_UPDATE_LOCK_GSL_EN, params->master_update_lock_gsl_en);
-}
-
-/* You can control the GSL timing by limiting GSL to a window (X,Y) */
-void optc2_set_gsl_window(struct timing_generator *optc,
-		   const struct gsl_params *params)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	REG_SET_2(OTG_GSL_WINDOW_X, 0,
-		OTG_GSL_WINDOW_START_X, params->gsl_window_start_x,
-		OTG_GSL_WINDOW_END_X, params->gsl_window_end_x);
-	REG_SET_2(OTG_GSL_WINDOW_Y, 0,
-		OTG_GSL_WINDOW_START_Y, params->gsl_window_start_y,
-		OTG_GSL_WINDOW_END_Y, params->gsl_window_end_y);
-}
-
 void optc2_set_gsl_source_select(
 		struct timing_generator *optc,
 		int group_idx,
@@ -156,18 +117,6 @@ void optc2_set_gsl_source_select(
 	}
 }
 
-/* DSC encoder frame start controls: x = h position, line_num = # of lines from vstartup */
-void optc2_set_dsc_encoder_frame_start(struct timing_generator *optc,
-					int x_position,
-					int line_num)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	REG_SET_2(OTG_DSC_START_POSITION, 0,
-			OTG_DSC_START_POSITION_X, x_position,
-			OTG_DSC_START_POSITION_LINE_NUM, line_num);
-}
-
 /* Set DSC-related configuration.
  *   dsc_mode: 0 disables DSC, other values enable DSC in specified format
  *   sc_bytes_per_pixel: Bytes per pixel in u3.28 format
@@ -293,8 +242,8 @@ void optc2_get_optc_source(struct timing_generator *optc,
 		*num_of_src_opp = 1;
 }
 
-void optc2_set_dwb_source(struct timing_generator *optc,
-		uint32_t dwb_pipe_inst)
+static void optc2_set_dwb_source(struct timing_generator *optc,
+				 uint32_t dwb_pipe_inst)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
@@ -306,7 +255,7 @@ void optc2_set_dwb_source(struct timing_generator *optc,
 				OPTC_DWB1_SOURCE_SELECT, optc->inst);
 }
 
-void optc2_align_vblanks(
+static void optc2_align_vblanks(
 	struct timing_generator *optc_master,
 	struct timing_generator *optc_slave,
 	uint32_t master_pixel_clock_100Hz,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c
index f5bf04f7da25..9a3402148fde 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dccg.c
@@ -44,7 +44,8 @@
 #define DC_LOGGER \
 	dccg->ctx->logger
 
-void dccg201_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk)
+static void dccg201_update_dpp_dto(struct dccg *dccg, int dpp_inst,
+				   int req_dppclk)
 {
 	/* vbios handles it */
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c
index 6b6f74d4afd1..35dd4bac242a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hubp.c
@@ -55,7 +55,7 @@ static void hubp201_program_surface_config(
 	hubp1_program_pixel_format(hubp, format);
 }
 
-void hubp201_program_deadline(
+static void hubp201_program_deadline(
 		struct hubp *hubp,
 		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
 		struct _vcs_dpi_display_ttu_regs_st *ttu_attr)
@@ -63,9 +63,8 @@ void hubp201_program_deadline(
 	hubp1_program_deadline(hubp, dlg_attr, ttu_attr);
 }
 
-void hubp201_program_requestor(
-		struct hubp *hubp,
-		struct _vcs_dpi_display_rq_regs_st *rq_regs)
+static void hubp201_program_requestor(struct hubp *hubp,
+				      struct _vcs_dpi_display_rq_regs_st *rq_regs)
 {
 	struct dcn201_hubp *hubp201 = TO_DCN201_HUBP(hubp);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
index a65e8f7801db..7f9ec59ef443 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_link_encoder.c
@@ -50,8 +50,8 @@
 #define IND_REG(index) \
 	(enc10->link_regs->index)
 
-void dcn201_link_encoder_get_max_link_cap(struct link_encoder *enc,
-	struct dc_link_settings *link_settings)
+static void dcn201_link_encoder_get_max_link_cap(struct link_encoder *enc,
+						 struct dc_link_settings *link_settings)
 {
 	uint32_t value1, value2;
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
@@ -66,7 +66,7 @@ void dcn201_link_encoder_get_max_link_cap(struct link_encoder *enc,
 	}
 }
 
-bool dcn201_link_encoder_is_in_alt_mode(struct link_encoder *enc)
+static bool dcn201_link_encoder_is_in_alt_mode(struct link_encoder *enc)
 {
 	uint32_t value;
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
index 0fa381088d1d..d6acf9a8590a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
@@ -672,9 +672,8 @@ static struct output_pixel_processor *dcn201_opp_create(
 	return &opp->base;
 }
 
-struct dce_aux *dcn201_aux_engine_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_aux *dcn201_aux_engine_create(struct dc_context *ctx,
+						uint32_t inst)
 {
 	struct aux_engine_dce110 *aux_engine =
 		kzalloc(sizeof(struct aux_engine_dce110), GFP_ATOMIC);
@@ -706,9 +705,8 @@ static const struct dce_i2c_mask i2c_masks = {
 		I2C_COMMON_MASK_SH_LIST_DCN2(_MASK)
 };
 
-struct dce_i2c_hw *dcn201_i2c_hw_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_i2c_hw *dcn201_i2c_hw_create(struct dc_context *ctx,
+					       uint32_t inst)
 {
 	struct dce_i2c_hw *dce_i2c_hw =
 		kzalloc(sizeof(struct dce_i2c_hw), GFP_ATOMIC);
@@ -789,7 +787,7 @@ static const struct encoder_feature_support link_enc_feature = {
 		.flags.bits.IS_TPS4_CAPABLE = true
 };
 
-struct link_encoder *dcn201_link_encoder_create(
+static struct link_encoder *dcn201_link_encoder_create(
 	const struct encoder_init_data *enc_init_data)
 {
 	struct dcn20_link_encoder *enc20 =
@@ -811,7 +809,7 @@ struct link_encoder *dcn201_link_encoder_create(
 	return &enc10->base;
 }
 
-struct clock_source *dcn201_clock_source_create(
+static struct clock_source *dcn201_clock_source_create(
 	struct dc_context *ctx,
 	struct dc_bios *bios,
 	enum clock_source_id id,
@@ -906,7 +904,7 @@ static const struct resource_create_funcs res_create_maximus_funcs = {
 	.create_hwseq = dcn201_hwseq_create,
 };
 
-void dcn201_clock_source_destroy(struct clock_source **clk_src)
+static void dcn201_clock_source_destroy(struct clock_source **clk_src)
 {
 	kfree(TO_DCE110_CLK_SRC(*clk_src));
 	*clk_src = NULL;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
index 36044cb8ec83..c5e200d09038 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubbub.c
@@ -680,7 +680,7 @@ void hubbub21_wm_read_state(struct hubbub *hubbub,
 			DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, &s->dram_clk_chanage);
 }
 
-void hubbub21_apply_DEDCN21_147_wa(struct hubbub *hubbub)
+static void hubbub21_apply_DEDCN21_147_wa(struct hubbub *hubbub)
 {
 	struct dcn20_hubbub *hubbub1 = TO_DCN20_HUBBUB(hubbub);
 	uint32_t prog_wm_value;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index 3de1bcf9b3d8..58e459c7e7d3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -183,7 +183,7 @@ static void hubp21_setup(
 
 }
 
-void hubp21_set_viewport(
+static void hubp21_set_viewport(
 	struct hubp *hubp,
 	const struct rect *viewport,
 	const struct rect *viewport_c)
@@ -225,8 +225,8 @@ void hubp21_set_viewport(
 		  SEC_VIEWPORT_Y_START_C, viewport_c->y);
 }
 
-void hubp21_set_vm_system_aperture_settings(struct hubp *hubp,
-		struct vm_system_aperture_param *apt)
+static void hubp21_set_vm_system_aperture_settings(struct hubp *hubp,
+						   struct vm_system_aperture_param *apt)
 {
 	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
 
@@ -248,7 +248,7 @@ void hubp21_set_vm_system_aperture_settings(struct hubp *hubp,
 			SYSTEM_ACCESS_MODE, 0x3);
 }
 
-void hubp21_validate_dml_output(struct hubp *hubp,
+static void hubp21_validate_dml_output(struct hubp *hubp,
 		struct dc_context *ctx,
 		struct _vcs_dpi_display_rq_regs_st *dml_rq_regs,
 		struct _vcs_dpi_display_dlg_regs_st *dml_dlg_attr,
@@ -664,7 +664,8 @@ static void program_surface_flip_and_addr(struct hubp *hubp, struct surface_flip
 			flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS);
 }
 
-void dmcub_PLAT_54186_wa(struct hubp *hubp, struct surface_flip_registers *flip_regs)
+static void dmcub_PLAT_54186_wa(struct hubp *hubp,
+				struct surface_flip_registers *flip_regs)
 {
 	struct dc_dmub_srv *dmcub = hubp->ctx->dmub_srv;
 	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
@@ -697,7 +698,7 @@ void dmcub_PLAT_54186_wa(struct hubp *hubp, struct surface_flip_registers *flip_
 	PERF_TRACE();  // TODO: remove after performance is stable.
 }
 
-bool hubp21_program_surface_flip_and_addr(
+static bool hubp21_program_surface_flip_and_addr(
 		struct hubp *hubp,
 		const struct dc_plane_address *address,
 		bool flip_immediate)
@@ -805,7 +806,7 @@ bool hubp21_program_surface_flip_and_addr(
 	return true;
 }
 
-void hubp21_init(struct hubp *hubp)
+static void hubp21_init(struct hubp *hubp)
 {
 	// DEDCN21-133: Inconsistent row starting line for flip between DPTE and Meta
 	// This is a chicken bit to enable the ECO fix.
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
index aa46c35b05a2..0a1ba6e7081c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
@@ -203,7 +203,7 @@ static bool update_cfg_data(
 	return true;
 }
 
-bool dcn21_link_encoder_acquire_phy(struct link_encoder *enc)
+static bool dcn21_link_encoder_acquire_phy(struct link_encoder *enc)
 {
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
 	int value;
@@ -277,7 +277,7 @@ void dcn21_link_encoder_enable_dp_output(
 
 }
 
-void dcn21_link_encoder_enable_dp_mst_output(
+static void dcn21_link_encoder_enable_dp_mst_output(
 	struct link_encoder *enc,
 	const struct dc_link_settings *link_settings,
 	enum clock_source_id clock_source)
@@ -288,9 +288,8 @@ void dcn21_link_encoder_enable_dp_mst_output(
 	dcn10_link_encoder_enable_dp_mst_output(enc, link_settings, clock_source);
 }
 
-void dcn21_link_encoder_disable_output(
-	struct link_encoder *enc,
-	enum signal_type signal)
+static void dcn21_link_encoder_disable_output(struct link_encoder *enc,
+					      enum signal_type signal)
 {
 	dcn10_link_encoder_disable_output(enc, signal);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index da6031cef244..ca1bbc942fd4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -784,9 +784,8 @@ static const struct dce_i2c_mask i2c_masks = {
 		I2C_COMMON_MASK_SH_LIST_DCN2(_MASK)
 };
 
-struct dce_i2c_hw *dcn21_i2c_hw_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_i2c_hw *dcn21_i2c_hw_create(struct dc_context *ctx,
+					      uint32_t inst)
 {
 	struct dce_i2c_hw *dce_i2c_hw =
 		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
@@ -1093,7 +1092,7 @@ static void patch_bounding_box(struct dc *dc, struct _vcs_dpi_soc_bounding_box_s
 	}
 }
 
-void dcn21_calculate_wm(
+static void dcn21_calculate_wm(
 		struct dc *dc, struct dc_state *context,
 		display_e2e_pipe_params_st *pipes,
 		int *out_pipe_cnt,
@@ -1390,7 +1389,7 @@ static noinline bool dcn21_validate_bandwidth_fp(struct dc *dc,
  * with DC_FP_START()/DC_FP_END(). Use the same approach as for
  * dcn20_validate_bandwidth in dcn20_resource.c.
  */
-bool dcn21_validate_bandwidth(struct dc *dc, struct dc_state *context,
+static bool dcn21_validate_bandwidth(struct dc *dc, struct dc_state *context,
 		bool fast_validate)
 {
 	bool voltage_supported;
@@ -1480,8 +1479,8 @@ static struct hubbub *dcn21_hubbub_create(struct dc_context *ctx)
 	return &hubbub->base;
 }
 
-struct output_pixel_processor *dcn21_opp_create(
-	struct dc_context *ctx, uint32_t inst)
+static struct output_pixel_processor *dcn21_opp_create(struct dc_context *ctx,
+						       uint32_t inst)
 {
 	struct dcn20_opp *opp =
 		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
@@ -1496,9 +1495,8 @@ struct output_pixel_processor *dcn21_opp_create(
 	return &opp->base;
 }
 
-struct timing_generator *dcn21_timing_generator_create(
-		struct dc_context *ctx,
-		uint32_t instance)
+static struct timing_generator *dcn21_timing_generator_create(struct dc_context *ctx,
+							      uint32_t instance)
 {
 	struct optc *tgn10 =
 		kzalloc(sizeof(struct optc), GFP_KERNEL);
@@ -1518,7 +1516,7 @@ struct timing_generator *dcn21_timing_generator_create(
 	return &tgn10->base;
 }
 
-struct mpc *dcn21_mpc_create(struct dc_context *ctx)
+static struct mpc *dcn21_mpc_create(struct dc_context *ctx)
 {
 	struct dcn20_mpc *mpc20 = kzalloc(sizeof(struct dcn20_mpc),
 					  GFP_KERNEL);
@@ -1545,8 +1543,8 @@ static void read_dce_straps(
 }
 
 
-struct display_stream_compressor *dcn21_dsc_create(
-	struct dc_context *ctx, uint32_t inst)
+static struct display_stream_compressor *dcn21_dsc_create(struct dc_context *ctx,
+							  uint32_t inst)
 {
 	struct dcn20_dsc *dsc =
 		kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
@@ -1683,9 +1681,8 @@ static struct dc_cap_funcs cap_funcs = {
 	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
 };
 
-struct stream_encoder *dcn21_stream_encoder_create(
-	enum engine_id eng_id,
-	struct dc_context *ctx)
+static struct stream_encoder *dcn21_stream_encoder_create(enum engine_id eng_id,
+							  struct dc_context *ctx)
 {
 	struct dcn10_stream_encoder *enc1 =
 		kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
@@ -1917,7 +1914,7 @@ static int dcn21_populate_dml_pipes_from_context(
 	return pipe_cnt;
 }
 
-enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_state)
+static enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_state)
 {
 	enum dc_status result = DC_OK;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
index 7aa9aaf5db4c..8daa12730bc1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
@@ -50,22 +50,6 @@
 	enc1->base.ctx
 
 
-void convert_dc_info_packet_to_128(
-	const struct dc_info_packet *info_packet,
-	struct dc_info_packet_128 *info_packet_128)
-{
-	unsigned int i;
-
-	info_packet_128->hb0 = info_packet->hb0;
-	info_packet_128->hb1 = info_packet->hb1;
-	info_packet_128->hb2 = info_packet->hb2;
-	info_packet_128->hb3 = info_packet->hb3;
-
-	for (i = 0; i < 32; i++) {
-		info_packet_128->sb[i] = info_packet->sb[i];
-	}
-
-}
 static void enc3_update_hdmi_info_packet(
 	struct dcn10_stream_encoder *enc1,
 	uint32_t packet_index,
@@ -489,7 +473,7 @@ static void enc3_dp_set_odm_combine(
 }
 
 /* setup stream encoder in dvi mode */
-void enc3_stream_encoder_dvi_set_stream_attribute(
+static void enc3_stream_encoder_dvi_set_stream_attribute(
 	struct stream_encoder *enc,
 	struct dc_crtc_timing *crtc_timing,
 	bool is_dual_link)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index c1d967ed6551..ab3918c0a15b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -41,8 +41,7 @@
 	dpp->tf_shift->field_name, dpp->tf_mask->field_name
 
 
-void dpp30_read_state(struct dpp *dpp_base,
-		struct dcn_dpp_state *s)
+static void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
 {
 	struct dcn20_dpp *dpp = TO_DCN20_DPP(dpp_base);
 
@@ -373,7 +372,7 @@ void dpp3_set_cursor_attributes(
 }
 
 
-bool dpp3_get_optimal_number_of_taps(
+static bool dpp3_get_optimal_number_of_taps(
 		struct dpp *dpp,
 		struct scaler_data *scl_data,
 		const struct scaling_taps *in_taps)
@@ -474,22 +473,7 @@ bool dpp3_get_optimal_number_of_taps(
 	return true;
 }
 
-void dpp3_cnv_set_bias_scale(
-		struct dpp *dpp_base,
-		struct  dc_bias_and_scale *bias_and_scale)
-{
-	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
-
-	REG_UPDATE(FCNV_FP_BIAS_R, FCNV_FP_BIAS_R, bias_and_scale->bias_red);
-	REG_UPDATE(FCNV_FP_BIAS_G, FCNV_FP_BIAS_G, bias_and_scale->bias_green);
-	REG_UPDATE(FCNV_FP_BIAS_B, FCNV_FP_BIAS_B, bias_and_scale->bias_blue);
-	REG_UPDATE(FCNV_FP_SCALE_R, FCNV_FP_SCALE_R, bias_and_scale->scale_red);
-	REG_UPDATE(FCNV_FP_SCALE_G, FCNV_FP_SCALE_G, bias_and_scale->scale_green);
-	REG_UPDATE(FCNV_FP_SCALE_B, FCNV_FP_SCALE_B, bias_and_scale->scale_blue);
-}
-
-void dpp3_deferred_update(
-	struct dpp *dpp_base)
+static void dpp3_deferred_update(struct dpp *dpp_base)
 {
 	int bypass_state;
 	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
@@ -751,8 +735,8 @@ static enum dc_lut_mode dpp3_get_blndgam_current(struct dpp *dpp_base)
 		return mode;
 }
 
-bool dpp3_program_blnd_lut(
-	struct dpp *dpp_base, const struct pwl_params *params)
+static bool dpp3_program_blnd_lut(struct dpp *dpp_base,
+				  const struct pwl_params *params)
 {
 	enum dc_lut_mode current_mode;
 	enum dc_lut_mode next_mode;
@@ -1164,9 +1148,8 @@ static void dpp3_program_shaper_lutb_settings(
 }
 
 
-bool dpp3_program_shaper(
-		struct dpp *dpp_base,
-		const struct pwl_params *params)
+static bool dpp3_program_shaper(struct dpp *dpp_base,
+				const struct pwl_params *params)
 {
 	enum dc_lut_mode current_mode;
 	enum dc_lut_mode next_mode;
@@ -1355,9 +1338,8 @@ static void dpp3_select_3dlut_ram_mask(
 	REG_SET(CM_3DLUT_INDEX, 0, CM_3DLUT_INDEX, 0);
 }
 
-bool dpp3_program_3dlut(
-		struct dpp *dpp_base,
-		struct tetrahedral_params *params)
+static bool dpp3_program_3dlut(struct dpp *dpp_base,
+			       struct tetrahedral_params *params)
 {
 	enum dc_lut_mode mode;
 	bool is_17x17x17;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
index 1c4b171c68ad..7a93eff183d9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mmhubbub.c
@@ -100,7 +100,7 @@ static void mmhubbub3_warmup_mcif(struct mcif_wb *mcif_wb,
 	REG_UPDATE(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_EN, false);
 }
 
-void mmhubbub3_config_mcif_buf(struct mcif_wb *mcif_wb,
+static void mmhubbub3_config_mcif_buf(struct mcif_wb *mcif_wb,
 		struct mcif_buf_params *params,
 		unsigned int dest_height)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index 95149734378b..0ce0d6165f43 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -1362,7 +1362,7 @@ uint32_t mpcc3_acquire_rmu(struct mpc *mpc, int mpcc_id, int rmu_idx)
 	return -1;
 }
 
-int mpcc3_release_rmu(struct mpc *mpc, int mpcc_id)
+static int mpcc3_release_rmu(struct mpc *mpc, int mpcc_id)
 {
 	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
 	int rmu_idx;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index 48ca4ad0b720..f786fff4a445 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -875,7 +875,7 @@ static const struct dc_debug_options debug_defaults_diags = {
 	.use_max_lb = true
 };
 
-void dcn30_dpp_destroy(struct dpp **dpp)
+static void dcn30_dpp_destroy(struct dpp **dpp)
 {
 	kfree(TO_DCN20_DPP(*dpp));
 	*dpp = NULL;
@@ -992,7 +992,7 @@ static struct mpc *dcn30_mpc_create(
 	return &mpc30->base;
 }
 
-struct hubbub *dcn30_hubbub_create(struct dc_context *ctx)
+static struct hubbub *dcn30_hubbub_create(struct dc_context *ctx)
 {
 	int i;
 
@@ -1143,9 +1143,8 @@ static struct afmt *dcn30_afmt_create(
 	return &afmt3->base;
 }
 
-struct stream_encoder *dcn30_stream_encoder_create(
-	enum engine_id eng_id,
-	struct dc_context *ctx)
+static struct stream_encoder *dcn30_stream_encoder_create(enum engine_id eng_id,
+							  struct dc_context *ctx)
 {
 	struct dcn10_stream_encoder *enc1;
 	struct vpg *vpg;
@@ -1179,8 +1178,7 @@ struct stream_encoder *dcn30_stream_encoder_create(
 	return &enc1->base;
 }
 
-struct dce_hwseq *dcn30_hwseq_create(
-	struct dc_context *ctx)
+static struct dce_hwseq *dcn30_hwseq_create(struct dc_context *ctx)
 {
 	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
index 736bda30abc3..ad0df1a72a90 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_panel_cntl.c
@@ -93,7 +93,7 @@ static unsigned int dcn301_get_16_bit_backlight_from_pwm(struct panel_cntl *pane
 	return (uint32_t)(current_backlight);
 }
 
-uint32_t dcn301_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
+static uint32_t dcn301_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
 {
 	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
 	uint32_t value;
@@ -147,7 +147,7 @@ uint32_t dcn301_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
 	return current_backlight;
 }
 
-void dcn301_panel_cntl_destroy(struct panel_cntl **panel_cntl)
+static void dcn301_panel_cntl_destroy(struct panel_cntl **panel_cntl)
 {
 	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(*panel_cntl);
 
@@ -155,7 +155,7 @@ void dcn301_panel_cntl_destroy(struct panel_cntl **panel_cntl)
 	*panel_cntl = NULL;
 }
 
-bool dcn301_is_panel_backlight_on(struct panel_cntl *panel_cntl)
+static bool dcn301_is_panel_backlight_on(struct panel_cntl *panel_cntl)
 {
 	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
 	uint32_t value;
@@ -165,7 +165,7 @@ bool dcn301_is_panel_backlight_on(struct panel_cntl *panel_cntl)
 	return value;
 }
 
-bool dcn301_is_panel_powered_on(struct panel_cntl *panel_cntl)
+static bool dcn301_is_panel_powered_on(struct panel_cntl *panel_cntl)
 {
 	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
 	uint32_t pwr_seq_state, dig_on, dig_on_ovrd;
@@ -177,7 +177,7 @@ bool dcn301_is_panel_powered_on(struct panel_cntl *panel_cntl)
 	return (pwr_seq_state == 1) || (dig_on == 1 && dig_on_ovrd == 1);
 }
 
-void dcn301_store_backlight_level(struct panel_cntl *panel_cntl)
+static void dcn301_store_backlight_level(struct panel_cntl *panel_cntl)
 {
 	struct dcn301_panel_cntl *dcn301_panel_cntl = TO_DCN301_PANEL_CNTL(panel_cntl);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
index 907bc4e1978b..b4001233867c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -717,15 +717,13 @@ static const struct dc_debug_options debug_defaults_diags = {
 	.use_max_lb = false,
 };
 
-void dcn301_dpp_destroy(struct dpp **dpp)
+static void dcn301_dpp_destroy(struct dpp **dpp)
 {
 	kfree(TO_DCN20_DPP(*dpp));
 	*dpp = NULL;
 }
 
-struct dpp *dcn301_dpp_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dpp *dcn301_dpp_create(struct dc_context *ctx, uint32_t inst)
 {
 	struct dcn3_dpp *dpp =
 		kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
@@ -741,8 +739,8 @@ struct dpp *dcn301_dpp_create(
 	kfree(dpp);
 	return NULL;
 }
-struct output_pixel_processor *dcn301_opp_create(
-	struct dc_context *ctx, uint32_t inst)
+static struct output_pixel_processor *dcn301_opp_create(struct dc_context *ctx,
+							uint32_t inst)
 {
 	struct dcn20_opp *opp =
 		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
@@ -757,9 +755,7 @@ struct output_pixel_processor *dcn301_opp_create(
 	return &opp->base;
 }
 
-struct dce_aux *dcn301_aux_engine_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_aux *dcn301_aux_engine_create(struct dc_context *ctx, uint32_t inst)
 {
 	struct aux_engine_dce110 *aux_engine =
 		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
@@ -793,9 +789,7 @@ static const struct dce_i2c_mask i2c_masks = {
 		I2C_COMMON_MASK_SH_LIST_DCN2(_MASK)
 };
 
-struct dce_i2c_hw *dcn301_i2c_hw_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct dce_i2c_hw *dcn301_i2c_hw_create(struct dc_context *ctx, uint32_t inst)
 {
 	struct dce_i2c_hw *dce_i2c_hw =
 		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
@@ -829,7 +823,7 @@ static struct mpc *dcn301_mpc_create(
 	return &mpc30->base;
 }
 
-struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
+static struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
 {
 	int i;
 
@@ -860,9 +854,8 @@ struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
 	return &hubbub3->base;
 }
 
-struct timing_generator *dcn301_timing_generator_create(
-		struct dc_context *ctx,
-		uint32_t instance)
+static struct timing_generator *dcn301_timing_generator_create(
+	struct dc_context *ctx, uint32_t instance)
 {
 	struct optc *tgn10 =
 		kzalloc(sizeof(struct optc), GFP_KERNEL);
@@ -894,7 +887,7 @@ static const struct encoder_feature_support link_enc_feature = {
 		.flags.bits.IS_TPS4_CAPABLE = true
 };
 
-struct link_encoder *dcn301_link_encoder_create(
+static struct link_encoder *dcn301_link_encoder_create(
 	const struct encoder_init_data *enc_init_data)
 {
 	struct dcn20_link_encoder *enc20 =
@@ -915,7 +908,7 @@ struct link_encoder *dcn301_link_encoder_create(
 	return &enc20->enc10.base;
 }
 
-struct panel_cntl *dcn301_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+static struct panel_cntl *dcn301_panel_cntl_create(const struct panel_cntl_init_data *init_data)
 {
 	struct dcn301_panel_cntl *panel_cntl =
 		kzalloc(sizeof(struct dcn301_panel_cntl), GFP_KERNEL);
@@ -997,9 +990,8 @@ static struct afmt *dcn301_afmt_create(
 	return &afmt3->base;
 }
 
-struct stream_encoder *dcn301_stream_encoder_create(
-	enum engine_id eng_id,
-	struct dc_context *ctx)
+static struct stream_encoder *dcn301_stream_encoder_create(enum engine_id eng_id,
+							   struct dc_context *ctx)
 {
 	struct dcn10_stream_encoder *enc1;
 	struct vpg *vpg;
@@ -1033,8 +1025,7 @@ struct stream_encoder *dcn301_stream_encoder_create(
 	return &enc1->base;
 }
 
-struct dce_hwseq *dcn301_hwseq_create(
-	struct dc_context *ctx)
+static struct dce_hwseq *dcn301_hwseq_create(struct dc_context *ctx)
 {
 	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
 
@@ -1182,9 +1173,7 @@ static void dcn301_destruct(struct dcn301_resource_pool *pool)
 		dcn_dccg_destroy(&pool->base.dccg);
 }
 
-struct hubp *dcn301_hubp_create(
-	struct dc_context *ctx,
-	uint32_t inst)
+static struct hubp *dcn301_hubp_create(struct dc_context *ctx, uint32_t inst)
 {
 	struct dcn20_hubp *hubp2 =
 		kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
@@ -1201,7 +1190,7 @@ struct hubp *dcn301_hubp_create(
 	return NULL;
 }
 
-bool dcn301_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+static bool dcn301_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
 {
 	int i;
 	uint32_t pipe_count = pool->res_cap->num_dwb;
@@ -1226,7 +1215,7 @@ bool dcn301_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
 	return true;
 }
 
-bool dcn301_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+static bool dcn301_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
 {
 	int i;
 	uint32_t pipe_count = pool->res_cap->num_dwb;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
index 815481a3ef54..ea4f8e06b07c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
@@ -462,7 +462,7 @@ void dccg31_set_physymclk(
 }
 
 /* Controls the generation of pixel valid for OTG in (OTG -> HPO case) */
-void dccg31_set_dtbclk_dto(
+static void dccg31_set_dtbclk_dto(
 		struct dccg *dccg,
 		int dtbclk_inst,
 		int req_dtbclk_khz,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
index 80bb09db5e4c..71c359f9cdd2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
@@ -174,7 +174,7 @@ void dcn31_link_encoder_set_dio_phy_mux(
 	}
 }
 
-void enc31_hw_init(struct link_encoder *enc)
+static void enc31_hw_init(struct link_encoder *enc)
 {
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
index 3b3721386571..83ece02380a8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
@@ -65,7 +65,7 @@ static uint32_t dcn31_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_cnt
 	return cmd.panel_cntl.data.current_backlight;
 }
 
-uint32_t dcn31_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
+static uint32_t dcn31_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
 {
 	struct dcn31_panel_cntl *dcn31_panel_cntl = TO_DCN31_PANEL_CNTL(panel_cntl);
 	struct dc_dmub_srv *dc_dmub_srv = panel_cntl->ctx->dmub_srv;
@@ -96,7 +96,7 @@ uint32_t dcn31_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
 	return cmd.panel_cntl.data.current_backlight;
 }
 
-void dcn31_panel_cntl_destroy(struct panel_cntl **panel_cntl)
+static void dcn31_panel_cntl_destroy(struct panel_cntl **panel_cntl)
 {
 	struct dcn31_panel_cntl *dcn31_panel_cntl = TO_DCN31_PANEL_CNTL(*panel_cntl);
 
@@ -104,7 +104,7 @@ void dcn31_panel_cntl_destroy(struct panel_cntl **panel_cntl)
 	*panel_cntl = NULL;
 }
 
-bool dcn31_is_panel_backlight_on(struct panel_cntl *panel_cntl)
+static bool dcn31_is_panel_backlight_on(struct panel_cntl *panel_cntl)
 {
 	union dmub_rb_cmd cmd;
 
@@ -114,7 +114,7 @@ bool dcn31_is_panel_backlight_on(struct panel_cntl *panel_cntl)
 	return cmd.panel_cntl.data.is_backlight_on;
 }
 
-bool dcn31_is_panel_powered_on(struct panel_cntl *panel_cntl)
+static bool dcn31_is_panel_powered_on(struct panel_cntl *panel_cntl)
 {
 	union dmub_rb_cmd cmd;
 
@@ -124,7 +124,7 @@ bool dcn31_is_panel_powered_on(struct panel_cntl *panel_cntl)
 	return cmd.panel_cntl.data.is_powered_on;
 }
 
-void dcn31_store_backlight_level(struct panel_cntl *panel_cntl)
+static void dcn31_store_backlight_level(struct panel_cntl *panel_cntl)
 {
 	union dmub_rb_cmd cmd;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 04b52c9d18da..bbd2bb38423c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -1272,7 +1272,7 @@ static struct link_encoder *dcn31_link_enc_create_minimal(
 	return &enc20->enc10.base;
 }
 
-struct panel_cntl *dcn31_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+static struct panel_cntl *dcn31_panel_cntl_create(const struct panel_cntl_init_data *init_data)
 {
 	struct dcn31_panel_cntl *panel_cntl =
 		kzalloc(sizeof(struct dcn31_panel_cntl), GFP_KERNEL);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
index 46c433c0bcb0..8bc27de4c104 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
@@ -1711,14 +1711,6 @@ void dml21_rq_dlg_get_dlg_reg(
 	dml_print("DML_DLG: Calculation for pipe[%d] end\n", pipe_idx);
 }
 
-void dml_rq_dlg_get_arb_params(struct display_mode_lib *mode_lib, display_arb_params_st *arb_param)
-{
-	memset(arb_param, 0, sizeof(*arb_param));
-	arb_param->max_req_outstanding = 256;
-	arb_param->min_req_outstanding = 68;
-	arb_param->sat_level_us = 60;
-}
-
 static void calculate_ttu_cursor(
 		struct display_mode_lib *mode_lib,
 		double *refcyc_per_req_delivery_pre_cur,
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
index 34f43cb650f8..cf072e2347d3 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
@@ -40,10 +40,9 @@
 
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn10(
-		struct irq_service *irq_service,
-		uint32_t src_id,
-		uint32_t ext_id)
+static enum dc_irq_source to_dal_irq_source_dcn10(struct irq_service *irq_service,
+						  uint32_t src_id,
+						  uint32_t ext_id)
 {
 	switch (src_id) {
 	case DCN_1_0__SRCID__DC_D1_OTG_VSTARTUP:
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
index a47f68634fc3..aa708b61142f 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
@@ -39,10 +39,9 @@
 
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn201(
-		struct irq_service *irq_service,
-		uint32_t src_id,
-		uint32_t ext_id)
+static enum dc_irq_source to_dal_irq_source_dcn201(struct irq_service *irq_service,
+						   uint32_t src_id,
+						   uint32_t ext_id)
 {
 	switch (src_id) {
 	case DCN_1_0__SRCID__DC_D1_OTG_VSTARTUP:
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
index 78940cb20e10..235294534c43 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
@@ -40,10 +40,9 @@
 
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn21(
-		struct irq_service *irq_service,
-		uint32_t src_id,
-		uint32_t ext_id)
+static enum dc_irq_source to_dal_irq_source_dcn21(struct irq_service *irq_service,
+						  uint32_t src_id,
+						  uint32_t ext_id)
 {
 	switch (src_id) {
 	case DCN_1_0__SRCID__DC_D1_OTG_VSTARTUP:
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
index 38e0ade60c7b..1b88e4e627fd 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
@@ -36,10 +36,9 @@
 
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
-enum dc_irq_source to_dal_irq_source_dcn31(
-		struct irq_service *irq_service,
-		uint32_t src_id,
-		uint32_t ext_id)
+static enum dc_irq_source to_dal_irq_source_dcn31(struct irq_service *irq_service,
+						  uint32_t src_id,
+						  uint32_t ext_id)
 {
 	switch (src_id) {
 	case DCN_1_0__SRCID__DC_D1_OTG_VSTARTUP:
-- 
2.34.1

